import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError, map, tap } from 'rxjs/operators';

import { Product, PRODUCTS } from './product';
import { MessageService } from './message.service';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private products = PRODUCTS
  private apiUrl = `${environment.apiURL}/api/v1/products`;
  httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

  constructor(private http: HttpClient, private messageService: MessageService) { }

  getAllProducts(): Observable<Product[]> {
    // return Promise.resolve(PRODUCTS);
    // return new Promise( resolve =>
    //     // Simulate server latency with 2s delay
    //     setTimeout( () => resolve(this.products), 2000 )
    //   )
    // return of(this.products)
    return this.http.get<Product[]>(this.apiUrl)
      .pipe(
        tap(p => console.log('fetched product', p)),
        catchError(this.handleError<Product[]>('getAllProducts', []))
      );
  }

  getProduct(productId: number): Observable<Product> {
      // return of(this.products.find(product => product.id === productId)!)
      const url = `${this.apiUrl}/${productId}`;
      return this.http.get<Product>(url).pipe(
        tap(_ => console.log(`fetched product id=${productId}`)),
        catchError(this.handleError<Product>(`getProduct id=${productId}`))
      );
  }

  createProduct(product: Product) {
    product.id = 0
    return this.http.post(this.apiUrl, product, this.httpOptions).pipe(
      tap(_ => console.log(`created product id=${product.id}`)),
      catchError(this.handleError<any>('saveProduct'))
    );
  }

  updateProduct(product: Product) {
    const url = `${this.apiUrl}/${product.id}`;
    return this.http.put(url, product, this.httpOptions).pipe(
      tap(_ => console.log(`updated product id=${product.id}`)),
      catchError(this.handleError<any>('updateProduct'))
    );
  }

  deleteProduct(product: Product) {
    const url = `${this.apiUrl}/${product.id}`;
    return this.http.delete(url, this.httpOptions).pipe(
      tap(_ => console.log(`updated product id=${product.id}`)),
      catchError(this.handleError<any>('deleteProduct'))
    );
  }

    /**
   * Handle Http operation that failed.
   * Let the app continue.
   *
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
     private handleError<T>(operation = 'operation', result?: T) {
      return (error: any): Observable<T> => {
  
        // TODO: send the error to remote logging infrastructure
        console.error(error); // log to console instead
  
        // TODO: better job of transforming error for user consumption
        console.error(`${operation} failed: ${error.message}`);

        this.messageService.add(`${operation} failed: ${error.message}`)
  
        // Let the app keep running by returning an empty result.
        return of(result as T);
      };
    }
  

}
