import openapi_client

configuration = openapi_client.Configuration(
    host="http://localhost:8080"
)

api = openapi_client.ApiClient(configuration)
petApi = openapi_client.PetApi(api)
