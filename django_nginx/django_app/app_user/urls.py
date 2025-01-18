from django.urls import path
from . import views

app_name = 'app_user'
urlpatterns = [
	path('users/', views.CreateUserView.as_view())
]