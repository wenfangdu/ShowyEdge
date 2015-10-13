#CONFIGURATION = Debug
CONFIGURATION = Release

AUTOUPDATE_ICON = 'build/Release/ShowyEdge.app/Contents/Frameworks/Sparkle.framework/Versions/A/Resources/Autoupdate.app/Contents/Resources/AppIcon.icns'

all:
	pod install --no-repo-update
	xcodebuild \
		-workspace *.xcworkspace \
		-scheme Pods \
		-configuration $(CONFIGURATION) \
		build \
		SYMROOT=`pwd`/build
	xcodebuild -alltargets -configuration $(CONFIGURATION) build
	[ -f $(AUTOUPDATE_ICON) ] || exit 1
	install -m 644 Resources/app.icns $(AUTOUPDATE_ICON)

clean:
	rm -rf build

gitclean:
	git clean -f -x -d

xcode:
	open *.xcworkspace

run: all
	./build/Release/ShowyEdge.app/Contents/MacOS/ShowyEdge

package:
	./make-package.sh

podupdate:
	pod update
