(* Wrapper main *)

module Events = Bs_dom_wrapper_events
module Html = Bs_dom_wrapper_html
module Nodes = Bs_dom_wrapper_nodes
module Blob = Bs_dom_wrapper_blob
module File = Bs_dom_wrapper_file
module File_reader = Bs_dom_wrapper_file_reader
module Form_data = Bs_dom_wrapper_form_data
module Data_transfer = Bs_dom_wrapper_data_transfer
module Css_style_declaration = Bs_dom_wrapper_css_style_declaration
module Dom_rect = Bs_dom_wrapper_dom_rect
module Window = Bs_dom_wrapper_window
module URL = Bs_dom_wrapper_url

(* binding for global variable *)
external document: Dom.document = "" [@@bs.val]
