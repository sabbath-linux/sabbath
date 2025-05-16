-- packages to install
-- must be on aur
packages = {
	"yay",
	"vesktop"
}

out_db = "sabbath.db.tar.zst"

-- console wrappers
console = {
	clone_aur_pkg = function(pkg)
		os.execute("echo \"Cloning Package " .. pkg .. "\"")
		os.execute("git clone https://aur.archlinux.org/" .. pkg)
	end,
	makepkg = function(pkg)
		os.execute("makepkg --dir " .. pkg)
	end,
	add_repo = function(pkg)
		os.execute("repo-add " .. out_db .. " " .. pkg .. "/*.pkg.tar.zst")
		os.execute("cp " .. pkg .. "/*.pkg.tar.zst ./")
	end,
}

function generate_package(pkg)
	console.clone_aur_pkg(pkg)
	console.makepkg(pkg)
end

function generate_db()
	for _,pkg in ipairs(packages) do
		generate_package(pkg)
		console.add_repo(pkg)
	end
end

generate_db()
