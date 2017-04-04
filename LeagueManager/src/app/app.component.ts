import { Component } from '@angular/core';
import { DataService } from './Services/DataService';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = "dsf";

  public constructor(public dataService: DataService) {
    this.title = environment.title;
  }

}
