import 'package:airplane/models/destinations_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService{

  // ignore: prefer_final_fields
  CollectionReference _destinationReference = 
    FirebaseFirestore.instance.collection('destinations');

    Future<List<DestinationsModel>> fecthDestinations() async{
      try {
        QuerySnapshot result = await _destinationReference.get();

        List<DestinationsModel> destinations = result.docs.map((e){
          return DestinationsModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
        }).toList();

        return destinations;
      } catch (e) {
        // ignore: use_rethrow_when_possible
        throw e;
      }
    }
}