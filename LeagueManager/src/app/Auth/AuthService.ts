import { Injectable } from '@angular/core';
import { Http } from "@angular/http";
import { Settings } from '../Settings';

export class User {
    public id: number;
    public username: string;
    public password: string;
    public team_id: number;
    public firstname: string;
    public lastname: string;
    public email: string;
}

@Injectable()
export class AuthService {

    public CurrentUser: User = null;
    public ErrMsg: string = null;

    public constructor(private http: Http) {
        console.log("auth constructor");
        this.loadCurrentUser();
    }

    private loadCurrentUser(): void {
        let url = Settings.Instance.GetFunctionUrl('GetSelf');
        this.http.post(url, null).toPromise()
            .then(resp => {
                this.CurrentUser = resp.json();
            });
    }

    public Login(username: string, password: string): void {

        this.ErrMsg = null;

        let url = Settings.Instance.GetFunctionUrl("Login");
        let body = {
            'username': username,
            'password': password
        };
        this.http.post(url, body).toPromise()
            .then(resp => {
                let result = resp.json();

                if (result.result == true)
                    this.CurrentUser = result.user;
                else
                    this.ErrMsg = result.message;
            });

        //console.log(event);
        //console.log(this.loginForm.value);
    }

    Logout() {
        this.ErrMsg = null;

        let url = Settings.Instance.GetFunctionUrl("Logout");
        this.http.post(url, null).toPromise()
            .then(resp => {
                this.CurrentUser = null;
            });

    }
}