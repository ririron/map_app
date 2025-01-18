import pytest
from django.test import TestCase
from rest_framework.test import APIClient

# Create your tests here.
@pytest.fixture
def make_client():
	return APIClient()

def test_get_access(make_client):
	client = make_client
	response = client.get('/app_user/users/')
	assert response.status_code == 405


@pytest.mark.django_db
def test_create_user(make_client):
	client = make_client
	response = client.post('/app_user/users/', {"username":"forTest", "password":"test"}, format='json')
	assert response.status_code == 201