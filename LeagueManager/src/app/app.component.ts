import { Component } from '@angular/core';
import { DataService } from './Services/DataService';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app works!';
  selectedSaisonId = 8;

  testdata = [{'id': 1, 'name': "2014"},{'id': 2, 'name': "2015"},{'id': 3, 'name': "2016"}];
  selectedValue = null;

  public constructor(private dataService: DataService) {

  }

}
