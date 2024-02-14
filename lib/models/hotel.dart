class Hotel {
  const Hotel({
    required this.id,
    required this.nom, 
    required this.prix,
    required this.etoile,
    required this.type,
    required this.idPartner
  });

 final String id;
 final String nom;
 final String prix;
 final int etoile; 
 final String type; 
 final String idPartner;
}