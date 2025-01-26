from rest_framework import serializers
from .models import UserTask, TaskLog
from app_user.models import AppUser

class UserTaskSerializer(serializers.ModelSerializer):

	task_owner = serializers.PrimaryKeyRelatedField(queryset=AppUser.objects.all())

	class Meta:
		model = UserTask
		fields = ['id', 'task_owner', 'name', 'sp']

class TaskLogSerializer(serializers.ModelSerializer):
	
	task_owner = serializers.PrimaryKeyRelatedField(queryset=AppUser.objects.all())
	class Meta:
		model = TaskLog
		fields = ['id', 'task_owner', 'task_id', 'date', 'remain']