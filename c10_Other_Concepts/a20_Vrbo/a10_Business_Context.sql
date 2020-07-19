
-- Spark

  # What are the different teams that use our dataset
    and what dimension & metrics is it helpful for them?
    + Conversion analysis
      - A/B Testing (Engagement ; exp1 vs exp2)
                    (Bookng; exp1 vs exp2 ; booking numbers )
                    (experiment_id, also based on visitor_id)
        . brand (vrbo, expedia)
        . site (vrbo ; us, france)

    + Marketing team
      -  Right now I only explain about the attribution and its usefulness for
         marketing team
         . channel
            . seo (Search results)
            . sem (Google Add)
            . email
            . direct
            . push notification
            . parter
         . entry_page_type -> homepage, property detail page
         . booking
         . pageviews
         . inquiry
         . dated_search
         . dateless_dated_search
         . trip_board
         . checkout

    + Partner


  # What are the different dataset (Aggregation datasets)?
    + visit_daily_fact
      - Has visit level aggregation
      - Contains attributino info
      - What are the attribution info
        . utm_medium
        . utm_term
        . ???
      - What are the possible 5/10 useful fields?
    + visitor_daily_fact
    + trip_board
      . created, upated, deleted
    + visitor_agg_keychain_id
      . Lookup with keychain
      . on different devices
      . login - public uuid
      . mobile - native_app_visitor_id

    + visitor_daily_fact or
    + visitor_agg_visit_id or
    + visitor_agg_keychain_id or


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

-- How do we filter Bots?

  - Internal IP Address
    . Filter out internal IP address

  - No of pageviews
    . If no of page views is high for a visit

  - Page Duration
    . If page duration is small compared to the average page duration

  - Bounce rate
    . If Bounce rate is high

  - Page Loading time
    . If page loading time is high, we might be getting swamped by Bot


