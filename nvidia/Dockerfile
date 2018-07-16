FROM nvidia/cuda

ENV CLAYMORE_VERSION="11.8"

# Claymore suggested flags
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100


# Ethereum pool address
ENV EPOOL=eth-eu1.nanopool.org:9999
# Ethereum wallet address
ENV EWAL=0x3a44c064438B6EEF06d66EF5B59909fde7dCF283
# Ethereum pool password
ENV WORKER=hiriyaCenterDocker
ENV EPSW=x
# Improve stability in multi-GPU systems
ENV GSER=1
# Mining mode [0: Dual, 1: Eth]
ENV MODE=1

# Install various libs
RUN apt-get update && apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages --no-install-recommends apt-transport-https wget ca-certificates ocl-icd-opencl-dev curl libcurl3 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get claymore
RUN curl -Lks https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v${CLAYMORE_VERSION}/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak.AMD.NVIDIA.GPU.Miner.v${CLAYMORE_VERSION}.-.LINUX.tar.gz | tar zxvf - && mv *Claymore* claymore
# Delete downloaded file
RUN rm -f Claymore*.tar.gz

# Start claymore
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh