(* Wrapper main *)

module Blob = Bs_dom_wrapper_blob
module File = Bs_dom_wrapper_file
module File_reader = Bs_dom_wrapper_file_reader
module Form_data = Bs_dom_wrapper_form_data
module URL = Bs_dom_wrapper_url

module Data_transfer = Bs_dom_wrapper_data_transfer
module Types = Bs_dom_wrapper_nodes_types

module Dom = struct
  module HtmlTypes = Bs_dom_wrapper_dom_html_types
  module HtmlInputElement = Bs_dom_wrapper_dom_html_input_element
  module HtmlImageElement = Bs_dom_wrapper_dom_html_image_element
  module HtmlCanvasElement = Bs_dom_wrapper_dom_html_canvas_element
end
