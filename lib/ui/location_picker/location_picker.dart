import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  String address = "null";
  String autocompletePlace = "null";
  Prediction? initialValue;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlacesAutocomplete(
            searchController: _controller,
            apiKey: "AIzaSyB9AB3O6SvSNqmokLlWUvieahUIy5JA_vw",
            mounted: mounted,
            hideBackButton: true,
            onGetDetailsByPlaceId: (PlacesDetailsResponse? result) {
              if (result != null) {
                setState(() {
                  autocompletePlace = result.result.formattedAddress ?? "";
                });
              }
            },
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              child: const Text('Pick location'),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapLocationPicker(
                        apiKey: "AIzaSyB9AB3O6SvSNqmokLlWUvieahUIy5JA_vw",
                        fabIcon: Icons.my_location,
                        onCameraIdle: () {},
                        onDecodeAddress: (result) {
                          if (kDebugMode) {
                            print(
                                "${result?.geometry.location.lat},${result?.geometry.location.lng}");
                          }
                        },
                        currentLatLng:
                            const LatLng(28.61426970867492, 77.20905147492886),
                        topCardMargin: const EdgeInsets.all(16),
                        // topCardColor: Colors.blue,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          hintText: "Search...",
                          // hintStyle: const TextStyle(color: Colors.white),
                        ),
                        topCardShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        bottomCardBuilder: (context, result, val) {
                          if (result?.formattedAddress != null) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 16, left: 16, right: 16),
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        CupertinoIcons.map_pin_ellipse,
                                        size: 32,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        " ${result?.addressComponents.first.shortName}",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "\n${result?.formattedAddress}\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 10),
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child:
                                          const Text("   CONFIRM LOCATION   "),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                        hideBackButton: true,
                        hideMapTypeButton: true,
                        onNext: (GeocodingResult? result) {
                          if (result != null) {
                            setState(() {
                              address = result.formattedAddress ?? "";
                            });
                          }
                        },
                        onSuggestionSelected: (PlacesDetailsResponse? result) {
                          if (result != null) {
                            setState(() {
                              autocompletePlace =
                                  result.result.formattedAddress ?? "";
                            });
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          ListTile(
            title: Text("Geocoded Address: $address"),
          ),
          ListTile(
            title: Text("Autocomplete Address: $autocompletePlace"),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
