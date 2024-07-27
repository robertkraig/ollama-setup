.PHONY: all setup configure run

all: setup configure

setup:
	@chmod +x ./scripts/install_dependencies.sh
	@chmod +x ./scripts/pyenv_setup.sh
	@./scripts/install_dependencies.sh
	@./scripts/pyenv_setup.sh
	echo "run 'source ~/.bashrc' to apply changes"

configure:
	@echo "Configuring system and Python environment..."
	sudo apt-get install -y build-essential cmake pkg-config libevdev-dev libudev-dev libconfig++-dev libglib2.0-dev
	sudo apt-get install -y zlib1g zlib1g-dev libssl-dev libbz2-dev libsqlite3-dev libreadline-dev libncurses-dev
	poetry config virtualenvs.in-project true
	pyenv install 3.10.14
	poetry env use 3.10.14

run:
	@echo "Running the Python script..."
	poetry run python main.py
