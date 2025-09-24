# -----------------------------
# Variáveis globais
# -----------------------------
NVM_VERSION=0.40.3
NODE_VERSION=24

# -----------------------------
# Neovim puro
# -----------------------------
create_nvim:
	docker build -t lab:nvim \
		--build-arg NVM_VERSION=$(NVM_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) . && \
	docker run -it --name nvimlab lab:nvim

exec_nvim:
	docker restart nvimlab && docker exec -it nvimlab bash

# -----------------------------
# Neovim + Go
# -----------------------------
create_go:
	docker build -t lab:go \
		--build-arg NVM_VERSION=$(NVM_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		--build-arg LANGUAGE=go . && \
	docker run -it --name golab lab:go

exec_go:
	docker restart golab && docker exec -it golab bash

# -----------------------------
# Neovim + Python
# -----------------------------
create_py:
	docker build -t lab:py \
		--build-arg NVM_VERSION=$(NVM_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		--build-arg LANGUAGE=py . && \
	docker run -it --name pylab lab:py

exec_py:
	docker restart pylab && docker exec -it pylab bash
