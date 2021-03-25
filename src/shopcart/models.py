from django.db import models
from product.models import AllProduct

# Create your models here.
class AllShopCart(models.Model):
    
    user_id = models.IntegerField(default=0, blank=True)
    
    def __str__(self):
        return self.user_id

class ShopCartProduct(models.Model):
    
    shopcart_id = models.ForeignKey(AllShopCart, on_delete=models.DO_NOTHING)
    product_id = models.ForeignKey(AllProduct, on_delete=models.DO_NOTHING)
    
    amount = models.IntegerField(default=1)

    def __str__(self):
        return self.product_id + " in cart " + self.shopcart_id