Hanami::Model.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
    create_table :roles do
      primary_key :id, :uuid, default: Sequel.function(:uuid_generate_v4)
      column :name, String, null: false
      column :created_at, DateTime, default: Sequel.function(:now)
      column :updated_at, DateTime, default: Sequel.function(:now)
    end
  end
end
