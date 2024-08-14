{
  pkgs,
  config,
  ...
}: let
  androidEnv = pkgs.androidenv.override {licenseAccepted = true;};
  androidComposition = androidEnv.composeAndroidPackages {
    includeNDK = true;
    includeEmulator = true;
  };
in {
  home.packages = with pkgs; [
    (android-studio.withSdk (androidComposition.androidsdk))
    android-tools
  ];

  xdg.desktopEntries = {
    "android-studio" = {
      name = "Android Studio";
      exec = "android-studio";
      icon = "android-studio";
      comment = "The official Android IDE";
      categories = ["Development" "IDE"];
      startupNotify = true;
    };
  };

  home.sessionVariables.ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
  home.sessionVariables.NDK_HOME = "${androidComposition.androidsdk}/libexec/android-sdk/ndk/${builtins.head (pkgs.lib.lists.reverseList (builtins.split "-" "${androidComposition.ndk-bundle}"))}";
}
