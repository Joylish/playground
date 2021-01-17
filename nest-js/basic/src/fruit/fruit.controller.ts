import { Controller, Get } from "@nestjs/common";

@Controller("fruit")
export class FruitController {
  @Get()
  getFruit() {
    return "Hi, I am Fruit Controller";
  }
}
