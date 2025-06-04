Feature: AllegionSDK Action Logging

  Background:
    Given the user is authenticated with valid Allegion CMS credentials
    And the AllegionSDK is initialized
    And the user is on the device interaction screen

  @regression @AllegionSDK @logging @Authenticate @JIRA-MOB-35119
  Scenario: Log statuses for Authenticate action
    When the user triggers the Authenticate action in AllegionSDK
    Then a "Start" status log should be recorded for the Authenticate action
    And if a retry occurs, a "Retry" status log should be recorded for the Authenticate action
    And if authentication is successful, a "Success" status log should be recorded for the Authenticate action
    And if authentication fails, a "Fail" status log should be recorded for the Authenticate action

  @regression @AllegionSDK @logging @DeleteCredential @JIRA-MOB-35119
  Scenario: Log statuses for DeleteCredential action
    When the user triggers the DeleteCredential action for a cardholder in AllegionSDK
    Then a "Start" status log should be recorded for the DeleteCredential action
    And if a retry occurs, a "Retry" status log should be recorded for the DeleteCredential action
    And if the credential is deleted successfully, a "Success" status log should be recorded for the DeleteCredential action
    And if deletion fails, a "Fail" status log should be recorded for the DeleteCredential action

  @regression @AllegionSDK @logging @CreateCredential @JIRA-MOB-35119
  Scenario: Log statuses for CreateCredential action
    When the user triggers the CreateCredential action for a cardholder in AllegionSDK
    Then a "Start" status log should be recorded for the CreateCredential action
    And if a retry occurs, a "Retry" status log should be recorded for the CreateCredential action
    And if the credential is created successfully, a "Success" status log should be recorded for the CreateCredential action
    And if creation fails, a "Fail" status log should be recorded for the CreateCredential action

  @regression @AllegionSDK @logging @InitSDK @JIRA-MOB-35119
  Scenario: Log statuses for InitSDK action
    When the user triggers the InitSDK action in AllegionSDK
    Then a "Start" status log should be recorded for the InitSDK action
    And if a retry occurs, a "Retry" status log should be recorded for the InitSDK action
    And if initialization is successful, a "Success" status log should be recorded for the InitSDK action
    And if initialization fails, a "Fail" status log should be recorded for the InitSDK action

  @regression @AllegionSDK @logging @DeviceEnrollment @JIRA-MOB-35119
  Scenario: Log statuses for DeviceEnrollment action
    When the user triggers the DeviceEnrollment action in AllegionSDK
    Then a "Start" status log should be recorded for the DeviceEnrollment action
    And if a retry occurs, a "Retry" status log should be recorded for the DeviceEnrollment action
    And if enrollment is successful, a "Success" status log should be recorded for the DeviceEnrollment action
    And if enrollment fails, a "Fail" status log should be recorded for the DeviceEnrollment action

  @regression @AllegionSDK @logging @PullAccessRights @JIRA-MOB-35119
  Scenario: Log statuses for PullAccessRights action
    When the user triggers the PullAccessRights action in AllegionSDK
    Then a "Start" status log should be recorded for the PullAccessRights action
    And if a retry occurs, a "Retry" status log should be recorded for the PullAccessRights action
    And if access rights are pulled successfully, a "Success" status log should be recorded for the PullAccessRights action
    And if pulling access rights fails, a "Fail" status log should be recorded for the PullAccessRights action

  @regression @AllegionSDK @logging @PullPayload @JIRA-MOB-35119
  Scenario: Log statuses for PullPayload action
    When the user triggers the PullPayload action in AllegionSDK
    Then a "Start" status log should be recorded for the PullPayload action
    And if a retry occurs, a "Retry" status log should be recorded for the PullPayload action
    And if payload is pulled successfully, a "Success" status log should be recorded for the PullPayload action
    And if pulling payload fails, a "Fail" status log should be recorded for the PullPayload action

  @regression @AllegionSDK @logging @WriteSecurityToken @JIRA-MOB-35119
  Scenario: Log statuses for WriteSecurityToken action
    When the user triggers the WriteSecurityToken action in AllegionSDK
    Then a "Start" status log should be recorded for the WriteSecurityToken action
    And if a retry occurs, a "Retry" status log should be recorded for the WriteSecurityToken action
    And if writing the security token is successful, a "Success" status log should be recorded for the WriteSecurityToken action
    And if writing the security token fails, a "Fail" status log should be recorded for the WriteSecurityToken action

  @regression @AllegionSDK @logging @TouringOperation @JIRA-MOB-35119
  Scenario Outline: Log statuses for TouringOperation <subaction> sub-action
    When the user triggers the TouringOperation action with "<subaction>" sub-action in AllegionSDK
    Then a "Start" status log should be recorded for the TouringOperation "<subaction>" sub-action
    And if a retry occurs, a "Retry" status log should be recorded for the TouringOperation "<subaction>" sub-action
    And if the operation is successful, a "Success" status log should be recorded for the TouringOperation "<subaction>" sub-action
    And if the operation fails, a "Fail" status log should be recorded for the TouringOperation "<subaction>" sub-action

    Examples:
      | subaction   |
      | Config      |
      | Schedule    |
      | PartialDb   |
      | FullDb      |
      | Audits      |

  @regression @AllegionSDK @logging @Unlock @JIRA-MOB-35119
  Scenario: Log statuses for Unlock action
    When the user triggers the Unlock action in AllegionSDK
    Then a "Start" status log should be recorded for the Unlock action
    And if a retry occurs, a "Retry" status log should be recorded for the Unlock action
    And if unlocking is successful, a "Success" status log should be recorded for the Unlock action
    And if unlocking fails, a "Fail" status log should be recorded for the Unlock action