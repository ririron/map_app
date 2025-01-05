from django.conf import settings
from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


# Create your models here.

class UserTask(models.Model):
	
	# ユーザー(外部キー)
	task_owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
    )
	# タスク名
	name = models.CharField(max_length = 30)
	# 設定したストーリーポイント
	sp   = models.IntegerField([MinValueValidator(0),
        MaxValueValidator(999)])

# タスクの進行状況
class TaskLog(models.Model):
	# ユーザー(外部キー)
	task_owner = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
    )
	# タスクのid
	task_id = models.ForeignKey(
		UserTask,
		on_delete=models.CASCADE,
	)
	# レコードが追加された日付
	date = models.DateField()
	# 残りのストーリーポイント
	remain = models.IntegerField(
		[MinValueValidator(0),
        MaxValueValidator(999)],)