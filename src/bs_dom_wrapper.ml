(* Wrapper *)

module Events = Bs_dom_wrapper_events

type blob

(* binding FormData *)
module FormData = struct
  type t

  external create : unit -> t = "FormData" [@@bs.new]
  external append : string -> blob -> unit = "" [@@bs.send.pipe:t]
end

module Image_element = struct
  type image
  type t = image Dom.element_like

  external create: unit -> t = "Image" [@@bs.new]
  external set_src: t -> string -> unit = "src" [@@bs.set]
  external get_src: t -> string = "src" [@@bs.get]
  external set_onload: t -> (Events.Progress_event.t -> unit) -> unit = "onload" [@@bs.set]
end

module Canvas_context = struct
  type t

  (* binding drawImage *)
  external draw_image: Image_element.t -> int -> int -> unit = "drawImage" [@@bs.send.pipe:t]
end

module Canvas_element = struct
  type t

  (* binding getContext() method *)
  external get_context: string -> Canvas_context.t = "getContext" [@@bs.send.pipe:t]
end


external create_element : Dom.document -> string -> Dom.node = "createElement" [@@bs.send]

(* binding document.createTextNode *)
external create_text_node : Dom.document -> string -> Dom.node = "createTextNode" [@@bs.send]

external get_by_id : Dom.document -> string -> Dom.node option =
  "getElementById" [@@bs.send] [@@bs.return null_to_opt]

external query_selector : Dom.document -> string -> Dom.node option =
  "querySelector" [@@bs.send] [@@bs.return null_to_opt]
