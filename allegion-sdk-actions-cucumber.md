```gherkin
Feature: AllegionSDK Actions Logging and Status Tracking

  As a developer or QA,
  I want to ensure all AllegionSDK actions are tracked and logged with correct statuses,
  So that the integration with Allegion devices is reliable and auditable.

  # 1. Authenticate
  Scenario: Authenticate with valid credentials
    Given the SDK has valid Allegion CMS credentials
    When the Authenticate action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And an authentication token should be issued

  Scenario: Authenticate with invalid credentials
    Given the SDK has invalid Allegion CMS credentials
    When the Authenticate action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry authentication after failure
    Given the previous Authenticate attempt failed
    When the Authenticate action is retried with valid credentials
    Then the status should transition to "Retry" and then "Success"

  # 2. DeleteCredential
  Scenario: Delete existing credential with valid cardformatid
    Given a valid cardformatid exists in Allegion CMS
    When the DeleteCredential action is triggered for the cardformatid
    Then the status should be "Start"
    And the status should transition to "Success"
    And the credential should be deleted

  Scenario: Delete credential with invalid cardformatid
    Given an invalid or non-existent cardformatid
    When the DeleteCredential action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry credential deletion after failure
    Given a previous DeleteCredential attempt failed
    When the DeleteCredential action is retried with a valid cardformatid
    Then the status should transition to "Retry" and then "Success"

  # 3. CreateCredential
  Scenario: Create credential with valid data
    Given all required credential data is provided
    When the CreateCredential action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the credential should be created

  Scenario: Create credential with missing or invalid data
    Given the credential data is missing required fields or is invalid
    When the CreateCredential action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry credential creation after failure
    Given a previous CreateCredential attempt failed
    When the CreateCredential action is retried with valid data
    Then the status should transition to "Retry" and then "Success"

  # 4. InitSDK
  Scenario: Initialize SDK in a supported environment
    Given the SDK is running in a supported environment
    When the InitSDK action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the SDK should be initialized

  Scenario: Initialize SDK in an unsupported environment
    Given the SDK is running in an unsupported environment
    When the InitSDK action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry SDK initialization after failure
    Given a previous InitSDK attempt failed
    When the InitSDK action is retried in a supported environment
    Then the status should transition to "Retry" and then "Success"

  # 5. DeviceEnrollment
  Scenario: Enroll device with valid parameters
    Given valid device details are provided
    When the DeviceEnrollment action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the device should be enrolled

  Scenario: Enroll device with invalid parameters
    Given invalid or incomplete device details
    When the DeviceEnrollment action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry device enrollment after failure
    Given a previous DeviceEnrollment attempt failed
    When the DeviceEnrollment action is retried with valid details
    Then the status should transition to "Retry" and then "Success"

  # 6. PullAccessRights
  Scenario: Pull access rights for a valid device
    Given a valid device is registered with AllegionSDK
    When the PullAccessRights action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And access rights should be returned

  Scenario: Pull access rights for an invalid device
    Given the device information is invalid
    When the PullAccessRights action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry pulling access rights after failure
    Given a previous PullAccessRights attempt failed
    When the PullAccessRights action is retried with valid device information
    Then the status should transition to "Retry" and then "Success"

  # 7. PullPayload
  Scenario: Pull payload for a valid transaction
    Given valid parameters for payload are provided
    When the PullPayload action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the payload should be received

  Scenario: Pull payload with invalid parameters
    Given invalid or missing parameters
    When the PullPayload action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry pulling payload after failure
    Given a previous PullPayload attempt failed
    When the PullPayload action is retried with valid parameters
    Then the status should transition to "Retry" and then "Success"

  # 8. WriteSecurityToken
  Scenario: Write security token with valid credentials
    Given valid credentials are provided to write the security token
    When the WriteSecurityToken action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the lock should accept the token

  Scenario: Write security token with invalid credentials
    Given invalid credentials are provided
    When the WriteSecurityToken action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry writing security token after failure
    Given a previous WriteSecurityToken attempt failed
    When the WriteSecurityToken action is retried with valid credentials
    Then the status should transition to "Retry" and then "Success"

  # 9. TouringOperation (SubActions: Config, Schedule, PartialDb, FullDb, Audits)
  Scenario Outline: TouringOperation with valid subaction
    Given a valid "<SubAction>" subaction and parameters
    When the TouringOperation action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the "<SubAction>" operation should be completed

    Examples:
      | SubAction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  Scenario: TouringOperation with invalid parameters
    Given invalid parameters are provided for any subaction
    When the TouringOperation action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And an error should be logged

  Scenario: Retry TouringOperation after failure
    Given a previous TouringOperation attempt failed
    When the TouringOperation action is retried with valid parameters
    Then the status should transition to "Retry" and then "Success"

  # 10. Unlock
  Scenario: Unlock with valid SDK credentials
    Given valid SDK credentials are provided
    When the Unlock action is triggered
    Then the status should be "Start"
    And the status should transition to "Success"
    And the lock should be unlocked

  Scenario: Unlock with invalid SDK credentials
    Given invalid credentials are provided
    When the Unlock action is triggered
    Then the status should be "Start"
    And the status should transition to "Fail"
    And the lock should remain locked

  Scenario: Retry unlock after failure
    Given a previous Unlock attempt failed
    When the Unlock action is retried with valid credentials
    Then the status should transition to "Retry" and then "Success"
```