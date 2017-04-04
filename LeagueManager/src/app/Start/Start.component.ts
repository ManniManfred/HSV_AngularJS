import { Component } from '@angular/core';
import { DataService } from '../Services/DataService';

@Component({
    selector: 'Start',
    templateUrl: './Start.html'
})
export class StartComponent {
    
  public constructor(public dataService: DataService) {
  }

}