
module Event_type = struct
  type t =
    DOMContentLoaded
  | Submit

  let to_string = function
    | DOMContentLoaded -> "DOMContentLoaded"
    | Submit -> "submit"
end

module Button = struct
  type t =
    Left
  | Middle
  | Right

  let of_int = function
    | 0 -> Left
    | 1 -> Middle
    | 2 -> Right
    | _ -> failwith "Unknown button"
end

module Drop_effect = struct
  type t =
    None
  | Copy
  | Link
  | Move

  let to_string = function
    | None -> "none"
    | Copy -> "copy"
    | Link -> "link"
    | Move -> "move"

  let of_string = function
    | "none" -> None
    | "copy" -> Copy
    | "link" -> Link
    | "move" -> Move
    | _ -> failwith "Unknown DropEffect"
end

module Effect_allowed = struct
  type t =
    None
  | Copy
  | CopyLink
  | CopyMove
  | Link
  | LinkMove
  | Move
  | All
  | Uninitialized

  let to_string = function
    | None -> "none"
    | Copy -> "copy"
    | CopyLink -> "copyLink"
    | CopyMove -> "copyMove"
    | Link -> "link"
    | LinkMove -> "linkMove"
    | Move -> "move"
    | All -> "all"
    | Uninitialized -> "uninitialized"

  let of_string = function
    | "none" -> None
    | "copy" -> Copy
    | "copyLink" -> CopyLink
    | "copyMove" -> CopyMove
    | "link" -> Link
    | "linkMove" -> LinkMove
    | "move" -> Move
    | "all" -> All
    | "uninitialized" -> Uninitialized
    | _ -> failwith "Unknown DropEffect"
end
