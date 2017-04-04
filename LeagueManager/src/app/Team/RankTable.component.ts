import { Component, OnChanges, SimpleChanges, Input } from '@angular/core';
import { Http } from "@angular/http";
import { SettingsService } from '../Services/SettingsService';
import { DataService } from '../Services/DataService';
import { AbstractDataComponent } from '../AbstractDataComponent';

@Component({
    selector: 'RankTable',
    templateUrl: './RankTable.html'
})
export class RankTableComponent
    extends AbstractDataComponent
    implements OnChanges {
    
    @Input()
    saisonId : Number = null;

    public sortBy = "rank";
    public sortOrder = "asc";

    constructor(private dataService: DataService,
        http: Http, settings: SettingsService) {
        super('play_table', http, settings);

    }

    public LoadTable(): Promise<any> {
        return super.LoadTable().then(res => {
                this.data.forEach(m => {
                    m.defeat = m.match_count - m.wins - m.stand_off;
                    m.points = m.wins * 3 + m.stand_off;
                    m.goal_diff = m.shoot - m.got;
                });
                this.data.sort((a,b) => b.points - a.points);
                
                this.data.forEach((m, i) => {
                    m.rank = i + 1;
                });

                this.SortData();
            });
    }

    ngOnChanges(changes: SimpleChanges): void {
        this.LoadTable();
    }

    protected getUrl(): string {
        if (this.saisonId == null)
            return null;

        let url = super.getUrl()
            + '?filter=id_saison,eq,' + this.saisonId;

        return url;
    }

    public order(sortStr: string): void {
        if (this.sortBy == sortStr)
            this.sortOrder = this.sortOrder == "asc" ? "desc" : "asc";
        this.sortBy = sortStr;

        this.SortData();
    }

    private SortData() :void {
        this.data = this.data.sort((a,b) => {
            if (a[this.sortBy] < b[this.sortBy])
                return this.sortOrder == "asc" ? -1 : 1;
            if (a[this.sortBy] > b[this.sortBy])
                return this.sortOrder == "asc" ? 1 : -1;

            return 0;
        });
    }
}