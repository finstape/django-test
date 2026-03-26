from django.db.models import Prefetch
from rest_framework.generics import ListAPIView

from src.apps.foods.models import Food, FoodCategory
from src.apps.foods.serializers import FoodListSerializer


class FoodCategoryListView(ListAPIView):
    serializer_class = FoodListSerializer

    def get_queryset(self):
        published_foods = (
            Food.objects.filter(is_publish=True)
            .prefetch_related("additional")
            .order_by("id")
        )

        return (
            FoodCategory.objects.filter(food__is_publish=True)
            .distinct()
            .prefetch_related(Prefetch("food", queryset=published_foods))
            .order_by("order_id", "name_ru")
        )
