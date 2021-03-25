from django.contrib import admin
from .models import AllProduct, ProductType

# Register your models here.

class ProductTypeAdmin(admin.ModelAdmin):
    pass

class AllProductAdmin(admin.ModelAdmin):
    pass

admin.site.register(AllProduct, AllProductAdmin)
admin.site.register(ProductType, ProductTypeAdmin)