from django.contrib import admin
from .models import UserTask, TaskLog

# Register your models here.

admin.site.register(UserTask)
admin.site.register(TaskLog)