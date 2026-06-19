;inherits rust
;
((line_comment) @comment.warning
  (#any-match? @comment.warning "Safety:" "SAFETY:"))

((line_comment) @comment.note
  (#any-match? @comment.note "Note:" "NOTE:" "Notes:"))

((line_comment) @comment.note
  (#any-contains? @comment.note "Todo:" "TODO:" "Example:"))
