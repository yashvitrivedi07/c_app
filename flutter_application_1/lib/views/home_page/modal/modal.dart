class ContactModal {
  String? fname, lname, contact, mail, cname, image;
  DateTime? date;

  ContactModal(
      {this.fname,
      this.cname,
      this.contact,
      this.lname,
      this.mail,
      this.image,
      this.date});
}

class AccountModal {
  String? firstName, lastName, email, number, password;

  AccountModal(
      {this.firstName, this.lastName, this.email, this.number, this.password});
}
