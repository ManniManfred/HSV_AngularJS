import { Injectable } from '@angular/core';
import { Http } from "@angular/http";
import { TableLoader } from '../TableLoader';
import { SettingsService } from './SettingsService';

export class Saison {
    public id: number;
    public name: string;
}

@Injectable()
export class DataService {

    public saisons: TableLoader;
    public selectedSaisonId: number = 0;

    public constructor(http: Http, settings: SettingsService) {
        this.saisons = new TableLoader("saison", http, settings);
        this.saisons.LoadTable()
        .then(res => {
            this.selectedSaisonId = this.saisons.data[this.saisons.data.length - 1].id;
            this.saisons.data.forEach(element => {
                if (element.isDefault)
                    this.selectedSaisonId = element.id;
            });
        });
    }
 
}