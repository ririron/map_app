from rest_framework.generics import ListAPIView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.permissions import AllowAny,IsAuthenticated
from .models import UserTask, TaskLog
from .filters import TaskLogFilter
from .serializers import UserTaskSerializer, TaskLogSerializer
# Create your views here.

class UserTaskListView(ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = UserTaskSerializer

    def get_queryset(self):
        return UserTask.objects.filter(task_owner=self.request.user)

class TaskLogListView(ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = TaskLogSerializer
    filterset_class = TaskLogFilter

    def get_queryset(self):
        return TaskLog.objects.filter(task_owner=self.request.user)
