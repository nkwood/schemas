CREATE TABLE locality (
  id      BIGSERIAL PRIMARY KEY,
  name    TEXT      NOT NULL,
  tz_name TEXT      NOT NULL
);

CREATE TABLE organization_p25 (
  id         BIGSERIAL PRIMARY KEY,
  locality   BIGINT    NOT NULL,
  about      TEXT      NOT NULL,
  wacn       INTEGER   NOT NULL,
  system_id  INTEGER   NOT NULL,
  rfss_id    INTEGER   NOT NULL,
  call_count INTEGER   NOT NULL DEFAULT 0
);

CREATE TABLE talkgroup_p25 (
  id           BIGSERIAL PRIMARY KEY,
  organization BIGINT    NOT NULL,
  tgid         INTEGER   NOT NULL,
  alias        TEXT      NOT NULL DEFAULT ''
);

CREATE TABLE organization_default_p25 (
  id           BIGSERIAL PRIMARY KEY,
  organization BIGINT    NOT NULL,
  wacn         INTEGER   NOT NULL,
  system_id    INTEGER   NOT NULL,
  rfss_id      INTEGER   NOT NULL
);

CREATE TABLE call_event_p25 (
  id             BIGSERIAL PRIMARY KEY,
  organization   BIGINT    NOT NULL,
  wacn           INTEGER   NOT NULL,
  system_id      INTEGER   NOT NULL,
  rfss_id        INTEGER   NOT NULL,
  source_id      INTEGER   NOT NULL,
  destination_id INTEGER   NOT NULL DEFAULT -1,
  group_id       INTEGER   NOT NULL DEFAULT -1,
  start_time     BIGINT    NOT NULL,
  end_time       BIGINT    NOT NULL,
  s3_bucket      TEXT      NOT NULL,
  s3_key         TEXT      NOT NULL
);

CREATE TABLE topic (
  id   BIGSERIAL PRIMARY KEY,
  name TEXT      NOT NULL
);

CREATE TABLE topic_link_p25 (
  topic_id      BIGSERIAL NOT NULL,
  call_event_id BIGSERIAL NOT NULL
);

CREATE INDEX call_event_p25_start_time_index ON call_event_p25(start_time);
