String getImagePath({required String name, required String extension}) =>
    "assets/images/$name.$extension";


getImagePathPng({required String name}) {
  return "assets/images/$name.png";
}

getImagePathJpg({required String name}) {
  return "assets/images/$name.jpg";
}


shortenPath({required String value, int length = 10})=> (value.length > length ) ? "${value.substring(0, length)}..." : value;