(* Declare FormData FFI *)

module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct
  module Blob = Bs_dom_wrapper_blob

  external create : unit -> T.t = "FormData" [@@bs.new]
  external appendBlob : string -> Blob.t -> unit = "append" [@@bs.send.pipe:T.t]
  external appendString : string -> string -> unit = "append" [@@bs.send.pipe:T.t]
end
