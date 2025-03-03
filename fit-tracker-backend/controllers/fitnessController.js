export const updateProgress = (req, res) => {
  const { steps, heartPoints } = req.body;
  const progress = ((steps + heartPoints) / 200) * 100;
  res.json({ progress: Math.min(progress, 100) });
}
