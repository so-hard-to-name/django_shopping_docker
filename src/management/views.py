from django.shortcuts import render
from django.http import HttpResponseForbidden, Http404, HttpResponse, HttpResponseRedirect
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic import CreateView
from product.models import AllProduct, ProductType
from shopcart.models import ShopCartProduct, AllShopCart
from product.forms import ProductForm
from django.db.models import Q
import json
# Create your views here.

class ProductlistView(ListView):
    template_name = "product_list.html"    

    def get_context_data(self, **kwargs):
        context = super(ProductlistView, self).get_context_data(**kwargs)

        userid = 0      # Normally there should be cookie using here to get user's id
        context['cartproduct_count'] = ShopCartProduct.objects.filter(shopcart_id__user_id=userid).count()
        
        context['products'] = AllProduct.objects.all()
        context['product_types'] = ProductType.objects.all()

        
        return context
    
    def get_queryset(self):
        # sort type in GET
        sort_type = self.request.GET.get('sort', None)
        initial_qs = AllProduct.objects.all()

class ProductDetailView(DetailView):
    template_name = 'product_info.html'

    def get_success_url(self):
        return reverse('product_list_view')
    
    def get_object(self, queryset=None):
        return AllProduct.objects.get(id=self.kwargs['pk'])

    def get_context_data(self, **kwargs):        
        context = super(ProductDetailView, self).get_context_data(**kwargs)

        userid = 0      # Normally there should be cookie using here to get user's id
        context['cartproduct_count'] = ShopCartProduct.objects.filter(shopcart_id__user_id=userid).count()
        context['product_detail'] = self.get_object

        return context
    
def add_product_to_cart(request, pk, template_name='', extra_context=None, **kwargs):

    class Response(object):
        result = ""

    response = Response()

    if request.method == "POST":
        userid = 0      # normally, it should check cookie here
        cart_ex = AllShopCart.objects.select_related().filter(Q(user_id=userid)).exists()
        if not cart_ex:
            a1 = AllShopCart(user_id=userid)
            a1.save()
        

        new_cart_product = ShopCartProduct()
        
        new_cart_product_id = request.POST['new_cart_product_id']
        new_cart_product_amount = request.POST['new_cart_product_amount']

        new_cart_product.amount = new_cart_product_amount
        new_cart_product.product_id = AllProduct.objects.get(id=new_cart_product_id)
        new_cart_product.shopcart_id = AllShopCart.objects.get(user_id=userid)

        try:
            new_cart_product.save()
        except Exception as e:
            return  HttpResponse("Error adding product to cart",
                                 content_type="text/plain", status=500)

        response.result = "SUCCESS"
        response.count = ShopCartProduct.objects.filter(shopcart_id__user_id=userid).count()

        return  HttpResponse(json.dumps( response.__dict__ ),
                             content_type="text/plain", status=201)
    else:
        return HttpResponse("No POST.", content_type="text/plain", status=403)

class ProductAddView(ListView):    
    template_name = 'product_add.html'
    
    def get_context_data(self, **kwargs):
        context = super(ProductAddView, self).get_context_data(**kwargs)

        context['product_types'] = ProductType.objects.all()        
        context['form'] = ProductForm

        return context

    def get_success_url(self):
        return reverse('product_list_view')

    def get_queryset(self):
        # sort type in GET
        sort_type = self.request.GET.get('sort', None)
        initial_qs = ProductType.objects.all()
        

def create_new_product(request, template_name='', extra_context=None, **kwargs):

    class Response(object):
        result = ""

    response = Response()

    if request.method == "POST":
        
        new_product = AllProduct()
        
        new_product_name = request.POST['new_product_name']
        new_product_price = request.POST['new_product_price']
        new_product_des = request.POST['new_product_des']
        new_product_storage = request.POST['new_product_storage']
        new_product_code = request.POST['new_product_code']
        new_product_type = request.POST['new_product_type']

        new_product.product_name = new_product_name
        new_product.price = new_product_price 
        new_product.description = new_product_des
        new_product.storage = new_product_storage
        new_product.product_code = new_product_code
        new_product.product_type = ProductType.objects.get(name=new_product_type)

        try:
            new_product.save()
        except Exception as e:
            return  HttpResponse("Error adding product to cart",
                                 content_type="text/plain", status=500)

        response.result = "SUCCESS"        

        return  HttpResponse(json.dumps( response.__dict__ ),
                             content_type="text/plain", status=201)
    else:
        return HttpResponse("No POST.", content_type="text/plain", status=403)

class SearchResultView(ListView):
    template_name = 'search_result.html'

    def get_context_data(self, **kwargs):
        context = super(SearchResultView, self).get_context_data(**kwargs)
        letter = self.kwargs['search']
        context['products'] = AllProduct.objects.select_related().filter(Q(product_name__icontains=letter) | Q(product_code__icontains=letter))

        userid = 0      # Normally there should be cookie using here to get user's id
        context['cartproduct_count'] = ShopCartProduct.objects.filter(shopcart_id__user_id=userid).count()
        
        return context
    
    def get_queryset(self):
        # sort type in GET
        sort_type = self.request.GET.get('sort', None)
        initial_qs = AllProduct.objects.all()