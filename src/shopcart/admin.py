from django.contrib import admin
from .models import AllShopCart, ShopCartProduct

# Register your models here.

class AllShopCartAdmin(admin.ModelAdmin):
    pass

admin.site.register(AllShopCart, AllShopCartAdmin)