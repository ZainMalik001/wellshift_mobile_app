from django.contrib.auth import authenticate
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework_simplejwt.views import TokenObtainPairView
from rest_framework import serializers, status
from rest_framework import generics, viewsets
from django.contrib.auth import get_user_model

from .serializers import RegisterSerializer, CustomUserGetSerializer

User = get_user_model()


class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer


class Login(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        user = authenticate(email=request.data.get(
            'email'), password=request.data.get('password'))
        if user is None:
            # Authentication failed
            raise serializers.ValidationError({
                'message': "The email or password is incorrect."
            })
        serializer = self.get_serializer(data=request.data)
        data = dict()
        data['user'] = CustomUserGetSerializer(user).data

        try:
            serializer.is_valid(raise_exception=True)
            data["token"] = serializer.validated_data["access"]
            data["refresh_token"] = serializer.validated_data["refresh"]
        except Exception as error:
            return Response({'message': error.__str__()}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(data, status=status.HTTP_200_OK)


class TestAPI(viewsets.ViewSet):
    def list(self, request):
        return Response("Hello World", status=status.HTTP_200_OK)
