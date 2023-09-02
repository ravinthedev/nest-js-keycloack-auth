import { Controller, Get } from '@nestjs/common';
import {UserService} from "./user.service";

@Controller()
export class UserController {
    constructor(private readonly userService: UserService) {}
    @Get('/test')
    getpublic(): string {
        return `${this.userService.getHello()} from public`;
    }
    @Get('/user')
    getUser(): string {
        return `${this.userService.getHello()} from user`;
    }
    @Get('/admin')
    getAdmin(): string {
        return `${this.userService.getHello()} from admin`;
    }
    @Get('/all')
    getAll(): string {
        return `${this.userService.getHello()} from all`;
    }
}