# 🌮 TacO Marker Pack Template / TMPT

This is a template for a [TacO](https://www.gw2taco.com/)/[Blish HUD](https://blishhud.com/) Marker Pack that features:
* Auto Building and Releasing - Publish your marker pack automatically with GitHub actions and releases.
* Changelog generation - Releases will have changelogs automatically added to them from the CHANGELOG.md
* Local Install Script - A one-click install to test your marker pack locally.

## 🛠️ Setup

Setting this system up is extremely simple.

* **Step 1.** Click "Use this template" -> "Create a new repository" and enter your repository name, description etc.
* **Step 2.** Change Variables within the repository:
    * **Step 2.1**. Open ".github\workflows\build_and_release.yml" and change the variable "OUTPUT_NAME" to be the name of your marker pack such as "OUTPUT_NAME: example" will output a file called example.taco on release.
    * **Step 2.2**. Open "install.bat" and change the two variables near the top of the file. One is called "targetLocation" which is the path of where your marker packs are loaded by TacO or Blish HUD, this is where the script will install your marker pack to be tested. Finally, change the "fileName" variable to be the name of your marker pack, it ideally should match with the above changed "OUTPUT_NAME".
* **Step 3.** Change README.md to fit your marker pack.


## 📝 How To: Develop Marker Pack

Make your marker pack as normal, you're still able to use multiple XML files, folders etc. while keeping a "[Unreleased]" section in your CHANGELOG.md and updating it with the development of your marker pack, this is what will be published with the future release of your marker pack.

If you're using Blish HUD then feel free to check out my [Marker Pack Assistant Module](https://blishhud.com/modules/?module=HexedHero.Blish_HUD.MarkerPackAssistant) that can provide you with useful information as well as automate the batch script process and reload markers.

The CHANGELOG.md follows the format of [keep a changelog](https://keepachangelog.com/).  
Changelog Example:
```
# Changelog

## [Unreleased]

### Added

- Added X

### Fixed

- Fixed X

## [1.0.0]- 2024-01-25

### Added

- Marker Pack for X
```

## 📥 How To: Install Locally

Run the "install.bat" file, this will create a TacO file and place it in the targeted location as well as remove any old versions installed in there.

## 📤 How To: Publish

When you are ready to publish a new release you have to push a commit with the format of "[CI-BUILD] x.x.x ..." such as "[CI-BUILD] 1.0.0 Release" and then GitHub will pack all your files into a TacO file and push it as a release with the changes from the CHANGELOG.md.

The best way to do this is to change the "[Unreleased]" tag to the next version of your marker pack such as "[1.0.1]" with the commit message of "[CI-BUILD] 1.0.1 Release".

The two directories ".git" and ".github" as well as the file "install.bat", won't be published with any release. However, **all** other files and directories will.
