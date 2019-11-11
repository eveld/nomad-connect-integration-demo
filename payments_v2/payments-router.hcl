kind = "service-router"
name = "payments"
routes = [
  {
    match {
      http {
        header = [
          {
            name  = "group"
            exact = "test"
          },
        ]
      }
    }

    destination {
      service = "payments"
      service_subset = "v2"
    }
  },
]