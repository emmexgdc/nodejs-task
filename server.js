const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// In-memory storage
let tasks = [];
let idCounter = 1;

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ 
    status: 'healthy', 
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// Get all tasks
app.get('/tasks', (req, res) => {
  res.json({
    count: tasks.length,
    tasks: tasks
  });
});

// Create a new task
app.post('/tasks', (req, res) => {
  const { title, description } = req.body;
  
  if (!title) {
    return res.status(400).json({ error: 'Title is required' });
  }

  const task = {
    id: idCounter++,
    title,
    description: description || '',
    completed: false,
    createdAt: new Date().toISOString()
  };
  
  tasks.push(task);
  res.status(201).json(task);
});

// Update a task
app.put('/tasks/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const taskIndex = tasks.findIndex(t => t.id === id);
  
  if (taskIndex === -1) {
    return res.status(404).json({ error: 'Task not found' });
  }

  tasks[taskIndex] = {
    ...tasks[taskIndex],
    ...req.body,
    id: id,
    updatedAt: new Date().toISOString()
  };

  res.json(tasks[taskIndex]);
});

// Delete a task
app.delete('/tasks/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const initialLength = tasks.length;
  tasks = tasks.filter(t => t.id !== id);
  
  if (tasks.length === initialLength) {
    return res.status(404).json({ error: 'Task not found' });
  }

  res.status(204).send();
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ error: 'Endpoint not found' });
});

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`✅ Task API server running on port ${PORT}`);
  console.log(`📍 Health check: http://localhost:${PORT}/health`);
  console.log(`📋 Tasks endpoint: http://localhost:${PORT}/tasks`);
});