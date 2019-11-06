Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9AF21EA
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 23:39:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477hKt3lyXzF4wK
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 09:39:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="VGI041dF"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477hKF47p0zF48c
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 09:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1573079931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ldm71abtjO4Lru136+i7ugU2tPPT2tvWQvFsEQtA884=;
 b=VGI041dF0coPktltapx49KHpNkLaMiUhEt4OOaoEGTBshI0YFZnSPMwz5k2dXIhgO5qb+U
 kbKS9CiHvr5wpj8xP82JCn57wCjEoiIsBp1zjhHNwbJZc4+c+KHrmGG0XACVymQ43aRGNU
 7hfwd6LmPf8K4ARfnzReY57PjdW+xy4=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-pxb3MLqpPDGQrHXauY6ZXQ-1; Wed, 06 Nov 2019 17:38:49 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 6 Nov 2019 14:38:35 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 6 Nov 2019 14:38:35 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, James Feist
 <james.feist@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC and https Vulnerable issue.
Thread-Topic: OpenBMC and https Vulnerable issue.
Thread-Index: AdWU2NcOn6r8XDKvQaCrtSIOdXMZIAAVrMKAABAGWwAAHzlqQA==
Date: Wed, 6 Nov 2019 22:38:33 +0000
Message-ID: <c4cb53595ede41398aa7ca7086da55ec@SCL-EXCHMB-13.phoenix.com>
References: <44ddb5d76e734cb8bcc7354e1c0e0081@SCL-EXCHMB-13.phoenix.com>
 <cd9008e5-2501-29d4-57e8-7831eb558160@linux.intel.com>
 <8e3e3633bd1946adbac73657816e049a@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <8e3e3633bd1946adbac73657816e049a@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: pxb3MLqpPDGQrHXauY6ZXQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRv
Om9wZW5ibWMtDQo+IGJvdW5jZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21AbGlzdHMub3ps
YWJzLm9yZ10gT24gQmVoYWxmIE9mIEJydWNlDQo+IE1pdGNoZWxsDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgNiwgMjAxOSAxNDoxOQ0KPiBUbzogSmFtZXMgRmVpc3Q7IE9wZW5CTUMgTWFp
bGxpc3QNCj4gU3ViamVjdDogUkU6IE9wZW5CTUMgYW5kIGh0dHBzIFZ1bG5lcmFibGUgaXNzdWUu
DQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBv
cGVuYm1jIFttYWlsdG86b3BlbmJtYy0NCj4gPiBib3VuY2VzK2JydWNlX21pdGNoZWxsPXBob2Vu
aXguY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJlaGFsZiBPZg0KPiA+IEphbWVzIEZlaXN0DQo+
ID4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciA2LCAyMDE5IDEzOjUyDQo+ID4gVG86IEJydWNl
IE1pdGNoZWxsOyBPcGVuQk1DIE1haWxsaXN0DQo+ID4gU3ViamVjdDogUmU6IE9wZW5CTUMgYW5k
IGh0dHBzIFZ1bG5lcmFibGUgaXNzdWUuDQo+ID4NCj4gPiBPbiAxMS82LzE5IDExOjMxIEFNLCBC
cnVjZSBNaXRjaGVsbCB3cm90ZToNCj4gPiA+ICBGcm9tIG15IGludmVzdGlnYXRpb25zIG9uIFRM
UyB0aGVyZSBzZWVtcyB0byBiZSAyIGlzc3VlcyB0aGF0IGNvdWxkIGJlDQo+ID4gY29ycmVjdGVk
IHdpdGggT3BlbkJNQydzIGh0dHBzOg0KPiA+ID4gICAgMSAgU2VjdXJlIENsaWVudC1Jbml0aWF0
ZWQgUmVuZWdvdGlhdGlvbiAgICAgVlVMTkVSQUJMRSAoTk9UIG9rKSwgRG9TDQo+ID4gdGhyZWF0
DQo+ID4NCj4gPiBUaGlzIENWRSBpcyBkaXNwdXRlZCBodHRwczovL3d3dy5jdmVkZXRhaWxzLmNv
bS9jdmUvQ1ZFLTIwMTEtMTQ3My8gZHVlDQo+ID4gdG8gQ1BVIGNvbnN1bXB0aW9uIGlzc3VlcyB0
aGF0IG1pZ2h0IG1ha2UgaXQgZWFzaWVyIHRvIGNhdXNlIGEgRE9TDQo+ID4gKHdoaWNoIGlzIGFy
Z3VhYmx5IGFscmVhZHkgbm90IHRoYXQgZGlmZmljdWx0IG9uIGEgQk1DKS4gVGhhdCBiZWluZyBz
YWlkDQo+ID4gdGhlIGZpeCBpcyBhIDEgbGluZXIsIHNvIEkgaW1wbGVtZW50ZWQgaXQgYW5kIGl0
IHNlZW1zIHRvIHdvcmssIGJ1dCBJDQo+ID4gbmVlZCB0byBzZWUgaWYgdGhlcmUgYXJlIGFueSBj
b25zZXF1ZW5jZXMuDQo+ID4NCj4gPiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6
L2Mvb3BlbmJtYy9ibWN3ZWIvKy8yNjk5Mg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gICAgMiAgTFVD
S1kxMyAoQ1ZFLTIwMTMtMDE2OSksIGV4cGVyaW1lbnRhbCAgICAgcG90ZW50aWFsbHkgVlVMTkVS
QUJMRSwNCj4gPiB1c2VzIGNpcGhlciBibG9jayBjaGFpbmluZyAoQ0JDKSBjaXBoZXJzIHdpdGgg
VExTDQo+ID4gPiAgICAgICBhbmQgeGMwMjMgICBFQ0RIRS1FQ0RTQS1BRVMxMjgtU0hBMjU2ICAg
ICAgICAgRUNESCA1MjEgICBBRVMgICAgICAgICAxMjgNCj4gPiBUTFNfRUNESEVfRUNEU0FfV0lU
SF9BRVNfMTI4X0NCQ19TSEEyNTYNCj4gPg0KPiA+IEJhc2VkIG9uIHRoaXMgaHR0cHM6Ly93aWtp
LmNyYXNodGVzdC1zZWN1cml0eS5jb20vcHJldmVudC1zc2wtbHVja3kxMywNCj4gPiB3ZSBhcmUg
dXNpbmcgdGhlIHJlY29tbWVuZGVkIGNpcGhlcnMsDQo+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvYm1jd2ViL2Jsb2IvMWY4YzdiNWQ2YTY3OWEzOGI4MjI2MTA2MDMxDQo+ID4gMGI4
NzYwNzlkMGY4Yi9pbmNsdWRlL3NzbF9rZXlfaGFuZGxlci5ocHAjTDMzMC4NCj4gPiBBbmQgYmFz
ZWQgb24gdGhpcyBjb21tZW50IGZyb20gdGhlIG1haW50YWluZXIgb2YgdGVzdCBzc2wsIG5vIHRv
b2wgY2FuDQo+ID4gZGV0ZXJtaW5lIHRoaXMgZXh0ZXJuYWxseSwgYW5kIGl0J3MganVzdCBhIHdh
cm5pbmc6DQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2Ryd2V0dGVyL3Rlc3Rzc2wuc2gvaXNzdWVz
LzEwMTEjaXNzdWVjb21tZW50LQ0KPiA+IDM3Mjk1MzY1NC4NCj4gPiBEbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbnMgb24gaWYgdGhlcmUgaXMgYW55dGhpbmcgdG8gY2hhbmdlIGZvciB0aGlzIG9u
ZT8NCj4gPg0KPiA+IFRoYW5rcw0KPiA+DQo+ID4gLUphbWVzDQo+ID4NCj4gDQo+IFRoYW5rcyBK
YW1lcywgSSBhY2NlcHQgeW91ciBhc3Nlc3NtZW50Lg0KPiANCj4gLUJydWNlDQo+IA0KDQpUaGVy
ZSBhcmUgTW96aWxsYSBSZWNvbW1lbmRlZCBjb25maWd1cmF0aW9ucyBhcyB3ZWxsLg0KaHR0cHM6
Ly93aWtpLm1vemlsbGEub3JnL1NlY3VyaXR5L1NlcnZlcl9TaWRlX1RMUyNSZWNvbW1lbmRlZF9j
b25maWd1cmF0aW9ucw0KDQotIEJydWNlDQoNCj4gPg0KPiA+ID4NCj4gPiA+IFByZXNlbnQgc3Rh
bmRhcmQgb2YgcHJhY3RpY2Ugc2VlbXMgdG8gYmUgdG8gbm90IGFsbG93IFNlY3VyZSBDbGllbnQt
DQo+ID4gSW5pdGlhdGVkIFJlbmVnb3RpYXRpb24gYW5kIHRvIG5vdCBhbGxvdyBDQkMgY2lwaGVy
cy4NCj4gPiA+DQo+ID4gPiBJcyB0aGlzIHlvdXIgdW5kZXJzdGFuZGluZyBhcyB3ZWxsPw0KPiA+
ID4NCj4gPiA+IFRoYW5rIHlvdSENCj4gPiA+DQoNCg==

