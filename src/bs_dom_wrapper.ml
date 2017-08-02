(* Wrapper main *)

module Blob = Bs_dom_wrapper_blob
module File = Bs_dom_wrapper_file
module File_reader = Bs_dom_wrapper_file_reader
module Form_data = Bs_dom_wrapper_form_data
module URL = Bs_dom_wrapper_url

(* binding for global variable *)
external document: Dom.document = "" [@@bs.val]
