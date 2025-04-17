class ChargesMock {
  static final createChargeSuccess = {
    "object": "charge",
    "id": "chrg_63f4bvoea7xdc1je2ry",
    "location": "/charges/chrg_63f4bvoea7xdc1je2ry",
    "amount": 20000,
    "acquirer_reference_number": null,
    "net": 19219,
    "fee": 730,
    "fee_vat": 51,
    "interest": 0,
    "interest_vat": 0,
    "funding_amount": 20000,
    "refunded_amount": 0,
    "transaction_fees": {
      "fee_flat": "0.0",
      "fee_rate": "3.65",
      "vat_rate": "7.0"
    },
    "platform_fee": {"fixed": 0, "amount": 0, "percentage": "0.0"},
    "currency": "THB",
    "funding_currency": "THB",
    "ip": null,
    "refunds": {
      "object": "list",
      "data": [],
      "limit": 20,
      "offset": 0,
      "total": 0,
      "location": "/charges/chrg_63f4bvoea7xdc1je2ry/refunds",
      "order": "chronological",
      "from": "1970-01-01T00:00:00Z",
      "to": "2025-04-17T12:41:53Z"
    },
    "link": null,
    "description": "anna tests expires_at",
    "metadata": {},
    "card": null,
    "source": {
      "object": "source",
      "id": "src_63f4bvo6mlqr3c4gs2g",
      "livemode": true,
      "location": "/sources/src_63f4bvo6mlqr3c4gs2g",
      "amount": 20000,
      "barcode": null,
      "bank": null,
      "created_at": "2025-04-17T12:41:51Z",
      "currency": "THB",
      "email": null,
      "flow": "offline",
      "installment_term": null,
      "ip": null,
      "absorption_type": null,
      "name": null,
      "mobile_number": null,
      "phone_number": null,
      "platform_type": null,
      "scannable_code": {
        "object": "barcode",
        "type": "qr",
        "image": {
          "object": "document",
          "livemode": true,
          "id": "docu_63f4bvwudrafxihuyxo",
          "deleted": false,
          "filename": "qrcode.svg",
          "location":
              "/charges/chrg_63f4bvoea7xdc1je2ry/documents/docu_63f4bvwudrafxihuyxo",
          "kind": "qr",
          "download_uri":
              "https://api.staging-omise.co/charges/chrg_63f4bvoea7xdc1je2ry/documents/docu_63f4bvwudrafxihuyxo/downloads/23F760B90243FD8F",
          "created_at": "2025-04-17T12:41:52Z"
        },
        "raw_data": null
      },
      "qr_settings": null,
      "billing": null,
      "shipping": null,
      "items": [],
      "references": null,
      "provider_references": {
        "reference_number_1": "63F4BVOGRBD77GREQD8",
        "reference_number_2": null,
        "buyer_name": null
      },
      "store_id": null,
      "store_name": null,
      "terminal_id": null,
      "type": "promptpay",
      "zero_interest_installments": null,
      "charge_status": "pending",
      "receipt_amount": null,
      "discounts": [],
      "promotion_code": null,
      "supplier_id": null
    },
    "schedule": null,
    "linked_account": null,
    "customer": null,
    "dispute": null,
    "transaction": null,
    "failure_code": null,
    "failure_message": null,
    "status": "pending",
    "authorize_uri":
        "https://pay.staging-omise.co/payments/pay2_63f4bvogrbd77greqd8/authorize?acs=false",
    "return_uri": "https://www.example.com/complete/success",
    "created_at": "2025-04-17T12:41:51Z",
    "paid_at": null,
    "authorized_at": null,
    "expires_at": "2025-04-17T12:46:51Z",
    "expired_at": null,
    "reversed_at": null,
    "multi_capture": false,
    "zero_interest_installments": false,
    "branch": null,
    "terminal": null,
    "device": null,
    "authorized": false,
    "capturable": false,
    "capture": true,
    "disputable": false,
    "livemode": true,
    "refundable": false,
    "partially_refundable": false,
    "reversed": false,
    "reversible": false,
    "voided": false,
    "paid": false,
    "expired": false,
    "can_perform_void": false,
    "approval_code": null
  };
  static final getCharge = {
    "object": "charge",
    "id": "chrg_63f4bvoea7xdc1je2ry",
    "location": "/charges/chrg_63f4bvoea7xdc1je2ry",
    "amount": 20000,
    "acquirer_reference_number": null,
    "net": 19219,
    "fee": 730,
    "fee_vat": 51,
    "interest": 0,
    "interest_vat": 0,
    "funding_amount": 20000,
    "refunded_amount": 0,
    "transaction_fees": {
      "fee_flat": "0.0",
      "fee_rate": "3.65",
      "vat_rate": "7.0"
    },
    "platform_fee": {"fixed": 0, "amount": 0, "percentage": "0.0"},
    "currency": "THB",
    "funding_currency": "THB",
    "ip": null,
    "refunds": {
      "object": "list",
      "data": [],
      "limit": 20,
      "offset": 0,
      "total": 0,
      "location": "/charges/chrg_63f4bvoea7xdc1je2ry/refunds",
      "order": "chronological",
      "from": "1970-01-01T00:00:00Z",
      "to": "2025-04-17T12:42:20Z"
    },
    "link": null,
    "description": "anna tests expires_at",
    "metadata": {},
    "card": null,
    "source": {
      "object": "source",
      "id": "src_63f4bvo6mlqr3c4gs2g",
      "livemode": true,
      "location": "/sources/src_63f4bvo6mlqr3c4gs2g",
      "amount": 20000,
      "barcode": null,
      "bank": null,
      "created_at": "2025-04-17T12:41:51Z",
      "currency": "THB",
      "email": null,
      "flow": "offline",
      "installment_term": null,
      "ip": null,
      "absorption_type": null,
      "name": null,
      "mobile_number": null,
      "phone_number": null,
      "platform_type": null,
      "scannable_code": {
        "object": "barcode",
        "type": "qr",
        "image": {
          "object": "document",
          "livemode": true,
          "id": "docu_63f4bvwudrafxihuyxo",
          "deleted": false,
          "filename": "qrcode.svg",
          "location":
              "/charges/chrg_63f4bvoea7xdc1je2ry/documents/docu_63f4bvwudrafxihuyxo",
          "kind": "qr",
          "download_uri":
              "https://api.staging-omise.co/charges/chrg_63f4bvoea7xdc1je2ry/documents/docu_63f4bvwudrafxihuyxo/downloads/23F760B90243FD8F",
          "created_at": "2025-04-17T12:41:52Z"
        },
        "raw_data": null
      },
      "qr_settings": null,
      "billing": null,
      "shipping": null,
      "items": [],
      "references": null,
      "provider_references": {
        "reference_number_1": "63F4BVOGRBD77GREQD8",
        "reference_number_2": null,
        "buyer_name": null
      },
      "store_id": null,
      "store_name": null,
      "terminal_id": null,
      "type": "promptpay",
      "zero_interest_installments": null,
      "charge_status": "pending",
      "receipt_amount": null,
      "discounts": [],
      "promotion_code": null,
      "supplier_id": null
    },
    "schedule": null,
    "linked_account": null,
    "customer": null,
    "dispute": null,
    "transaction": null,
    "failure_code": null,
    "failure_message": null,
    "status": "pending",
    "authorize_uri":
        "https://pay.staging-omise.co/payments/pay2_63f4bvogrbd77greqd8/authorize?acs=false",
    "return_uri": "https://www.example.com/complete/success",
    "created_at": "2025-04-17T12:41:51Z",
    "paid_at": null,
    "authorized_at": null,
    "expires_at": "2025-04-17T12:46:51Z",
    "expired_at": null,
    "reversed_at": null,
    "multi_capture": false,
    "zero_interest_installments": false,
    "branch": null,
    "terminal": null,
    "device": null,
    "authorized": false,
    "capturable": false,
    "capture": true,
    "disputable": false,
    "livemode": true,
    "refundable": false,
    "partially_refundable": false,
    "reversed": false,
    "reversible": false,
    "voided": false,
    "paid": false,
    "expired": false,
    "can_perform_void": false,
    "approval_code": null
  };
  static final chargeNotFound = {
    "object": "error",
    "location": "https://www.omise.co/api-errors#not-found",
    "code": "not_found",
    "message": "charge chrg_63f4bvoea7xdc1je2ry2 was not found"
  };
  static final invalidPaymentType = {
    "object": "error",
    "location": "https://www.omise.co/api-errors#bad-request",
    "code": "bad_request",
    "message": "type is currently not supported"
  };
}
