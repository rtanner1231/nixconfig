{ lib, pkgs, fetchFromGitHub, buildNpmPackage, nodejs_22, openjdk }:

buildNpmPackage rec {
  pname = "suitecloud-cli";
  version = "3.0.2";

  src = fetchFromGitHub {
    owner = "oracle";
    repo = "netsuite-suitecloud-sdk";
    tag="suitecloud-cli@${version}";
    sha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"; # Actual hash after calculation
  };

  # The CLI is located in a subdirectory of the monorepo.
  sourceRoot = "source/packages/suitecloud-cli";

  npmDepsHash = "sha256-yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"; # Actual hash after calculation

  nodejs = nodejs_22;

  # Provide the required Oracle JDK to the build environment.
  buildInputs = [ openjdk ];

  # Pass the license acceptance flag to the 'npm ci' command.
  npmInstallFlags =["--acceptSuiteCloudSDKLicense"];

  # Ensure the executable is available in the final package.
  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    ln -s $out/lib/node_modules/@oracle/suitecloud-cli/src/suitecloud.js $out/bin/suitecloud
    runHook postInstall
  '';

  meta = with lib; {
    description = "SuiteCloud CLI for Node.js to manage SuiteCloud project components";
    homepage = "https://github.com/oracle/netsuite-suitecloud-sdk";
    license = licenses.upl; # Universal Permissive License v1.0
    maintainers = with maintainers; [ ]; # Add your maintainer handle
    platforms = platforms.linux ++ platforms.darwin;
  };
}
