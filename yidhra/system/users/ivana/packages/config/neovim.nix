{ pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      initLua = builtins.readFile ./neovim/init.lua;
      
      extraPackages = with pkgs; [
        clang-tools
        cmake-language-server
        omnisharp-roslyn
        rust-analyzer
        gopls
        zls
        lua-language-server
        nixd
        nil
        nixfmt
        lemminx
        yaml-language-server
        taplo
        vscode-langservers-extracted
        bash-language-server
        shellcheck
        pyright
        typescript-language-server
        typescript
        marksman
        texlab
        sqls
        docker-language-server        
      ];

      coc = {
        enable = true;
        settings = {
          "suggest.noselect" = false;
          "diagnostic.virtualText" = true;
          "diagnostic.virtualTextCurrentLineOnly" = false;
          "coc.preferences.formatOnSaveFiletypes" = [
            "c" 
            "cpp" 
            "go" 
            "javascript"
            "lua"
            "python" 
            "rust" 
            "typescript" 
            "zig" 
          ];

          languageserver = {
            clangd = {
              command = "clangd";
              args = [ "--background-index" "--clang-tidy" "--header-insertion=iwyu" ];
              filetypes = [ "c" "cpp" "objc" "objcpp" "cuda" ];
              rootPatterns = [ "compile_commands.json" "compile_flags.txt" ".clangd" ".git" ];
            };

            cmake = {
              command = "cmake-language-server";
              filetypes = [ "cmake" ];
              rootPatterns = [ "CMakeLists.txt" "build" ".git" ];
            };

            omnisharp = {
              command = "OmniSharp";
              args = [ "-lsp" ];
              filetypes = [ "cs" ];
              rootPatterns = [ ".git" ];
            };
            rust-analyzer = {
              command = "rust-analyzer";
              filetypes = [ "rust" ];
              rootPatterns = [ "Cargo.toml" "rust-project.json" ];
              settings.rust-analyzer = {
                cargo.buildScripts.enable = true;
                procMacro.enable = true;
              };
            };

            gopls = {
              command = "gopls";
              filetypes = [ "go" "gomod" "gowork" "gotmpl" ];
              rootPatterns = [ "go.mod" "go.work" ".git" ];
            };

            zls = {
              command = "zls";
              filetypes = [ "zig" "zir" ];
              rootPatterns = [ "build.zig" ".git" ];
            };

            lua-ls = {
              command = "lua-language-server";
              filetypes = [ "lua" ];
              rootPatterns = [ ".luarc.json" ".luarc.jsonc" ".git" ];
              settings.Lua = {
                runtime.version = "LuaJIT";
                diagnostics.globals = [ "vim" ];
                workspace = {
                  checkThirdParty = false;
                  library = [ "${pkgs.neovim-unwrapped}/share/nvim/runtime/lua" ];
                };
                telemetry.enable = false;
              };
            };

            pyright = {
              command = "pyright-langserver";
              args = [ "--stdio" ];
              filetypes = [ "python" ];
              rootPatterns = [ "pyproject.toml" "setup.py" "setup.cfg" "requirements.txt" ".git" ];
            };

            bash = {
              command = "bash-language-server";
              args = [ "start" ];
              filetypes = [ "sh" "bash" ];
              rootPatterns = [ ".git" ];
            };

            html = {
              command = "vscode-html-language-server";
              args = [ "--stdio" ];
              filetypes = [ "html" "htmldjango" "handlebars" ];
              rootPatterns = [ ".git" ];
            };

            css = {
              command = "vscode-css-language-server";
              args = [ "--stdio" ];
              filetypes = [ "css" "scss" "less" ];
              rootPatterns = [ ".git" ];
            };

            json = {
              command = "vscode-json-language-server";
              args = [ "--stdio" ];
              filetypes = [ "json" "jsonc" ];
              rootPatterns = [ ".git" ];
            };

            yaml = {
              command = "yaml-language-server";
              args = [ "--stdio" ];
              filetypes = [ "yaml" ];
              rootPatterns = [ ".git" ];
            };

            toml = {
              command = "taplo";
              args = [ "lsp" "stdio" ];
              filetypes = [ "toml" ];
              rootPatterns = [ "*.toml" ".git" ];
            };

            xml = {
              command = "lemminx";
              filetypes = [ "xml" "xsd" "xsl" "xslt" "svg" ];
              rootPatterns = [ ".git" ];
            };

            markdown = {
              command = "marksman";
              args = [ "server" ];
              filetypes = [ "markdown" ];
              rootPatterns = [ ".marksman.toml" ".git" ];
            };

            latex = {
              command = "texlab";
              filetypes = [ "tex" "plaintex" "bib" ];
              rootPatterns = [ ".latexmkrc" ".git" ];
            };

            sql = {
              command = "sqls";
              filetypes = [ "sql" "mysql" ];
              rootPatterns = [ ".git" ];
            };

            docker = {
              command = "docker-language-server";
              args = [ "start" "--stdio" ];
              filetypes = [ "dockerfile" ];
              rootPatterns = [ "Dockerfile" ".git" ];
            };

            tsserver = {
              command = "typescript-language-server";
              args = [ "--stdio" ];
              filetypes = [
                "javascript" "javascriptreact" "javascript.jsx"
                "typescript" "typescriptreact" "typescript.tsx"
              ];
              rootPatterns = [ "package.json" "tsconfig.json" "jsconfig.json" ".git" ];
            };
          
            nixd = {
              command = "nixd";
              filetypes = [ "nix" ];
              rootPatterns = [ "flake.nix" ".git" ];
              settings.nixd = {
                nixpkgs.expr = "import (builtins.getFlake (toString ./.)).inputs.nixpkgs { }";
                formatting.command = [ "nixfmt" ];
                options = {
                  nixos.expr =
                    "(builtins.head (builtins.attrValues (builtins.getFlake (toString ./.)).nixosConfigurations)).options";
                  home-manager.expr =
                    "(builtins.head (builtins.attrValues (builtins.getFlake (toString ./.)).nixosConfigurations)).options.home-manager.users.type.getSubOptions []";
                };
              };
            };

            nil = {
              command = "nil";
              filetypes = [ "nix" ];
              rootPatterns = [ "flake.nix" ".git" ];
              disabledFeatures = [ "completion" "formatting" ];
              settings.nil = {
                nix.flake.autoEvalInputs = true;
              };
            };
          };
        };
      };
    };
  };


  xdg = {
    configFile = {
      "nvim/autoload/plug.vim" = {
        source = "${pkgs.vimPlugins.vim-plug}/plug.vim";
      };
    };
  };
}
