#!/bin/bash
set -e  # Exit on any error

echo "🚀 Starting Nomad deployment..."
NOMAD_ADDR="${NOMAD_ADDR:-http://18.190.160.5:4646}"

# Verify Nomad connection
echo "📡 Checking Nomad connectivity..."
nomad node status || {
    echo "❌ Cannot connect to Nomad at $NOMAD_ADDR"
    exit 1
}

# Define deployment order - CRÍTICO
JOBS=("traefik.nomad" "blog-db.nomad" "redis.nomad" "blog-app.nomad")

for job_file in "${JOBS[@]}"; do
    if [[ -f "nomad/jobs/$job_file" ]]; then
        echo "📦 Deploying $job_file..."
        nomad job run "nomad/jobs/$job_file"
        
        # Wait for health checks
        echo "⏳ Waiting for service to be healthy..."
        sleep 10
    else
        echo "⚠️  Job file $job_file not found, skipping..."
    fi
done

echo "✅ All jobs deployed successfully!"