param anmName string
param configName string
param groupId string
param hubId string

@allowed([
  'Mesh'
  'HubAndSpoke'
])
param topology string = 'HubAndSpoke'

resource config 'Microsoft.Network/networkManagers/connectivityConfigurations@2022-11-01' = {
  name: '${anmName}/${configName}'
  properties: {
    connectivityTopology: topology
    description: '${topology} topology'
    deleteExistingPeering: 'True'
    displayName: configName
    isGlobal: 'False'
    hubs: [
      {
        resourceId: hubId
      }
    ]
    appliesToGroups: [
      {
        networkGroupId: groupId
        groupConnectivity: 'None'
        isGlobal: 'False'
        useHubGateway: 'False'
      }
    ]

  }
}

