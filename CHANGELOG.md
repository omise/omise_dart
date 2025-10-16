## 0.8.0

### Added

- Support TAS passkey suthentication flow for charge and token.

## 0.7.0

### Added

- Support charge creation.

## 0.6.0

### Added

- Support apple pay tokenization.

## 0.5.0

### Added

- Support non card tokenization in token api request.

## 0.4.0

### Added

- Added new source `maybank_qr`.

## 0.3.0

### New Features

- Add `Source` request creation using the omise API.

## 0.2.0

### Breaking Changes

- Updated models to use `DateTime` type and `ChargeStatus` enum for `Token` response.
- Made `CreateTokenRequest` class mutable for easier frontend manipulation.

### Enhancements

- Expose enum and exception classes for external usage.

## 0.1.0

- Initial version.
