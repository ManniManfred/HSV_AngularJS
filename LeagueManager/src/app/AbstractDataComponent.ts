import { OnInit } from '@angular/core';
import { Http } from "@angular/http";
import 'rxjs/add/operator/toPromise';

import { SettingsService } from './Services/SettingsService';
import { TableLoader } from './TableLoader';

export class AbstractDataComponent extends TableLoader implements OnInit {

    constructor(tableName: string,
        http: Http,
        settings: SettingsService) {
        super(tableName, http, settings);
    }

    ngOnInit() {
        this.LoadTable()
    }

}
