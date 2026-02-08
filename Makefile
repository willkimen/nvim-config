# -----------------------------
# Neovim puro
# -----------------------------
create_nvim:
	docker build -t lab:nvim . && \
	docker run -it --name nvimlab lab:nvim

exec_nvim:
	docker restart nvimlab && docker exec -it nvimlab bash

