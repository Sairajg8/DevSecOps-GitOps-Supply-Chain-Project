# 🛡️ DevSecOps GitOps Supply Chain Guard

A production-grade, secure software supply chain pipeline that automates container building, vulnerability scanning, SBOM generation, cryptographic image signing, and Policy-as-Code enforcement using GitOps.

## 🏗️ Architecture Diagram

```mermaid
graph TD
    Dev((Developer)) -->|Git Push| GH[GitHub Repository]
    GH --> GHA[GitHub Actions CI]
    
    subgraph CI Pipeline [Secure CI Pipeline]
        GHA --> Build[Build Docker Image]
        Build --> Trivy[Trivy Vulnerability Scan]
        Trivy --> Syft[Generate SBOM with Syft]
        Syft --> Cosign[Sign Image with Cosign]
    end

    Cosign --> GHCR[(GitHub Container Registry)]
    
    GHCR --> Argo[Argo CD GitOps]
    Argo --> K8s[Kubernetes Cluster]
    
    subgraph Security Enforcement [Policy-as-Code]
        Kyverno[Kyverno Admission Controller] -.->|Verifies Signature| K8s
    end
    
    K8s --> App[Secure Web App]