(* Declare canvas element FFI *)
(*
bs-webapi has CanvasElement implementation, but it doesn't have some APIs to draw image element.
And it is not include implementations for some inherited APIs.
 *)

module Types = Bs_dom_wrapper_dom_html_types
module Image_element = Bs_dom_wrapper_dom_html_image_element
module Blob = Bs_dom_wrapper_blob

module Context = struct
  type t

  (* binding drawImage *)
  external drawImage: Image_element.t -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external drawImageWithDSize: Image_element.t -> int -> int -> int -> int -> unit = "drawImage" [@@bs.send.pipe:t]
  external drawImageWithSSize: Image_element.t -> int -> int -> int -> int ->
                               int -> int -> int -> int -> unit = "drawImage" [@@bs.send.pipe:t]
  external clearRect: int -> int -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external strokeRect: int -> int -> int -> int -> unit = "" [@@bs.send.pipe:t]
  external strokeStyle: t -> string = "" [@@bs.get]
  external setStrokeStyle: t -> string -> unit = "strokeStyle" [@@bs.set]
end

type canvas
type t = canvas Dom.htmlElement_like

include Bs_webapi.Dom.EventTarget.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.Node.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.Element.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.HtmlElement.Impl(struct type nonrec t = t end)

(* properties *)
external height: t -> int = "" [@@bs.get]
external setHeight: t -> int -> unit = "height" [@@bs.set]
external width: t -> int = "" [@@bs.get]
external setWidth: t -> int -> unit = "width" [@@bs.set]

(* methods *)
external getContextEx: string -> Context.t = "getContext" [@@bs.send.pipe:t]
let getContext typ t =
  let typ = Types.Context_type.to_string typ in
  t |> getContextEx typ

external toBlob: Blob.t = "" [@@bs.send.pipe:t]
external toDataURL: string -> string = "" [@@bs.send.pipe:t]
