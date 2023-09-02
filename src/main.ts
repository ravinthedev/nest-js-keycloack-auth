import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as dotenv from 'dotenv';

async function bootstrap() {
  const env = (process.env.NODE_ENV || 'dev').trim(); // Default to 'development'
  const envFilePath = `${env}.env`;
  // Load environment variables from the selected file
  dotenv.config({ path: envFilePath });
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
}
bootstrap();
