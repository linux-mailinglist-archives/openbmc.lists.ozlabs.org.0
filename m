Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C691EB9A5
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:23:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740GF5DcvzF6Gs
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:23:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0204e3cd19=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4725Rf6YtVzDrcG
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 07:09:58 +1100 (AEDT)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9SK6oqp026051; Mon, 28 Oct 2019 20:09:50 GMT
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 2vx331jedp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Oct 2019 20:09:50 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id 7348667;
 Mon, 28 Oct 2019 20:09:49 +0000 (UTC)
Received: from G9W8667.americas.hpqcorp.net (16.220.49.26) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 28 Oct 2019 20:09:32 +0000
Received: from G4W10204.americas.hpqcorp.net (2002:10cf:5210::10cf:5210) by
 G9W8667.americas.hpqcorp.net (2002:10dc:311a::10dc:311a) with Microsoft SMTP
 Server (TLS) id 15.0.1367.3; Mon, 28 Oct 2019 20:09:31 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.241.52.12) by
 G4W10204.americas.hpqcorp.net (16.207.82.16) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Mon, 28 Oct 2019 20:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc8W75myvzslvxNG29Zibuo89F8/2frJ4EaRDgdhkaPOGit6u70gpIkR0z9RaIDhEtVZsaT0Hdjo8NFTRgPyABLg3KNwzUa0JvVdjqQwr79IKuvnsYvw1n5XlJaSO5/bM8Fz0dtwF/+xRTEP22mVyPMEj2MHxHpRwhxkBwa8TjpDSbqEO3ULV9i2S2/wdQ1I34UQXErUJI4qnWlnavMA9cjxVUrOiTsxtf1FhYKTm4h7d0QXUrJ33cMUC8lff9FrAjRisG4k11QXQGgQEliXJ7rMoDtwDGr8t8YpsXytiyNWQrsv2l2iJhZ7nNCDkkeC8ijtSmgXuN6xFY0XCwTTzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZJ6q2nGMt6FNRuVbwEHYj1i2XwkYz5iyHsvm3Rtb+E=;
 b=eI5lHWEZTr+nlKMzbds7DWz1qyArFRKpEJHIlbWBjSHT7ztaSdIr7hpckBVv39BBF2XKGNVeDoq4ywYFLntO+mbnD1QzpMQnNkBv0DB/9qOHuC/HnDujMZGCadW4eVl1uoSE5K+kxpCVE/7imLNtH3uoSSYAxUAXdYRitUlBPy4WGO6pVunEAvrXe7m51D7aWECXBeWRk625KngW8OT//KGDxNwuDUpGRw7rKbTSD5pgOAcfObenXz4UEEbfXREUpEDi8HRQmcFJt/5Mtnf6wwK2fkQhSjtAs1Bjrjv7Acb8BtVDH4UQn5jn01mOeQIC3Ug9r4JQMDbuSuuDWgWSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.136) by
 DF4PR8401MB0682.NAMPRD84.PROD.OUTLOOK.COM (10.169.85.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Mon, 28 Oct 2019 20:09:29 +0000
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a]) by DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a%6]) with mapi id 15.20.2387.021; Mon, 28 Oct 2019
 20:09:29 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: "Khetan, Sharad" <sharad.khetan@intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: RE: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Topic: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Index: AdWKAHHvH4cEuoZBQpKgd9B6kReChADmUqaAAAXlMYAABmS9kA==
Date: Mon, 28 Oct 2019 20:09:29 +0000
Message-ID: <DF4PR8401MB1084205825D43ADCB95F1289D8660@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB10841D9A4AB2C85B587D477FD86A0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
 <D5DFCF5B-2691-4308-BB27-4E3A185EF674@fuzziesquirrel.com>
 <865C376D1B77624AAA570EFEF73CE52F9E04512A@fmsmsx118.amr.corp.intel.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E04512A@fmsmsx118.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:8003:793e:b800:f1c3:927e:9771:aeee]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03c72070-39f5-4acc-f50a-08d75be2bdb3
x-ms-traffictypediagnostic: DF4PR8401MB0682:
x-microsoft-antispam-prvs: <DF4PR8401MB068293FA05D952A70AB40A45D8660@DF4PR8401MB0682.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(396003)(136003)(346002)(376002)(13464003)(189003)(199004)(52536014)(7696005)(2906002)(14454004)(110136005)(86362001)(99286004)(9686003)(229853002)(55016002)(33656002)(66476007)(76116006)(6116002)(66946007)(66556008)(66446008)(64756008)(74316002)(305945005)(25786009)(7736002)(5660300002)(6246003)(4326008)(8936002)(316002)(71200400001)(71190400001)(76176011)(102836004)(256004)(53546011)(46003)(6506007)(186003)(486006)(446003)(11346002)(476003)(81156014)(8676002)(478600001)(6436002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB0682;
 H:DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dn1QYyLxzh857/j8mi2YSpSpusb2dnNcr84QXWKYgwVxK+yboxHqNEfleyRCdRA/9zwyR6MceO2YypiBuP8pGoaOA/zVhps+DB0S4d6CcPWLKgstifC87fPtbtLoaTWDv9nSVaI+ONxS8zs4lPCXckadm+ulPF2jrxM/HWiu8EsjcQovYDO3Y/qnnls48TXWgKlL6fei0nuSg0DPP0fWSotbNSlc6rBeeNdXBg6BBO74MYx46JjtavM8hn2U0nzzwk3UPYWY6Mqe2S9TZmaxSx7H99wiB4wYIQaRT16Bs1TuXVOLltxTWW235FHij3Df4VLQtsSQtuL3IfR5/xQF6RD4gGdABs/Jv3yHKTNeDJTxYppGrEQs7XBb/rYPSIdiLN6LRK9zqFDgB9d8k7sx492oX+9gVPhlRIEhdv9J/G1NKUl/WlGHG/e6Iq6uTW47
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c72070-39f5-4acc-f50a-08d75be2bdb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 20:09:29.7959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmML+OyMaEzpaOu52bTYON+J/02gknqj+3Ajng7vX9gpuhAwYlkv/VTywagQFvmynEe1+3b184H8W83yJp9iLfozag/cBwdfqqxM4sA2sg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0682
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-28_07:2019-10-28,2019-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=988 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 malwarescore=0 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910280190
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:21:55 +1100
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIEJyYWQuDQoNClRoYXQgaXMgYW4gaW50ZXJlc3RpbmcgdGFsZS4gIEkgbG92ZSB0aGUg
aGlzdG9yeSBsZXNzb24uDQoNCkNoZWVycywNCk1hdHQuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogS2hldGFuLCBTaGFyYWQgPHNoYXJhZC5raGV0YW5AaW50ZWwuY29t
Pg0KPiBTZW50OiBUdWVzZGF5LCAyOSBPY3RvYmVyIDIwMTkgMzowMSBBTQ0KPiBUbzogQnJhZCBC
aXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT47IE11Z2dlcmlkZ2UsIE1hdHQNCj4g
PG1hdHQubXVnZ2VyaWRnZTJAaHBlLmNvbT4NCj4gQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDogUkU6IEN1cmlvc2l0eTogV2h5IGlzIHRo
ZSBPcGVuQk1DIGxheWVyIG5hbWVkICJwaG9zcGhvciINCj4gDQo+IFZlcnkgaW50ZXJlc3Rpbmcu
IEkgaGF2ZSB3b25kZXJlZCBhYm91dCBub21lbmNsYXR1cmUgYnV0IGRpZG7igJl0IGtub3cgdGhl
DQo+IHJvb3RzIHdlcmUgZmlzaHkg8J+Yii4NCj4gLVNoYXJhZA0KPiANCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyA8b3BlbmJtYy0NCj4gYm91bmNlcytzaGFy
YWQua2hldGFuPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgQnJhZA0K
PiBCaXNob3ANCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDE5IDc6MTMgQU0NCj4gVG86
IE11Z2dlcmlkZ2UsIE1hdHQgPG1hdHQubXVnZ2VyaWRnZTJAaHBlLmNvbT4NCj4gQ2M6IE9wZW5C
TUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDogUmU6IEN1
cmlvc2l0eTogV2h5IGlzIHRoZSBPcGVuQk1DIGxheWVyIG5hbWVkICJwaG9zcGhvciINCj4gDQo+
IA0KPiANCj4gPiBPbiBPY3QgMjMsIDIwMTksIGF0IDg6MjEgUE0sIE11Z2dlcmlkZ2UsIE1hdHQN
Cj4gPG1hdHQubXVnZ2VyaWRnZTJAaHBlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBJIHNlZSDigJxw
aG9zcGhvcuKAnSBzaG93cyB1cCBhbGwgb3ZlciB0aGUgcGxhY2UgaW4gb3BlbmJtYy4gIEUuZy4g
bWV0YS0NCj4gcGhvc3Bob3IgaXMgdGhlIE9wZW5CTUMgbGF5ZXIuDQo+ID4NCj4gPiBJcyBwaG9z
cGhvciBhIHByb2plY3QgbmFtZSB0aGF0IHdpbGwgZXZvbHZlIHdpdGggT3BlbkJNQyBnZW5lcmF0
aW9ucyBvcg0KPiBpcyBpdCBmb3JldmVyIHN0YXRpYz8NCj4gDQo+IEF0IHRoZSBtb21lbnQgaXQg
aXMgc3RhdGljIGJ1dCB0aGF0IGlzbuKAmXQgYW55IGtpbmQgb2YgaGFyZCBhbmQgZmFzdCBydWxl
LiAgSXQgaXMNCj4gdHlwaWNhbGx5IHVzZWQgdG8gZGlzdGluZ3Vpc2ggYSBkZWZhdWx0IG9yIHJl
ZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBidXQgdGhhdA0KPiBkZWZpbml0aW9uIGFuZCBpdHMgdXNh
Z2UgaXMgY2VydGFpbmx5IGZ1enp5Lg0KPiANCj4gVGhlIGZpcnN0IHBsYXRmb3JtIHN1cHBvcnRl
ZCBieSB0aGlzIHByb2plY3QgYmFjayBpbiAyMDE1IHdhcyB0aGUgYmFycmVsZXllDQo+IHN5c3Rl
bS4gIEJhcnJlbGV5ZSBpcyBhIGtpbmQgb2YgZmlzaCAtIGl0IGhhcyBhIHBob3NwaG9yZXNjZW50
IGdsb3c7IG1ldGEtDQo+IHBob3NwaG9yIGlzIGEgbm9kIHRvIHRob3NlIHJvb3RzIG9mIHRoZSBw
cm9qZWN0Lg0KPiANCj4gdGh4IC0gYnJhZA0K
