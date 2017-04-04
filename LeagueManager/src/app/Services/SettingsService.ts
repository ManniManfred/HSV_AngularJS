import { Injectable } from '@angular/core';
import { Http } from "@angular/http";

export class Saison {
    public id: number;
    public name: string;
}

@Injectable()
export class SettingsService {

    private backendPath: string;

    public constructor(private http: Http) {
        this.backendPath = '/LeagueManager/Backend/';
    }

    public get TablePrefix(): string {
        return 'lm_';
    }
    public get Backend(): string {
        return this.backendPath + 'Data.php/' + this.TablePrefix;
    }

	public GetFunctionUrl(fName): string {
		return this.backendPath + fName + '.php';
	}

}