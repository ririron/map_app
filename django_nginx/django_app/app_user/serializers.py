from rest_framework import serializers
from .models import AppUser


class AppUserSerializer(serializers.ModelSerializer):

	class Meta:
		model = AppUser
		fields = ('username', 'password')

	def create(self, validated_data):
		return AppUser.objects.create_user(validated_data['username'], None, validated_data['password'])