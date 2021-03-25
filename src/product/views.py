from django.shortcuts import render
from .models import AllProduct
# Create your views here.
from django.http import HttpResponse

def product_list(request):
    context = {
        'products': AllProduct.objects.all()
    }
    return render(request, "home-page.html", context)
