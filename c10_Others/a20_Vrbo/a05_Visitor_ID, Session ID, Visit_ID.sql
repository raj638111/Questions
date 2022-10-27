

-- Visitor ID

  + Is directly correlated to Cookie (1, 2 years)
  + Is basically the Cookie ID

-- Session ID

  + For a given visitor, a session lasts for 1 days from 00 to 24 hour

-- Visit ID

  + The time for which a visitor (Visitor ID) is active is given
    a session ID

  + A new Visit ID is generate for a visitor when,
    . There is 30 min inactivity after which we get a new event
      from the same Visitor

    . When we get a new UTM parameter for the same visitor
      ~ We get different UTM parameter in the URL when the user
        visits the Vrbo website from a different source
      ~ A source can be
        . Google search from where the user lands in Vrbo
        . A Facebook ad from where the user lands in Vrbo
        . etc...
