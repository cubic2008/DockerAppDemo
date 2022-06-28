import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EditProductDetailsComponent } from './edit-product-details.component';
import { ProductListComponent } from './product-list.component';
import { AppMessageComponent } from './app-message.component';

@NgModule({
  declarations: [
    AppComponent,
    EditProductDetailsComponent,
    ProductListComponent,
    AppMessageComponent,
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
