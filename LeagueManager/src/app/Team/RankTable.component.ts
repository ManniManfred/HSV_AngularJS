import { Component } from '@angular/core';
import {Http} from "@angular/http";
import { Settings } from '../Settings';
import { AbstractDataComponent } from '../AbstractDataComponent';

@Component({
    selector: 'RankTable',
    templateUrl: './RankTable.html'
})
export class RankTableComponent extends AbstractDataComponent {
    public sortBy = "rank";
    public sortOrder = "asc";

    constructor(http: Http)
    {
        super('play_table', http);

        Settings.Instance.SelectedSaison
    }

    protected getUrl(): string {
        if (Settings.Instance.SelectedSaison == null)
            return null;

        let url = super.getUrl()
            + '?filter=id_saison,eq,' + Settings.Instance.SelectedSaison.id;

        return url;
    }
    
}