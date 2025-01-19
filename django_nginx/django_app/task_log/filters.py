from django_filters import rest_framework as filters
from .models import UserTask, TaskLog

class TaskLogFilter(filters.FilterSet):
	class Meta:
		model = TaskLog
		fields = ["task_id"]
