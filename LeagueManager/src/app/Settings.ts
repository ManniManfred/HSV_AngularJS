
export class Saison {
    public id: number;
    public name: string;
}

export class Settings {
    private static _instance: Settings;

    private backendPath: string;

    public SelectedSaison : Saison = null;

    public get TeamId(): number {
        return -1;
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

    private constructor() {
        this.backendPath = '/LeagueManager/Backend/';
    }

    public static get Instance() {
        return this._instance || (this._instance = new this());
    }
}