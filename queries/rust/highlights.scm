;inherits rust
;
((line_comment) @comment.warning
  (#lua-match? @comment.warning "%s+[Ss]afety")
  (#lua-match? @comment.warning "%s+SAFETY"))
