(* Declare canvas element FFI *)

module Types = Bs_dom_wrapper_html_types
module Image_element = Bs_dom_wrapper_html_image_element
module Blob = Bs_dom_wrapper_blob

module Context = struct
  type t

  (* binding drawImage *)
  external drawImage: Image_element.t -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external drawImageWithDSize: Image_element.t -> int -> int -> int -> int -> unit = "drawImage" [@@bs.send.pipe:t]
  external clearRect: int -> int -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external strokeRect: int -> int -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external strokeStyle: t -> string = "" [@@bs.get]
  external setStrokeStyle: t -> string -> unit = "strokeStyle" [@@bs.set]
end

type canvas
type t = canvas Dom.htmlElement_like

include Bs_dom_wrapper_nodes_event_target.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_node.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_element.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_html_element.Make(struct type nonrec t = t end)

(* properties *)
external height: t -> int = "" [@@bs.get]
external setHeight: t -> int -> unit = "height" [@@bs.set]
external width: t -> int = "" [@@bs.get]
external setWidth: t -> int -> unit = "width" [@@bs.set]

(* methods *)
external getContext: string -> Context.t = "" [@@bs.send.pipe:t]
let getContext typ t =
  let typ = Types.Context_type.to_string typ in
  t |> getContext typ

external toBlob: Blob.t = "" [@@bs.send.pipe:t]
