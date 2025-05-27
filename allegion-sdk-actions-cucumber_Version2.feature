Feature: AllegionSDK Actions Logging and Status Tracking

  As a developer or QA,
  I want to ensure all AllegionSDK actions are tracked and logged with correct statuses in PDF Logs,
  So that the integration with Allegion devices is reliable and auditable.

  # Authenticate
  Scenario: Authenticate with valid credentials
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the Authenticate action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And an authentication token should be issued in PDF Logs

  Scenario: Authenticate fails with invalid credentials
    Given Download and install SDK and the user logged in using invalid credentials
    Then User clicks on the share PDF logs and share logs
    When the Authenticate action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry authentication after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the Authenticate action is retried with valid credentials
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # DeleteCredential
  Scenario: DeleteCredential with valid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the DeleteCredential action is triggered for a valid cardformatid
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the credential should be deleted in PDF Logs

  Scenario: DeleteCredential fails with invalid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the DeleteCredential action is triggered for an invalid cardformatid
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry DeleteCredential after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the DeleteCredential action is retried with a valid cardformatid
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # CreateCredential
  Scenario: CreateCredential with valid cardformatid
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the CreateCredential action is triggered for a valid cardformatid
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the credential should be created in PDF Logs

  Scenario: CreateCredential fails with missing or invalid data
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the CreateCredential action is triggered with missing or invalid data
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry CreateCredential after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the CreateCredential action is retried with valid data
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # InitSDK
  Scenario: InitSDK in supported environment
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the InitSDK action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the SDK should be initialized in PDF Logs

  Scenario: InitSDK fails in unsupported environment
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the InitSDK action is triggered in an unsupported environment
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry InitSDK after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the InitSDK action is retried in a supported environment
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # DeviceEnrollment
  Scenario: DeviceEnrollment with valid details
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the DeviceEnrollment action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the device should be enrolled in PDF Logs

  Scenario: DeviceEnrollment fails with invalid details
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the DeviceEnrollment action is triggered with invalid details
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry DeviceEnrollment after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the DeviceEnrollment action is retried with valid details
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # PullAccessRights
  Scenario: PullAccessRights with valid device
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the PullAccessRights action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And access rights should be returned in PDF Logs

  Scenario: PullAccessRights fails with invalid device
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the PullAccessRights action is triggered with invalid device information
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry PullAccessRights after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the PullAccessRights action is retried with valid device information
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # PullPayload
  Scenario: PullPayload with valid transaction
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the PullPayload action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the payload should be received in PDF Logs

  Scenario: PullPayload fails with invalid parameters
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the PullPayload action is triggered with invalid parameters
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry PullPayload after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the PullPayload action is retried with valid parameters
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # WriteSecurityToken
  Scenario: WriteSecurityToken with valid credentials
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the WriteSecurityToken action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the lock should accept the token in PDF Logs

  Scenario: WriteSecurityToken fails with invalid credentials
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the WriteSecurityToken action is triggered with invalid credentials
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And an error should be logged in PDF Logs

  Scenario: Retry WriteSecurityToken after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the WriteSecurityToken action is retried with valid credentials
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

  # TouringOperation
  Scenario Outline: TouringOperation with valid subaction
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the TouringOperation action is triggered with "<SubAction>" subaction
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

  Scenario Outline: TouringOperation fails with invalid "<SubAction>" subaction
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the TouringOperation action is triggered with invalid "<SubAction>" parameters
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

  Scenario Outline: Retry TouringOperation after failure for "<SubAction>"
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the TouringOperation action is retried with valid "<SubAction>" parameters
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs

    Examples:
      | SubAction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  # Unlock
  Scenario: Unlock with valid SDK credentials
    Given Download and install SDK and the user logged in using valid credentials
    Then User clicks on the share PDF logs and share logs
    When the Unlock action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Success" in PDF Logs
    And the lock should be unlocked in PDF Logs

  Scenario: Unlock fails with invalid credentials
    Given Download and install SDK and the user logged in using invalid credentials
    Then User clicks on the share PDF logs and share logs
    When the Unlock action is triggered
    Then the status should be "Start" in PDF Logs
    And the status should transition to "Fail" in PDF Logs
    And the lock should remain locked in PDF Logs

  Scenario: Retry Unlock after failure
    Given Download and install SDK and the user logged in using valid credentials after previous failure
    Then User clicks on the share PDF logs and share logs
    When the Unlock action is retried with valid credentials
    Then the status should transition to "Retry" in PDF Logs
    And the status should transition to "Success" in PDF Logs