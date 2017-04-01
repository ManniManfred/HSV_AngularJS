import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { ArticlesComponent } from './Article/Articles.component';
import { RankTableComponent } from './Team/RankTable.component';
import { AuthComponent } from './Auth/Auth.component';
import { AuthService } from './Auth/AuthService';

@NgModule({
  declarations: [
    AppComponent,
    ArticlesComponent,
    RankTableComponent,
    AuthComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    HttpModule,
    RouterModule.forRoot([{
      path: 'Articles',
      component: ArticlesComponent
    }, {
      path: 'RankTable',
      component: RankTableComponent
    }])
  ],
  providers: [AuthService],
  bootstrap: [AppComponent]
})
export class AppModule { }
