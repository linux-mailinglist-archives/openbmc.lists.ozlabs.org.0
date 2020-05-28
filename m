Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8851E6C66
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:21:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Xzcl4kQpzDqYC
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 06:21:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3417d689fb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=iKFyzwYa; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=adyIl/at; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xzbh4w5VzDqY1
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 06:20:46 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04SK4n6C014593; Thu, 28 May 2020 13:20:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=IoR9+LSa4lTw3MgqogDPmiKlxjh3mYbE/Dj/UEuBTp4=;
 b=iKFyzwYa6AeppWCFMUFuhgUyrWkUTIDJz4bHqtPlzm77TrzchhP8EigLFHRgsHOkuZWo
 gH8mglFFd4NjkmfVfmZzpGPYwDXL+AkLtgKmSdXjKz/R/XU8yQWK5gWP3XobtUrN+vXN
 +VhVTIOs27DpTchFu7F1WDCapn8D68qEN+s= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 319tb06x60-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 May 2020 13:20:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 28 May 2020 13:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDUulY5Td0gByBzTZ/sZhiWvr7BkQZaYiMzG9DHBWkJ/hrAEwU+DRqMjeQmDKOdPUJZ8YDFF53ItAi+jwOy7FoYPITBoAW0xw7lQbx5ko8kOWUwJDvxKxAOUV3VBsSL96SwGohMGy/kZMsPGbE9H7VK8hXjefTyfPPh+wRxIM1ZgBsX6VmtVax9zkGFmKbnIxwhL9J1utZBFG8MNDYZhB1uwLcmlvM7SInhm++z4c0pkHK0UzuIy+sKx71D9V07A1nC4x6Tz/d4nnooxKXofLfuWaFMvO1VhomIDYBch37htRyD6owUAXiLpcsxvzGpj0HeVCNuqXxDkyhaLocG6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoR9+LSa4lTw3MgqogDPmiKlxjh3mYbE/Dj/UEuBTp4=;
 b=U9EsEOFVpMgNDmv8qtvj2e6W2Nk7Fw5GYVqrHTXj/8q9KJxwhLbvvoWD9Y2YPikGp4dIwh64V9oiJqeN8YCDFsLmBBncja0P2bYlnHWtRXLq7Bg5JkxptqcLkxVo9s/a6qXn0bOIWZEXR58ixlb904sc5QqICxTv+uFKRvC9k9gHiipvslHSnR5hxEQhu6/pdGmdhEp8cqiBzIV25TkQ+w3v3dPmaiEVT7X7osnQhfLQBANkkIVHdW8LA5xsbEQlC+HtLVGSspJvnX9LMN9RfU/FoynpyNroq4G3fumaNzaZgBPnTr6NGIejV1ZtFS6lhTGr7g1tVgnM/xWD3PpqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoR9+LSa4lTw3MgqogDPmiKlxjh3mYbE/Dj/UEuBTp4=;
 b=adyIl/atuldmBtUQrKgO3S9Qrn30d9fbZsE/nM2M0jVWDCiWnngqFPy2Fl+aaIhaB5l3rgUyAGIl1VMyeEWKs/AzWCLpCLexG8R9fDF4mFUpBhneL1IEclpeeGPUznC21Y3Is2V91KPWca3tag5ZGEgS6L0jYjawnUkjhwxAt78=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2696.namprd15.prod.outlook.com (2603:10b6:a03:156::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 28 May
 2020 20:20:36 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 20:20:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Geissler
 <geissonator@gmail.com>
Subject: Re: article on data in OpenBMC
Thread-Topic: article on data in OpenBMC
Thread-Index: AQHWMHpXfXuP/xMHpk2jzZ6JVDfZn6i6i2+A//+wDoCAAz6vgIAACmmA
Date: Thu, 28 May 2020 20:20:36 +0000
Message-ID: <2DC71440-1CC4-474C-9F00-BD4DC787E993@fb.com>
References: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
 <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
 <A969F89F-44AE-443A-BA7A-A58653C1424E@fb.com>
 <cb4000fd3899df7f74daa5bc71c3213b611a272e.camel@fuzziesquirrel.com>
In-Reply-To: <cb4000fd3899df7f74daa5bc71c3213b611a272e.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:f1d7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4a856a1-6060-483b-f4bb-08d803449516
x-ms-traffictypediagnostic: BYAPR15MB2696:
x-microsoft-antispam-prvs: <BYAPR15MB26965999758A148757DF359BDD8E0@BYAPR15MB2696.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kg5e+DUAOoU7Ko8LnxvEnuSzD8PpPARge6AYxMHQf1sZu49JarHlACW4hXIcCxeHxBxxUoZFMbIs1+6rcqIXHiYdGjmbYgxb2yJ/YZy8wYjrzoknAwgGYous/3iSNjke/MSDQNUWBosop5oA22UAYWbpJxWxmdG/kLMo3odmNbxmQyOQBElDX0VaI5J4SqSi4kUZXdPDgQKmLMEGckQwR8f1q+SehszIKCJMGVn+dlR5A4+lppKJB034Vn62GwH43Qt+iraPewm6rnj2q/cBjyyoVvBocz1320lKwjRxB9aGWuwqoF1Al4hjtVMgJ9OUohGjW+5Cp1i5Ti8P0jdthg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(136003)(39860400002)(366004)(396003)(8936002)(6506007)(36756003)(66946007)(4326008)(6512007)(8676002)(478600001)(86362001)(33656002)(316002)(5660300002)(186003)(64756008)(66556008)(66446008)(66476007)(2906002)(110136005)(76116006)(2616005)(6486002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lwkaxgCWRVztEMwZIRVhh2Ntsc4rwmvsb1BHJwnbHIGJwDGx/uiTWoxGYTnm6CfhN1r7za5tVbFzxk3+8la6rT1wZe1K/DbKnAo5RuhW/nDkjbV44fT6z6cwmL1XIYqRluE+FxmWUQwxL7vkZdcLtT6Fwf1//iCiEk9l/YLAWCL9QHQ155PTKP9N/PjEZayjn7FJ/SMZYyjrgTqArp+lD5F9stR3sqVJaH5wzBkxjfxzo0MyOEXR6c9zQNnBGKAjWCvN4FDPbcWG3qRSDLSmd+UOSy4LcB/aSqE2qYGaKOgEAy+4JTGOIpSdRpSJ2Xg4ZoUj2sJH+1uO+L1JxM0RXnwBoLndyyqjO7XEOSVJwUbpfJt2DpDCjwS1sLqgp5zI6kNdvV+sE6vXmmx+AT4NhHvo5KTWh1BNWQ31Y/hlO4gax+RQebACpjfUPJzpocoXYkksV8uvkV6R7ZqDNvr9gihH/IC2ZGRjbCjqv9AtAF6TshGHuaPFuZXLxvNs371Lxou4qnBoHTo/xepgwhfrZw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <22DA693B1F6BD449B9EC0712C10BBB21@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a856a1-6060-483b-f4bb-08d803449516
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 20:20:36.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DevXcPzhH/bFddMZBUMS+JfLxlecmKMotsdnF6P9SzZ0TUbMo9if4N7dlYmtbISJpOoLyPK+UonP8nqwVSreMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2696
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_07:2020-05-28,
 2020-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 mlxlogscore=999 cotscore=-2147483648 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280132
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDUvMjgvMjAsIDU6NDMgQU0sICJCcmFkIEJpc2hvcCIgPGJyYWRsZXliQGZ1enpp
ZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIDIwMjAtMDUtMjYgYXQgMTg6MTAg
KzAwMDAsIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IA0KICAgID4gT24gNS8yNi8yMCwgODo1
NyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEFuZHJldyBHZWlzc2xlciIgPA0KICAgID4gb3Bl
bmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFs
ZiBvZiANCiAgICA+IGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+
ICAgDQogICAgPiAgICAgTm90IHN1cmUgaWYgdGhpcyBkb2MgaXMgdGhlIGJlc3QgcGxhY2UgYnV0
IEnigJlkIGxpa2UgdG8gc2VlIGEgYmVzdA0KICAgID4gcHJhY3RpY2VzIG9uDQogICAgPiAgICAg
ZmlsZSBmb3JtYXQgKGkuZS4gdXNlIC5qc29uKSBhbmQgcnVudGltZSBjb25maWcgZmlsZSBsb2Nh
dGlvbnMNCiAgICA+IChpLj9lLj8gL2V0Yy8gL3ZhciB0eXBlIA0KICAgID4gICAgIGRlY2lzaW9u
cykuIEFsc28sIHRoZSByZWNvbW1lbmRhdGlvbiB0byBtYWtlIHlvdXIgZGF0YSBydW50aW1lDQog
ICAgPiBjb25maWcNCiAgICA+ICAgICB2cy4gYnVpbGQgdGltZSBjb25maWcgd2hlbiBwb3NzaWJs
ZSAodG8gbWFrZSBsaXZlIGRlYnVnL3Rlc3QNCiAgICA+IGVhc2llcikuDQogICAgPiANCiAgICA+
IEkgYWdyZWUgd2l0aCBBbmRyZXcgaGVyZS4gQXMgbm90IGFsbCBkYXRhIGFyZSB1bmRlciAvZXRj
LCBzb21lIG9mDQogICAgPiBydW50aW1lIGRhdGEgYXJlDQogICAgPiB1bmRlciAvdmFyIGFzIHdl
bGwNCiAgICANCiAgICBJIGRvIHdhbnQgdG8gbWFrZSBhIGRpc3RpbmN0aW9uIGJldHdlZW4gZGF0
YSB0aGF0IGRlc2NyaWJlcyB0aGUNCiAgICBwcm9wZXJ0aWVzIG9mIHRoZSBzeXN0ZW0gKGUuZy4g
dGhpbmdzIHlvdSdkIGZpbmQgaW4gYSBzY2hlbWF0aWMpIHZzIGRhdGENCiAgICBnZW5lcmF0ZWQg
YnkgYXBwbGljYXRpb25zLiAgTXkgaW50ZW5kZWQgYXVkaWVuY2Ugd2FzIHRoZSBwZW9wbGUNCiAg
ICBnZW5lcmF0aW5nIHRoZSBmb3JtZXIuICBBbnkgaWRlYXMgb24gd2hhdCBhbiBvdXRsaW5lIHRo
YXQgbWFpbnRhaW5zIHRoYXQNCiAgICBkaXN0aW5jdGlvbiBhbmQgaW5jbHVkZXMgYXBwbGljYXRp
b24gZ2VuZXJhdGVkIGRhdGEgd291bGQgbG9vayBsaWtlPw0KICAgIA0KICAgID4gIHNvIGl0IHdv
dWxkIG5pY2UgdG8gaGF2ZSBzb21lIHBvbGljeSBkZWZpbmVkIHdoYXQgdHlwZSBjYW4gZ28NCiAg
ICA+IHdoZXJlLg0KICAgIA0KICAgIFllYWgsIHRoaXMgaXMgZGVmaW5pdGVseSBzb21ldGhpbmcg
SSd2ZSBiZWVuIHdhbnRpbmcgdG8gY292ZXIuICBBbnkNCiAgICBpZGVhcyBvbiBob3cgdG8gbWFr
ZSB0aGlzIGVhc3kgZm9yIHNvbWVvbmUgdG8gZG8/ICBGb3IgZXhhbXBsZSB3ZSBoYXZlDQogICAg
dGhlIGFudGktcGF0dGVybnMgZG9jdW1lbnQgd2l0aCBhIHRlbXBsYXRlIC0gaWYgd2UgaGF2ZSBh
IHNpbWlsYXIgYmVzdC0NCiAgICBwcmFjdGljZXMgZG9jdW1lbnQgd2l0aCBhIHRlbXBsYXRlIHdv
dWxkIHRoYXQgaGVscD8gIEknbSBub3Qgc28gc3VyZQ0KICAgIGJlY2F1c2UgdGhlIGFudGktcGF0
dGVybnMgZG9jdW1lbnQgaGFzbid0IGdvdHRlbiBtdWNoIHRyYWN0aW9uDQogICAgdW5mb3J0dW5h
dGVseS4uLg0KV2UgY2FuIGhhdmUgYSBzZXBhcmF0ZSBkb2N1bWVudCBvciBzZWN0aW9uIGluIGEg
ZG9jdW1lbnQgd2hpY2ggd2lsbCB0YWxrDQphYm91dCBydW50aW1lIGNvbmZpZ3VyYXRpb24gZGF0
YSB0eXBlIGFuZCBpdHMgdGFyZ2V0ZWQgbG9jYXRpb24uIEluZmFjdCB3ZSANCmNhbiBoYXZlIGEg
cHJlZGVmaW5lZCB2YXJpYWJsZSBmb3IgdGhlc2UgbGlrZSAkc3lzdGVtZGlyLiBBbmQgbWVzb24g
d2lsbCBoYXZlDQpkZWZpbml0aW9uIG9mIHRoZXNlIGRhdGEgaW5wdXQuIFdlIGNhbiBhbHNvIGdp
dmUgZXhhbXBsZSBvZiBtZXNvbiBmaWxlIGFzIGhvdw0KaXQgd2lsbCBiZSBpbmNsdWRlZCBmb3Ig
YW55IHByb2plY3QuDQogICAgDQoNCg==
