import { Component } from '@angular/core';
import { Http } from "@angular/http";
import { User, AuthService } from '../Services/AuthService';
import { FormBuilder, Validators } from '@angular/forms';


@Component({
    selector: 'Auth',
    templateUrl: './Auth.html'
})
export class AuthComponent {

    public loginForm = this.fb.group({
        username: ["", Validators.required],
        password: ["", Validators.required]
    });

    constructor(public fb: FormBuilder, private http: Http,
        private auth: AuthService) {
        //this.currentUser = Settings.Instance.CurrentUser;
    }

    doLogin(event) {
        this.auth.Login(this.loginForm.value.username,this.loginForm.value.password);
    }

    doLogout() {
        this.auth.Logout();
    }
}