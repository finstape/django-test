from django.contrib import admin

from src.apps.foods.models import Food, FoodCategory


@admin.register(FoodCategory)
class FoodCategoryAdmin(admin.ModelAdmin):
    list_display = ("id", "name_ru", "order_id")
    search_fields = ("name_ru", "name_en", "name_ch")


@admin.register(Food)
class FoodAdmin(admin.ModelAdmin):
    list_display = ("id", "name_ru", "internal_code", "code", "category", "is_publish")
    list_filter = ("is_publish", "is_vegan", "is_special", "category")
    search_fields = ("name_ru", "description_ru")
