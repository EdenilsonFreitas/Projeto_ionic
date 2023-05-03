import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ResidenciaPage } from './residencia.page';

const routes: Routes = [
  {
    path: '',
    component: ResidenciaPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ResidenciaPageRoutingModule {}
