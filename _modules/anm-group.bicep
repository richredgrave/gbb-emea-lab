param name string
param anmName string
param description string
param membershipCondition string

resource anmGroup 'Microsoft.Network/networkManagers/networkGroups@2022-11-01' = {
  name: '${anmName}/${name}'
  properties: {
    description: description
    conditionalMembership: membershipCondition
  }
}

output anmGroupId string = anmGroup.id
