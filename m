Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D640B5DDDE
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 08:00:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dr7k277qzDqS4
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 16:00:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.76.104; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="HMN1fTGR"; dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760104.outbound.protection.outlook.com [40.107.76.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dr7333v7zDqP1
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 16:00:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQDUN2JowaMkpBpcpkX8mNLQcQfOGnCAJ3EH/PngKQoOEzbjPSRc5yFrR7c0lw81S/vaommeO9RFN5cI57StU6BfI50sTJrwXBEyzY/d26zpYBEo6qDFvGHnzzoN41RCUO+kanCiz9jZPtd6PtAa4H3tBFEDpfnCa8VdqT2iOvRTFqtR7Adeh+nuGMJPhWePasr3vPq1PSyFypJmQ8+Pi8Njbjb3iYB8RYqYQKaY9nqA7Rb5sOx3+g3vfGtfNbXBT8P5eXj9CQwzBKq06Drm5YRZ7E2EvlewfGmrmWbC8LWCzG7Xs/1mrNq95lwT/R0wCEBhadPuetwcnfrqAtgntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciwoRQGQFLccUZzGgqzN05Mxsdt/jrjTq/67WGnysk=;
 b=beZCZFBwG6/k+i60jBDJlr1Z8sbA+mOQhowTxE4aLFRXZwFjAMkDLcCxpaIrNkOcal0yp/6Imar/EHSpndkBpJadzliwg9z8DkAdvMphyGZ/zmWB+//Y8tP4wtlygCMzHFIzR23VZhULyFyz8oyOM13YkIgulHP1xpaRbkp6zqeIwIjy/8O+elXkhRKyMNL6q81pgtFpLeSxyJYHjchoJxxpVtDhs+cKTcAnI1EV0Hh3CtKf5nirQPR6krkO0yMsHGLoS8ag8B7ZSwOTUewlxQZOWRxqVIAKkImmlh8SFo25R9B9/gVO/60TwIbl79v2fvlRH88cbp3wmyR+UHn+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microsoft.com;dmarc=pass action=none
 header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciwoRQGQFLccUZzGgqzN05Mxsdt/jrjTq/67WGnysk=;
 b=HMN1fTGRtakrAt36HAL+9ERlNEvY4TlR9/F32OKK9MNwFFo8T93BzKTy3Z+mMjeaQ0XGDu5Utej61ig7+HWvn7CIb5uIiQyDKbWWHkVfpHxaUMB1Mmke9ntu+nwcAAtpB+tnNSPIJRliQ5YqUHHBCd2G9QUng5m0sQzsvA87h5Y=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1222.namprd21.prod.outlook.com (20.179.57.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.1; Wed, 3 Jul 2019 06:00:08 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4%2]) with mapi id 15.20.2073.004; Wed, 3 Jul 2019
 06:00:08 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Lei YU <mine260309@gmail.com>, Patrick Venture <venture@google.com>
Subject: RE: Future features of phosphor-ipmi-flash
Thread-Topic: Future features of phosphor-ipmi-flash
Thread-Index: AQHVMUxWrKCyCpn5n0aUZTmA/ilzO6a4OUEAgAArsPA=
Date: Wed, 3 Jul 2019 06:00:07 +0000
Message-ID: <BYAPR21MB11918D32FD1F25D6616FE591C8FB0@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <CAO=notzxbMtyjvW5Efo-Pp3c1-hZz93aFwPvQiumsp_fj2nuzw@mail.gmail.com>
 <CAARXrtknLpC0Ke+_Y7uCsL222kMPvXcj6E-qct5ppmwrzvCn4w@mail.gmail.com>
In-Reply-To: <CAARXrtknLpC0Ke+_Y7uCsL222kMPvXcj6E-qct5ppmwrzvCn4w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-03T06:00:04.7476095Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=9da8a273-c3c0-4475-9a1a-86881cc2c97f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d16b6f8c-095b-4833-6749-08d6ff7bb3c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1222; 
x-ms-traffictypediagnostic: BYAPR21MB1222:
x-microsoft-antispam-prvs: <BYAPR21MB1222D8839171DDB4793993F1C8FB0@BYAPR21MB1222.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(13464003)(189003)(199004)(68736007)(2906002)(81166006)(66556008)(64756008)(5660300002)(33656002)(66066001)(81156014)(74316002)(66476007)(478600001)(52536014)(8676002)(7736002)(66946007)(66446008)(8936002)(305945005)(22452003)(446003)(86362001)(316002)(7696005)(10290500003)(71190400001)(25786009)(53936002)(55016002)(6436002)(9686003)(99286004)(26005)(110136005)(14454004)(71200400001)(8990500004)(256004)(4326008)(73956011)(76116006)(3846002)(229853002)(14444005)(5024004)(53546011)(6506007)(6246003)(486006)(476003)(11346002)(54906003)(186003)(102836004)(6116002)(10090500001)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1222;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /PcOfDoSkA79+OWNWLV0AQe8qUfgLDBm+WEvKLa1e7Bmha3F8UgwHEjFxfmce2HrBETSA+in6ywNmDAmOKm1RWfRmrU8u/iQPAYExFI31m7ORLDbmeIqt86az4MCfaLP9OARcTkqzKdS4JOR566BOzwdME5osKu2J7QZ28ih1RR3EZzVj7EGQeQGNneaUYAj6w9FG7xu3mKvQhBsOZBu6ptCe0MAmS5Yt97x2+ScB3cFA6UJ+c8seBM7xRfW+XptVUkjq52D8nRH7CopfAUIDV65R5XsjlKM1dAlaiw+dx2cEjCXdXZdkz7nI33M2CYAoY8C4Zhk484fBisYsYKA2ZhiwF24o+xIX1gbsG5v9ap06eXxlPhIoDeFpjBP0WoopICb4UOjPk8GgrEuzZXekcoLOeApZlrb9lhoFdWyog0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16b6f8c-095b-4833-6749-08d6ff7bb3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 06:00:07.7094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1222
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhpcyBpcyBncmVhdC4gSW4gdGhpcyBjYXNlLCB3ZSBzaG91bGQgYmUgYWJsZSB0byBtYWtlIHVz
ZSBvZiB0aGlzIGRlc2lnbiBmb3IgYWxsIEJNQyBtYW5hZ2VkIGNvbXBvbmVudHMgKCBGUEdBLCBD
UExEIGFuZCBQU1UgRlcpIGJ5IHByb3ZpZGluZyB2ZXJpZmljYXRpb24gc2VydmljZSwgYW5kIGFu
IHVwZGF0ZSBzZXJ2aWNlLiBCYXNpY2FsbHkgVEZUUCB0aGUgaW1hZ2UgYW5kIHRoZW4gY2FsbCB0
aGUgZGJ1cyBtZXRob2RzDQoNCkhvdyBkbyB3ZSBzcGVjaWZ5IGlmIHdlIHdhbnQgdG8gdXBkYXRl
IG9ubHkga2VybmVsIG9yIHJvZnMgb3Igcndmcz8gDQoNCk5lZXJhag0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1taWNy
b3NvZnQuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBMZWkgWVUNClNlbnQ6IFR1
ZXNkYXksIEp1bHkgMiwgMjAxOSA4OjE4IFBNDQpUbzogUGF0cmljayBWZW50dXJlIDx2ZW50dXJl
QGdvb2dsZS5jb20+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnPjsgQWRyaWFuYSBLb2J5bGFrIDxhbm9vQHVzLmlibS5jb20+DQpTdWJqZWN0OiBSZTogRnV0
dXJlIGZlYXR1cmVzIG9mIHBob3NwaG9yLWlwbWktZmxhc2gNCg0KT24gV2VkLCBKdWwgMywgMjAx
OSBhdCAxMTowNiBBTSBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6
DQo+DQo+IFVwbG9hZGluZyB0aGUgQklPcyB2aWEgcGhvc3Bob3ItaXBtaS1mbGFzaCBpcyBhdmFp
bGFibGUgZm9yIHJldmlldywgDQo+IGJ1dCBpdCdzIG5vdCB0aWVkIGludG8gYW5vdGhlciBkYWVt
b24uICBPbmUgbXVzdCBwcm92aWRlIGEgDQo+IHZlcmlmaWNhdGlvbiBzZXJ2aWNlLCBhbmQgYW4g
dXBkYXRlIHNlcnZpY2UuDQo+DQo+IEknZCBsaWtlIHRvIHByb3ZpZGUgdGhlIG9wdGlvbiB0byBs
ZXZlcmFnZSBwaG9zcGhvci1ibWMtY29kZS1tZ210LiAgSXQgDQo+IGxvb2tzIGxpa2UgaW4gdGhp
cyBjb2RlYmFzZSB0aGVyZSBpcyBhIG5vdGlvbiBvZiBhIHNpZ25lZCBpbWFnZSwgYnV0IA0KPiB0
aGUgc2lnbmF0dXJlIGlzIGF0dGFjaGVkLiAgSXQgYWxzbyBsb29rcyBsaWtlLCB0aGVyZSdzIHNv
bWUgdmVyc2lvbiANCj4gaW5mb3JtYXRpb24gdGhhdCdzIG1lYW50IHRvIHBhcnNhYmxlIGFuZCBp
bnZvbHZlZC4gIEkgaGF2ZW4ndCBoYWQgYSANCj4gY2hhbmNlIHRvIHBsYXkgd2l0aCBpdC4NCj4N
Cj4gV2l0aCBwaG9zcGhvci1pcG1pLWZsYXNoIHRoZSBoYXNoIGZpbGUgcG9ydGlvbiBpcyBvcHRp
b25hbC4gIEJlY2F1c2UgDQo+IHBob3NwaG9yLWlwbWktZmxhc2ggZG9lc24ndCBkZWZpbmUgYW55
dGhpbmcgYmV5b25kIHRoZSBzZXF1ZW5jZSBvZiANCj4gY2FsbHMsIG9uZSBjb3VsZCB1c2UgYnVy
bl9teV9ibWMgYW5kIHNlbmQgdGhlIGhhc2ggZG93biBzZXBhcmF0ZWx5IGFuZCANCj4gdGhlbiB0
aGUgdmVyaWZpY2F0aW9uIHRhcmdldCBjb3VsZCB0cmlnZ2VyIHNvbWV0aGluZyB0aGF0IGNvbmNh
dGVuYXRlcyANCj4gYW5kIHRyaWdnZXJzIHRoZSBibWMgY29kZSBtZ210IHNpZ25hdHVyZSBjaGVj
ay4NCj4NCj4gSXQgc2hvdWxkIGJlIHNvbWV3aGF0IHN0cmFpZ2h0Zm9yd2FyZCB0byB0aWUgdGhl
IHR3byBjb2RlYmFzZXMgDQo+IHRvZ2V0aGVyIChhcyBhbiBvcHRpb25hbCB1c2FnZSkuDQo+DQo+
IElmIHNvbWVvbmUgaGFzIGV4cGVyaWVuY2Ugd2l0aCBwcm9ncmFtbWluZyBhZ2FpbnN0IA0KPiBw
aG9zcGhvci1ibWMtY29kZS1tZ210IGFuZCB3YW50cyB0byBoZWxwIHdpdGggdGhpcyBvciBhdCBs
ZWFzdCBwb2ludCANCj4gbWUgYXQgd2hhdCBJIG5lZWQgdG8ga25vdywgSSdkIGJlIG1vcmUgdGhh
biBoYXBweS4NCj4NCj4gRnJvbSByZWFkaW5nIHRoZSBkb2NzIHdpdGggdGhlIGRidXMgaW50ZXJm
YWNlIGRlZmluaXRpb25zLCBJIHRoaW5rIEkgDQo+IGhhdmUgdGhlIGdlbmVyYWwgaWRlYSAtLSBk
cm9wIHRoZSBmaWxlIGludG8gdGhlIHBsYWNlIGl0IGV4cGVjdHMgdGhlIA0KPiBmaWxlIChhIGNv
bmZpZ3VyYXRpb24gb3B0aW9uKSBhbmQgdGhlbiBjYWxsIHRoZSBkYnVzIG1ldGhvZHMuDQoNCkV4
YWN0bHksIHRoZSB3aG9sZSBwcm9jZXNzIG9mIEJNQyBjb2RlIHVwZGF0ZSBpczoNCjEuIFB1dCBh
IHRhcmJhbGwgaW4gL3RtcC9pbWFnZXMvICh2aWEgUkVTVCBBUEksIFRGVFAsIG9yIHNjcCkgMi4g
QW4gb2JqZWN0IHdpbGwgYmUgZ2VuZXJhdGVkIG9uIERCdXMgdG8gcmVwcmVzZW50IHRoZSBpbWFn
ZTsgMy4gSW52b2tlIGEgREJ1cyBjYWxsIHRvIHNldCBSZXF1ZXN0ZWRBY3RpdmF0aW9uIHByb3Bl
cnR5IHRvICJBY3RpdmUiDQo0LiBSZWJvb3QuDQoNCkJlIG5vdGVkIHRoYXQgdGhlIHRhcmJhbGwg
Y29uc2lzdHMgb2YgZm9sbG93aW5nIGZpbGVzOg0KDQogaW1hZ2UtdS1ib290DQogaW1hZ2Uta2Vy
bmVsDQogaW1hZ2Utcm9mcw0KIGltYWdlLXJ3ZnMNCiBNQU5JRkVTVA0KIHB1YmxpY2tleQ0KIGlt
YWdlLXUtYm9vdC5zaWcNCiBpbWFnZS1rZXJuZWwuc2lnDQogaW1hZ2Utcm9mcy5zaWcNCiBpbWFn
ZS1yd2ZzLnNpZw0KIE1BTklGRVNULnNpZw0KIHB1YmxpY2tleS5zaWcNCg==
