adminAuth: {
    type: "credentials",
    users: [{
      username: process.env.NODERED_AUTH_ADMIN.slice(0, process.env.NODERED_AUTH_ADMIN.indexOf(':')),
      password: process.env.NODERED_AUTH_ADMIN.slice(process.env.NODERED_AUTH_ADMIN.indexOf(':')+1)
    }]
  },
}
