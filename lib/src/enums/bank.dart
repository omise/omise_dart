enum Bank {
  test,
  bbl,
  kbank,
  rbs,
  ktb,
  jpm,
  mufg,
  ttb,
  scb,
  citi,
  smbc,
  sc,
  cimb,
  uob,
  bay,
  mega,
  boa,
  cacib,
  gsb,
  hsbc,
  db,
  ghb,
  baac,
  mb,
  bnp,
  ibank,
  tisco,
  kk,
  icbc,
  tcrb,
  lhb,
}

extension BankExtension on Bank {
  static Bank fromString(String value) {
    switch (value.toLowerCase()) {
      case 'test':
        return Bank.test;
      case 'bbl':
        return Bank.bbl;
      case 'kbank':
        return Bank.kbank;
      case 'rbs':
        return Bank.rbs;
      case 'ktb':
        return Bank.ktb;
      case 'jpm':
        return Bank.jpm;
      case 'mufg':
        return Bank.mufg;
      case 'ttb':
        return Bank.ttb;
      case 'scb':
        return Bank.scb;
      case 'citi':
        return Bank.citi;
      case 'smbc':
        return Bank.smbc;
      case 'sc':
        return Bank.sc;
      case 'cimb':
        return Bank.cimb;
      case 'uob':
        return Bank.uob;
      case 'bay':
        return Bank.bay;
      case 'mega':
        return Bank.mega;
      case 'boa':
        return Bank.boa;
      case 'cacib':
        return Bank.cacib;
      case 'gsb':
        return Bank.gsb;
      case 'hsbc':
        return Bank.hsbc;
      case 'db':
        return Bank.db;
      case 'ghb':
        return Bank.ghb;
      case 'baac':
        return Bank.baac;
      case 'mb':
        return Bank.mb;
      case 'bnp':
        return Bank.bnp;
      case 'ibank':
        return Bank.ibank;
      case 'tisco':
        return Bank.tisco;
      case 'kk':
        return Bank.kk;
      case 'icbc':
        return Bank.icbc;
      case 'tcrb':
        return Bank.tcrb;
      case 'lhb':
        return Bank.lhb;
      default:
        throw ArgumentError('Unknown bank: $value');
    }
  }
}
