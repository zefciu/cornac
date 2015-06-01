BEGIN;

CREATE TABLE channels (
    id serial primary key,
    name varchar(512)
);

CREATE TABLE messages (
    id bigserial primary key,
    sender oid,
    sent timestamp default current_timestamp,
    payload json
);

CREATE TABLE subscriptions (
    channel_id integer references channels(id) on delete cascade,
    user_id oid,
    primary key (channel_id, user_id)
);

CREATE TABLE confirmations (
    message_id bigint references messages(id) on delete cascade,
    user_id oid,
    primary key (message_id, user_id)
);

COMMIT;
