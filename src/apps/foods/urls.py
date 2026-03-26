from django.urls import path

from src.apps.foods.views import FoodCategoryListView

urlpatterns = [
    path("foods/", FoodCategoryListView.as_view(), name="foods-list"),
]
