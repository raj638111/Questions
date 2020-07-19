

-- UserAgent

  + What information are we extracting from userAgent string form user event?
    - Browser + Browser version
    - OS

-- MaxMind

  + How do we identify Geo information from IP?
    - We use MaxMind API to get geo information from IP Address
    - What are those geo information?
      . Country
      . Region (NA, SA I believe?)
      . Country
      . City
      . State

-- Cross device tracking

  + MaxMind is used for GA

  + Custom Keychain is used to identify the user
    connecting across multiple devices...as well as from
    different Expedia websites (Vrbo, Expedia, Abritel)