import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NotoficationRecord extends FirestoreRecord {
  NotoficationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "postid" field.
  DocumentReference? _postid;
  DocumentReference? get postid => _postid;
  bool hasPostid() => _postid != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as DocumentReference?;
    _postid = snapshotData['postid'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notofication');

  static Stream<NotoficationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotoficationRecord.fromSnapshot(s));

  static Future<NotoficationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotoficationRecord.fromSnapshot(s));

  static NotoficationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotoficationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotoficationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotoficationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotoficationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotoficationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotoficationRecordData({
  DocumentReference? userid,
  DocumentReference? postid,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'postid': postid,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotoficationRecordDocumentEquality
    implements Equality<NotoficationRecord> {
  const NotoficationRecordDocumentEquality();

  @override
  bool equals(NotoficationRecord? e1, NotoficationRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.postid == e2?.postid &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(NotoficationRecord? e) =>
      const ListEquality().hash([e?.userid, e?.postid, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is NotoficationRecord;
}
