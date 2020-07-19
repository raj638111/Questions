

-- How to reduce shuffle in join?

    + If one of the dataset that is joined is small, Broadcast Hash Join
      can be used to reduce shuffle. (Note: This is different from Broadcast variable)
