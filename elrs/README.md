This folder contains ELRS UID to password related tools;

# How a UID is computed from the binding phrase.
An ELRS UID is ;
  md5('-DMY_BINDING_PHRASE="{bind_phrase}"')[:6]

# Tools
- elrs_do_rainbow.py : Insert a wordlist in the database
- elrs_rainbow.py : Try to find a binding phrase in the rainbow table.
- elrs_uid.py: get a uid from a binding phrase.

