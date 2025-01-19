from django.urls import path
from . import views

app_name = 'task_log'
urlpatterns = [
    path('tasks/', views.UserTaskListView.as_view()),
    path('user_logs/', views.TaskLogListView.as_view())
]