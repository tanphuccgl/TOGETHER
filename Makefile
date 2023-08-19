
clean: 
	@echo "$ Cleaning the project"
	@rm -rf pubspec.lock
	@rm -rf ./ios/Podfile.lock
	@dart clean && dart pub get && make pod
get:
	@dart pub get
format:
	@dart format .
lint:
	@dart analyze
runnerForce: 
	@flutter packages pub run build_runner build --delete-conflicting-outputs
runner:	
	@flutter packages pub run build_runner build
pod:
	@pod install --project-directory=ios && pod update --project-directory=ios
signingReport:
	@cd android && ./gradlew signingReport && cd ..
# keytool -list -v -keystore android/app/release-keystore.jks -alias <key alias>
