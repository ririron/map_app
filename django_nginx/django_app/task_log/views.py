from rest_framework.generics import ListAPIView
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.permissions import AllowAny,IsAuthenticated
from .models import UserTask, TaskLog
from .filters import UserTaskFilter, TaskLogFilter
from .serializers import UserTaskSerializer, TaskLogSerializer
# Create your views here.

class UserTaskListView(ListAPIView):
    queryset = UserTask.objects.all()
    permission_classes = [IsAuthenticated]
    serializer_class = UserTaskSerializer
    filterset_class = UserTaskFilter


class TaskLogListView(ListAPIView):
    queryset = TaskLog.objects.all()
    permission_classes = [AllowAny]
    serializer_class = TaskLogSerializer
    filterset_class = TaskLogFilter
