import pytest
from app_user.models import AppUser
from rest_framework.test import APIClient
from rest_framework_simplejwt.tokens import RefreshToken
from django.test import TestCase

# Create your tests here.

@pytest.fixture
def make_client():
    return APIClient()

@pytest.fixture
def make_authenticated_client(db):
    """認証済みのAPIクライアントを返す"""
    client = APIClient()
    user = AppUser.objects.create_user("forTest", None, "test")
    refresh = RefreshToken.for_user(user)
    client.credentials(HTTP_AUTHORIZATION=f'Bearer {refresh.access_token}')
    return client
	
@pytest.mark.django_db
def test_dont_access(make_client):
	client = make_client

	response = client.get('/task_log/tasks/')

	assert response.status_code == 401

@pytest.mark.django_db
def test_get_list(make_authenticated_client):
	client = make_authenticated_client

	response = client.get('/task_log/tasks/')

	assert response.status_code == 200