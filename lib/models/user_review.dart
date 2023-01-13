import 'package:json_annotation/json_annotation.dart';

part 'user_review.g.dart';

@JsonSerializable()
class UserReview {
  UserReview({
    this.re_id,
    this.tessera,
    this.nome_poi,
    this.nominativo,
    this.pr_nome,
    this.pr_cognome,
    this.id_poi,
    this.re_data,
    this.re_valore,
    this.re_testo,
    this.re_testo_en,
    this.pr_email,
    this.re_posto,
    this.re_tot,
    this.re_open,
    this.re_approv,
    this.tipologia,
    this.id,
    this.cat_convenzioni,
    this.cat_areesosta,
    this.cat_areeservizio,
    this.cat_camping,
    this.cat_attrazioni,
    this.cat_allianz,
    this.id_tipologia_poi,
    this.idLocalita_poi,
    this.indirizzo_poi,
    this.citta_poi,
    this.cap_poi,
    this.provincia_poi,
    this.regione_poi,
    this.nazione_poi,
    this.telefono_poi,
    this.fax_poi,
    this.email_poi,
    this.sitoweb_poi,
    this.paginafb_poi,
    this.scadenzaConv_poi,
    this.lat_poi,
    this.lon_poi,
    this.precisionegeo_poi,
    this.quota_poi,
    this.idParchi_poi,
    this.apertodal_poi,
    this.apertoal_poi,
    this.facilitazioni_poi,
    this.sconto_poi,
    this.sconto_poi_en,
    this.referenti_poi,
    this.desc_poi,
    this.desc_poi_en,
    this.numeroposti_poi,
    this.tariffagiorno_poi,
    this.idsAmbienti_poi,
    this.idsServizi_poi,
    this.maxgiorni_poi,
    this.piazzola_poi,
    this.attrazioni_poi,
    this.no_gps,
    this.offline,
    this.rev_en,
    this.valutazione_poi,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) =>
      _$UserReviewFromJson(json); // ignore: lines_longer_than_80_chars

  Map<String, dynamic> toJson() => _$UserReviewToJson(this);

  final String? re_id;
  final String? tessera;
  final String? nome_poi;
  final String? nominativo;
  final String? pr_nome;
  final String? pr_cognome;
  final String? id_poi;
  final String? re_data;
  final String? re_valore;
  final String? re_testo;
  final String? re_testo_en;
  final String? pr_email;
  final String? re_posto;
  final String? re_tot;
  final String? re_open;
  final String? re_approv;
  final String? tipologia;
  final String? id;
  final String? cat_convenzioni;
  final String? cat_areesosta;
  final String? cat_areeservizio;
  final String? cat_camping;
  final String? cat_attrazioni;
  final String? cat_allianz;
  final String? id_tipologia_poi;
  final String? idLocalita_poi;
  final String? indirizzo_poi;
  final String? citta_poi;
  final String? cap_poi;
  final String? provincia_poi;
  final String? regione_poi;
  final String? nazione_poi;
  final String? telefono_poi;
  final String? fax_poi;
  final String? email_poi;
  final String? sitoweb_poi;
  final String? paginafb_poi;
  final String? scadenzaConv_poi;
  final String? lat_poi;
  final String? lon_poi;
  final String? precisionegeo_poi;
  final String? quota_poi;
  final String? idParchi_poi;
  final String? apertodal_poi;
  final String? apertoal_poi;
  final String? facilitazioni_poi;
  final String? sconto_poi;
  final String? sconto_poi_en;
  final String? referenti_poi;
  final String? desc_poi;
  final String? desc_poi_en;
  final String? numeroposti_poi;
  final String? tariffagiorno_poi;
  final String? idsAmbienti_poi;
  final String? idsServizi_poi;
  final String? maxgiorni_poi;
  final String? piazzola_poi;
  final String? attrazioni_poi;
  final String? no_gps;
  final String? offline;
  final String? rev_en;
  final String? valutazione_poi;
}
