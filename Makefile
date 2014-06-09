all: install
install: install.sh
	./install.sh
clean:
	rm -rf ~/.search
