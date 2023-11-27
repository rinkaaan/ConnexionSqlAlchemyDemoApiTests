import json

from openapi_client import PutPetProps, Pet

from src.apis import petsApi


class Test:
    created_pets: list[Pet] = []

    @classmethod
    def setup_method(cls):
        with open('data.json', 'r') as file:
            data = json.load(file)
        for obj in data:
            PutPetProps.model_validate(obj)
        for obj in data:
            pet = petsApi.put(PutPetProps(**obj))
            cls.created_pets.append(pet)

    def test_get_pets(self):
        all_ids = [p.id for p in petsApi.get_items()]
        for pet in self.created_pets:
            assert pet.id in all_ids

    @classmethod
    def teardown_method(cls):
        for pet in cls.created_pets:
            petsApi.delete(pet.id)
        cls.created_pets = []
