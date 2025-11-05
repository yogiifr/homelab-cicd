# Zero-Downtime Auto-Deploy Homelab

A fully on-premise CI/CD pipeline that auto-builds, deploys, and updates.

---

## Architecture Diagram

[GitHub/GitLab]
     ↓ (git push)
[GitLab Server] → trigger → [GitLab Runner di Home Server]
     ↓
[Build Docker Image] → [Push to Local Registry] → [Deploy via Docker Compose]
     ↓
[Live App: http://homelab.local:3000]

## Stack

- **Vite + TypeScript** – Frontend app  
- **Podman** – Rootless, daemonless container runtime  
- **GitLab CE (self-hosted)** – Git server + CI/CD engine  
- **GitLab Runner** – CI/CD agent (Docker-in-Podman executor)  
- **Nginx (multi-stage build)** – Production static server  

---

## Phase Progress

### Phase 1: App & Containerization

- [x] Vite + TypeScript app initialized  
- [x] Multi-stage `Dockerfile` (build → Nginx)  
- [x] App runs locally: `podman run -p 8080:80`  
- [x] Verified at `http://localhost:8080`

### Phase 2: GitLab CE Self-Hosted

- [x] GitLab CE running via Podman  
- [x] Accessible at `http://homelab-ip:8080`  
- [x] Root account configured  
- [x] Project `homelab-cicd` created (private)

### Phase 3: GitLab Runner

- [x] Runner container running via Podman  
- [x] Connected via `podman.sock` → Docker executor  
- [x] Registered to project with token  
- [x] Status: **Online** in GitLab UI  
- [x] Ready to execute CI/CD jobs

### Phase 4: CI/CD Pipeline (In Progress)

- [ ] `.gitlab-ci.yml` with `build` + `deploy` stages  
- [ ] Auto-build image on `git push`  
- [ ] Auto-deploy via `podman-compose`  
- [ ] Zero-downtime update

### Phase 5: Live Demo & Portfolio (Upcoming)

- [ ] `ngrok` live URL  
- [ ] 2-min demo video  
- [ ] Full documentation + architecture diagram  

---

## Lesson Learned

- Running Gitlab di server on-premise makan banyak ram, coba lanjut implement cloud stack untuk next project

---

## Docs References

- [Vite Docs](https://vitejs.dev/)  
- [Podman Docs](https://podman.io/docs)  
- [GitLab CE Docker/Podman](https://docs.gitlab.com/omnibus/docker/)  
- [GitLab Runner Registration](https://docs.gitlab.com/runner/register/)  
- [Podman + GitLab Runner](https://www.redhat.com/sysadmin/podman-gitlab-runners)  
- [Docker Multi-stage Build](https://docs.docker.com/develop/develop-images/multistage-build/)  
