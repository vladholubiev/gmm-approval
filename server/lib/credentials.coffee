if not ServiceConfiguration.configurations.findOne(service: "google")
  ServiceConfiguration.configurations.insert
    service: 'google'
    clientId: '793024068301-6fi2kjqqqi5v9q0mca9f4g35tbrni3h1.apps.googleusercontent.com'
    secret: 'DU8AXxeVpzATE_KzVxD7PueL'