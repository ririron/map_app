from rest_framework import serializers
from .models import UserTask, TaskLog

class UserTaskSerializer(serializers.ModelSerializer):

	task_owner = serializers.StringRelatedField(read_only=True)

	class Meta:
		model = UserTask
		fields = ['id', 'task_owner', 'name', 'sp']
        read_only_fields = ['task_owner']

class TaskLogSerializer(serializers.ModelSerializer):
	task_owner = serializers.StringRelatedField(read_only=True)

	class Meta:
		model = TaskLog
		fields = ['id', 'task_owner', 'task_id', 'date', 'remain']
        read_only_fields = ['task_owner']