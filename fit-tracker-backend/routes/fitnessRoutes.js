import express from "express";
import { updateProgress } from "../controllers/fitnessController.js";

const router = express.Router();

router.post("/update", updateProgress);
export default router;
