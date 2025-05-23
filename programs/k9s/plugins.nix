{
  plugins = {
    stern = {
      shortCut = "Ctrl-Y";
      confirm = false;
      description = "Logs <Stern>";
      scopes = [ "pods" ];
      command = "stern";
      background = false;
      args =
        [ "--tail" "50" "$FILTER" "-n" "$NAMESPACE" "--context" "$CONTEXT" ];
    };
  };
}
