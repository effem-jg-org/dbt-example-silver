#!/bin/bash

source .venv/bin/activate

INPUT_DATA_CONTRACTS=(
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:supplies"
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:stores"
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:products"
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:orders"
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:customers"
  "urn:datacontract:project:jaffle-shop:dbt-seed:raw-model:items"
)

for d in ${INPUT_DATA_CONTRACTS[@]}; do
  contract_name=$(echo $d | grep -Po '(?<=:)[a-zA-Z0-9_-]+' | tail -n 2 | paste -sd - -)

  curl -s -X 'GET' \
    "${DATACONTRACT_MANAGER_HOST}/api/datacontracts/${d}" \
    --header "x-api-key: ${DATACONTRACT_MANAGER_API_KEY}" \
    --header "content-type: application/json" > \
    metadata/input/data_contracts/${contract_name}.json

  cat metadata/input/data_contracts/${contract_name}.json | yq --yaml-output > \
    metadata/input/data_contracts/${contract_name}.yaml
  
  datacontract export \
    metadata/input/data_contracts/${contract_name}.yaml \
    --format dbt-sources \
    --output dbt/models/sources/${contract_name}.yaml

  # Anti-Agnostic Pattern to hardcode/ convert Data Types to conform with
  # desired Warehouse against `dbt build`. data_type aliasing is enabled in
  # dbt by default, but logical types aren't widespread enough. Issue raised
  # with dbt.
  #
  # TODO: 
  # - [dbt] Revert clean-up once aliasing has been updated
  yq -r -i --yaml-roundtrip '.sources[0] += {"schema": "{{target.schema}}_bronze"}' \
    dbt/models/sources/${contract_name}.yaml
  yq -r -i --yaml-roundtrip \
    --arg timestamp 'TIMESTAMP' \
    --arg number 'BIGINT' \
    --arg int 'INT' \
    --arg float 'DOUBLE' \
    --arg bigint 'INT' \
    --arg string 'VARCHAR(250)' \
    --arg boolean 'BOOLEAN' \
    'walk( 
      if type == "object" and has("data_type") then
        if .data_type == "TIMESTAMP_TZ" then .data_type = $timestamp
        elif .data_type == "NUMBER" then .data_type = $number
        elif .data_type == "INT" then .data_type = $int
        elif .data_type == "FLOAT" then .data_type = $float
        elif .data_type == "BIGINT" then .data_type = $bigint
        elif .data_type == "STRING" then ( .data_type = $string | .char_size = 250 )
        elif .data_type == "BOOLEAN" then .data_type = $boolean
        else . end
      else . end )' dbt/models/sources/${contract_name}.yaml

  model_name=$(cat metadata/input/data_contracts/${contract_name}.json | jq -r '.models | keys[0]')
  datacontract export \
    metadata/input/data_contracts/${contract_name}.yaml \
    --format dbt-staging-sql \
    --model ${model_name} \
    --output dbt/models/metadata_staging/${model_name}.sql
  
  datacontract export \
    metadata/input/data_contracts/${contract_name}.yaml \
    --format dbt \
    --model ${model_name} \
    --output dbt/models/metadata_staging/${model_name}.yaml
  
  yq -r -i --yaml-roundtrip \
    --arg timestamp 'TIMESTAMP' \
    --arg number 'BIGINT' \
    --arg int 'INT' \
    --arg float 'DOUBLE' \
    --arg bigint 'INT' \
    --arg string 'VARCHAR(250)' \
    --arg boolean 'BOOLEAN' \
    'walk( 
      if type == "object" and has("data_type") then
        if .data_type == "TIMESTAMP_TZ" then .data_type = $timestamp
        elif .data_type == "NUMBER" then .data_type = $number
        elif .data_type == "INT" then .data_type = $int
        elif .data_type == "FLOAT" then .data_type = $float
        elif .data_type == "BIGINT" then .data_type = $bigint
        elif .data_type == "STRING" then ( .data_type = $string | .char_size = 250 )
        elif .data_type == "BOOLEAN" then .data_type = $boolean
        else . end
      else . end )' dbt/models/metadata_staging/${model_name}.yaml
done

deactivate