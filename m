Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1FD7B62E
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 01:20:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ysx51HlWzDqRh
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 09:20:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.82.137; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="TKYALmpC"; dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820137.outbound.protection.outlook.com [40.107.82.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yswP26dRzDqN7
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 09:20:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtAwJ+z7dfGgAJoaw0E76iefy10pFinDTORb6dbcD+fwm7m/iq+CB/nrNj9/rP3rife895s+qJ3jlxOP3fppnxuwA+nK79sAG1vJWZcbBhWj1ryVZ7ABR56l3uvrhpm+8oqbjrq5FdBu4KMyHLm2lPP9I75pWkqib9l4hs9YiGGpk8iCa/5k+iXJtmYqmF17fh61PjXAmyWU9ZmjGdxChF/bbChmdUQix7CfLk6Ol6LJmvsD7brID9VKkYfqFqQX/oKedNPXIpShu5h3RltwJTXdErCkkr0Bzj9aWaGNTZgFmDjsOQFBb6gz9m7ZvoReCPMQY+vy3AI5bwJZQwAvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYQx0WvWZ+ZbRWEwzlmYw3pjcZ9iF4hubtNQeHdQn/8=;
 b=c5p78JOqT+0WUzkHVjZroEgsIaFQJZPWCEfwzYRxVU4vIRFjsRY7uLpQAkxpFzN03O72LHmfoI9Y7O83Z8HX1LMzAx5IbE0dWSJVXyv0HppF7il01I+eIXYAHm5tQXCw8E22gS5djBg9m86pjaKm7L5hJWhCrHY3HmAcizvkc+ZXKjkI8TNYLkCOjkYHChsFmx7vNNc4nHt4lbAEko0jpOqRLtkrSsh4aZUxzb5kWURrHaYw7uq5phh4ljR5a2D9ew+yxW5VKEoWsNNO3Sczp3yQsbn9iDagekcytQqZP9mb/0mc4aqnm4APzTe61LUlRMC9OYXGOql3ODNKVz7XUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYQx0WvWZ+ZbRWEwzlmYw3pjcZ9iF4hubtNQeHdQn/8=;
 b=TKYALmpCyWG9hxAMQF1yaitNaJFhEbV+vZHsk6Lcy+gGo/mRf20b+VywgYvucKuhWJt16tiXPajK1Y+GGr5CxHVllI9RwI7sQn3bFdyFOWTQu8ZSDZARD3GjHjnym1fdftDXtBL9pTjkY3NNtGngRiRpjqyubJtyQknopW4wQxM=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1254.namprd21.prod.outlook.com (20.179.57.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.2; Tue, 30 Jul 2019 23:19:59 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4%2]) with mapi id 15.20.2157.001; Tue, 30 Jul 2019
 23:19:58 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Patrick Venture <venture@google.com>
Subject: RE: phosphor-ipmi-flash making progress!
Thread-Topic: phosphor-ipmi-flash making progress!
Thread-Index: AQHVIYQAUgxH9LDCREqvqwOwXfgzG6akHSIQgACIIoCAP3IHYA==
Date: Tue, 30 Jul 2019 23:19:57 +0000
Message-ID: <BYAPR21MB1191D6BE0A9E08752FAC8A76C8DC0@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
 <SN6PR2101MB0943F194BD7DF1868ADED4DDC8E40@SN6PR2101MB0943.namprd21.prod.outlook.com>
 <CAO=notwkfzqwYA2hatPP3StNUj7kZLgPbTuf=B2eE8PJsWCqXQ@mail.gmail.com>
In-Reply-To: <CAO=notwkfzqwYA2hatPP3StNUj7kZLgPbTuf=B2eE8PJsWCqXQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-30T23:19:56.0133638Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ff486efa-63f3-4474-b5d7-cd453e43ecfe;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:7:45e5:2737:d46b:3e19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca2fc3b2-4527-4e1f-3f7d-08d7154470be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR21MB1254; 
x-ms-traffictypediagnostic: BYAPR21MB1254:
x-microsoft-antispam-prvs: <BYAPR21MB1254E96920F91F7E1422AD3EC8DC0@BYAPR21MB1254.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(13464003)(199004)(189003)(8936002)(86362001)(22452003)(6116002)(52536014)(71200400001)(7736002)(305945005)(74316002)(2906002)(81156014)(14454004)(81166006)(3480700005)(316002)(6916009)(5660300002)(71190400001)(8676002)(9686003)(55016002)(446003)(186003)(99286004)(476003)(486006)(10290500003)(14444005)(53936002)(478600001)(46003)(102836004)(7696005)(6506007)(256004)(229853002)(11346002)(6436002)(53546011)(6246003)(66946007)(76176011)(66556008)(4326008)(8990500004)(10090500001)(64756008)(66446008)(76116006)(33656002)(66476007)(25786009)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1254;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TORi3RG6dYdLnJRTkHBohanJ01KiLjd6qiqviobh6kvJyhc9e6BgY6SwJYuvs2MqwJZ+WUg5dtif/I3SnSiDYFX4hTAFbZ869QXa382BsLZUJij0j2lptFN8ihp6lO/ALynYH38mH0fHOI3bHlkymYc2bEmeCnvSwCeM+9ksBbVL6mEaGset9YxIsH8xiB7SVh6EYLRZ/BZafBoh9ttmywixwzALz9cgYMCc+ixYeYjzXKc4zi3tL6EIczXozdYFuI/TsUdYAtsW7wmMDdr5eTPtx8z/E+Cs84S6KZO7S6QJhn041xU96hTAyqH1IKhwMbX3Ca7lwvNMcyo1IaozY3Saed/5Kuu0Zxe9D/cQD0v5boJ7Vv6/QmC4dZRssad9zB/nlftK40wXLQLo0iPieivG6QOLi0VokYYyCBxEaU0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2fc3b2-4527-4e1f-3f7d-08d7154470be
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 23:19:58.7678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJiBTQknsmPA5sQXKeoF6/ioV6r12KeFT2eGfzJpBYdqJDCYdUFloeqpGmTjnRKh7XNRHNzUpBcil/ardROf4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1254
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

RG8gd2Ugc3VwcG9ydCBIUE0gPyBob3cgZG8gd2UgZW5hYmxlIFdpbmRvd3MgYmFzZWQgSW5iYW5k
IGZpcm13YXJlIHVwZGF0ZT8gDQoNCk5lZXJhag0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gDQpTZW50OiBU
aHVyc2RheSwgSnVuZSAyMCwgMjAxOSA3OjI2IEFNDQpUbzogTmVlcmFqIExhZGthbmkgPG5lbGFk
a0BtaWNyb3NvZnQuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZz4NClN1YmplY3Q6IFJlOiBwaG9zcGhvci1pcG1pLWZsYXNoIG1ha2luZyBwcm9ncmVz
cyENCg0KT24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTE6MjMgUE0gTmVlcmFqIExhZGthbmkgPG5l
bGFka0BtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4NCj4gV2hhdCBhcmUgaW4tYmFuZCB1cGRhdGUg
bWV0aG9kcyBmb3IgT3BlbkJNQz8gSSBzZWUgdGhpcyhwaG9zcGhvci1pcG1pLWZsYXNoKSBjYW4g
dGFrZSB0YWtlcyB+MyBob3VycyBvdmVyIElQTUkuIFdoYXQgaXMgdGhlIHNvbHV0aW9uIGZvciBp
bi1iYW5kIHVwZGF0ZT8gIHdoYXQgdG9vbHMgY2FuIGJlIHVzZWQ/DQoNCkl0IHN1cHBvcnRzIHRo
ZSBMUEMgbWVtb3J5IHJlZ2lvbiBpbnRlcmZhY2UgYXZhaWxhYmxlIHdpdGggdGhlIEFzcGVlZCBh
bmQgTnV2b3RvbiBCTUNzLiAgVGhlbiBpdCBkb2Vzbid0IHRha2UgMyBob3Vycy4gIEl0IGFsc28g
c3VwcG9ydHMgdXNpbmcgdGhlIGFzcGVlZCBwY2ktdG8tYWhiIGJyaWRnZSBvbiBBc3BlZWQuICBJ
dCB3aWxsIHByb2JhYmx5IHN1cHBvcnQgTnV2b3RvbidzIHZhcmlhdGlvbiBvZiB0aGF0LCBidXQg
dGhhdCdzIGJleW9uZCBteSBjdXJyZW50IHNjb3BpbmcuICBBcyBmYXIgYXMgdG9vbHMsIGkgZG9u
J3QgZW50aXJlbHkga25vdyB3aGF0IHlvdSBtZWFuLiAgVGhlcmUgaXMgYSB0b29sIGluIHBob3Nw
aG9yLWlwbWktZmxhc2ggZm9yIHRoZSBob3N0Lg0KDQo+DQo+IE5lZXJhag0KPg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVs
YWRrPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gDQo+IE9uIEJlaGFsZiBPZiBQYXRy
aWNrIFZlbnR1cmUNCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDEyLCAyMDE5IDY6MDQgUE0NCj4g
VG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVj
dDogcGhvc3Bob3ItaXBtaS1mbGFzaCBtYWtpbmcgcHJvZ3Jlc3MhDQo+DQo+IEZvciB0aG9zZSBp
bnRlcmVzdGVkIHBhcnRpZXMsIHBob3NwaG9yLWlwbWktZmxhc2ggd2hpY2ggcHJvdmlkZXMgYSB2
YXJpZXR5IG9mIG91dC1vZi1iYW5kIG1lY2hhbmlzbXMgZm9yIHVwZGF0aW5nIHRoZSBCTUMgaW4g
YSBmdWxseS1jb25maWd1cmFibGUgbWFubmVyIGlzIG5lYXJseSByZWFkeSBmb3Igd2lkZSBkaXN0
cmlidXRpb24uDQo+DQo+IEN1cnJlbnRseSBzdXBwb3J0ZWQ6IGFzcGVlZC1wMmEtY3RybCAoaXBt
aXBjaSksIGFuZCBpbmJhbmQgKGlwbWlidCkqIA0KPiBTaG9ydGx5IHN1cHBvcnRlZDogYXNwZWVk
LWxwYy1jdHJsIChpcG1pbHBjKQ0KPg0KPiAqVGhlcmUgaXMgYSBidWcgaW4gdGhlIHRyYW5zbWl0
IGJ1ZmZlciBzaXplIGRlcGVuZGluZyBvbiB3aGV0aGVyIGl0J3Mgb3ZlciBLQ1MgdmVyc3VzIGFj
dHVhbGx5IEJUIHNpbmNlIEJUIGhhcyBhIHNtYWxsZXIgYnVmZmVyIHJlcXVpcmVtZW50Lg0KPg0K
PiBVQkkgVGFyYmFsbCB1cGRhdGVzIGFyZW4ndCB5ZXQgc3VwcG9ydGVkLCBidXQgdGhhdCdzIG9u
bHkgYSBtYXR0ZXIgb2Ygc29tZW9uZSB3cml0aW5nIGFuIHVwZGF0ZSBoYW5kbGVyLiAgVGhlIGZp
cm13YXJlIGhhbmRsZXIgb24gdGhlIEJNQyBjYW4gYmUgZXh0ZW5kZWQgZWFzaWx5IHRvIHN1cHBv
cnQgYSB2YXJpZXR5IG9mIHZlcmlmaWNhdGlvbiBhbmQgdXBkYXRlIG1lY2hhbmlzbXMuICBUaGUg
ZGVmYXVsdCBiZWhhdmlvciBpcyB0byBsZXZlcmFnZSBhIHNlcnZpY2UgZm9yIGVhY2ggb2YgdGhl
c2UgdGhpbmdzLiAgT25lIGNhbiBpbXBsZW1lbnQgd2hhdGV2ZXIgdGhleSByZWFsbHkgd2FudCBm
b3IgZWFjaCBzZXJ2aWNlLg0KPg0KPiBUaGUgZmlsZSBzZW50IHRvIHRoZSBCTUMgaXNuJ3QgcmVx
dWlyZWQgdG8gaGF2ZSBhIHNpZ25hdHVyZSBmaWxlLiAgT25lIGNvdWxkIHNpbXBseSBza2lwIHNl
bmRpbmcgdGhlIGhhc2ggZmlsZSBhbmQgaGF2ZSBhIHZlcmlmaWNhdGlvbiBzdGVwIHRoYXQgZG9l
c24ndCBkbyBhbnl0aGluZyBzcGVjaWFsLiAgU28sIGl0J3MgdmVyeSBmbGV4aWJsZS4NCj4NCj4g
SGVyZSdzIHNvbWUgb3V0cHV0Og0KPg0KPiAkIC4vcGhvc3Bob3JfaXBtaV9mbGFzaF90b29sIC0t
Y29tbWFuZCB1cGRhdGUgLS1pbnRlcmZhY2UgaXBtaXBjaSANCj4gLS1pbWFnZSBpbWFnZS1ibWMg
LS1zaWcgaW1hZ2UtYm1jLnNpZw0KPg0KPiBTZW5kaW5nIG92ZXIgdGhlIGZpcm13YXJlIGltYWdl
Lg0KPiBbMHgxYTAzIDB4MjAwMF0NCj4gVGhlIGJyaWRnZSBpcyBlbmFibGVkIQ0KPiBSZWNlaXZl
ZCBhZGRyZXNzOiAweDQ3ZmYwMDAwDQo+IFNlbmRpbmcgb3ZlciB0aGUgaGFzaCBmaWxlLg0KPiBb
MHgxYTAzIDB4MjAwMF0NCj4gVGhlIGJyaWRnZSBpcyBlbmFibGVkIQ0KPiBSZWNlaXZlZCBhZGRy
ZXNzOiAweDQ3ZmYwMDAwDQo+DQo+IE9wZW5pbmcgdGhlIHZlcmlmaWNhdGlvbiBmaWxlDQo+IENv
bW1pdHRpbmcgdG8gL2ZsYXNoL3ZlcmlmeSBmaWxlIHRvIHRyaWdnZXIgc2VydmljZSBDYWxsaW5n
IHN0YXQgb24gDQo+IC9mbGFzaC92ZXJpZnkgc2Vzc2lvbiB0byBjaGVjayBzdGF0dXMgb3RoZXIg
cnVubmluZyBydW5uaW5nIHN1Y2Nlc3MgDQo+IFJldHVybmVkIHN1Y2Nlc3Mgc3VjY2VlZGVkDQo+
DQo+IE9wZW5pbmcgdGhlIHVwZGF0ZSBmaWxlDQo+IENvbW1pdHRpbmcgdG8gL2ZsYXNoL3VwZGF0
ZSBmaWxlIHRvIHRyaWdnZXIgc2VydmljZSBDYWxsaW5nIHN0YXQgb24gDQo+IC9mbGFzaC91cGRh
dGUgc2Vzc2lvbiB0byBjaGVjayBzdGF0dXMgcnVubmluZyBFeGNlcHRpb24gcmVjZWl2ZWQ6IGJs
b2IgDQo+IGV4Y2VwdGlvbiByZWNlaXZlZDogUmVjZWl2ZWQgSVBNSV9DQzogYnVzeQ0KPg0KPiBP
biB0aGUgQk1DOg0KPiBzaHV0ZG93bjogcmVib290IC0tdGltZW91dCA5MDAwMDAwMHVzIC0tbG9n
LWxldmVsIDYgLS1sb2ctdGFyZ2V0IGttc2cgDQo+IC0tbG9nLWNvbG9yDQo+ICsgYXdrICcvb2xk
cm9vdHxtbnQvIHsgcHJpbnQgJDIgfScNCj4gKyBzb3J0IC1yDQo+ICsgdW1vdW50IC9vbGRyb290
L3N5cy9rZXJuZWwvZGVidWcNCj4gKyB1bW91bnQgL29sZHJvb3Qvc3lzL2ZzL2Nncm91cC91bmlm
aWVkIHVtb3VudCANCj4gKyAvb2xkcm9vdC9zeXMvZnMvY2dyb3VwL3N5c3RlbWQgdW1vdW50IC9v
bGRyb290L3N5cy9mcy9jZ3JvdXAgdW1vdW50IA0KPiArIC9vbGRyb290L3N5cy9mcy9icGYgdW1v
dW50IC9vbGRyb290L3N5cyB1bW91bnQgL29sZHJvb3QvcHJvYyB1bW91bnQgDQo+ICsgL29sZHJv
b3QvZGV2L3NobSB1bW91bnQgL29sZHJvb3QvZGV2L3B0cyB1bW91bnQgL29sZHJvb3QvZGV2IHVt
b3VudCANCj4gKyAvb2xkcm9vdCB1bW91bnQgL21udC9pbml0cmFtZnMvcncgdW1vdW50IC9tbnQv
aW5pdHJhbWZzL3JvIHVtb3VudCANCj4gKyAvbW50IHNldCAreA0KPiBQaW5naW5nIHdhdGNoZG9n
IHdpdGggYXJncyAtdCAxIC1UIDUNCj4gdXBkYXRlOiAtLWNsZWFuLXNhdmVkLWZpbGVzDQo+IFsg
ODI0MC44MTc4MDFdIGpmZnMyOiBub3RpY2U6ICgxMTcxKSBqZmZzMl9idWlsZF94YXR0cl9zdWJz
eXN0ZW06DQo+IGNvbXBsZXRlIGJ1aWxkaW5nIHhhdHRyIHN1YnN5c3RlbSwgMTcgb2YgeGRhdHVt
ICgxNSB1bmNoZWNrZWQsIDENCj4gb3JwaGFuKSBhbmQgMzAgb2YgeHJlZiAoMSBkZWFkLCAwIG9y
cGhhbikgZm91bmQuDQo+IFVwZGF0aW5nIGJtYy4uLg0KPiBFcmFzaW5nIGJsb2NrOiA2OS81MTIg
KDEzJSkNCj4NCj4gR2l2ZW4gYSBCTUMgY29uZmlndXJhdGlvbjoNCj4gRVhUUkFfT0VDT05GX2Fw
cGVuZF9xdWFudGEtcTcxbCA9ICIgLS1lbmFibGUtc3RhdGljLWxheW91dCINCj4gRVhUUkFfT0VD
T05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIgLS1lbmFibGUtcGNpLWJyaWRnZSINCj4gRVhUUkFf
T0VDT05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIgLS1lbmFibGUtYXNwZWVkLXAyYSINCj4gRVhU
UkFfT0VDT05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIgLS1lbmFibGUtcmVib290LXVwZGF0ZSIN
Cj4gRVhUUkFfT0VDT05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIgTUFQUEVEX0FERFJFU1M9MHg0
N0ZGMDAwMCINCj4NCj4NCj4gUGF0cmljaw0K
