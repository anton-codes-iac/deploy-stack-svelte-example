# SvelteKit on AWS ECS Fargate (Day 1 & Day 2 Reference Implementation) ☁️🚀

> A production-ready reference architecture demonstrating how to automatically deploy and manage SvelteKit applications on AWS ECS Fargate.

This repository serves as a live example of the [svelte-adapter-deploy-stack](https://www.npmjs.com/package/svelte-adapter-deploy-stack) package in action. It showcases a completely automated solution for Day 1 provisioning and Day 2 lifecycle management of AWS infrastructure for SSR (Server-Side Rendered) applications.

## 🏗️ The Problem it Solves

Deploying a SvelteKit app to AWS natively (without using expensive proprietary PaaS wrappers) traditionally requires immense DevSecOps overhead. 

By integrating `svelte-adapter-deploy-stack`, this repository demonstrates how to bypass that complexity. The adapter hooks into the standard SvelteKit build process to automatically generate and manage:
*   **Infrastructure as Code:** Production-grade Terraform modules for ECS Fargate, Application Load Balancers (ALB), and VPC networking.
*   **Containerization:** Optimized Dockerfiles tailored for SvelteKit Node.js compilation.
*   **Day 2 Operations (CI/CD):** A zero-secret GitHub Actions pipeline using IAM OIDC for secure, continuous deployments.
*   **DevSecOps:** Integrated Trivy vulnerability scanning for both containers and IaC.

## 🚀 How to Reproduce this Architecture

Want this exact Day 1 and Day 2 AWS Fargate setup for your own SvelteKit project? 

You do not need to clone this repository. Simply install the adapter in your own project:

```bash
npm uninstall @sveltejs/adapter-auto
npm install -D svelte-adapter-deploy-stack
```

Then, update your `vite.config.ts` (or `svelte.config.js` for older versions) to use the adapter:

```typescript
import adapter from 'svelte-adapter-deploy-stack';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
  plugins: [
    sveltekit({
      adapter: adapter({
        region: 'us-east-2',
        size: 'micro'
      })
    })
  ]
});
```

Run `npm run build` to generate the infrastructure code, and `npx --yes deploy-stack apply` to provision it to AWS.

## 🔗 Resources
*   **[svelte-adapter-deploy-stack on NPM](https://www.npmjs.com/package/svelte-adapter-deploy-stack)**
*   **[deploy-stack core CLI](https://github.com/anton-codes-iac/deploy-stack)**