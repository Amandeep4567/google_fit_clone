import express from "express";
import cors from "cors";
import fitnessRoutes from "./routes/fitnessRoutes.js"

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/fitness", fitnessRoutes);

const PORT = 5000;
app.listen(PORT, () => console.log(`Server is running at port ${PORT}`));
