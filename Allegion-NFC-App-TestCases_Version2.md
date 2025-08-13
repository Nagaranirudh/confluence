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
  - User is assigned to multiple communities.
  - App displays a credential for each distinct community assigned.
  - Verify the number of available keys matches the number of communities.

- **TC18: User with multiple units in one community**
  - User is assigned to more than one unit within a single community.
  - App displays only a single key for that community (not duplicated per unit).

- **TC19: Community name in key name**
  - Each credential is labeled in the app (e.g., Allegion-NFC-Comm1) to indicate its community.

- **TC20: UserId generation for multi-community**
  - Ensure UserId is generated as per spec: last 16 bytes of IPK + first 8 bytes of Community GUID.
  - Validate correct UserId mapping for each community pass.

- **TC21: Switching between communities**
  - User switches/selects different community credentials.
  - App updates UI and actions based on selected credential.

- **TC22: Remove community assignment**
  - Remove a community assignment from the user.
  - App removes and invalidates the corresponding credential.

- **TC23: Add new community assignment**
  - Assign a new community to user.
  - App provisions and displays new community credential.

- **TC24: Attempt unlock with credential for wrong community**
  - User attempts to use a credential for Community A at a lock in Community B.
  - Access is denied; app shows appropriate error.

- **TC25: UI validation for multiple credentials**
  - All credentials are visually distinct, show correct community, and are managed independently.

- **TC26: Edge case – No communities assigned**
  - User has no communities assigned.
  - App displays no credentials and appropriate messaging.

## 6. Error Handling

- **TC27: Malformed API event (delivery/lifecycle)**
  - App logs and gracefully handles errors from backend.

- **TC28: Connectivity loss during operation**
  - App shows offline/error state and retries when possible.

## 7. UI & Wallet Integration

- **TC29: Add credential to Google Wallet (Android)**
  - Credential can be added, removed, and displayed.

- **TC30: Add credential to Apple Wallet (iOS)**
  - Same as above for iOS.

- **TC31: Wallet shows correct pass info**
  - Branding, organization name, expiration, user photo (if any).

## 8. Security

- **TC32: Attempt credential use after app uninstall/reinstall**
  - Credential remains valid/invalid as per backend state.

- **TC33: Test with wrong mTLS certificate/key**
  - Backend rejects requests, app displays error.

---

This list now includes detailed test cases for multi-community assignment and all related edge cases, in addition to the full Allegion NFC app flow.