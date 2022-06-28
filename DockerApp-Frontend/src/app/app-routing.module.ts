import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EditProductDetailsComponent } from './edit-product-details.component';
import { ProductListComponent } from './product-list.component';

const routes: Routes = ([
  {
    path: '',
    redirectTo: '/products',
    pathMatch: 'full'
 },
  {
     path: 'products',
     component: ProductListComponent
  },
  {
    path: 'products/:id',
    component: EditProductDetailsComponent
  },

])

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
