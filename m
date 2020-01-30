Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D55F14E2AA
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 19:54:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487qK0532vzDqZq
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 05:54:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=9298bfd363=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=WsGR9Fn6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=jkTDn71b; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487qHy2TdNzDqTT
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 05:53:33 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00UIrHLD020853; Thu, 30 Jan 2020 10:53:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=azmSIlqlPSGgbSXTp1h5UBgwnZplv9iw6PGgW8HOS+8=;
 b=WsGR9Fn6G9LP6nGTL+TM0mgUh+FR0Ee5kYw1LXIEkn/LU+IXoO+u38/EwXvV4CU242uJ
 QNahXF2pdvzvxzjKdrF9FaGeLC4tYg22yX6HiKikwtGr+FJF2x+vz/VGWqef/4pVWjQX
 mpM78+kT1zQrZTEybLWfO3LzllXragKFJjg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xuepgx7e3-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Jan 2020 10:53:28 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Thu, 30 Jan 2020 10:53:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdxMs1ou33tqB4y8MpP1CszyXU/kI0g/QLAWUpvMeYgSnO88GhMQblD28VKPS7Fw1m6iM+B1DMK/6o6vciV5OnFWlyHQe327X9NBdRbVBhqRwYEgAkvbVbQBahbojWEv8TIcgrq+exaIboOAjtF+bc0heAUSZFDZ9GIKTIlTd5hOjMu4tHyTN1CmKKeMxCIXHcvmEgJ9sGAEDYu6YdF0ydQViKU/3HWg46THgGvPhnpUDCEfgtdyIhp4fa9AZhlG/VqQbmS+RC9k3+Gfv9Lwy/nAavIHwr/o8AEwI10bTIDJkB6PsnYE/5synRbL2qP7sCIdar0XXaud7kA3Vpo0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azmSIlqlPSGgbSXTp1h5UBgwnZplv9iw6PGgW8HOS+8=;
 b=OUDEhl7nN4j4Cd4ewu7llNf2/pyRve840aeJe7sQqpwgDKInFxI5HUg6GxLNrAnVbYx6uuRoYgvJlrpexJT+1WvLYB1Pqydv5DlfJbUhZK5i8qP3uRver9sx319RQ3BpYOXDWxMqWHmKNfQddnzHXpxjOSae+eVRyyh1rduz9edwsEAKCbbGHz1nu7aKkrEpkUzSS/56pCC/v7ZlxQkBjFk3WeDypbOQNkVSaEArPALXqhFzq18jNAKq/80gT08utOBF6uP13D4f3OhiZCGe8EuinGeoSRnuogzp5PesTaW/TyX5DeSNhDiew6FEvEX9gA83G268egsQWhrHsDj12A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azmSIlqlPSGgbSXTp1h5UBgwnZplv9iw6PGgW8HOS+8=;
 b=jkTDn71bvFdRyAJazU2HeqfAmI2AfRwH9x8T/n2Jkv4AKn28l16EnX7r96lXu/tVhdAspY0gus+w+UaxHTurwqfIvKY05YlF6bRjPQU7naSmLgIXdi1ZXGZKkpf0lz9zETae0IbyKvy2QuPFwGQ0GTYZKC6mhEL2/fkYAJpGcO8=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1694.namprd15.prod.outlook.com (10.175.141.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.26; Thu, 30 Jan 2020 18:53:19 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 18:53:19 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3ACAAK69gIAABOgA//+HZoCABQhZAP//lXuAgAId0ACAAnzCgIAAARYA
Date: Thu, 30 Jan 2020 18:53:18 +0000
Message-ID: <65B9F3C8-1066-449B-B0AE-928ED1455687@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
 <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
 <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
 <A81FB058-4102-4774-B238-2C5484BCF938@fb.com>
In-Reply-To: <A81FB058-4102-4774-B238-2C5484BCF938@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:c081]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b5d10f9-8edf-4c8c-410d-08d7a5b5ac16
x-ms-traffictypediagnostic: MWHPR15MB1694:
x-microsoft-antispam-prvs: <MWHPR15MB1694055169EC76F24099B07CDD040@MWHPR15MB1694.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(2616005)(186003)(6486002)(53546011)(110136005)(64756008)(6506007)(66446008)(66946007)(6512007)(66556008)(66476007)(71200400001)(76116006)(81156014)(3480700007)(81166006)(7116003)(8676002)(2906002)(33656002)(36756003)(966005)(316002)(5660300002)(478600001)(8936002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1694;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kmyAMSVNH1WLM7uB6EwjKInM8gAt4YZwhnDwv1EKaqdda3P2RGxusc5PBrLouG9MHUfN4DVdgGF9BYdROzJWzwVDydy/k1zUM70XOanNmlMucLMZvAgu0sTbsntzIpjyyCggiWRQc9pbLziuqjbYv6djV/+Jse8cfeILDVktqiA/Pf4xH3sYDyECfDhDqLbZHivbB8TeREfud300E1utE1Rha/7+HPFcOeUH0EOuOHGnE2A2V7akrCNc6iUhZ3EDzEClkzvZsk8ZQb5jdIrOXAXkBrlqWREhNB94mHCusxTd3nybmzGl6xdVT0vNwkYiVPIW6msHRGqu6X8/R6P73IkipFLtH7Vir+SN+TwmMsykuj/F3B7v7EkdRMAJ4eXxUlRM/J7HaVLOjMYn6yj3dZgJ6JYdrpR9kdGEOSSi9MRrsar/91lnacmWvDsTA64X1OPtXxC3LDoeGKxtk7JcU9PsZqlb8Xk7EAiCLV8994O7t38IJNFpxda7kjk7x9YLRWoTlZWCS+G/uo3rxTH2Kg==
x-ms-exchange-antispam-messagedata: u6D5lY0bxbDRT4bbqobbaxdcCdxUSxRVmpM9qyIhg9PAmDGJdlQv8SN83tdeA3TtJgH/G4WlSkmCt8uQflQO/ScAzkwsK6VTE4QG7QGtEOSgVVAWeg0VLA4oE0LMVw4VBpMxrdXZzMvpS9v2rDeb4Z4UnpvuL3PmLBqq7rWJ/j+Zl7MCqZtyACu+7OIJGmqh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B3D01EB0A99744E84E20827CF558C6B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d10f9-8edf-4c8c-410d-08d7a5b5ac16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 18:53:18.8978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ky22IkvaWvPJO21X51MPteKksh7F90uSRFEWF1WefC4JMJ1y/UERudeYMx8l6YB4ZKU2TQDNOuZlt1Yag5EUKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1694
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-30_06:2020-01-30,
 2020-01-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001300128
X-FB-Internal: deliver
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QW5kIGl0IGlzIGluY29uc2lzdGVudCBhcyAyIHRpbWVzIHdvcmtzIG91dCBvZiA1IHRpbWUgbG9v
cCB3aXRoIDMwIHNlY29uZCBkZWxheS4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDEvMzAv
MjAsIDEwOjQ5IEFNLCAiVmlqYXkgS2hlbWthIiA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToN
Cg0KICAgIEhpIEphc29uLA0KICAgIFRoZSBwcm9ibGVtIEkgYW0gc2VlaW5nIGFzIEkgYW0gdW5h
YmxlIHRvIHNlbmQgcmVzZXQgaXBtaSBjb21tYW5kIHRvIE1FIHZpYSBJUE1CIG9uIGkyYyBidXMu
IEkgdHJpZWQgdG8gZ2l2ZSAzMCBzZWNvbmQgZGVsYXkgYWZ0ZXIgcG93ZXIgb2ZmIGFuZCBzZXR0
aW5nIGluIE1FIHJlY292ZXJ5IG1vZGUuIE9uY2UgSSBkbyBmb3JjZSBwb3dlcm9mZiB0aGVuIG9u
bHkgSSBhbSBhYmxlIHRvIHNlbmQgYW55IGNvbW1hbmQgdG8gTUUuIEkgZG9uJ3Qga25vdyB3aGF0
IGlzIHRoZSByZWxhdGlvbiBvZiBwb3dlciB0byBNRSBhY2Nlc3Mgb24gaTJjIGJ1cy4NCiAgICAN
CiAgICBSZWdhcmRzDQogICAgLVZpamF5DQogICAgDQogICAgT24gMS8yOC8yMCwgMTI6NTAgUE0s
ICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToN
CiAgICANCiAgICAgICAgDQogICAgICAgIA0KICAgICAgICBPbiAxLzI3LzIwMjAgMTI6MzEgUE0s
IFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICAgICAgPiANCiAgICAgICAgPiANCiAgICAgICAgPiBP
biAxLzI3LzIwLCAxMDo1MiBBTSwgIkJpbGxzLCBKYXNvbiBNIiA8amFzb24ubS5iaWxsc0BsaW51
eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgICAgICA+IA0KICAgICAgICA+ICAgICAgDQogICAgICAg
ID4gICAgICANCiAgICAgICAgPiAgICAgIE9uIDEvMjQvMjAyMCAyOjAxIFBNLCBWaWpheSBLaGVt
a2Egd3JvdGU6DQogICAgICAgID4gICAgICA+DQogICAgICAgID4gICAgICA+DQogICAgICAgID4g
ICAgICA+IE9uIDEvMjQvMjAsIDE6MTMgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywg
SmFzb24gTSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
ICAgICAgICA+ICAgICAgPg0KICAgICAgICA+ICAgICAgPg0KICAgICAgICA+ICAgICAgPg0KICAg
ICAgICA+ICAgICAgPiAgICAgIE9uIDEvMjQvMjAyMCAxMjo1NSBQTSwgQmlsbHMsIEphc29uIE0g
d3JvdGU6DQogICAgICAgID4gICAgICA+ICAgICAgPg0KICAgICAgICA+ICAgICAgPiAgICAgID4N
CiAgICAgICAgPiAgICAgID4gICAgICA+IE9uIDEvMjQvMjAyMCAxMDoyOSBBTSwgVmlqYXkgS2hl
bWthIHdyb3RlOg0KICAgICAgICA+ICAgICAgPiAgICAgID4+DQogICAgICAgID4gICAgICA+ICAg
ICAgPj4NCiAgICAgICAgPiAgICAgID4gICAgICA+PiBPbiAxLzIzLzIwLCA0OjM2IFBNLCAiQmls
bHMsIEphc29uIE0iIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4NCiAgICAgICAgPiAg
ICAgID4gICAgICA+PiB3cm90ZToNCiAgICAgICAgPiAgICAgID4gICAgICA+Pg0KICAgICAgICA+
ICAgICAgPiAgICAgID4+ICAgICAgT24gMS8yMy8yMDIwIDQ6MTMgUE0sIFZpamF5IEtoZW1rYSB3
cm90ZToNCiAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgID4gSGkgSmFzb24sDQogICAgICAg
ID4gICAgICA+ICAgICAgPj4gICAgICA+DQogICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICA+
IFdlIGhhdmUgYSByZXF1aXJlbWVudCBvZiBwb3dlciBidXR0b24gb3ZlcnJpZGUuIEkgZG9u4oCZ
dCBzZWUNCiAgICAgICAgPiAgICAgID4gICAgICA+PiB4ODYtcG93ZXINCiAgICAgICAgPiAgICAg
ID4gICAgICA+PiAgICAgID4gY29udHJvbCBkb2VzbuKAmXQgc3VwcG9ydCB0aGlzIGN1cnJlbnRs
eS4gRG8geW91IG5lZWQgdGhpcw0KICAgICAgICA+ICAgICAgPiAgICAgID4+IGZlYXR1cmVzIG9y
IGRvDQogICAgICAgID4gICAgICA+ICAgICAgPj4gICAgICA+IHlvdSBoYXZlIGFueSBsb2NhbCBw
YXRjaCBmb3IgdGhpcy4NCiAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgIEhpIFZpamF5LA0K
ICAgICAgICA+ICAgICAgPiAgICAgID4+ICAgICAgcG93ZXIgYnV0dG9uIG92ZXJyaWRlIGlzIHVz
ZWQgZm9yIHRoZSAiRm9yY2UgT2ZmIiBhY3Rpb25zIGluDQogICAgICAgID4gICAgICA+ICAgICAg
Pj4gcG93ZXIgY29udHJvbDoNCiAgICAgICAgPiAgICAgID4gICAgICA+Pg0KICAgICAgICA+ICAg
ICAgPiAgICAgID4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9s
L2Jsb2IvbWFzdGVyL3Bvd2VyLWNvbnRyb2wteDg2L3NyYy9wb3dlcl9jb250cm9sLmNwcCNMNTAu
DQogICAgICAgID4gICAgICA+ICAgICAgPj4NCiAgICAgICAgPiAgICAgID4gICAgICA+Pg0KICAg
ICAgICA+ICAgICAgPiAgICAgID4+IFRoaXMgd2lsbCBub3Qgd29yayBpZiBjdXJyZW50IHN0YXR1
cyBpcyBvZmYuIFRoaXMgc2hvdWxkIGp1c3Qgc2VuZA0KICAgICAgICA+ICAgICAgPiAgICAgID4+
IHB1bHNlIGluIGFueSBzdGF0dXMgb24vb2ZmLg0KICAgICAgICA+ICAgICAgPiAgICAgID4gQ29y
cmVjdC4gIEZvcmNlIE9mZiBpcyBub3QgZG9uZSBpZiB0aGUgY3VycmVudCBzdGF0dXMgaXMgb2Zm
Lg0KICAgICAgICA+ICAgICAgPiAgICAgIERvIHlvdSBoYXZlIG1vcmUgZGV0YWlscyBvbiB0aGUg
cG93ZXIgYnV0dG9uIG92ZXJyaWRlIGJlaGF2aW9yIHRoYXQgeW91DQogICAgICAgID4gICAgICA+
ICAgICAgbmVlZD8NCiAgICAgICAgPiAgICAgID4NCiAgICAgICAgPiAgICAgID4gWWVzLCBUaGlz
IGlzIHJlcXVpcmVkIHRvIGJyaW5nIE1FIGJhY2sgdG8gb3BlcmF0aW9uIG1vZGUgZnJvbSByZWNv
dmVyeS4gSG93IGFyZSB5b3UgaGFuZGxpbmcgTUUgZm9yIEJpb3MgdXBncmFkZS4NCiAgICAgICAg
PiAgICAgIFdoZW4gaW4gcmVjb3ZlcnkgbW9kZSwgdGhlIE1FIHdpbGwgYWNjZXB0IGEgcmVzZXQg
Y29tbWFuZCAoSVBNSSByYXcgMHg2DQogICAgICAgID4gICAgICAweDIpIHRvIHJlc2V0IHRvIG9w
ZXJhdGlvbmFsIG1vZGUuDQogICAgICAgID4gDQogICAgICAgID4gQmlsbCwgSSB0cmllZCB0aGlz
IGFuZCBzZWUgaW5jb25zaXN0ZW50IGJlaGF2aW9yIGZyb20gaG9zdC4gU29tZXRpbWUgaXQgcmVm
dXNlIHRvIHBvd2VyIG9uLiBTbyBQQk8gcmVzb2x2ZXMgdGhpcy4NCiAgICAgICAgSSBjaGVja2Vk
IHdpdGggdGhlIE1FIHRlYW0gYW5kIE1FIHJlc2V0IHRvIG1vdmUgZnJvbSByZWNvdmVyeSBtb2Rl
IHRvIA0KICAgICAgICBvcGVyYXRpb25hbCBtb2RlIHNob3VsZCB3b3JrLiAgWW91IGNhbiBmaWxl
IGEgdGlja2V0IHdpdGggSW50ZWwgc3VwcG9ydCANCiAgICAgICAgdG8gaGVscCByZXNvbHZlIHRo
ZSBpbmNvbnNpc3RlbnQgYmVoYXZpb3IgdGhhdCB5b3Ugc2VlIHdoZW4gZG9pbmcgdGhpcy4NCiAg
ICAgICAgDQogICAgICAgIEluIHRoZSBtZWFudGltZSwgSSB3aWxsIGxvb2sgb3ZlciB5b3VyIHBh
dGNoLg0KICAgICAgICANCiAgICAgICAgVGhhbmtzLA0KICAgICAgICAtSmFzb24NCiAgICAgICAg
DQogICAgICAgID4gICAgICANCiAgICAgICAgPiAgICAgID4NCiAgICAgICAgPiAgICAgID4gICAg
ICA+PiAgICAgID4NCiAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgID4gUmVnYXJkcw0KICAg
ICAgICA+ICAgICAgPiAgICAgID4+ICAgICAgPg0KICAgICAgICA+ICAgICAgPiAgICAgID4+ICAg
ICAgPiAtVmlqYXkNCiAgICAgICAgPiAgICAgID4gICAgICA+PiAgICAgID4NCiAgICAgICAgPiAg
ICAgID4gICAgICA+Pg0KICAgICAgICA+ICAgICAgPg0KICAgICAgICA+ICAgICAgPg0KICAgICAg
ICA+ICAgICAgDQogICAgICAgID4gDQogICAgICAgIA0KICAgIA0KICAgIA0KDQo=
