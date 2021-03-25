# Generated by Django 3.1.7 on 2021-03-22 14:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ProductType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='AllProduct',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_name', models.CharField(max_length=100)),
                ('description', models.TextField(max_length=200)),
                ('price', models.IntegerField(default=0)),
                ('storage', models.IntegerField(default=0)),
                ('product_type', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='product.producttype')),
            ],
        ),
    ]