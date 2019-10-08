Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE2D03F8
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 01:17:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ntY74rrvzDqKw
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 10:17:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5184daeaff=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="BL7SP9NB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gzo6y8mn"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ntWJ53zrzDqKf;
 Wed,  9 Oct 2019 10:15:55 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x98NFDfn021830; Tue, 8 Oct 2019 16:15:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=DZ+bM4uALC7ILHlyWSt2g5tcN/pZLJVYxwe7bOWVrik=;
 b=BL7SP9NB4HqjkrxvXbu4Bx0w0u37xFEokD6FFJtRsr9nSmfmYww1CFthZDnzZfhFoQyj
 Wy4XDjf6Fvd4div8kpiDckKLtFF1Xf5BfyRKVWoG9iX9aCmoy11Sp58TH6WgZHJe3WZo
 E/P1XfV4k9u00mCTgmYmDnUnhQhjTYHJ9A4= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vg6ms8br8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 16:15:26 -0700
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 8 Oct 2019 16:15:24 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 8 Oct 2019 16:15:24 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 8 Oct 2019 16:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTtY31FmBHrVSANcWu//Id7pFTT563P8bHaeyxEAYrTppN6cMH7dLzU+8pnUNY6oQ7plJ/W2MGgleYcVvSILrQ4aRncDaSF77JVNoPAhzIDFrQQ5sPQS1njJg7z4PEyyOg0bjhW0YsdFRatDQYjETD44A2+uJONLDYbdVET/Fu5AMl1M8VYtfHD8Sp7pqX3qkXBlNPv9vsyVkCIl/5o0ORJyMEW1sCSya3hugfLA7d1Fn0AvYtSWueZh/oLPHo4ua7uZ6hXSoT/wexyx7Rwp1qYzWw3rUsK2dqyrWpjbzmspvbsudDns/AffcsywVBiBxdsXab9afdt4QnwM28s3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ+bM4uALC7ILHlyWSt2g5tcN/pZLJVYxwe7bOWVrik=;
 b=kps9jP7f2E46CsFIPYYXqIB2rUdJK1uYL0v2syOthe6oPKDH0yKCV4wptq6INbQow4JvAxcZ4b7rQQ1rr3Hb9O1w06qkZBjUvhE3ibrv2rZuHNcIJTOMHrjEfqtFSt0sL634Ozm2lNaMEwFisKN9lPM2JmM0Lm+GBNf2b5FJ8bWnP1yqXs8GPzPMfwrpNS4suqDqx2Cm2zN1rMjBehuYww66KiGrWhM6nbbsW1dTxv4wn6YMjCWqEl+AWf5q1azZ7TYyN/GKe4cnc3kAgdUW2KP05p0EsrwOOZr29eg8w/UU4PwQY/fSNSce3Ay9BvVdjyzYQtFw6gQum9cN1hbfZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZ+bM4uALC7ILHlyWSt2g5tcN/pZLJVYxwe7bOWVrik=;
 b=gzo6y8mnNy2cyfgfP0WU4WBb4y1qpt09pgXgk7FkKvyPoEVMmuQEaR/WPfIFQr8qpDl14MI3LgCggDmNkVzmxiFWpntc5QSb8pzLBi1x0m7BixMvqP9yxBbXyWGhC6JEi0Zx1Oq/HMNRbcMCJ28r4zUtHsBpGWVKjUc2Gz++BNA=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1870.namprd15.prod.outlook.com (10.174.96.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 8 Oct 2019 23:15:23 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 23:15:23 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfWTbblC7pbX04kW4ywPkkt70vadRTOAAgAAMhYCAAAhTAA==
Date: Tue, 8 Oct 2019 23:15:23 +0000
Message-ID: <bba604eb-4cca-257e-01d7-b2d9471e6455@fb.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <422eea61-7cb9-e471-83fb-3f554ff5e079@fb.com>
 <6f280195-eef7-1fe7-ac42-ad6879ca9838@linux.intel.com>
In-Reply-To: <6f280195-eef7-1fe7-ac42-ad6879ca9838@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR12CA0031.namprd12.prod.outlook.com
 (2603:10b6:301:2::17) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:cba1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e6b6a3b-d26f-42db-f149-08d74c45652c
x-ms-traffictypediagnostic: MWHPR15MB1870:
x-microsoft-antispam-prvs: <MWHPR15MB187081A1147624563C94C146B29A0@MWHPR15MB1870.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(2906002)(8676002)(81166006)(446003)(8936002)(2616005)(6486002)(11346002)(486006)(386003)(81156014)(86362001)(52116002)(99286004)(6512007)(186003)(102836004)(46003)(476003)(6506007)(31696002)(65956001)(65806001)(6116002)(14454004)(5660300002)(229853002)(76176011)(305945005)(7416002)(71200400001)(256004)(53546011)(31686004)(14444005)(7736002)(36756003)(25786009)(478600001)(6246003)(4326008)(316002)(66946007)(71190400001)(58126008)(66446008)(54906003)(110136005)(66556008)(64756008)(66476007)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1870;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7u+mvxooTR4HCoSRzFQoDk6rJDMEpHdsin3rB5gpjDMgISBGM6KhReYfFoe6PmZ9Ok5ZOJFqxZfdojR351L+A1u3MLZMNa+wIjN63dpempe+60pATrnrSD1IVTftLj3JhZXbjFM6kJtPc7nC3CyLb5oCxW0WpmN/06sg7T+ckfiINtuRiLEwlOY0192im46hFFfF1atxTSHkkgPcYi4PaDYePqRs/PRE2Siivh+n0IXE3Y0z4V9YbCj5vuyAtiVhBuzI5HkZHDv3od+GgovHlxVQYMO0SU4VEJFjXYkcqZ63o10Cv3v1a+2N1Ze2ROPUCPGO5puq3GO6q2Y+W/wbNglVyLocOnT3gUxNJqveNcq0xUuUEln4FMUk9ltMy+iHtNpKXFvOSVkaF5diaYIPzVVcOdcJTcfo7x0QNiYo258=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A8F4C9A7BD2AA4FA7A76F6B3D08D904@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6b6a3b-d26f-42db-f149-08d74c45652c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 23:15:23.3281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RGojwddCIZTo0OFI+5BjCXqE8KhAEH2KuQ1Z/Mn1qcxD/TBAS/JPUI7/PjPEL+SC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1870
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_09:2019-10-08,2019-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910080184
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvOC8xOSAzOjQ1IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IEhpIFRhbywNCj4gDQo+
IE9uIDEwLzgvMjAxOSAzOjAwIFBNLCBUYW8gUmVuIHdyb3RlOg0KPj4gT24gMTAvNy8xOSA0OjEz
IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+Pj4gSW4gY2FzZSBvZiBtYXN0ZXIgcGVuZGluZyBz
dGF0ZSwgaXQgc2hvdWxkIG5vdCB0cmlnZ2VyIHRoZSBtYXN0ZXINCj4+PiBjb21tYW5kIGJlY2F1
c2UgdGhpcyBIL1cgaXMgc2hhcmluZyB0aGUgc2FtZSBkYXRhIGJ1ZmZlciBmb3Igc2xhdmUNCj4+
PiBhbmQgbWFzdGVyIG9wZXJhdGlvbnMsIHNvIHRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSB3
aXRoIG1ha2luZw0KPj4+IHRoZSBtYXN0ZXIgY29tbWFuZCB0cmlnZ2VyaW5nIGhhcHBlbiB3aGVu
IHRoZSBzdGF0ZSBnb2VzIHRvIGFjdGl2ZQ0KPj4+IHN0YXRlLg0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPj4+IC0t
LQ0KPj4+IMKgIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMgfCA5ICsrKysrLS0tLQ0K
Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4+PiBpbmRleCBmYTY2OTUxYjA1ZDAuLjQw
ZjZjZjk4ZDMyZSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVl
ZC5jDQo+Pj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPj4+IEBAIC0z
MzYsMTggKzMzNiwxOSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfaTJjX2RvX3N0YXJ0KHN0cnVjdCBh
c3BlZWRfaTJjX2J1cyAqYnVzKQ0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGkyY19tc2cgKm1zZyA9
ICZidXMtPm1zZ3NbYnVzLT5tc2dzX2luZGV4XTsNCj4+PiDCoMKgwqDCoMKgIHU4IHNsYXZlX2Fk
ZHIgPSBpMmNfOGJpdF9hZGRyX2Zyb21fbXNnKG1zZyk7DQo+Pj4gwqAgLcKgwqDCoCBidXMtPm1h
c3Rlcl9zdGF0ZSA9IEFTUEVFRF9JMkNfTUFTVEVSX1NUQVJUOw0KPj4+IC0NCj4+PiDCoCAjaWYg
SVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPj4+IMKgwqDCoMKgwqAgLyoNCj4+PiDCoMKg
wqDCoMKgwqAgKiBJZiBpdCdzIHJlcXVlc3RlZCBpbiB0aGUgbWlkZGxlIG9mIGEgc2xhdmUgc2Vz
c2lvbiwgc2V0IHRoZSBtYXN0ZXINCj4+PiDCoMKgwqDCoMKgwqAgKiBzdGF0ZSB0byAncGVuZGlu
ZycgdGhlbiBIL1cgd2lsbCBjb250aW51ZSBoYW5kbGluZyB0aGlzIG1hc3Rlcg0KPj4+IMKgwqDC
oMKgwqDCoCAqIGNvbW1hbmQgd2hlbiB0aGUgYnVzIGNvbWVzIGJhY2sgdG8gdGhlIGlkbGUgc3Rh
dGUuDQo+Pj4gwqDCoMKgwqDCoMKgICovDQo+Pj4gLcKgwqDCoCBpZiAoYnVzLT5zbGF2ZV9zdGF0
ZSAhPSBBU1BFRURfSTJDX1NMQVZFX0lOQUNUSVZFKQ0KPj4+ICvCoMKgwqAgaWYgKGJ1cy0+c2xh
dmVfc3RhdGUgIT0gQVNQRUVEX0kyQ19TTEFWRV9JTkFDVElWRSkgew0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBidXMtPm1hc3Rlcl9zdGF0ZSA9IEFTUEVFRF9JMkNfTUFTVEVSX1BFTkRJTkc7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+PiArwqDCoMKgIH0NCj4+PiDCoCAjZW5kaWYg
LyogQ09ORklHX0kyQ19TTEFWRSAqLw0KPj4+IMKgICvCoMKgwqAgYnVzLT5tYXN0ZXJfc3RhdGUg
PSBBU1BFRURfSTJDX01BU1RFUl9TVEFSVDsNCj4+PiDCoMKgwqDCoMKgIGJ1cy0+YnVmX2luZGV4
ID0gMDsNCj4+PiDCoCDCoMKgwqDCoMKgIGlmIChtc2ctPmZsYWdzICYgSTJDX01fUkQpIHsNCj4+
PiBAQCAtNDMyLDcgKzQzMyw3IEBAIHN0YXRpYyB1MzIgYXNwZWVkX2kyY19tYXN0ZXJfaXJxKHN0
cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzLCB1MzIgaXJxX3N0YXR1cykNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGJ1cy0+c2xhdmVfc3RhdGUgIT0gQVNQRUVEX0kyQ19TTEFWRV9JTkFDVElW
RSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9ub19jb21wbGV0ZTsN
Cj4+PiDCoCAtwqDCoMKgwqDCoMKgwqAgYnVzLT5tYXN0ZXJfc3RhdGUgPSBBU1BFRURfSTJDX01B
U1RFUl9TVEFSVDsNCj4+PiArwqDCoMKgwqDCoMKgwqAgYXNwZWVkX2kyY19kb19zdGFydChidXMp
Ow0KPj4+IMKgwqDCoMKgwqAgfQ0KPj4NCj4+IFNoYWxsIHdlIG1vdmUgdGhlIHJlc3RhcnQtbWFz
dGVyIGxvZ2ljIGZyb20gbWFzdGVyX2lycSB0byBidXNfaXJxPyBUaGUgcmVhc29uIGJlaW5nOg0K
Pj4gbWFzdGVyIHRyYW5zYWN0aW9uIGNhbm5vdCBiZSByZXN0YXJ0ZWQgd2hlbiBhc3BlZWQtaTJj
IGlzIHJ1bm5pbmcgaW4gc2xhdmUgc3RhdGUgYW5kDQo+PiByZWNlaXZlcyBTVE9QIGludGVycnVw
dCwgYmVjYXVzZSBhc3BlZWRfaTJjX21hc3Rlcl9pcnEgd29uJ3QgYmUgY2FsbGVkIGluIHRoaXMg
Y2FzZS4NCj4gDQo+IEV2ZW4gaW4gdGhhdCBjYXNlLCBtYXN0ZXIgY2FuIGJlIHJlc3RhcnRlZCBw
cm9wZXJseSBiZWNhdXNlIHNsYXZlX2lycQ0KPiB3aWxsIGJlIGNhbGxlZCBmaXJzdCBiZWNhdXNl
IG1hc3RlciBpcyBpbiBNQVNURVJfUEVORElORyBzdGF0ZSwgc28gdGhlDQo+IHNsYXZlX2lycSBo
YW5kbGVzIHRoZSBTVE9QIGludGVycnVwdCBhcyB3ZWxsLCBhbmQgdGhlbiBtYXN0ZXJfaXJxIHdp
bGwNCj4gYmUgY2FsbGVkIHdpdGggU0xBVkVfSU5BQ1RJVkUgc3RhdGUgc28gdGhlIGFzcGVlZF9p
MmNfZG9fc3RhcnQgY2FuIGJlDQo+IGNhbGxlZCBldmVudHVhbGx5Lg0KDQpJIG1lYW4gbWFzdGVy
X2lycSBjYW5ub3QgYmUgY2FsbGVkIHdoZW4gaXJxX3JlbWFpbmluZyBiZWNvbWVzIDAgYWZ0ZXIg
c2xhdmVfaXJxLg0KDQoNCkNoZWVycywNCg0KVGFvDQo=
