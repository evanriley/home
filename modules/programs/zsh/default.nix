{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    initExtra = ''
      export HISTSIZE=1000
      export SAVEHIST=1000
      RPROMPT=" "

    '';
    envExtra = ''
      export PATH="/opt/homebrew/bin:$PATH"
      export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules,target,.clj-kondo,.lsp}/*"'
    '';
    shellAliases = {
      # utils
      grep = "grep --color=auto";
      egrep = "egrep -color=auto";
      fgrep = "fgrep --color=auto";
      mkdir = "mkdir -pv";
      myip = "curl http://ipecho.net/plain; echo";
      pubkey = "pbcopy < ~/.ssh/id_rsa.pub'";
      ls = "gls -F --color";
      l = "gls -lAh --color";
      ll = "gls -l --color";
      la = "gls -A --color";
      cat = "bat";

      # vi
      vi = "nvim";
      vim = "nvim";

      # git
      gac = "git add . && git commit -a -m";
      gl = "git pull --prune";
      glog =
        "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative";
      gp = "git push origin HEAD";
      gd = ''git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'';
      gc = "git commit";
      gca = "git commit -a";
      gco = "git checkout";
      gcb = "git copy-branch-name";
      gb = "git branch";
      gs = "git status -sb";
      ge = "git-edit-new";

      # ios
      ios =
        "open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app";
      watchos =
        "open /Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app";

      # nix
      drs = "darwin-rebuild switch";

    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
