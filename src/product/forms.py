from django import forms
from django.forms import ModelChoiceField, CharField, FloatField, IntegerField, Select, DecimalField
from .models import ProductType, AllProduct

class ProductForm(forms.Form):
    product_type = ModelChoiceField(queryset=ProductType.objects.select_related().all().order_by('name'),
                                    widget=Select(), label='Product Type')
    product_name = CharField(label='Product Name', required=True)
    price = DecimalField(label='Price', min_value=0)
    description = CharField(label='Description')
    storage = IntegerField(label='Storage', min_value=0)
    product_code = CharField(label='Product Code')

    def save(self):
        data = self.cleaned_data
        product = AllProduct(product_type=ProductType.object.get(name=data['product_type']['name']), 
            prodect_name=data['product_name'], price=data['price'], 
            description=data['description'], storage=data['storage'],
            product_code=data['product_code'])
        product.save()