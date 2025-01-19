import django_filters
from .models import UserTask, TaskLog

class UserTaskFilter(django_filters.FilterSet):

	def __init__(self, *args, **kwargs):
		self.request = kwargs.pop('request', None)  # requestオブジェクトを取得
		super().__init__(*args, **kwargs)

	def filter_queryset(self, queryset):
		if self.request:
			# ログインユーザーの投稿のみを取得
			queryset = queryset.filter(task_owner=self.request.user.id)
		return super().filter_queryset(queryset)

class TaskLogFilter(django_filters.FilterSet):
	class Meta:
		model = TaskLog
		fields = ["task_id"]

	def __init__(self, *args, **kwargs):
		self.request = kwargs.pop('request', None)  # requestオブジェクトを取得
		super().__init__(*args, **kwargs)

	def filter_queryset(self, queryset):
		if self.request:
			# ログインユーザーの投稿のみを取得
			queryset = queryset.filter(task_owner=self.request.user.id)
		return super().filter_queryset(queryset)