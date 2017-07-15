(* Declare FormData FFI *)

module Blob = Bs_dom_wrapper_blob

type t

external create : unit -> t = "FormData" [@@bs.new]
external append : string -> Blob.t -> unit = "" [@@bs.send.pipe:t]
