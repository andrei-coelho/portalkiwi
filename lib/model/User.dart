

class User {

  String _nome, _device_key, _token;

  User(this._nome, this._device_key, this._token);

  get nome { return _nome; }
  get device_key { return _device_key; }
  get token { return _token; }

}