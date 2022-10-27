

-- Important Datasets

  # What are the different dataset (Aggregation datasets)?

    + visit_daily_fact
      - Has visit level aggregation
      - Contains attributino info
      - What are the attribution info
        . utm_medium
        . utm_term
        . ???

    + visitor_daily_fact

    + trip_board
      . created, updated, deleted

    + visitor_agg_keychain_id
      visitor_agg_visit_id
      . Lookup with keychain
      . on different devices
      . login - public uuid
      . mobile - native_app_visitor_id

-- Important Dimensions of the dataset

  # Page Type
    . Entry page
    . Checkout page
    . Search page

  # Interactions
    . Photo
    . Clicks

  # Marketing attributes
    . utm_medium (email, cpc (Google Ads), organic, social, referral)
    . utm_source (google, microsoft, facebook)
    . utm_campaign (email campaign, weekender, anything that company creates)

  # MaxMind
    . Region
    . Country
    . City
    . State