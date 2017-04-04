import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ComboBoxModule } from 'ng2-combobox';

import { AppComponent } from './app.component';
import { ArticlesComponent } from './Article/Articles.component';
import { RankTableComponent } from './Team/RankTable.component';
import { AuthComponent } from './Auth/Auth.component';
import { StartComponent } from './Start/Start.component';

import { AuthService } from './Services/AuthService';
import { SettingsService } from './Services/SettingsService';
import { DataService } from './Services/DataService';

@NgModule({
  declarations: [
    AppComponent,
    ArticlesComponent,
    RankTableComponent,
    StartComponent,
    AuthComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    ComboBoxModule,
    RouterModule.forRoot([
    {
      path: 'Articles',
      component: ArticlesComponent
    }, {
      path: '**',
      component: StartComponent
    }])
  ],
  providers: [AuthService, SettingsService, DataService],
  bootstrap: [AppComponent]
})
export class AppModule { }
