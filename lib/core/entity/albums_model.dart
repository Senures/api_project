class AlbumsResponse {
  List<Albums>? albums;

  AlbumsResponse({this.albums});

  AlbumsResponse.fromJson(Map<String, dynamic> json) {
    if (json['albums'] != null) {
      albums = <Albums>[];
      json['albums'].forEach((v) {
        albums!.add(new Albums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Albums {
  String? albumType;
  List<Artists>? artists;
  List<Copyrights>? copyrights;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;

  String? href;
  String? id;
  List<Images>? images;
  String? label;
  String? name;
  int? popularity;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  Tracks? tracks;
  String? type;
  String? uri;

  Albums(
      {this.albumType,
      this.artists,
      this.copyrights,
      this.externalIds,
      this.externalUrls,
      this.href,
      this.id,
      this.images,
      this.label,
      this.name,
      this.popularity,
      this.releaseDate,
      this.releaseDatePrecision,
      this.totalTracks,
      this.tracks,
      this.type,
      this.uri});

  Albums.fromJson(Map<String, dynamic> json) {
    albumType = json['album_type'];
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    if (json['copyrights'] != null) {
      copyrights = <Copyrights>[];
      json['copyrights'].forEach((v) {
        copyrights!.add(new Copyrights.fromJson(v));
      });
    }
    externalIds = json['external_ids'] != null
        ? new ExternalIds.fromJson(json['external_ids'])
        : null;
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;

    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    label = json['label'];
    name = json['name'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    totalTracks = json['total_tracks'];
    tracks =
        json['tracks'] != null ? new Tracks.fromJson(json['tracks']) : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_type'] = this.albumType;
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    if (this.copyrights != null) {
      data['copyrights'] = this.copyrights!.map((v) => v.toJson()).toList();
    }
    if (this.externalIds != null) {
      data['external_ids'] = this.externalIds!.toJson();
    }
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }

    data['href'] = this.href;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['label'] = this.label;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    data['total_tracks'] = this.totalTracks;
    if (this.tracks != null) {
      data['tracks'] = this.tracks!.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists(
      {this.externalUrls, this.href, this.id, this.name, this.type, this.uri});

  Artists.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class Copyrights {
  String? text;
  String? type;

  Copyrights({this.text, this.type});

  Copyrights.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['type'] = this.type;
    return data;
  }
}

class ExternalIds {
  String? upc;

  ExternalIds({this.upc});

  ExternalIds.fromJson(Map<String, dynamic> json) {
    upc = json['upc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upc'] = this.upc;
    return data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class Tracks {
  String? href;
  List<AlbumItems>? items;
  int? limit;
  Null? next;
  int? offset;
  Null? previous;
  int? total;

  Tracks(
      {this.href,
      this.items,
      this.limit,
      this.next,
      this.offset,
      this.previous,
      this.total});

  Tracks.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    if (json['items'] != null) {
      items = <AlbumItems>[];
      json['items'].forEach((v) {
        items!.add(AlbumItems.fromJson(v));
      });
    }
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['next'] = this.next;
    data['offset'] = this.offset;
    data['previous'] = this.previous;
    data['total'] = this.total;
    return data;
  }
}

class AlbumItems {
  List<Artists>? artists;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;
  LinkedFrom? linkedFrom;

  AlbumItems(
      {this.artists,
      this.discNumber,
      this.durationMs,
      this.explicit,
      this.externalUrls,
      this.href,
      this.id,
      this.isLocal,
      this.isPlayable,
      this.name,
      this.previewUrl,
      this.trackNumber,
      this.type,
      this.uri,
      this.linkedFrom});

  AlbumItems.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = <Artists>[];
      json['artists'].forEach((v) {
        artists!.add(new Artists.fromJson(v));
      });
    }
    discNumber = json['disc_number'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    isLocal = json['is_local'];
    isPlayable = json['is_playable'];
    name = json['name'];
    previewUrl = json['preview_url'];
    trackNumber = json['track_number'];
    type = json['type'];
    uri = json['uri'];
    linkedFrom = json['linked_from'] != null
        ? new LinkedFrom.fromJson(json['linked_from'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists!.map((v) => v.toJson()).toList();
    }
    data['disc_number'] = this.discNumber;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['is_local'] = this.isLocal;
    data['is_playable'] = this.isPlayable;
    data['name'] = this.name;
    data['preview_url'] = this.previewUrl;
    data['track_number'] = this.trackNumber;
    data['type'] = this.type;
    data['uri'] = this.uri;
    if (this.linkedFrom != null) {
      data['linked_from'] = this.linkedFrom!.toJson();
    }
    return data;
  }
}

class LinkedFrom {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  LinkedFrom({this.externalUrls, this.href, this.id, this.type, this.uri});

  LinkedFrom.fromJson(Map<String, dynamic> json) {
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    id = json['id'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['id'] = this.id;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}
