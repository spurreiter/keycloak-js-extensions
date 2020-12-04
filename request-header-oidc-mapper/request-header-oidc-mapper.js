function getHeader (name) {
  return (keycloakSession.getContext().getRequestHeaders().getRequestHeader(name) || [])[0]
}

var tenantId = getHeader('x-tenant-id')
var someId = getHeader('x-some-id')

// alternatively set token claim here
/*
token.getOtherClaims().put('x', {
  tenant_id: tenantId,
  some_id: someId
})
*/

// or export and set `Token Claim Name=x` and `Claim JSON Type=JSON` in mapper config
exports = JSON.stringify({
  tenant_id: tenantId,
  some_id: someId
})
