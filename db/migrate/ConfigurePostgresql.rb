class ConfigurePostgresql < ActiveRecord::Migration
  def up
    execute("CREATE EXTENSION unaccent;")
    execute("ALTER TEXT SEARCH DICTIONARY unaccent (RULES='unaccent');")
    execute("CREATE TEXT SEARCH CONFIGURATION es ( COPY = spanish );")
    execute("ALTER TEXT SEARCH CONFIGURATION es
      ALTER MAPPING FOR hword, hword_part, word
      WITH unaccent, spanish_stem;")
  end
end
