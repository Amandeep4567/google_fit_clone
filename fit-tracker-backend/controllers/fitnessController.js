export const updateProgress = (req, res) => {
  const steps = 80;
  const heartPoints = 60;
  const progress = ((steps + heartPoints) / 200) * 100;

  res.json({
    progress: Math.min(progress, 100),
    steps,
    heartPoints,
  });
};
