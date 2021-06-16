"""AppUser Model"""
from django.db.models.deletion import CASCADE
from django.contrib.auth.models import User
from django.db import models


class AppUser(models.Model):
    """
        AppUser user model add fields to the default User model.
    """

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    company = models.CharField(max_length=50)
    role = models.CharField(max_length=50)
    phone = models.CharField(max_length=12)
