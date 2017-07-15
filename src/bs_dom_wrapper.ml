(* Wrapper *)

module Event = struct
  include Bs_dom_wrapper_event
  module Progress_event = Bs_dom_wrapper_progress_event
end

type blob

(* Interface for File *)
module File = struct
  type t = blob

  external name: t -> string = "" [@@bs.get]
end

(* binding FormData *)
module FormData = struct
  type t

  external create : unit -> t = "FormData" [@@bs.new]
  external append : string -> blob -> unit = "" [@@bs.send.pipe:t]
end

module Node = struct
  type node
  type t = Dom.node

  (* binding  node.appendChild *)
  external append_child : t -> t -> t = "appendChild" [@@bs.send]
  external set_class_name : t -> string -> unit = "className" [@@bs.set]
  external get_class_name : t -> string = "className" [@@bs.get]
  external set_attribute : t -> string -> 'a -> unit = "setAttribute" [@@bs.send]
  external get_files : t -> File.t array = "files" [@@bs.get]

  external get_value : t -> string = "value" [@@bs.get]
  external set_value : t -> string -> unit = "value" [@@bs.set]
end

module Image_element = struct
  type image
  type t = image Dom.element_like

  external create: unit -> t = "Image" [@@bs.new]
  external set_src: t -> string -> unit = "src" [@@bs.set]
  external get_src: t -> string = "src" [@@bs.get]
  external set_onload: t -> (Event.Progress_event.t -> unit) -> unit = "onload" [@@bs.set]
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

(* Interface for FileReader *)
module FileReader = struct
  type file_reader
  type t = file_reader Dom.eventTarget_like

  external get_result: t -> string = "result" [@@bs.get]
  external create: unit -> t = "FileReader" [@@bs.new]
  external set_onload: t -> (Event.Progress_event.t -> unit) -> unit = "onload" [@@bs.set]
  external read_as_data_url: t -> File.t -> unit = "readAsDataURL" [@@bs.send]
end

external create_element : Dom.document -> string -> Node.t = "createElement" [@@bs.send]

(* binding document.createTextNode *)
external create_text_node : Dom.document -> string -> Node.t = "createTextNode" [@@bs.send]

external get_by_id : Dom.document -> string -> Node.t option =
  "getElementById" [@@bs.send] [@@bs.return null_to_opt]

external query_selector : Dom.document -> string -> Node.t option =
  "querySelector" [@@bs.send] [@@bs.return null_to_opt]
