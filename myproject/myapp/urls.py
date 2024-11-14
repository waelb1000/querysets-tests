from django.urls import path
from . import views

urlpatterns = [
    path('test-querysets/', views.test_querysets, name='test_querysets'),
    path('', views.query_view, name='query_view'),
]
