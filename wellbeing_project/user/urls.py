from django.urls import path, include
from rest_framework_simplejwt import views as jwt_views
from .views import Login, TestAPI
from rest_framework import routers

router = routers.DefaultRouter()
router.register('hello_world', TestAPI, basename='test')

urlpatterns = [
    path('login/', Login.as_view(), name='login'),
    path('login/token/', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('login/token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    path('', include(router.urls)),
]