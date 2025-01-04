from django.db import models
\

# Create your models here.

class UserTask(models.Model):
	
	# ユーザーid(外部キー)

	# タスク名
	name = models.CharField(max_length = 30)