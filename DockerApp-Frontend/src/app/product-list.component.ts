import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Product} from './product'
import { ProductService } from './product.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {
  componentTitle = 'Product List';
  // products = PRODUCTS;
  products: Product[] | undefined
  selectedProduct: Product | undefined;

  constructor(private productService: ProductService, private router: Router,) {
  }

  ngOnInit(): void {
    console.log("In ProductListComponent.ngOnInit()")
    this.productService.getAllProducts().subscribe( products => this.products = products);
  }

  onSelect(product: Product): void {
    this.selectedProduct = product;
  }

  newProduct() {
    this.router.navigate(['/products', 0]);
  }

  deleteProduct(product: Product) {
    console.log("delete product - ", product.id)
    this.productService.deleteProduct(product)
      // .subscribe(this.products = this.products.filter(p => [p] !== product);
      // .subscribe(() => this.productService.getAllProducts().subscribe( products => this.products = products))
      .subscribe(() => {
        console.log("Deleted.")
        this.productService.getAllProducts().subscribe( products => { console.log("retrieve list"); this.products = products;})
    })
  }
}
