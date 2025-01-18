import pytest
from app_user.models import AppUser
from rest_framework.test import APIClient
from django.test import TestCase

# Create your tests here.

@pytest.fixture
def create_user():
	AppUser.objects.create_user("forTest", None, "test")


@pytest.fixture
def make_client():
    return APIClient()
	
@pytest.mark.django_db
def test_get_token(create_user, make_client):
	client = make_client
	# トークンの取得
	response = client.post('/auth/token/', {"username":"forTest", "password":"test"}, format = 'json')
	assert response.status_code == 200

@pytest.mark.django_db
def test_cant_get_token(create_user, make_client):
	client = make_client
	# パスワードが違うとトークンは払い出されないはず
	response = client.post('/auth/token/', {"username":"forTest", "password":"thisIsTest"}, format = 'json')
	assert response.status_code == 401
