class ComicsResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  Data data;

  ComicsResponse(
      {this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHTML,
        this.etag,
        this.data});

  ComicsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['attributionText'] = this.attributionText;
    data['attributionHTML'] = this.attributionHTML;
    data['etag'] = this.etag;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Comic> results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Comic>();
      json['results'].forEach((v) {
        results.add(new Comic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comic {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<TextObjects> textObjects;
  String resourceURI;
  List<Urls> urls;
  Series series;
  List<Null> variants;
  List<Null> collections;
  List<Null> collectedIssues;
  List<Dates> dates;
  List<Prices> prices;
  Thumbnail thumbnail;
  List<ImageItems> images;
  Creators creators;
  Creators characters;
  Creators stories;
  Creators events;

  Comic(
      {this.id,
        this.digitalId,
        this.title,
        this.issueNumber,
        this.variantDescription,
        this.description,
        this.modified,
        this.isbn,
        this.upc,
        this.diamondCode,
        this.ean,
        this.issn,
        this.format,
        this.pageCount,
        this.textObjects,
        this.resourceURI,
        this.urls,
        this.series,
        this.variants,
        this.collections,
        this.collectedIssues,
        this.dates,
        this.prices,
        this.thumbnail,
        this.images,
        this.creators,
        this.characters,
        this.stories,
        this.events});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'];
    description = json['description'];
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    if (json['textObjects'] != null) {
      textObjects = new List<TextObjects>();
      json['textObjects'].forEach((v) {
        textObjects.add(new TextObjects.fromJson(v));
      });
    }
    resourceURI = json['resourceURI'];
    if (json['urls'] != null) {
      urls = new List<Urls>();
      json['urls'].forEach((v) {
        urls.add(new Urls.fromJson(v));
      });
    }
    series =
    json['series'] != null ? new Series.fromJson(json['series']) : null;
    if (json['dates'] != null) {
      dates = new List<Dates>();
      json['dates'].forEach((v) {
        dates.add(new Dates.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = new List<Prices>();
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    if (json['images'] != null) {
      images = new List<ImageItems>();
      json['images'].forEach((v) {
        images.add(new ImageItems.fromJson(v));
      });
    }
    creators = json['creators'] != null
        ? new Creators.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null
        ? new Creators.fromJson(json['characters'])
        : null;
    stories =
    json['stories'] != null ? new Creators.fromJson(json['stories']) : null;
    events =
    json['events'] != null ? new Creators.fromJson(json['events']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['isbn'] = this.isbn;
    data['upc'] = this.upc;
    data['diamondCode'] = this.diamondCode;
    data['ean'] = this.ean;
    data['issn'] = this.issn;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;
    if (this.textObjects != null) {
      data['textObjects'] = this.textObjects.map((v) => v.toJson()).toList();
    }
    data['resourceURI'] = this.resourceURI;
    if (this.urls != null) {
      data['urls'] = this.urls.map((v) => v.toJson()).toList();
    }
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
    if (this.dates != null) {
      data['dates'] = this.dates.map((v) => v.toJson()).toList();
    }
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters.toJson();
    }
    if (this.stories != null) {
      data['stories'] = this.stories.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events.toJson();
    }
    return data;
  }
}

class TextObjects {
  String type;
  String language;
  String text;

  TextObjects({this.type, this.language, this.text});

  TextObjects.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    language = json['language'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['language'] = this.language;
    data['text'] = this.text;
    return data;
  }
}

class Urls {
  String type;
  String url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}

class Series {
  String resourceURI;
  String name;

  Series({this.resourceURI, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    return data;
  }
}

class Dates {
  String type;
  String date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['date'] = this.date;
    return data;
  }
}

class Prices {
  String type;
  double price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    price = json['price'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}

class ImageItems {
  String path;
  String extension;

  ImageItems({this.path, this.extension});

  ImageItems.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}

class Creators {
  int available;
  String collectionURI;
  List<CreatorItems> items;
  int returned;

  Creators({this.available, this.collectionURI, this.items, this.returned});

  Creators.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = new List<CreatorItems>();
      json['items'].forEach((v) {
        items.add(new CreatorItems.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['returned'] = this.returned;
    return data;
  }
}

class CreatorItems {
  String resourceURI;
  String name;
  String role;

  CreatorItems({this.resourceURI, this.name, this.role});

  CreatorItems.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    data['role'] = this.role;
    return data;
  }
}

class Items {
  String resourceURI;
  String name;
  String type;

  Items({this.resourceURI, this.name, this.type});

  Items.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}