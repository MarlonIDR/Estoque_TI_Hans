class ItemModel {
  final int id;
  final String tipoDispositivo;
  final String local;
  final String numeroPatrimonial;
  final String codItem;
  final String serviceTag;
  final String status;

  ItemModel({
    required this.id,
    required this.tipoDispositivo,
    required this.local,
    required this.numeroPatrimonial,
    required this.codItem,
    required this.serviceTag,
    required this.status,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      tipoDispositivo: json['tipo_dispositivo'] as String,
      local: json['local'] as String,
      numeroPatrimonial: json['numero_patrimonial'] as String,
      codItem: json['cod_item'] as String,
      serviceTag: json['service_tag'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tipo_dispositivo': tipoDispositivo,
      'local': local,
      'numero_patrimonial': numeroPatrimonial,
      'cod_item': codItem,
      'service_tag': serviceTag,
      'status': status,
    };
  }
}