Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCF6C0BB
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 20:01:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45plSB5VfszDqWZ
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 04:00:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=21012f26b2=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MBdOpFsK"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="hejsgYee"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45plRD5v9QzDqSd
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 04:00:04 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HHxsUC019401; Wed, 17 Jul 2019 10:59:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=dYvLBBv/gWVl7YaNRjXGgbrTB5oplyCwJAyrRRb7hBE=;
 b=MBdOpFsKniZBuObwfIYAlYx1R0fjeqgNtBbNIEbk/4K3GtLDADZurK5lgwwyn47inheY
 pkJS+5MjS/KULblcDbW3ilX8FKV1vJM9M3rUj43LWwY0zqnYoA/xJST6ZncqXo+ycFns
 amMmwbSRlev7xScFLy3LxxejVf+KTK9NdDc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tsnfq3r0g-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 17 Jul 2019 10:59:59 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 10:59:58 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jul 2019 10:59:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwzA9CLE66oZCpbf5Mvc3/cyIpnUW6KNdMHWITMzyQW9BfUFrj00w0az6iN+vN4KdIwk14a35UH5jsCSxMxZ0pGaknQVx3NTNp8j1uFsdBDjaJYYQcuVf8etqR8Uw9QDozstC5DanjzDyRhAw9yI6/lD3+VPEpDOKRhoz82A16aoWa9X9pNiKd2UH3n37A+dipy05EabJ73C9B/EVOS6CcXWZXkPJbnKsdyKbv2XuWQ+MMpXcrAumiW5dujH0p5cE5+EWcV0ME04IPxCtIITMPm2QsJbp476ACtiF1bX7CDI5OuSXyliXGxg7dVI3/3AQpjrEJPEdiGit+aTOL9hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYvLBBv/gWVl7YaNRjXGgbrTB5oplyCwJAyrRRb7hBE=;
 b=KuJFnzPxZRwzTXoXGJehSHc8ubzP1U7xBZo8g25sI1b18OiruwUOXgjflSbQm9uphXGA/HqxF19JTgayWYeMA9Ss7hsD+Ba416neCooX3+83UNZonl9iZIQYRXTwFxqbgg9mAgcoY1dT64fxm8deTIZH/RREghOOGVceN1XCSZcVJEEFk8P4wIXcAISA+S+BI4Ak5IEdNRl87k9QIc+csB6Xl+Z22XX3GxbmLP6NJDLT2++Wx5VChcsZ57sxqNuopqO5GWVeLd2wKBhpRkeXgv6zBUT7l9hCybWRAm/2U2RjFbw6C1+VPCbd5XYICDmWb+Sr3lvf4pBtfM5U2NaCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYvLBBv/gWVl7YaNRjXGgbrTB5oplyCwJAyrRRb7hBE=;
 b=hejsgYeeY8hhGDZ3zrVZ5llpQkvW5zHN8uJkUDozz8VkJnogig1phDG0ZHhUpbjadbUlG7oYhgFW++Y2+csv3kUeRTLRUz7jejsjC0egHNwv4TTLBXInwU4RRif2dcrAmSbvtVINKk3D/+Ar/6BQfosarkTakRCFmQq0FHdGMbM=
Received: from DM5PR15MB1321.namprd15.prod.outlook.com (10.173.211.143) by
 DM5PR15MB1354.namprd15.prod.outlook.com (10.173.220.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 17:59:57 +0000
Received: from DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250]) by DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::1849:40c8:9086:b250%5]) with mapi id 15.20.2073.015; Wed, 17 Jul 2019
 17:59:57 +0000
From: Ben Wei <benwei@fb.com>
To: Joel Stanley <joel@jms.id.au>, Sam Mendoza-Jonas <sam@mendozajonas.com>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: RE: Out-of-band NIC management
Thread-Topic: Out-of-band NIC management
Thread-Index: AdU8H8pBvdsVlvP/RSqN9qCJJOBAZQALW1UAAB6kdrA=
Date: Wed, 17 Jul 2019 17:59:56 +0000
Message-ID: <DM5PR15MB1321495F72F3045CA719498AA3C90@DM5PR15MB1321.namprd15.prod.outlook.com>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
In-Reply-To: <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2c07]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c43d9c7-ffd0-4ce0-1257-08d70ae09427
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR15MB1354; 
x-ms-traffictypediagnostic: DM5PR15MB1354:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR15MB1354DDACA47ABB0EC5F11E87A3C90@DM5PR15MB1354.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(53754006)(25786009)(99286004)(86362001)(478600001)(446003)(71190400001)(71200400001)(9686003)(2906002)(6306002)(46003)(6246003)(55016002)(4326008)(11346002)(110136005)(53936002)(7736002)(5660300002)(33656002)(19627235002)(316002)(305945005)(52536014)(486006)(8676002)(76116006)(966005)(256004)(3480700005)(81166006)(476003)(64756008)(6506007)(66556008)(66446008)(66476007)(81156014)(66946007)(8936002)(186003)(6436002)(102836004)(6116002)(7696005)(14454004)(76176011)(68736007)(74316002)(229853002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1354;
 H:DM5PR15MB1321.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zVw6L737hvpOmKLroICh+7fIIvHmlaFcRICeGNeTR0QwhF7+RH7jf6hI8uzy6BFf7qwbrEYQgjFLh//oInTFM+xr2axj4V/XRVAbq/Bn17VZwJAGzmL2ay9WNgi+XP2qyCBk6+FOUMH0OKSaBUUD9MtYOHpV6cqDofssLfr10cfGPBXy2k+wAUbKI7L8hrt4atFq3WtHEqYZIDZcR5g2OrteQkNH2Hb1NnuZz62CjL5N50HMaNsqnY7zyM6cbSE88ldf96XmoovJgeXF+sBMZqo1xnJEauA0shc0Gb+NdTf7bnXoEHFpsNvO8Ue6U1e8/zOKXNCcK/FyvYOvzuhcc+Wz/bEkrHTvW3FKu6R5+57EjrtvYKwTBBLscguaU/bvqMgKQrO1+eKuYyGCDmM2d3O7Rq77uci8hUwY/3UKQp0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c43d9c7-ffd0-4ce0-1257-08d70ae09427
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 17:59:56.9444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: benwei@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1354
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170206
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiBUdWUsIDE2IEp1bCAyMDE5IGF0IDIxOjQ2LCBCZW4gV2VpIDxiZW53ZWlAZmIuY29tPiB3
cm90ZToNCj4gPg0KPiA+IEhpIGFsbCwNCj4gPg0KPiA+IFdvdWxkIGFueW9uZSBiZSBpbnRlcmVz
dGVkIGluIGNvbGxhYm9yYXRpbmcgb24gb3V0LW9mLWJhbmQgTklDIG1hbmFnZW1lbnQgYW5kIG1v
bml0b3Jpbmc/DQo+ID4NCj4gPiBETVRGIGhhcyBhcyBhIE5DU0kgc3BlYyAoaHR0cHM6Ly91cmxk
ZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX193d3cuZG10Zi5vcmdfc2l0
ZXNfZGVmYXVsdF9maWxlc19zdGFuZGFyZHNfZG9jdW1lbnRzX0RTUDAyMjItPiA1RjEuMS4wLnBk
ZiZkPUR3SUJhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj1VMzVJYVEtN1Rud2pzN3FfRndm
X2JRJm09bFhTcThLWW1ONl81X18wczY0dWxJTXdINWJ3cUpRak0yZC1JcUhMN2tjdyZzPUwtPiBj
M1hFRXM3Y3JNSHBLc2NxRWRIWUtNOGZSUjJ4SE05TmtRZGZvaEFjVSZlPSApLCB0aGF0IGRlZmlu
ZXMgYSBzdGFuZGFyZCBpbnRlcmZhY2UgZm9yIEJNQ3MgdG8gbWFuYWdlIE5JQ3MuDQo+ID4gQW5k
IGluIGtlcm5lbCA1LnggLCBOQy1TSSBkcml2ZXIgc3VwcG9ydHMgTmV0bGluayBpbnRlcmZhY2Ug
Zm9yIGNvbW11bmljYXRpbmcgd2l0aCB1c2Vyc3BhY2UgcHJvY2Vzc2VzLg0KPiA+DQo+ID4gSSdt
IHRoaW5raW5nIGFkZGluZyB0aGUgZm9sbG93aW5nIHRvb2xzIHRvIE9wZW5CTUMgYXMgYSBzdGFy
dGluZyBwb2ludCBhbmQgYnVpbGQgZm9ybSB0aGVyZToNCj4gPg0KPiA+ICAgICAgIDEuIEEgY29t
bWFuZCBsaW5lIHV0aWxpdHkgKGUuZy4gbmNzaS11dGlsKSB0byBzZW5kIHJhdyBOQy1TSSBjb21t
YW5kcywgdXNlZnVsIGZvciBkZWJ1Z2dpbmcgYW5kIGluaXRpYWwgTklDIGJyaW5nIHVwLA0KPiA+
ICAgICAgIEZvciBleGFtcGxlOg0KPiA+ICAgICAgICAgICBuY3NpLXV0aWwgLWV0aDAgLWNoIDAg
PHJhdyBOQy1TSSBjb21tYW5kPg0KPg0KPiBUaGUgTkNTSSBrZXJuZWwgbWFpbnRhaW5lciwgU2Ft
LCBoYXMgd3JpdHRlbiBhIHRvb2wgdGhhdCBmaXRzIHRoaXMgZGVzY2lycHRpb246DQo+DQo+ICBo
dHRwczovL2dpdGh1Yi5jb20vc2FtbWovbmNzaS1uZXRsaW5rDQoNClRoYW5rcywgdGhpcyBpcyBl
eGFjdGx5IHdoYXQgSSB3YXMgbG9va2luZyBmb3IhDQpPbmUgcXVlc3Rpb24gb24gdGhpcywgZG8g
eW91IHBsYW4gYWRkIHNvbWUgY29tbWFuZC1zcGVjaWZpYyBwYXJzaW5nLiAgRXNwZWNpYWxseSBm
b3IgY29tbWFuZHMgbGlrZSBnZXQgdmVyc2lvbiBJRCwgIGNhcGFiaWxpdHkgJiBwYXJhbWV0ZXJz
LCBhbmQgdmFyaW91cyBzdGF0aXN0aWNzLiBJIHRoaW5rIHRoZXNlIGFyZSBlc3BlY2lhbGx5IHVz
ZWZ1bCBmb3IgaW5pdGlhbCBOSUMgYnJpbmcgdXAgYW5kIGRlYnVnZ2luZy4NCg0KUmVnYXJkcywN
Ci1CZW4NCg==
