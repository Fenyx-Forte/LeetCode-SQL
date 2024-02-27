select
  t.tweet_id
from
  tweets as t
where
  length(t.content) > 15;
