import pytest
from app_user.models import AppUser
from app_user.serializers import AppUserSerializer
from task_log.models import UserTask, TaskLog
from task_log.serializers import UserTaskSerializer, TaskLogSerializer
from rest_framework.test import APIClient
from rest_framework_simplejwt.tokens import RefreshToken
from django.test import TestCase

# Create your tests here.

@pytest.fixture
def make_client():
    return APIClient()

@pytest.fixture
def make_authenticated_client():
    """認証済みのAPIクライアントを返す"""
    client = APIClient()
    user = AppUser.objects.create_user("forTest", None, "test")
    refresh = RefreshToken.for_user(user)
    client.credentials(HTTP_AUTHORIZATION=f'Bearer {refresh.access_token}')
    return client
    
@pytest.fixture
def make_test_data():

    # 作成済みユーザーを読み出し
    user = AppUser.objects.get(username="forTest")
    # ダミーユーザーを作成
    dummy = AppUser.objects.create_user("fuga", None, "test")

    # user1.id と user2.id を `task_owner` に設定
    user_tasks = [
        {"task_owner": user.id, "name": "hoge", "sp": 999},
        {"task_owner": dummy.id, "name": "fuga", "sp": 999},
    ]
    
    # UserTask のシリアライザを適用
    serializer = UserTaskSerializer(data=user_tasks, many=True)
    if serializer.is_valid(raise_exception=True):
        user_tasks_instances = serializer.save()  # 保存したインスタンスを取得

    # task_logs のデータを作成
    task_logs = [
        {"task_owner": user.id, "task_id": user_tasks_instances[0].id, "date": "2024-01-01", "remain": 100},
        {"task_owner": user.id, "task_id": user_tasks_instances[0].id, "date": "2024-01-02", "remain": 50},
        {"task_owner": dummy.id, "task_id": user_tasks_instances[1].id, "date": "2024-01-01", "remain": 100},
    ]

    # TaskLog のシリアライザを適用
    serializer = TaskLogSerializer(data=task_logs, many=True)
    if serializer.is_valid(raise_exception=True):
        serializer.save()
    
    return

@pytest.mark.django_db
def test_dont_access(make_client):
    client = make_client

    response = client.get('/task_log/user_logs/')

    assert response.status_code == 401

@pytest.mark.django_db
def test_get_list(make_authenticated_client):
    client = make_authenticated_client

    response = client.get('/task_log/user_logs/')

    assert response.status_code == 200


@pytest.mark.django_db
def test_get_with_parametar(make_authenticated_client, make_test_data):
    client = make_authenticated_client
    make_test_data

    # タスクの一覧を取得
    task_list = client.get('/task_log/tasks/')
    print(task_list)
    print(task_list.data)
    # 得られたidでlog一覧を取得
    task_logs = client.get('/task_log/user_logs/?task_id=' + str(task_list.data[0]["id"]))
    print(task_logs)
    print(task_logs.data)

    assert task_logs.status_code == 200
    assert task_logs.data[1]["date"] == "2024-01-02"

    # ユーザーに紐づいていないlogは取得できない
    tasks = UserTask.objects.get(task_owner=2)
    expect_empty = client.get('/task_log/user_logs/?task_id=' + str(tasks.id))

    assert expect_empty.data == []