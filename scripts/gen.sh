CWD=~/repos/ConnexionSqlAlchemyDemoApiTests
API_PATH=~/repos/ConnexionSqlAlchemyDemoApi
cd $CWD || exit
rm -rf openapi_client && mkdir -p openapi_client
(cd openapi_client && npx @openapitools/openapi-generator-cli generate -i $API_PATH/src/openapi.yaml -g python && pip install .)
rm -rf openapi_client
