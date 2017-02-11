import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import { Article } from './Article'
import { PhpCrud } from '../PhpCrud'
import { Settings } from '../Settings'

import 'rxjs/add/operator/toPromise';

@Injectable()
export class ArticleService {
    teamId: number;

    constructor(private http: Http) {
        this.teamId = -1;
    }

    getArticles(): Promise<Article[]> {
        var tableName = 'article';
        var url = Settings.Instance.Backend + tableName
            + '?order=created,desc';

        if (this.teamId < 0)
            url += '&filter=team_id,isnull';
        else
            url += '&filter=team_id,eq,' + this.teamId;

        return this.http.get(url)
            .toPromise()
            .then(spielerResponse => {
                return PhpCrud.transform(spielerResponse.json().data)
                    [Settings.Instance.TablePrefix + tableName];
            });
    }
}