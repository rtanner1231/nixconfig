{ lib, pkgs,buildNpmPackage, fetchurl, nodejs_22 }:
# let
#   packageLock = fetchurl {
#     url = "https://raw.githubusercontent.com/oracle/netsuite-suitecloud-sdk/refs/heads/master/package.json";
#     sha256 = "sha256-t7qwbfif1dwv5hG9NiWQfyXtKrfhf/X1np1zrIuAfzc=";
#   };
# in
buildNpmPackage rec {
  # 1. Package Identity (from Section 2.1)
  pname = "@oracle/suitecloud-cli";
  version = "3.0.2";

  # 2. Source Code Input (from Section 2.2)
  # This fetches the package's own source code from the npm registry.
  src = fetchurl {
    url = "https://registry.npmjs.org/@oracle/suitecloud-cli/-/suitecloud-cli-${version}.tgz";
    # IMPORTANT: Replace this placeholder with the actual hash from `nix-prefetch-url`.
    sha256 = "sha256-cBBpIqcz4mVAEWU0RhrVdehfPUW6s+i5aQ/pCvZKr5Q=";
  };

  # 3. NPM Dependency Tree Input (from Section 2.4)
  # This hash verifies the integrity of the entire node_modules dependency tree.
  # IMPORTANT: Replace this placeholder with the actual hash from `prefetch-npm-deps`.
    #npmDepsHash = "sha256-y8+pjpH1blpM1qXzYEG0rUw1YNOE9h3z2eoR3JxK9OY=";

  npmDepsHash = "sha256-OHpzdQV8HpgEACDGr2vtmSzS36/kLxNwnVDH0FaIbq0=";

  makeCacheWritable = true;

  postPatch = ''
    cp ${./package-lock.json} ./package-lock.json
  '';

    # sourceRoot = "source/packages/suitecloud-cli";

  # 4. Build-time Dependencies (from Section 3.2)
  # These packages are made available in the PATH during the build process.
  nativeBuildInputs = [
    nodejs_22
    pkgs.openjdk
  ];

    npmFlags=["--acceptSuiteCloudSDKLicense"];

    #npmInstallFlags =["acceptSuiteCloudSDKLicense"];

  #   preConfigure = ''
  #   export npm_config_acceptsuitecloudsdklicense=true
  # '';

# installPhase = ''
#   runHook preInstall
#   npm install --acceptSuiteCloudSDKLicense @oracle/suitecloud-cli
#   runHook postInstall
# '';

  # 5. Installation Configuration (from Section 3.3)
  # This flag is required for non-interactive installation.

  #   installPhase = ''
  #   runHook preInstall
  #   export npm_config_acceptsuitecloudsdklicense=true
  #   npm ci --ignore-scripts=false
  #   runHook postInstall
  # '';


  # 6. Package Metadata (from Section 3.3)
  # This provides essential information about the package, including its unfree license.
  meta = with lib; {
    description = "Command-line interface for developing on the SuiteCloud platform";
    homepage = "https://www.npmjs.com/package/@oracle/suitecloud-cli";
    license = licenses.unfree;
    maintainers = with maintainers; [ ]; # Optional: add your maintainer handle
    platforms = platforms.linux ++ platforms.darwin;
  };
}
