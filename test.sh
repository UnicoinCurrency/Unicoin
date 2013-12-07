mv .git/objects/pack/* XXX
for i in XXX/*.pack; do
  git unpack-objects -r < $i
done
rm XXX/*
