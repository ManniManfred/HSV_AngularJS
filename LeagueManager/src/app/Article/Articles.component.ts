import { Component } from '@angular/core'
import { Article } from './Article';
import { ArticleService } from './Article.service'

@Component({
    selector: 'Articles',
    providers: [ArticleService],
    templateUrl: './Articles.html'
})
export class ArticlesComponent {
    public articles = [];

    constructor(private artService: ArticleService)
    {
        this.artService.getArticles().then(
            (arts) => this.articles = arts
        );
    }
}