from django.urls import path
from django.conf.urls import url
from management import views as management_views

urlpatterns = [
    url(r'^product/$', management_views.ProductlistView.as_view(), name='product_list_view'),
    url(r'^product/(?P<pk>\d+)/$', management_views.ProductDetailView.as_view(), name='product_detail_view'),    
    url(r'^product/add/$', management_views.ProductAddView.as_view(), name='product_add_view'),
    url(r'^product/search/(?P<search>[\.\w-]+)/$', management_views.SearchResultView.as_view(), name='search_result_view'),
    url(r'^product/(?P<pk>\d+)/addcart/$', management_views.add_product_to_cart, name='add_product_to_cart'),
    url(r'^product/add/create/$', management_views.create_new_product, name='create_new_product'),
]