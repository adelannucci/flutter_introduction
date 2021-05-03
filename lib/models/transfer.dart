class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccount() {
    return 'Conta: $account';
  }

  @override
  String toString() {
    return 'Transfer{value: $value, account: $account}';
  }
}