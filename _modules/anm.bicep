param location string
param name string

resource anm 'Microsoft.Network/networkManagers@2022-11-01' = {
  name: name
  location: location
  properties: {
    displayName: name
    networkManagerScopes: {
      subscriptions: [
        subscription().id
      ]
    }
    networkManagerScopeAccesses: [
      'Connectivity'
    ]
  }
}

output anmId string = anm.id
