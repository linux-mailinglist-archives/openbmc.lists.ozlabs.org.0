Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D17258425
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgQCr5Ky6zDqWM
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:41:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.243.42;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.cy.kao@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-na.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=hgYlb8Rv; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgBTj5XRdzDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:52:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcni7xrc42qur8P0WMPtod5qlZrrMvH52IeV70b4GNFbyO2c4lShDZBeDMgNIx+4DEFWjFWmC2NGuC87kYXn1+wsYuAFWHEmRT4i7BCJkLkrhOkEualZGpt+3k7HhzSMT2aQnQ1saYSw9JgpgSqzh0dJaNpp3fpzkdmybdgvlZ71vsaZooDlwva8MxdEXTHsJmu5LX9PxnRVZ5v1SNQcmSwyDLBjOO1XJy02O7G4ZPv4s2kkLGHeFVLhqB77MV0kzDdihVhSkTSSDd5/KJdjoiuycdV9Io81gzN7DeqiiXBYrYy6VPLUEfIKkJUxO0uAuznOSAN+YqX8hhb4tN/ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/IRIaoIKsUXwWPOckUbtjrEDhqsRKptQFGgQYDijhE=;
 b=cH8gsqbAWH+IjwJW4TJ5NpS1vvKdiPTV3m6DXmBxYqJX5R98c7zlLWs5PUxEojPOyrZkxr4Z4U/lugJVFOG/ouWV87FKVPoB4eXO6Oezl4a5eyMu2m9oCtFdMgG9jCaa6N+OKlbrwmvKjjvoPBkLBM6xdE4mHc2s5xWCyY/3PLA/2S2o6yWcK6fmYBcd2PnPRFiBZOOZdDxqtevvgXlMLlphdZtVy3EI8mKXSCrjcyKYe6ZitltR7Psh9smcASh7rUzkzIgMBfv6FdqICBe6wJtWlllKghkLbI0gVjbF2dj5aogI2LrBW4tuQcQtI+8yYpCFekkCuo/dPHOrJFsN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/IRIaoIKsUXwWPOckUbtjrEDhqsRKptQFGgQYDijhE=;
 b=hgYlb8RvnqAClcZ4TxtzDVYvCVvNxSRukAN+iqMmEoH+tqmOywAf+g95q6p9B3He0o5mN11MjIYfJEAdxzZKCqYroDDE9EnFkThmqBhhQKGTQ35ntIbQZq5G4IWDKvV2ShwM8v9AeCklK1dev+f/z/Zhyht+p9Mx64wTUVzYJm9/Z48RY+cM1KyYOoYr35Dwe6ZRjgzHohlePrKJzK9gK2aae+eOAK8roRuuM6CWDbVy9FTpNYYnD/1KFo8We5y7ND50cOpZu3Vpnq2u8TuVmKkgxjCjTk+OjK+mYodpX/qsfM2QmBvLI+GROC0AXQbiiVmXkFP7HQiwNy/EvueW1Q==
Received: from BN6PR08MB2770.namprd08.prod.outlook.com (2603:10b6:404:132::15)
 by BN7PR08MB4100.namprd08.prod.outlook.com (2603:10b6:406:88::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Mon, 31 Aug
 2020 13:52:16 +0000
Received: from BN6PR08MB2770.namprd08.prod.outlook.com
 ([fe80::f179:98ac:4480:35aa]) by BN6PR08MB2770.namprd08.prod.outlook.com
 ([fe80::f179:98ac:4480:35aa%8]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:52:16 +0000
From: Lancelot Kao <lancelot.cy.kao@fii-na.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: New meta-layer request
Thread-Topic: New meta-layer request
Thread-Index: AQHWf53v3euz4gEjPEybsOOWZAcTYA==
Date: Mon, 31 Aug 2020 13:52:16 +0000
Message-ID: <FA2BA7DD-2DD5-4CCD-927B-310AB5B56C64@fii-na.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-na.com;
x-originating-ip: [65.205.114.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c579137-fecd-4a8c-5242-08d84db51236
x-ms-traffictypediagnostic: BN7PR08MB4100:
x-microsoft-antispam-prvs: <BN7PR08MB4100E3D602124B3A3F77C3AA9C510@BN7PR08MB4100.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qv5msehEq4uQ/sr41SB/T+Mc1jXDYXelmHmnrS9ANTNzdKxHd/wQy1MDhW9KzYQ/e7UH534D9IBKLakR2Oh5/CyfrzbtNPQPgPYCEtuAMJt91wMDQDAlr9/faojsUbEtayErKxXGiyqqjGUMi6hrNCWNEompj2paOGOC2C9MOHx2VqOBw1JS+1KHMje/3FyB8d+QXFBIi7XS/VHK6ZDrPw/L15QMAxlnTAntTdrw6c/x8Kyc0dZg8R1RTOSgA8iiV33nurqe1cEltweOuSryKrUPBp1gHaerYEHlg1nQ/mWXFvM9i+smRLAjz5bGVLl6yTYNLPoC+9V9S3shDEa1Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR08MB2770.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(346002)(376002)(39850400004)(91956017)(36756003)(4744005)(6486002)(2906002)(86362001)(26005)(6512007)(316002)(478600001)(71200400001)(186003)(5660300002)(6916009)(66946007)(64756008)(66476007)(76116006)(3480700007)(2616005)(6506007)(66556008)(66446008)(8936002)(8676002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: emrZsph/jwLmW6eI65Yozla9YgkKRZfU1T8uaTT926GuUz8NQ9eRvwLQqIdtiO/S2eUAX25t3JPGdGzIW8PrJWRBpKQmQPuB1VCnaG8voZpwae9kabSmdi+Dk4ILewLZICR3xM+vkAHdr22ZQokr5BGPGmS4KY88qfnrKeGt+Ywx7Fc7HkrKnig39O3k7uQyYWugbaY07AaH0XzJCaTvnF1Hn+LlsaaL6RqgYn1153PrI8CsncIHRIqMImSh0AXU2kYheCwosNu4qZGOhGHNQkEOjLcVHn33T2xKwBkhVk7Xqu7vaRnleZLFbRHdTIkhc9tgq8UzHpKOUJX3NkxeC5esqaMAZUCmGX62/Tr2KaAFRMrZJeHbsQhkSIByp+3ia7nGYW6W46Z3uyvb9Uq3V8iJsSkmLADbciMEfBRAmv9F5JIKhF5J9/HgLVkmtsGVL8c0BNZ86XzlYpqgIKcyysHT3oMWBs/RnD2iembS5v9TRuCOmeq7FgQswMXfriZIiA5V7NZbuxO2v3uAuo1u43nwq4uhDuSiX1s2Qg3SkR/F6nLIla/tuiINfK5zrsiOKE/WlFIE03JwFMXpqCZYaC9k65M3cLj5r/fac+pyCY6c6704Z/VYHTDagAhMZuulCgAhxj4dO6Fb90XSNhnmHQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_FA2BA7DD2DD54CCD927B310AB5B56C64fiinacom_"
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR08MB2770.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c579137-fecd-4a8c-5242-08d84db51236
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 13:52:16.1105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /iRrIlsjeDAUIvTCZc3XZERCQMC3lja/UBuJ5alFTAWkTEeKaQ9VzFNV/D0i0hrMH+ycvfn/vGp3hWvDB3r8FwU56pRCGyT9c5rbmT5YDG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4100
X-Mailman-Approved-At: Tue, 01 Sep 2020 08:40:29 +1000
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

--_000_FA2BA7DD2DD54CCD927B310AB5B56C64fiinacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFBpb25lZXINCiAgICAgICAgICAgICAgICBJIGNvbWUgZnJvbSBGaWkgY3JvcHMgYXMgYSBz
dWJncm91cCBvZiBGb3hjb25uLiBXZSBhcmUgdXNpbmcgdGhlIG9wZW5CTUMgdG8gZGV2ZWxvcCBv
dXIgb3BlbkJNQyB3aXRoIHRoZSBBbXBlcmUgJiBOdXZvdG9uIHNvbHV0aW9uLg0KICAgICAgICAg
ICAgICAgIFNvLCB3ZSBuZWVkIHRvIGNyZWF0ZSBhIG5ldyBtZXRhLWxheWVyIGZvciB1cy4gSSBh
bSB0b2xkIHRoZXJlIGlzIHNvbWVvbmUgd2hvIG1heSBoZWxwIHVzIHRvIGNyZWF0ZSB0aGUgbWV0
YS1sYXllciBmb3IgdXMuIFRoZSBiZWxvdyBpcyB0aGUgaW5mb3JtYXRpb24gbmVlZHMgdG8gY3Jl
YXRlIG1ldGEtbGF5ZXIuDQogICAgICAgICAgICAgICAgTmFtZSA6IG1ldGEtZmlpDQogICAgICAg
ICAgICAgICAgTWFpbnRhaW5lcnMgOg0KTGFuY2Vsb3Qua2FvQGZpaS11c2EuY29tPG1haWx0bzpM
YW5jZWxvdC5rYW9AZmlpLXVzYS5jb20+DQpOZWlsLmNoZW5AZmlpLXVzYS5jb208bWFpbHRvOk5l
aWwuY2hlbkBmaWktdXNhLmNvbT4NCnZ2ZWVyYWNoQGdvb2dsZS5jb208bWFpbHRvOnZ2ZWVyYWNo
QGdvb2dsZS5jb20+DQpiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbTxtYWlsdG86YmVuamFtaW5mYWly
QGdvb2dsZS5jb20+DQoNCiAgICAgICAgICAgICAgICBJZiBJIG1pc3MgYW55dGhpbmcsIHBsZWFz
ZSBsZXQgbWUga25vdy4NCg0KLS0NCkJlc3QgUmVnYXJkcy4NCg0KTGFuY2Vsb3QgS2FvDQoNCkNB
QkcvQ0VTQkcNClRXIDogKzg4Ni0yLTIyNjgtMzQ2NiAjMzc2Ng0KVVMgOiArMS0yODEtNjU1LTI2
NjgNCmUtbWFpbCA6IGxhbmNlbG90LmN5Lmthb0BmaWktbmEuY29tDQoNCg0K

--_000_FA2BA7DD2DD54CCD927B310AB5B56C64fiinacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <AC0D12A3DC292944A6F00936E6529614@namprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpQTWluZ0xpVTsNCglwYW5vc2UtMToyIDIgNSAwIDAgMCAwIDAgMCAw
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6
MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBQTWluZ0xpVSI7DQoJcGFub3NlLTE6MiAxIDYgMSAwIDEgMSAxIDEgMTt9DQpAZm9u
dC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJoZWx2ZXRpY2EgbmV1ZSI7DQoJcGFub3NlLTE6MiAwIDUg
MyAwIDAgMCAyIDAgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxp
Lk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6ZToxMS4w
cHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1z
b0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0
ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHls
ZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2Vy
aWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlw
ZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFn
ZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo2MTIuMHB0IDc5Mi4wcHQ7DQoJbWFyZ2luOjcyLjBwdCA3
Mi4wcHQgNzIuMHB0IDcyLjBwdDt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rp
b24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJlbi1UVyIgbGluaz0iIzA1
NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5IaSwgPC9zcGFuPjxzcGFuIGxhbmc9
IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtoZWx2ZXRp
Y2EgbmV1ZSZxdW90Oztjb2xvcjpibGFjaztiYWNrZ3JvdW5kOndoaXRlIj5QPC9zcGFuPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O2hlbHZldGljYSBuZXVl
JnF1b3Q7O2NvbG9yOmJsYWNrO2JhY2tncm91bmQ6d2hpdGUiPmlvbmVlcjwvc3Bhbj48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj4mbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSSBjb21lIGZyb20gRmlpIGNyb3BzIGFzIGEgc3Vi
Z3JvdXAgb2YgRm94Y29ubi4gV2UgYXJlIHVzaW5nIHRoZSBvcGVuQk1DIHRvIGRldmVsb3Agb3Vy
IG9wZW5CTUMgd2l0aCB0aGUgQW1wZXJlICZhbXA7IE51dm90b24gc29sdXRpb24uPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBTbywgd2UgbmVlZCB0byBjcmVhdGUgYSBu
ZXcgbWV0YS1sYXllciBmb3IgdXMuIEkgYW0gdG9sZCB0aGVyZSBpcyBzb21lb25lIHdobyBtYXkg
aGVscCB1cyB0byBjcmVhdGUgdGhlIG1ldGEtbGF5ZXIgZm9yIHVzLiBUaGUgYmVsb3cgaXMgdGhl
IGluZm9ybWF0aW9uIG5lZWRzIHRvIGNyZWF0ZSBtZXRhLWxheWVyLjxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj4mbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgTmFtZSA6IG1ldGEtZmlpPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBNYWludGFpbmVycyA6PG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjEwOC4wcHQiPjxhIGhy
ZWY9Im1haWx0bzpMYW5jZWxvdC5rYW9AZmlpLXVzYS5jb20iPjxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90Oztjb2xvcjojMDAwMDY0Ij5MYW5jZWxvdC5rYW9A
ZmlpLXVzYS5jb208L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3Vy
aWVyIE5ldyZxdW90Oztjb2xvcjpibGFjayI+PGJyPg0KPC9zcGFuPjxhIGhyZWY9Im1haWx0bzpO
ZWlsLmNoZW5AZmlpLXVzYS5jb20iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3Vy
aWVyIE5ldyZxdW90Oztjb2xvcjojMDAwMDY0Ij5OZWlsLmNoZW5AZmlpLXVzYS5jb208L3NwYW4+
PC9hPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90Oztjb2xv
cjpibGFjayI+PGJyPg0KPC9zcGFuPjxhIGhyZWY9Im1haWx0bzp2dmVlcmFjaEBnb29nbGUuY29t
Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q291cmllciBOZXcmcXVvdDs7Y29sb3I6
IzAwMDA2NCI+dnZlZXJhY2hAZ29vZ2xlLmNvbTwvc3Bhbj48L2E+PHNwYW4gc3R5bGU9ImZvbnQt
ZmFtaWx5OiZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7O2NvbG9yOmJsYWNrIj48YnI+DQo8L3NwYW4+
PGEgaHJlZj0ibWFpbHRvOmJlbmphbWluZmFpckBnb29nbGUuY29tIj48c3BhbiBzdHlsZT0iZm9u
dC1mYW1pbHk6JnF1b3Q7Q291cmllciBOZXcmcXVvdDs7Y29sb3I6IzAwMDA2NCI+YmVuamFtaW5m
YWlyQGdvb2dsZS5jb208L3NwYW4+PC9hPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxz
cGFuIGxhbmc9IkVOLVVTIj5JZiBJIG1pc3MgYW55dGhpbmcsIHBsZWFzZSBsZXQgbWUga25vdy4N
CjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPi0tPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4t
VVMiPkJlc3QgUmVnYXJkcy48YnI+DQo8YnI+DQpMYW5jZWxvdCBLYW88YnI+DQo8YnI+DQpDQUJH
L0NFU0JHPGJyPg0KVFcgOiArODg2LTItMjI2OC0zNDY2ICMzNzY2IDxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5VUyA6ICsxLTI4
MS02NTUtMjY2ODxicj4NCmUtbWFpbCA6IGxhbmNlbG90LmN5Lmthb0BmaWktbmEuY29tPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMi
PiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_FA2BA7DD2DD54CCD927B310AB5B56C64fiinacom_--
