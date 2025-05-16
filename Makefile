OUT_DIR = bin
WORK_DIR = obj
PROFILE = live
DB = db

all: build

$(DB)/sabbath.db.tar.zst: db/step_down_perms_and_run.sh
	echo $(USER)
	bash $<
	cp $@ ./$(PROFILE)/airootfs/sabbath/db/

$(PROFILE)/pacman.conf: utils/genpacmanconf/pacman.conf utils/genpacmanconf/genpacmanconf.sh
	bash utils/genpacmanconf/genpacmanconf.sh

build: $(DB)/sabbath.db.tar.zst $(PROFILE)/pacman.conf
	mkarchiso -v -w $(WORK_DIR) -o $(OUT_DIR) $(PROFILE)

clean:
	rm -rf $(WORK_DIR)
	rm -rf $(DB)/*.zst

run:
	run_archiso -i $(OUT_DIR)/*.iso
