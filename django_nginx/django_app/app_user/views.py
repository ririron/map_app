from rest_framework import status, views, generics
from rest_framework.response import Response
from rest_framework.permissions import AllowAny,IsAuthenticated
from .serializers import AppUserSerializer

# Create your views here.

class CreateUserView(generics.CreateAPIView):
	# ユーザーの新規登録用
	permission_classes = [AllowAny]
	serializer_class = AppUserSerializer

