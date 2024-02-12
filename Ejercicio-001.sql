CREATE TABLE "follows" (
  "following_user_id" integer,
  "followed_user_id" integer,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "role" varchar,
  "created_at" timestamp
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "title" varchar,
  "body" text,
  "user_id" integer,
  "status" varchar,
  "created_at" timestamp
);

CREATE TABLE "comments" (
  "id_comment" int PRIMARY KEY,
  "comment" varchar,
  "user_id" int
);

COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

COMMENT ON COLUMN "comments"."comment" IS 'Content of the comment';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("following_user_id") REFERENCES "users" ("id");

ALTER TABLE "follows" ADD FOREIGN KEY ("followed_user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("comment") REFERENCES "posts" ("id");
