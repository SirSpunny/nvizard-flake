;; extends

(
  (block_mapping_pair
    value: (flow_node
      [
        (plain_scalar)
        (double_quote_scalar)
      ] @injection.content
    )
  )

  (#match? @injection.content "\\{[{%]")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.language "jinja")
)

(
  (block_sequence_item
    (flow_node
      [
        (plain_scalar)
        (double_quote_scalar)
      ] @injection.content
    )
  )

  (#match? @injection.content "\\{[{%]")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.language "jinja")
)
