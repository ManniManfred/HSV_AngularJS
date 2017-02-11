import { OnInit } from '@angular/core';
import { Http } from "@angular/http";
import 'rxjs/add/operator/toPromise';
import { Settings } from './Settings';
import { PhpCrud } from './PhpCrud';

export class AbstractDataComponent implements OnInit {

    public data = [];

    constructor(private tableName: string, private http: Http) {
    }

    public get TableName(): string {
        return Settings.Instance.TablePrefix + this.tableName;
    }

    ngOnInit() {
        this.loadTable();
    }

    protected getUrl(): string {
        return Settings.Instance.Backend + this.tableName;
    }

    protected loadTable(): void {
        let url = this.getUrl();
        if (url == null)
            return;

        let self = this;
        this.http.get(url).toPromise()
            .then(resp => {
                var transformed = PhpCrud.transform(resp.json());
                self.data = transformed[self.TableName];
            });
    }
}
