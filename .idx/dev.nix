{pkgs}: {
  channel = "stable-24.11";
  packages = [
    pkgs.nodejs_20
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
          "npm"  # Changed from pnpm
          "run"
          "dev"
          "--"   # Often required by npm to pass arguments to the script
          "--port"
          "$PORT"
        ];
        manager = "web";
      };
    };
  };
}
