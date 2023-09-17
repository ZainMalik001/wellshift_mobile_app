from django.db import models
from django.contrib.auth.models import AbstractBaseUser, Permission, Group
from .managers import CustomUserManager


class CustomUser(AbstractBaseUser):
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=150, null=True, blank=True)
    last_name = models.CharField(max_length=150, null=True, blank=True)
    date_joined = models.DateTimeField(verbose_name='date joined', auto_now_add=True)
    last_login = models.DateTimeField(verbose_name='last login', auto_now=True)
    is_admin = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    groups = models.ManyToManyField(Group)
    user_permissions = models.ManyToManyField(Permission, blank=True)

    name = models.CharField(max_length=255)
    phone = models.CharField(max_length=150, null=True, blank=True)
    age = models.CharField(max_length=255, null=True, blank=True)
    birth_date = models.CharField(max_length=255, null=True, blank=True)
    recovery_email = models.EmailField(null=True, blank=True)
    recovery_question = models.TextField(null=True, blank=True)
    profile_pic = models.ImageField(upload_to='media/profile_pics/', null=True, blank=True)
    is_lock = models.BooleanField(default=False)
    is_deleted = models.BooleanField(default=False)

    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['email']

    objects = CustomUserManager()

    def __str__(self):
        return self.email

    # For checking permissions. to keep it simple all admin have ALL permissons
    def has_perm(self, perm, obj=None):
        return self.is_admin

    # Does this user have permission to view this app? (ALWAYS YES FOR SIMPLICITY)
    def has_module_perms(self, app_label):
        return True
