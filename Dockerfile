FROM node:20-alpine AS builder

WORKDIR /app

# Enable corepack so pnpm is available
RUN corepack enable

# Copy workspace manifests first for better Docker layer caching
COPY pnpm-workspace.yaml pnpm-lock.yaml package.json ./
COPY apps ./apps
COPY packages ./packages

# Install dependencies for the whole monorepo
RUN pnpm install --frozen-lockfile

# Build the shared ui library and the web app
RUN pnpm --filter @example/ui build
RUN pnpm --filter web build

# --- Runtime image ---
FROM nginx:alpine AS runner

# Copy built static assets into nginx
COPY --from=builder /app/apps/web/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

