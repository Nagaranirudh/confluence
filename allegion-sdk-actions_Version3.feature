Feature: AllegionSDK Actions Logging and Status Tracking

  As a developer or QA,
  I want to ensure all AllegionSDK actions are tracked and logged with correct statuses in PDF Logs,
  So that the integration with Allegion devices is reliable and auditable.

  # 1. Authenticate
  # Note: In order to connect with Allegion CMS APIs, need to first get an authentication token.
  Scenario: Authenticate with valid credentials
    Given Download and install SDK and the user logged in using valid credentials
    When the Authenticate action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And an authentication token should be issued in PDF Logs

  Scenario: Authenticate fails with invalid credentials
    Given Download and install SDK and the user logged in using invalid credentials
    When the Authenticate action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry Authenticate after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the Authenticate action is retried with valid credentials
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 2. DeleteCredential
  # Note: Before pushing the new credentials to Allegion CMS, delete the existing one for a cardholder.
  Scenario: DeleteCredential for a valid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    When the DeleteCredential action is triggered for a valid cardformatid
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the credential should be deleted in PDF Logs

  Scenario: DeleteCredential fails with invalid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    When the DeleteCredential action is triggered for an invalid cardformatid
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry DeleteCredential after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the DeleteCredential action is retried with a valid cardformatid
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 3. CreateCredential
  # Note: Push Allegion credentials to AllegionCMS.
  Scenario: CreateCredential for a valid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    When the CreateCredential action is triggered for a valid cardformatid
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the credential should be created in PDF Logs

  Scenario: CreateCredential fails with missing or invalid data
    Given Download and install SDK and the user logged in using valid credentials
    When the CreateCredential action is triggered with missing or invalid data
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry CreateCredential after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the CreateCredential action is retried with valid data
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 4. InitSDK
  # Note: Initialize the Allegion SDK.
  Scenario: InitSDK in a supported environment
    Given Download and install SDK and the user logged in using valid credentials
    When the InitSDK action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the SDK should be initialized in PDF Logs

  Scenario: InitSDK fails in unsupported environment
    Given Download and install SDK and the user logged in using valid credentials
    When the InitSDK action is triggered in an unsupported environment
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry InitSDK after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the InitSDK action is retried in a supported environment
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 5. DeviceEnrollment
  # Note: Device enrollment with AllegionSDK.
  Scenario: DeviceEnrollment with valid details
    Given Download and install SDK and the user logged in using valid credentials
    When the DeviceEnrollment action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the device should be enrolled in PDF Logs

  Scenario: DeviceEnrollment fails with invalid details
    Given Download and install SDK and the user logged in using valid credentials
    When the DeviceEnrollment action is triggered with invalid details
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry DeviceEnrollment after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the DeviceEnrollment action is retried with valid details
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 6. PullAccessRights
  # Note: Pull Access rights from AllegionSDK.
  Scenario: PullAccessRights with valid device
    Given Download and install SDK and the user logged in using valid credentials
    When the PullAccessRights action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And access rights should be returned in PDF Logs

  Scenario: PullAccessRights fails with invalid device
    Given Download and install SDK and the user logged in using valid credentials
    When the PullAccessRights action is triggered with invalid device information
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry PullAccessRights after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the PullAccessRights action is retried with valid device information
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 7. PullPayload
  # Note: Pull Payload from AllegionSDK.
  Scenario: PullPayload with valid transaction
    Given Download and install SDK and the user logged in using valid credentials
    When the PullPayload action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the payload should be received in PDF Logs

  Scenario: PullPayload fails with invalid parameters
    Given Download and install SDK and the user logged in using valid credentials
    When the PullPayload action is triggered with invalid parameters
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry PullPayload after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the PullPayload action is retried with valid parameters
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 8. WriteSecurityToken
  # Note: In order to connect with Allegion lock, the SDK needs to be authenticated by lock.
  Scenario: WriteSecurityToken with valid credentials
    Given Download and install SDK and the user logged in using valid credentials
    When the WriteSecurityToken action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the lock should accept the token in PDF Logs

  Scenario: WriteSecurityToken fails with invalid credentials
    Given Download and install SDK and the user logged in using valid credentials
    When the WriteSecurityToken action is triggered with invalid credentials
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry WriteSecurityToken after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the WriteSecurityToken action is retried with valid credentials
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # 9. TouringOperation
  # Note: Writing Config to lock.
  Scenario Outline: TouringOperation with valid <SubAction>
    Given Download and install SDK and the user logged in using valid credentials
    When the TouringOperation action is triggered with "<SubAction>" subaction
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the "<SubAction>" operation should be completed in PDF Logs

    Examples:
      | SubAction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  Scenario Outline: TouringOperation fails with invalid <SubAction>
    Given Download and install SDK and the user logged in using valid credentials
    When the TouringOperation action is triggered with invalid "<SubAction>" parameters
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

    Examples:
      | SubAction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  Scenario Outline: Retry TouringOperation after failure for <SubAction>
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the TouringOperation action is retried with valid "<SubAction>" parameters
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

    Examples:
      | SubAction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  # 10. Unlock
  # Note: Allegion Unlocking.
  Scenario: Unlock with valid SDK credentials
    Given Download and install SDK and the user logged in using valid credentials
    When the Unlock action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the lock should be unlocked in PDF Logs

  Scenario: Unlock fails with invalid credentials
    Given Download and install SDK and the user logged in using invalid credentials
    When the Unlock action is triggered
    Then User clicks on the share PDF logs and share logs
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And the lock should remain locked in PDF Logs

  Scenario: Retry Unlock after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    When the Unlock action is retried with valid credentials
    Then User clicks on the share PDF logs and share logs
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs