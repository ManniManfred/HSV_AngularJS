import { SettingsService } from './Services/SettingsService';
import { PhpCrud } from './PhpCrud';
import { Http } from "@angular/http";

export class TableLoader {

    public data = [];
    
    public constructor(private tableName: string,
        private http: Http,
        protected settings: SettingsService) {
    }

    public get TableName(): string {
        return this.settings.TablePrefix + this.tableName;
    }

    protected getUrl(): string {
        return this.settings.Backend + this.tableName;
    }

    public LoadTable(): Promise<any> {
        let url = this.getUrl();
        if (url == null)
            return new Promise((resolve, reject) => {
                resolve();
            });
        
        return this.http.get(url).toPromise()
            .then(resp => {
                var transformed = PhpCrud.transform(resp.json());
                this.data = transformed[this.TableName];
            });
    }
}