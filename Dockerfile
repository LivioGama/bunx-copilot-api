FROM oven/bun:1 as base
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Copy package files if they exist (optional)
COPY package*.json bun.lock* ./

# Install dependencies if package.json exists
RUN if [ -f package.json ]; then bun install --frozen-lockfile; fi

# Default command to run bunx copilot-api start
CMD ["bunx", "copilot-api", "start"]

# Expose port 4141
EXPOSE 4141