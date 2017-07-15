(* Declare Element FFI. *)

module type TYPE = sig
  type t
end

module Make(T:TYPE) = struct

  external attributes: T.t -> Dom.namedNodeMap = "" [@@bs.get]
  external classList: T.t -> Dom.domTokenList = "" [@@bs.get]

  external className: T.t -> string = "" [@@bs.get]
  external setClassName: T.t -> string -> unit = "" [@@bs.set]

  external computedName: T.t -> string = "" [@@bs.get]
  external computedRole: T.t -> string = "" [@@bs.get]

  external id: T.t -> string = "" [@@bs.get]
  external setId: T.t -> string -> unit = "" [@@bs.set]

  external innerHTML: T.t -> string = "" [@@bs.get]
  external setInnerHTML: T.t -> string -> unit = "" [@@bs.set]

  external localName: T.t -> string = "" [@@bs.get]
  external namespaceURI: T.t -> string option = "" [@@bs.get] [@@bs.return null_to_opt]
  external prefix: T.t -> string = "" [@@bs.get]

  external tagName: T.t -> string = "" [@@bs.get]


  (* methods *)
  external animate: 'a Js.t -> Dom.animation = "" [@@bs.send.pipe: T.t]
  external animateWithOption: 'a Js.t -> 'a Js.t -> Dom.animation = "" [@@bs.send.pipe: T.t]
  external closest: string -> Dom.element option = "" [@@bs.send.pipe: T.t]
                                                     [@@bs.return null_to_opt]
  external getAttribute: string -> string option = "" [@@bs.send.pipe: T.t]
                                                     [@@bs.return null_to_opt]
  external getAttributeNames: string -> string array = "" [@@bs.send.pipe: T.t]
  external getAttributeNS: string -> string -> string option = "" [@@bs.send.pipe: T.t]
                                                                 [@@bs.return null_to_opt]
  external getBoundingClientRect: Dom.domRect = "" [@@bs.send.pipe: T.t]
  external getClientRects: Dom.domRect array = "" [@@bs.send.pipe: T.t]
  external getElementsByClassName: string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]
  external getElementsByTagName: string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]
  external getElementsByTagNameNS: string -> string -> Dom.htmlCollection = "" [@@bs.send.pipe: T.t]

  external hasAttribute: string -> bool = "" [@@bs.send.pipe: T.t]
  external hasAttributeNS: string -> string -> bool = "" [@@bs.send.pipe: T.t]
  external hasAttributes: bool = "" [@@bs.send.pipe: T.t]
  external matches: string -> bool = "" [@@bs.send.pipe: T.t]
  external querySelector: string -> Dom.element option = "" [@@bs.send.pipe: T.t]
                                                           [@@bs.return null_to_opt]
  external querySelectorAll: string -> Dom.nodeList = "" [@@bs.send.pipe: T.t]
  external remove: unit = "" [@@bs.send.pipe: T.t]
  external removeAttribute: string -> unit = "" [@@bs.send.pipe: T.t]
  external removeAttributeNS: string -> string -> unit = "" [@@bs.send.pipe: T.t]
  external setAttribute: string -> string -> unit = "" [@@bs.send.pipe: T.t]
  external setAttributeNS: string -> string -> string -> unit = "" [@@bs.send.pipe: T.t]

(* not implemented list in Element
   - client*
   - outerHTML
   - scroll*
   - nextElementSibling
   - previousElementSibling
   - shadowRoot
   - slot
   - ongotpointercapture
   - onlostpointercapture
   - onwheel
 *)

end

include Bs_dom_wrapper_event_target.Make(struct type t = Dom.element end)
include Bs_dom_wrapper_node.Make(struct type t = Dom.element end)
include Make(struct type t = Dom.element end)
