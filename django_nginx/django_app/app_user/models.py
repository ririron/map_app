from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


# アプリ用カスタムユーザー
class AppUser(AbstractUser):
	job = models.CharField(max_length=10)