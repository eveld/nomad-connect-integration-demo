kind = "service-router"
name = "payments"
routes = [
  {
    match {
      http {
        header = [
          {
            name  = "group"
            exact = "dev"
          },
        ]
      }
    }

    destination {
      service = "currency"
    }
  },
]