import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "@typespec/versioning";
import "./models.tsp";
import "./FirewallPolicy.tsp";
import "../Common/main.tsp";

using TypeSpec.Rest;
using TypeSpec.Versioning;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;
using Common;

namespace Microsoft.Network;
/**
 * Kube selector group resource.
 */
#suppress "@azure-tools/typespec-azure-core/no-private-usage" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
#suppress "@azure-tools/typespec-azure-core/composition-over-inheritance" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
#suppress "@azure-tools/typespec-azure-resource-manager/arm-custom-resource-usage-discourage" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
@added(Versions.v2025_09_01)
@Azure.ResourceManager.Legacy.feature(Features.firewallPolicy)
@parentResource(FirewallPolicy)
@Http.Private.includeInapplicableMetadataInPayload(false)
model FirewallPolicyKubeSelectorGroup extends SubResourceModel {
  properties?: FirewallPolicyKubeSelectorGroupProperties;

  /**
   * The name of the resource that is unique within a firewall policy. This name can be used to access the resource.
   */
  @visibility(Lifecycle.Read)
  @path
  @key("kubeSelectorGroupName")
  @segment("kubeSelectorGroups")
  name: string;

  /** A unique read-only string that changes whenever the resource is updated. */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  @visibility(Lifecycle.Read)
  etag?: string;
}

#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
@added(Versions.v2025_09_01)
@Azure.ResourceManager.Legacy.feature(Features.firewallPolicy)
@armResourceOperations
interface FirewallPolicyKubeSelectorGroups {
  /**
   * Gets the specified FirewallPolicyKubeSelectorGroup.
   */
  get is ArmResourceRead<FirewallPolicyKubeSelectorGroup, Error = CloudError>;

  /**
   * Creates or updates the specified FirewallPolicyKubeSelectorGroup.
   */
  createOrUpdate is ArmResourceCreateOrReplaceAsync<
    FirewallPolicyKubeSelectorGroup,
    Error = CloudError
  >;

  /**
   * Deletes the specified FirewallPolicyKubeSelectorGroup.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "FIXME: Update justification, follow aka.ms/tsp/conversion-fix for details"
  delete is ArmResourceDeleteWithoutOkAsync<
    FirewallPolicyKubeSelectorGroup,
    Response = ArmDeletedResponse | ArmDeleteAcceptedLroResponse | ArmDeletedNoContentResponse,
    Error = CloudError
  >;

  /**
   * Lists all FirewallPolicyKubeSelectorGroups in a FirewallPolicy resource.
   */
  list is ArmResourceListByParent<
    FirewallPolicyKubeSelectorGroup,
    Error = CloudError
  >;
}

@@doc(FirewallPolicyKubeSelectorGroup.name,
  "The name of the FirewallPolicyKubeSelectorGroup."
);
@@doc(FirewallPolicyKubeSelectorGroup.name,
  "The name of the resource that is unique within a firewall policy. This name can be used to access the resource."
);
@@doc(FirewallPolicyKubeSelectorGroup.properties,
  "The properties of the firewall policy kube selector group."
);
@@doc(FirewallPolicyKubeSelectorGroups.createOrUpdate::parameters.resource,
  "Parameters supplied to the create or update FirewallPolicyKubeSelectorGroup operation."
);
