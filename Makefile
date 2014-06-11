all: install
install: installer.sh
	./installer.sh install
clean: installer.sh
	./installer.sh uninstall

