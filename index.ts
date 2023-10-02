import 'dotenv/config';
import express from 'express';
import type { Request, Response } from 'express';
import connectDatabase from './db';

// connect to database
connectDatabase();

// create express app
const app = express();

// add middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// define routes
app.get('/', (req: Request, res: Response) => {
  return res.status(200).send('Hello World!');
});

app.get('/health', (req: Request, res: Response) => {
  return res.status(200).json({ ok: true });
});

// start server
const port = parseInt(process.env.PORT as string) || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
