import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

import { Product } from './product';
import { ProductService } from './product.service';

@Component({
  selector: 'app-edit-product-details',
  templateUrl: './edit-product-details.component.html',
  styleUrls: ['./edit-product-details.component.css']
})
export class EditProductDetailsComponent implements OnInit {

  componentTitle = 'Edit Product';

  // @Input()
  // product: Product | undefined

  // editProduct: Product = new Product()
  
  product: Product | undefined

  constructor(
    private _productService : ProductService,
    private route: ActivatedRoute,
    private location: Location
  ) {
  }

  ngOnInit(): void {
    // if (this.product) {
    //   this.editProduct.id = this.product.id
    //   this.editProduct.name = this.product.name
    //   this.editProduct.model = this.product.model
    //   this.editProduct.price = this.product.price
    //   this.editProduct.quantity = this.product.quantity
    // }
    // console.log("In EditProductDetailsComponent.ngOnInit()")
    const id = Number(this.route.snapshot.paramMap.get('id'));
    if (id == 0) {
      this.product = new Product()
      this.componentTitle = "Create a new Product"
    } else {
      this._productService.getProduct(id)
            .subscribe(product => this.product = product)
    }

  }

  goBack(): void {
    this.location.back();
  }

  saveProduct() {
    if (this.product) {
      if (this.product.id > 0) {
        this._productService.updateProduct(this.product)
          .subscribe(() => this.goBack())
      } else {
        this._productService.createProduct(this.product)
          .subscribe(() => this.goBack())
      }
    }
  }

}
