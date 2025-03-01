#!/bin/bash

source .venv/bin/activate

if [ ! -f metadata/output/data_contracts/process_customers.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model customers \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/process_customers.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:process-model:customers" |
      .info.title |= "Jaffle Shop PROCESS Customers Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop PROCESS Customers Data provided by dbt/ created by dbt build." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/process_customers.yaml
fi

if [ ! -f metadata/output/data_contracts/process_order_items.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model order_items \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/process_order_items.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:process-model:order_items" |
      .info.title |= "Jaffle Shop PROCESS Order Items Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop PROCESS Order Items Data provided by dbt/ created by dbt build." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/process_order_items.yaml
fi

if [ ! -f metadata/output/data_contracts/process_orders.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model orders \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/process_orders.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:process-model:orders" |
      .info.title |= "Jaffle Shop PROCESS Orders Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop PROCESS Orders Data provided by dbt/ created by dbt build." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/process_orders.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_customers.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_customers \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_customers.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:customers" |
      .info.title |= "Jaffle Shop STAGE Customers Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Customers Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_customers.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_locations.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_locations \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_locations.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:locations" |
      .info.title |= "Jaffle Shop STAGE Locations Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Locations Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_locations.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_order_items.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_order_items \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_order_items.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:order_items" |
      .info.title |= "Jaffle Shop STAGE Order Items Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Order Items Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_order_items.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_orders.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_orders \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_orders.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:orders" |
      .info.title |= "Jaffle Shop STAGE Orders Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Orders Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_orders.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_products.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_products \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_products.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:products" |
      .info.title |= "Jaffle Shop STAGE Products Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Products Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_products.yaml
fi

if [ ! -f metadata/output/data_contracts/stage_suppliers.yaml ]; then
  datacontract import \
  --format dbt \
  --source dbt/target/manifest.json \
  --dbt-model stg_suppliers \
  --template ./enablement_team_contract_template.yaml \
  --output metadata/output/data_contracts/stage_suppliers.yaml
  
  yq -i --yaml-output \
    --arg version $(date '+%Y.%m.%d') \
    '
      .id |= "urn:datacontract:project:jaffle-shop:dbt:stage-model:suppliers" |
      .info.title |= "Jaffle Shop STAGE Suppliers Data Contract" |
      .info.description |= "Data Contract for Example Jaffle Shop STAGE Suppliers Data provided by dbt/ created by dbt seed." |
      .info.version |= $version
    ' \
    metadata/output/data_contracts/stage_suppliers.yaml
fi

if [ "${1}" == "databricks" ]; then
  export DATABRICKS_CATALOG=$(cat dbt/logs/dbt_databricks_${DBT_ENV_TARGET}_config.log | grep -Po '(?<=catalog:\s)[a-zA-Z0-9_]+')
  export DATABRICKS_SCHEMA=$(cat dbt/logs/dbt_databricks_${DBT_ENV_TARGET}_config.log | grep -Po '(?<=schema:\s)[a-zA-Z0-9_]+')

  for contract in metadata/output/data_contracts/*.yaml; do
    if ! $( yq 'has("servers")' ${contract} ); then
      yq -i --yaml-output \
        --arg serverName "dna_databricks_${DBT_ENV_TARGET}" \
        --arg host ${DBT_ENV_SECRET_DATABRICKS_HOST:-NA} \
        --arg catalog ${DATABRICKS_CATALOG:-NA} \
        --arg schema ${DATABRICKS_SCHEMA:-NA} \
      '
        .servers |= {($serverName):
            {
              "type": "databricks",
              "host": $host,
              "catalog": $catalog,
              "schema": $schema
            }
          }
      ' ${contract}
    elif ! $( yq --arg serverName "dna_databricks_${DBT_ENV_TARGET}" '.servers | has($serverName)' ${contract} ); then
      yq -i --yaml-output \
        --arg serverName "dna_databricks_${DBT_ENV_TARGET}" \
        --arg host ${DBT_ENV_SECRET_DATABRICKS_HOST:-NA} \
        --arg catalog ${DATABRICKS_CATALOG:-NA} \
        --arg schema ${DATABRICKS_SCHEMA:-NA} \
      '
        .servers += {($serverName): 
            {
              "type": "databricks",
              "host": $host,
              "catalog": $catalog,
              "schema": $schema
            }
          }
      ' ${contract}
    fi
  done

elif [ "${1}" == "snowflake" ]; then

  export SNOWFLAKE_DATABASE=$(cat dbt/logs/dbt_snowflake_${DBT_ENV_TARGET}_config.log | grep -Po '(?<=database:\s)[a-zA-Z0-9_]+')
  export SNOWFLAKE_SCHEMA=$(cat dbt/logs/dbt_snowflake_${DBT_ENV_TARGET}_config.log | grep -Po '(?<=schema:\s)[a-zA-Z0-9_]+')

  for contract in metadata/output/data_contracts/*.yaml; do
    if ! $( yq 'has("servers")' ${contract} ); then
      yq -i --yaml-output \
        --arg serverName "dna_snowflake_${DBT_ENV_TARGET}" \
        --arg account ${DBT_ENV_SECRET_SNOWFLAKE_ACCOUNT:-NA} \
        --arg database ${SNOWFLAKE_DATABASE:-NA} \
        --arg schema ${SNOWFLAKE_SCHEMA:-NA} \
        '
          .servers |= {($serverName):
            {
              "type": "snowflake",
              "account": $account,
              "database": $database,
              "schema": $schema
            }
          }
      ' ${contract}
    elif ! $( yq --arg serverName "dna_snowflake_${DBT_ENV_TARGET}" '.servers | has($serverName)' ${contract} ); then
      yq -i --yaml-output \
        --arg serverName "dna_snowflake_${DBT_ENV_TARGET}" \
        --arg account ${DBT_ENV_SECRET_SNOWFLAKE_ACCOUNT:-NA} \
        --arg database ${SNOWFLAKE_DATABASE:-NA} \
        --arg schema ${SNOWFLAKE_SCHEMA:-NA} \
        '
          .servers += {($serverName):
            {
              "type": "snowflake",
              "account": $account,
              "database": $database,
              "schema": $schema
            }
          }
      ' ${contract}
    fi
  done
  
fi

deactivate