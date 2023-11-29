WORKPLACE="$HOME/workplace/ConnexionSqlAlchemyDemo"
WORKSPACE="$WORKPLACE/ConnexionSqlAlchemyDemoApiTests"
SCHEMA_PATH="$WORKPLACE/ConnexionSqlAlchemyDemoApi/api/openapi.yaml"

(
  cd "$WORKSPACE"
  rm -rf openapi_client
  mkdir -p openapi_client

  cd openapi_client
  npx @openapitools/openapi-generator-cli generate -i "$SCHEMA_PATH" -g python
  pip install .
)

rm -rf openapi_client
