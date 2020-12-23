import { NestFactory } from "@nestjs/core";
import { FruitModule } from "./fruit/fruit.module";

async function bootstrap() {
  const app = await NestFactory.create(FruitModule);
  await app.listen(3000);
}
bootstrap();
