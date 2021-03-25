from django.db import models

# Create your models here.
class ProductType(models.Model):
    
    name = models.CharField(max_length=100, blank=True)
    description = models.TextField()

    def __str__(self):
        return self.name

class AllProduct(models.Model):
    
    product_type = models.ForeignKey(ProductType, on_delete=models.DO_NOTHING)
    product_name = models.CharField(max_length=100, blank=True)

    description = models.TextField(max_length=200)
    price = models.IntegerField(default=0)
    storage = models.IntegerField(default=0)
    product_code = models.CharField(max_length=10, blank=True)

    def __str__(self):
        return self.product_name + " of type " + self.product_type.name       