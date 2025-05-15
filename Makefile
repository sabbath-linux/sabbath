OUT_DIR = bin
WORK_DIR = obj
PROFILE = live

all: build

build:
	mkarchiso -v -w $(WORK_DIR) -o $(OUT_DIR) $(PROFILE)

clean:
	rm -rf $(WORK_DIR)

run:
	run_archiso -i $(OUT_DIR)/*.iso
