json.array!(@boards) do |board|
  json.extract! board, :id, :board_name, :user_id
  json.url board_url(board, format: :json)
end
