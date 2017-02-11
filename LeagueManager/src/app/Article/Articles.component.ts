import { Component } from '@angular/core';
import { Http } from "@angular/http";
import { AbstractDataComponent } from '../AbstractDataComponent';
import { Settings } from '../Settings';

@Component({
    selector: 'Articles',
    templateUrl: './Articles.html'
})
export class ArticlesComponent extends AbstractDataComponent {
    
    constructor(http: Http) {
        super('article', http);
    }

    protected getUrl(): string {
        let url = super.getUrl() + '?order=created,desc';

        if (Settings.Instance.TeamId < 0)
            url += '&filter=team_id,isnull';
        else
            url += '&filter=team_id,eq,' + Settings.Instance.TeamId;
        
        return url;
    }
}