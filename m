Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2DB3C44
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 16:11:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X7Tj3Q67zF4sm
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 00:11:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4162a39c11=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Z9Q8ilA/"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cNfUhjAO"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X7S73yPJzF4MD
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 00:10:23 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8GE8X4m018927; Mon, 16 Sep 2019 07:10:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EhfcB/g3haDvhXJs6F70YbY1x3FSclbYwECwEd74V3g=;
 b=Z9Q8ilA/tojykX+/Q4d2R8lLiY2iFFmJwFzkdSz/r5JPpf2MqIhaDFedy+xi+QNErD9x
 YON7XibCTuNr1OCzJU6dwPkOoAUWQFGtKOJ02M/5B3EeuYLMwpucmTJ5t6RX3YP9ua50
 32ZY194yMsD9XVFDEAeDawnv21OkeoPv1Yg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v1fwsmn28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 16 Sep 2019 07:10:15 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Sep 2019 07:10:14 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Sep 2019 07:10:14 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Sep 2019 07:10:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L70p0C69CSsqApkep/8uEJ5XLegVSjsXM9cfhcB8R9jB86KZLjNRt7Onw96BLnLkQHse3QNWq3La7/OuzPL/uYxJGeId2HKSncM0n5KCRA+fei8TCuEEH1VLFJYQTRgf6DQ441eut0LcYmFAhm9EyYNCwY75nZhRKeQDlIO/g7/xxfU7QNcyy1lIU14dt7aIBqR86ajst/TBaoq/c26bMCBY8w0lKdZwveizBem2gun/yuQcbSXIlW99f8Qj/ww/bjopaDtNv5m1QXZtSuUytxGDkDfLe0OMd/N7Vv2wrwrJ81ecYzTECnXbBqH35Srkg5Qln4JPIqORL1KxqiStbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhfcB/g3haDvhXJs6F70YbY1x3FSclbYwECwEd74V3g=;
 b=ekkqXXO9JxRW4HC1vUX0wDHP2oec6OEy2IghWpzopjdgVbD1KYNcrTGeukjMpto+io/F7rA5F0cvlofAfTOTXhj208nsNjpwUrRMv/oTNQv3GOfdLsLhYCx1tCoC/XIa5gVZMu/TS4lUsJoNBv7ZmedTTuagnoE890N9QLty+czuFBhTJXsffkKNvUwj/lgXl/P3Q0tQmWVJD1lcrGUbkQ0bmmkSdZwZjbct65x9HiDlJyjByhspnCIIcBwIIF705vlQQIq1tQjxRAqvfsgNUwHPPLEkgFIQP8pbegH497TTWMMvXpT75YTKV1bUPtYUOQkzVdzfGaU7pfCtiNXcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhfcB/g3haDvhXJs6F70YbY1x3FSclbYwECwEd74V3g=;
 b=cNfUhjAOfhjGqknUWoiSwEEvmheZdrnCWA5iqkSeRfNfmpv4AUMVv0ELT0UsUG+UduzxuZLsbwbHR1ztUbk9sBGy4rcluv3jaJWTVmr9Mrq8uTR+YYcDLjKe2Sjqg6f4SqBjgMBF7rYtsqOf00EMus4cJK2iTFcyE9zuA4yBFyc=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1824.namprd15.prod.outlook.com (10.174.99.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 14:10:13 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 14:10:13 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Current Minimal Binary Size
Thread-Topic: Current Minimal Binary Size
Thread-Index: AQHVbJh05DqIeV2IOE+he3NTEtv9Tg==
Date: Mon, 16 Sep 2019 14:10:12 +0000
Message-ID: <18C166E9-70FB-4C8F-8FC9-CA1156696B03@fb.com>
References: <mailman.651.1568609107.9379.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.651.1568609107.9379.openbmc@lists.ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::ec75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04394818-514a-4ae5-5298-08d73aaf976a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1824; 
x-ms-traffictypediagnostic: MWHPR15MB1824:
x-microsoft-antispam-prvs: <MWHPR15MB1824A6BF125CD4FAE0CD9AC2BD8C0@MWHPR15MB1824.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(186003)(8936002)(6486002)(446003)(2616005)(11346002)(33656002)(102836004)(2351001)(476003)(486006)(86362001)(6506007)(316002)(8676002)(81156014)(81166006)(1730700003)(3480700005)(76176011)(229853002)(25786009)(71190400001)(71200400001)(4326008)(99286004)(2501003)(478600001)(5660300002)(6436002)(5640700003)(6246003)(6512007)(6916009)(6116002)(66446008)(53936002)(36756003)(305945005)(76116006)(7736002)(66556008)(64756008)(66946007)(66476007)(256004)(2906002)(14454004)(46003)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1824;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fY/BHEe/dlgH0S20Wa4VYDJsWsm/dhymzWgdolfMs45R2015Kuj4yOwTna9C6+4EhiartQlh8u6XO+NYOSEGWP1GNDDrZS8B44gZncli0h37rLMEKv30EyyXTEcjkAt/Ub6OaM054YYHaezQs01bPR2AYWNQrrw51a9t10/mwgAJHPzCudpzHd9SDxmsBHFe6eoWm9VBDOo3WtW8Y1yOWIxJAfQaO3zJiMJTgjpnxrPeNXHdurSAtCRT01QbKnnkemLXvUdLVU6q9BUjkNdzQRPadpisEg7Aaem91nrYcg2tCrQ1OQG4oDk38ABPA/Y3/g6IytTxZnElNdYrmg9kVEQmgXIJTnJ7BSrbYj3pXYGJ69s6xqo5uC3zolO7Mo3tGADCIEL1y8Ib98zTGdY2Ofopje40bTBCbJxPmfRc4io=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D64613AF77F1594DA8EBE359A9C22F84@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 04394818-514a-4ae5-5298-08d73aaf976a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 14:10:12.8560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hK+1nYl1tnavGJn7NDBKr3hiI2e+gsMT3+V4WUjTD7UUbMSQlEwvyUz9GcGopvXxupccE9gnahsktZxoOoYiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1824
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-16_06:2019-09-11,2019-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909160148
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiANCj4gT3V0IG9mIGN1cmlvc2l0eSwgaG93IGFyZSB5b3UgZ2VuZXJhdGluZyB0aGVzZSByZXN1
bHRzPyBGb3IgaW5zdGFuY2UgdXNpbmcNCj4gdGhlIFVidW50dSBBUk0gR0NDIGNyb3NzIGNvbXBp
bGVyIEkgaGF2ZSBhIHNtYWxsZXN0IGV4ZWN1dGFibGUgb2YgbGVzcw0KPiB0aGFuIGhhbGYgdGhl
IHNpemUgb2Ygd2hhdCB5b3UgbGlzdCBhYm92ZToNCj4gDQo+ICQgYXJtLWxpbnV4LWdudWVhYmkt
Z2NjIC0tdmVyc2lvbg0KPiBhcm0tbGludXgtZ251ZWFiaS1nY2MgKFVidW50dS9MaW5hcm8gOC4z
LjAtNnVidW50dTEpIDguMy4wDQo+IENvcHlyaWdodCAoQykgMjAxOCBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIEluYy4NCj4gVGhpcyBpcyBmcmVlIHNvZnR3YXJlOyBzZWUgdGhlIHNvdXJjZSBm
b3IgY29weWluZyBjb25kaXRpb25zLiAgVGhlcmUgaXMgTk8NCj4gd2FycmFudHk7IG5vdCBldmVu
IGZvciBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
DQo+IA0KPiAkIGNhdCBlbXB0eS5jDQo+IGludCBtYWluKHZvaWQpDQo+IHsNCj4gICAgICAgIHJl
dHVybiAwOw0KPiB9DQo+ICQgbWFrZSBlbXB0eSBDQz1hcm0tbGludXgtZ251ZWFiaS1nY2MgQ0ZM
QUdTPS1PcyAmJiBhcm0tbGludXgtZ251ZWFiaS1zdHJpcCBlbXB0eSAmJiBscyAtbCBlbXB0eQ0K
PiBhcm0tbGludXgtZ251ZWFiaS1nY2MgLU9zICAtV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251
IC1XbCwtLWFzLW5lZWRlZCAgZW1wdHkuYyAgIC1vIGVtcHR5DQo+IC1yd3hyLXhyLXggMSBhbmRy
ZXcgYW5kcmV3IDU1NDQgU2VwIDE2IDEzOjA4IGVtcHR5DQo+ICQgc2l6ZSBlbXB0eQ0KPiAgIHRl
eHQgICAgZGF0YSAgICAgYnNzICAgICBkZWMgICAgIGhleCBmaWxlbmFtZQ0KPiAgICA3NTkgICAg
IDI3NiAgICAgICA0ICAgIDEwMzkgICAgIDQwZiBlbXB0eQ0KPiANCj4gQWRtaXR0ZWRseSBpdCdz
IG5vdCB0aGUgU0RLIGNyb3NzLWNvbXBpbGVyLCBidXQgc29tZSBtb3JlIGNsYXJpdHkNCj4gb24g
aG93IHlvdSBjYW1lIHRvIHRob3NlIG51bWJlcnMgd291bGQgYmUgaGVscGZ1bC4NCj4gDQo+IEFu
ZHJldw0KPiANCg0KQW5kcmV3LA0KDQpTbyBnbGFkIHlvdSByZXBsaWVkLg0KDQpJ4oCZbSBkb2lu
ZyBhIEJpdGJha2UgYnVpbGQgZm9yIGEgcmVjaXBlIHRoYXQgdXNlcyBDTUFLRToNCg0KYWRkX2V4
ZWN1dGFibGUoIHNpemV0ZXN0LmJpbiBzb3VyY2Uvc2l6ZWJpbi5jcHApDQp0YXJnZXRfY29tcGls
ZV9vcHRpb25zKCBzaXpldGVzdC5iaW4gUFVCTElDIC1PcyAtcykNCg0KSSBkb27igJl0IGtub3cg
aWYgaXQgbWF0dGVycywgYnV0IEnigJltIGNvbXBpbGluZyBpbiBDZW50T1MgNyB3aXRoIHRoZSBP
cGVuQk1DL09wZW5CTUMgdHJlZSBhbmQgbXkgVGVtcGxhdGVDb25mIHNldCB0byBtZXRhLWZhY2Vi
b29rL21ldGEtdGlvZ2FwYXNzLg0KDQphcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpLWdjYyAoR0ND
KSA5LjIuMA0KDQpJIG5lZWQgdG8gcnVuIGFuIGVycmFuZCB0aGlzIG1vcm5pbmcsIGJ1dCB3aWxs
IHJlcGxpY2F0ZSB5b3VyIHByZWNpc2Ugc2VxdWVuY2UgYSBiaXQgbGF0ZXIgdG9kYXkuDQoNCkni
gJltIGFsd2F5cyBvcGVuIHRvIHRoZSBwb3NzaWJpbGl0eSB0aGF0IEnigJltIGRvaW5nIHNvbWV0
aGluZyB3cm9uZyBvciBtaXNzaW5nIHNvbWV0aGluZywgYnV0IGxhc3QgdGltZSBJIGNoZWNrZWQs
IC1PcyBnZW5lcmF0ZXMgdGhlIHNtYWxsZXN0IHBvc3NpYmxlIGNvZGUgYW5kIC1zIHN0cmlwcyBz
eW1ib2xzLg0KDQpXaWxmcmVk
