{pkgs}: {
  channel = "stable-24.11";
  packages = [
    pkgs.nodejs_20
    pkgs.pnpm
    pkgs.npm
    pkgs.jdk17
    pkgs.zip
  ];
  idx.extensions = [
    "GoogleCloudTools.firebase-dataconnect-vscode"
    "GraphQL.vscode-graphql-syntax"
  ];
  idx.workspace.onCreate = {
    install-dependencies = "cd app && npm install";
  };
  idx.workspace.onStart = {
    start-emulators = "npx -y firebase-tools@latest emulators:start";
  };
  idx.previews = {
    enable = true; 
    previews = {
      web = {
        command = [
          "pnpm"
          "run" 
          "dev:emulator" 
          "--port"
          "$PORT" 
        ];
        manager = "web";
      };
    };
  };
}