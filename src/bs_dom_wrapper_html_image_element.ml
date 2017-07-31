(* Image Element wrapper and accessor from bs-webapi-incubator *)
(*
MIT License

Copyright (c) 2017 reasonml-community

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 *)


module Events = Bs_dom_wrapper_events

type image
type t = image Dom.htmlElement_like

include Bs_dom_wrapper_nodes_event_target.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_node.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_nodes_element.Make(struct type nonrec t = t end)
include Bs_dom_wrapper_html_element.Make(struct type nonrec t = t end)

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

(* event handlers *)
external setOnload: t -> ('a Dom.event_like -> unit) -> unit = "onload" [@@bs.set]
