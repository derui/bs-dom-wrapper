(* Declare canvas element FFI *)

module Types = Bs_dom_wrapper_event_types
module Image_element = Bs_dom_wrapper_image_element
module Blob = Bs_dom_wrapper_blob

module Context = struct
  type t

  (* binding drawImage *)
  external draw_image: Image_element.t -> int -> int -> unit = "drawImage" [@@bs.send.pipe:t]
end

type canvas
type t = canvas Dom.htmlElement_like

include Bs_dom_wrapper_event_target.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_node.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_element.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_html_element.Make(struct type t = Dom.element end)

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
