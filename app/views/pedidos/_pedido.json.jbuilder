json.extract! pedido, :id, :produto_id, :usuario_id, :quantidade, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
