// =========================================================================
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
// =========================================================================

// =========================================================================
// Disclaimer notes:
//  This library is not intended to be a viable option for use in situations
//  of reliability and robustness, several of these algorithms need to be
//  better implemented, this library serves to demonstrate certain algorithms
//  applied to the theory of numbers, also serves as an example as a basis
//  for creating a library (quite simple).
// =========================================================================

#ifndef CRYDI3_DIGITAL_SIGN_H
#define CRYDI3_DIGITAL_SIGN_H

#include "digital_sign_def.h"

namespace crydi {

template <class T>
DigitalSign<T>::DigitalSign(const KeyList<T>& rsa_keys_a, const KeyList<T>& rsa_keys_b, const KeyList<T>& elgammal_keys):
  rsa(rsa_keys_a),
  elgammal(elgammal_keys),
  a_keys(rsa_keys_a),
  b_keys(rsa_keys_b) {
    KeyList<T> swaped { rsa_keys_a[PRIVATE_R], rsa_keys_a[PUBLIC_R], rsa_keys_a[MODULUS_R] };
    rsa.SetKeys(swaped);
    a_keys = swaped;
  }

template <class T>
DigitalSign<T>::DigitalSign(const KeyList<T>& rsa_keys_a, const KeyList<T>& rsa_keys_b, const KeyList<T>& elgammal_keys, const string& sign):
  rsa(rsa_keys_a),
  elgammal(elgammal_keys),
  a_keys(rsa_keys_a),
  b_keys(rsa_keys_b),
  sign(sign) {
    KeyList<T> swaped { rsa_keys_a[PRIVATE_R], rsa_keys_a[PUBLIC_R], rsa_keys_a[MODULUS_R] };
    rsa.SetKeys(swaped);
    a_keys = swaped;
  }

template <class T>
DigitalSign<T>::DigitalSign(const string& alpha):
  rsa(alpha),
  elgammal(alpha) {}

template <class T>
DigitalSign<T>::DigitalSign(const string& alpha, const string& sign):
  rsa(alpha),
  elgammal(alpha),
  sign(sign) {}

template <class T>
DigitalSign<T>::DigitalSign(const string& alpha, const KeyList<T>& rsa_keys_a, const KeyList<T>& rsa_keys_b, const KeyList<T>& elgammal_keys):
  rsa(alpha, rsa_keys_a),
  elgammal(alpha, elgammal_keys),
  a_keys(rsa_keys_a),
  b_keys(rsa_keys_b) {
    KeyList<T> swaped { rsa_keys_a[PRIVATE_R], rsa_keys_a[PUBLIC_R], rsa_keys_a[MODULUS_R] };
    rsa.SetKeys(swaped);
    a_keys = swaped;
  }

template <class T>
DigitalSign<T>::DigitalSign(const string& alpha, const KeyList<T>& rsa_keys_a, const KeyList<T>& rsa_keys_b, const KeyList<T>& elgammal_keys, const string& sign):
  rsa(alpha, rsa_keys_a),
  elgammal(alpha, elgammal_keys),
  a_keys(rsa_keys_a),
  b_keys(rsa_keys_b),
  sign(sign) {
    KeyList<T> swaped { rsa_keys_a[PRIVATE_R], rsa_keys_a[PUBLIC_R], rsa_keys_a[MODULUS_R] };
    rsa.SetKeys(swaped);
    a_keys = swaped;
  }

template <class T>
string DigitalSign<T>::GetSign() { return this->sign; }

template <class T>
void DigitalSign<T>::SetSign(const string& sign) { this->sign = sign; }

template <class T>
RSACrypto<T>& DigitalSign<T>::GetRSACrypto() {
  return this->rsa;
}

template <class T>
ElGammalCrypto<T>& DigitalSign<T>::GetElGammalCrypto() {
  return this->elgammal;
}

template <class T>
void DigitalSign<T>::SetReceiverKeys(const KeyList<T>& rsa_keys_b) {
  this->b_keys = rsa_keys_b;
}

template <class T>
KeyList<T> DigitalSign<T>::GetReceiverKeys() {
  return this->b_keys;
}

template <class T>
string DigitalSign<T>::Encrypt(string msg) {
  if (sign == "") throw NotSignFounded();
  rsa.SetKeys(this->a_keys);
  string msg_encrypted  = elgammal.Encrypt(elgammal.MsgToNumericalForm(msg));
  string sign_encrypted = rsa.Encrypt(rsa.MsgToNumericalForm(this->sign));
  rsa.SetKeys(this->b_keys);
  return rsa.Encrypt(msg_encrypted + sign_encrypted);
}

template <class T>
string DigitalSign<T>::Decrypt(string msg) {
  rsa.SetKeys(b_keys);
  string msg_decrypted = rsa.Decrypt(msg);
  unsigned long modulus_size {
    NumberToString(a_keys[MODULUS_R]).size()
  };
  // Separate both blocks
  string sign_block = msg_decrypted.substr(
    msg_decrypted.size() - modulus_size
  );
  msg_decrypted = msg_decrypted.substr(
    0, msg_decrypted.size() - modulus_size
  );
  rsa.SetKeys(a_keys);
  sign_block = rsa.Decrypt(sign_block);
  msg_decrypted = elgammal.Decrypt(msg_decrypted);
  return (msg_decrypted + " - " + sign_block);
}

}

#endif