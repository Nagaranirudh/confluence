# Allegion NFC App - Test Cases

## 1. User and Pass Creation

- **TC1: Successful credential provisioning**
  - User requests a new NFC credential.
  - Validate backend receives the request and returns success.
  - Verify app receives and displays new credential.

- **TC2: Display of provisioned credential in user's wallet**
  - After provisioning, verify the credential appears in Google Wallet/Apple Wallet.
  - Check for correct branding and organization name.

- **TC3: Duplicate provisioning attempt**
  - Attempt to provision a credential that already exists for the user.
  - Validate error handling and messaging.

- **TC4: Invalid user data during credential request**
  - Attempt to create with malformed or missing user data.
  - Validate appropriate error is shown and request is rejected.

- **TC5: Backend/API failure during provisioning**
  - Simulate a backend/API failure.
  - App should show error and not create credential.

## 2. Credential Activation/Delivery

- **TC6: Activate delivered credential**
  - After delivery event from Allegion, credential becomes active.
  - User can see status update in app.

- **TC7: Fail to activate credential (invalid event)**
  - Simulate invalid event payload.
  - App should log error and not activate.

- **TC8: Push notification on successful delivery**
  - User receives notification when credential is delivered and activated.

## 3. Credential Lifecycle (Suspend, Resume, Delete)

- **TC9: Admin-initiated suspend**
  - Admin suspends a user's credential.
  - App reflects credential as suspended (cannot use for unlock).

- **TC10: User-initiated suspend**
  - User suspends their own credential from the app.
  - App and backend sync; credential is disabled until resumed.

- **TC11: Resume credential (admin or user)**
  - Credential in suspended state is resumed.
  - App updates to show credential as active and usable.

- **TC12: Delete credential (admin or user)**
  - Credential is deleted from backend and removed from app/wallet.
  - Verify user cannot use credential after deletion.

- **TC13: Attempt action on deleted credential**
  - User attempts unlock or management on deleted credential.
  - App should show appropriate error.

## 4. Unlock Operations

- **TC14: Unlock with valid credential**
  - User presents mobile credential to lock.
  - Lock unlocks; app displays success.

- **TC15: Unlock with suspended credential**
  - Attempt unlock while credential is suspended.
  - Lock remains locked; app shows error.

- **TC16: Unlock with outdated/expired credential**
  - Simulate using an expired credential.
  - App and lock should deny access.

## 5. Multiple Community Assignment

- **TC17: User assigned to multiple communities**
  - Verify correct number of available keys.
  - Keys are named according to community.

- **TC18: User with multiple units in one community**
  - Only single key shown for that community.

- **TC19: UserId generation**
  - Ensure UserId matches last 16 bytes of IPK and first 8 bytes of Community GUID.

## 6. Error Handling

- **TC20: Malformed API event (delivery/lifecycle)**
  - App logs and gracefully handles errors from backend.

- **TC21: Connectivity loss during operation**
  - App shows offline/error state and retries when possible.

## 7. UI & Wallet Integration

- **TC22: Add credential to Google Wallet (Android)**
  - Credential can be added, removed, and displayed.

- **TC23: Add credential to Apple Wallet (iOS)**
  - Same as above for iOS.

- **TC24: Wallet shows correct pass info**
  - Branding, organization name, expiration, user photo (if any).

## 8. Security

- **TC25: Attempt credential use after app uninstall/reinstall**
  - Credential remains valid/invalid as per backend state.

- **TC26: Test with wrong mTLS certificate/key**
  - Backend rejects requests, app displays error.

---

This list covers provisioning, delivery, lifecycle events, unlock flows, multiple community/user assignment, error handling, UI/wallet integration, and security. You may need to adapt or expand these based on your specific implementation and environment.