const express = require("express");
const app = express();

app.get("/api/health", (req, res) => {
  res.json({ status: "Backend is healthy" });
});

app.get("/api/data", (req, res) => {
  res.json({ message: "Hello from backend API" });
});

app.listen(3000, () => {
  console.log("Backend running on port 3000");
});
