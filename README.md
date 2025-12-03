# Task API - DevOps Interview Project

A simple RESTful API for managing tasks, demonstrating DevOps best practices with Docker, Kubernetes, Terraform, and CI/CD.

##  Features

- RESTful API for task management
- Health check endpoint
- Containerized with Docker
- Deployed on DigitalOcean Kubernetes
- Infrastructure as Code with Terraform
- CI/CD with GitHub Actions

##  API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /health | Health check |
| GET | /tasks | Get all tasks |
| POST | /tasks | Create a new task |
| PUT | /tasks/:id | Update a task |
| DELETE | /tasks/:id | Delete a task |

##  Local Development

### Prerequisites
- Node.js 18+ 
- Docker
- Git

### Setup

1. Clone the repository:
```bash
git clone <your-repo-url>
cd task-api-devops
```

2. Install dependencies:
```bash
npm install
```

3. Run locally:
```bash
npm start
```

4. Test the API:
```bash
# Health check
curl http://localhost:3000/health

# Create a task
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title":"Test Task","description":"This is a test"}'

# Get all tasks
curl http://localhost:3000/tasks
```

##  Docker

Build and run with Docker:
```bash
docker build -t task-api .
docker run -p 3000:3000 task-api
```

##  Infrastructure

Infrastructure is managed with Terraform and includes:
- DigitalOcean Kubernetes Cluster (DOKS)
- Virtual Private Cloud (VPC)
- Container Registry (DOCR)
- Firewall rules

See `terraform/` directory for details.

##  Deployment

Deployment is automated via GitHub Actions:
1. Code pushed to `main` branch
2. Docker image built and pushed to DOCR
3. Kubernetes deployment updated
4. Rolling update performed

##  Architecture

```
GitHub → GitHub Actions → DOCR → Kubernetes (DOKS)
                                      ↓
                               LoadBalancer → Internet
```

##  Technology Stack

- **Application**: Node.js + Express
- **Containerization**: Docker
- **Orchestration**: Kubernetes
- **Infrastructure**: Terraform
- **CI/CD**: GitHub Actions
- **Cloud Provider**: DigitalOcean

##  Future Improvements

- [ ] Add database (PostgreSQL/MongoDB)
- [ ] Implement authentication (JWT)
- [ ] Add request validation
- [ ] Implement rate limiting
- [ ] Add monitoring (Prometheus/Grafana)
- [ ] Add logging (ELK stack)
- [ ] Implement auto-scaling
- [ ] Add SSL/TLS certificates

## 👤 Author

Nwogu Emmanuel
