const String piiTable = '''
CREATE TABLE IF NOT EXISTS "pii" (
	"id" INTEGER NOT NULL UNIQUE,
	"category" TEXT,
	"type" TEXT,
	"issuer" TEXT, 
  "id_number"	TEXT, 
	"valid_from" TEXT, 
  "valid_to" TEXT, 
  "created_at" TEXT,
  "last_update_at" TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
)
''';

const String userTable = '''
CREATE TABLE IF NOT EXISTS "user" (
	"id" INTEGER NOT NULL UNIQUE,
	"salutation" TEXT,
	"first_name" TEXT,
	"last_name" TEXT, 
  "date_of_birth"	INTEGER, 
	"address" TEXT,  
  "created_at" TEXT,
  "last_update_at" TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
)
''';
