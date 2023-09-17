from django.contrib.auth.password_validation import validate_password
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.db import transaction

from .models import CustomUser


class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
        required=True,
        validators=[UniqueValidator(queryset=CustomUser.objects.all())]
    )

    password = serializers.CharField(write_only=True, required=True, validators=[validate_password])
    confirm_password = serializers.CharField(write_only=True, required=True)

    class Meta:
        model = CustomUser
        fields = ('id', 'email', 'password', 'confirm_password')

    def validate(self, attrs):
        if attrs['password'] != attrs['confirm_password']:
            raise serializers.ValidationError({"password": "Password and Confirm Password didn't match."})

        return attrs

    @transaction.atomic()
    def create(self, validated_data):
        user = CustomUser.objects.create(username=validated_data['username'],
                                   email=validated_data['email']
                                   )

        user.set_password(validated_data['password'])
        user.save()

        return user


class CustomUserGetSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        exclude = ['password']

