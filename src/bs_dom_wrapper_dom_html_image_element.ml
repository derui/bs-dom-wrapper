(* Image Element wrapper and accessor based on bs-webapi's interface *)

type image
type t = image Dom.htmlElement_like

include Bs_webapi.Dom.EventTarget.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.Node.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.Element.Impl(struct type nonrec t = t end)
include Bs_webapi.Dom.HtmlElement.Impl(struct type nonrec t = t end)

(* Constructor *)
external create: unit -> t = "Image" [@@bs.new]

(* properties *)
external alt: t -> string = "" [@@bs.get]
external setAlt: t -> string -> unit = "alt" [@@bs.set]
external crossOrigin: t -> string = "" [@@bs.get]
external setCrossOrigin: t -> string -> unit = "crossOrigin" [@@bs.set]
external height: t -> int = "" [@@bs.get]
external setHeight: t -> int -> unit = "height" [@@bs.set]
external width: t -> int = "" [@@bs.get]
external setWidth: t -> int -> unit = "width" [@@bs.set]
external isMap: t -> bool = "" [@@bs.get]
external setIsMap: t -> Js.boolean -> unit = "isMap" [@@bs.set]
external src: t -> string = "" [@@bs.get]
external setSrc: t -> string -> unit = "src" [@@bs.set]

external naturalHeight: t -> int = "" [@@bs.get]
external naturalWidth: t -> int = "" [@@bs.get]

external srcset: t -> string = "" [@@bs.get]
external setSrcset: t -> string -> unit = "srcset" [@@bs.set]

external x: t -> int = "" [@@bs.get]
external y: t -> int = "" [@@bs.get]
