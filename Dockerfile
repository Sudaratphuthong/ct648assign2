# Use an official Node runtime as a parent image
FROM node:16

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Set Bun to the PATH
ENV PATH="/root/.bun/bin:$PATH"

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json (or bun.lockb) to the working directory
COPY ./package*.json ./bun.lockb* ./

# Install dependencies using Bun
RUN bun install

# Copy the remaining application files to the working directory
COPY . .

# Expose port 3000 for the application
EXPOSE 3000

# Start the application using Bun
CMD ["bun", "run", "dev"]
