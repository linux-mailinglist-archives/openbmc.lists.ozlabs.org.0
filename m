Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4729D168
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 19:03:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLxJS33t9zDqTs
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 05:03:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=DmQShMOd; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Gp7YXHCI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLxHf582NzDqTF
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 05:02:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603908152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UovmpfXdhRPA1WQXSftMyBH0CjnSjJpW/6ILSUYoG5w=;
 b=DmQShMOdqO8vftRyQF2DFaYIKbcRVopWU4XHcHz+34Nse7QjrsE/0PwUYxpnn3m8crKGb2
 Xw5rFGTjQbUSKlcfG3jmFRSK/DzLEsb5KPT1nLTjscB8aMSLHdVUW0bpEMa3DKRFbUFggS
 7lK+d7d8p5pj22hfzf7YvWDfXoDwVVc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603908153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UovmpfXdhRPA1WQXSftMyBH0CjnSjJpW/6ILSUYoG5w=;
 b=Gp7YXHCIlw22whEfW+12FstP114TFbOshqzjtZtsZtPhZ6kKv+KucPVSaTiPerkSDYeBQO
 g4ttuMs5S6DMTbag5ypFc/v7qdhOIhVTKKB4NQrM60JRtN8fvCpw6UCzzOZfCG4cvEQCBN
 itnThTJHXWz08FkB6zuh57gDcLblyj0=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-A_hyHEFROmG-EnnNDqu15w-1; Wed, 28 Oct 2020 14:02:29 -0400
X-MC-Unique: A_hyHEFROmG-EnnNDqu15w-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 28 Oct 2020 11:02:28 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 28 Oct 2020 11:02:28 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: RE: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Topic: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Index: AdatTyI5t5CLRj2MQ0iaFWWZIGQPrAAP0yWAAA6h3bA=
Date: Wed, 28 Oct 2020 18:02:27 +0000
Message-ID: <f9b694053dd74feea45f6e9cd63c9a28@SCL-EXCHMB-13.phoenix.com>
References: <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
 <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
In-Reply-To: <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEZXJpY2sgTW9udGFndWUgW21h
aWx0bzpEZXJpY2suTW9udGFndWVAaWJtLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDI4LCAyMDIwIDEwOjU3DQo+IFRvOiBCcnVjZSBNaXRjaGVsbA0KPiBDYzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBXaXRoIHdlYnVpLXZ1ZSBGaXJtd2FyZSB2ZXJz
aW9uIG9uIE92ZXJ2aWV3IHZzIEhhcmR3YXJlDQo+IHN0YXR1cyBCTUMgbWFuYWdlciBub3QgYWx3
YXlzIG1hdGNoaW5nLg0KPiANCj4gPiBXaXRoIHdlYnVpLXZ1ZSBGaXJtd2FyZSB2ZXJzaW9uIG9u
IE92ZXJ2aWV3IHZzIEhhcmR3YXJlIHN0YXR1cw0KPiBCTUMgbWFuYWdlciBub3QgYWx3YXlzIG1h
dGNoaW5nLg0KPiA+DQo+ID4gVGhlc2UgYXJlIHNjcmVlbiBzaG90cy4NCj4gPg0KPiA+IEkgZmlu
ZCBSb211bHVzIGlzIG5vdCBoYXZpbmcgdGhpcyBpc3N1ZToNCj4gPiAJT3ZlcnZpZXcgLSBodHRw
czovL2JtYy0NCj4gYnJ1Y2UuZ2l0aHViLmlvL1JvbXVsdXNfT3ZlcnZpZXdfRmlybXdhcmUtdmVy
c2lvbi5wbmcNCj4gPiAJSGFyZHdhcmUgc3RhdHVzIC0gaHR0cHM6Ly9ibWMtDQo+IGJydWNlLmdp
dGh1Yi5pby9Sb211bHVzX0hhcmR3YXJlLXN0YXR1c19GaXJtd2FyZS12ZXJzaW9uLnBuZw0KPiA+
DQo+ID4gV2hlcmUgb3VyIGJ1aWxkIGRvZXMgc2hvdyB0aGlzIGlzc3VlOg0KPiA+IAlPdmVydmll
dyAtIGh0dHBzOi8vYm1jLQ0KPiBicnVjZS5naXRodWIuaW8vUGhvZW5peF9PdmVydmlld19GaXJt
d2FyZS12ZXJzaW9uLnBuZw0KPiA+IAlIYXJkd2FyZSBzdGF0dXMgLSBodHRwczovL2JtYy0NCj4g
YnJ1Y2UuZ2l0aHViLmlvL1Bob2VuaXhfSGFyZHdhcmUtc3RhdHVzX0Zpcm13YXJlLXZlcnNpb24u
cG5nDQo+IA0KPiA+IEkgYW0gY3VyaW91cyBhcyB0byBob3cgSGFyZHdhcmUgc3RhdHVzIGdldHMg
dGhlIChCTUMpIEZpcm13YXJlDQo+IHZlcnNpb24gYXMgY29tcGFyZWQgdG8gaG93IE92ZXJ2aWV3
IGdldHMgdGhlIChCTUMpIEZpcm13YXJlIHZlcnNpb24uDQo+IA0KPiBUaGV5IGFyZSBsb29raW5n
IGluIGRpZmZlcmVudCBwcm9wZXJ0aWVzLiBJIGFtIG5vdCAxMDAlIHN1cmUgd2h5IGFuZCBpdA0K
PiBtaWdodA0KPiBiZSBhYmxlIHRvIGJlIHNpbXBsaWZpZWQuIEhvd2V2ZXIsIGdpdmVuIHRoZSBp
bmZvcm1hdGlvbiwgSSB3b3VsZCBleHBlY3QNCj4gdGhhdA0KPiB5b3UgYXJlIGFsc28gbWlzc2lu
ZyB0aGUgRlcgdmVyc2lvbnMgb24gdGhlIEZXIHVwZGF0ZSBwYWdlIGFsc28uDQo+IA0KPiBJdCBs
b29rcyBsaWtlIHRoZSBPdmVydmlldyBwYWdlIHVzZXMgdGhlIEZpcm13YXJlIHN0b3JlIHRoYXQg
Y2FsbHMNCj4gL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jIGFuZCBnZXRzIHRoZSB2YWx1ZSBmcm9t
IHRoZQ0KPiBMaW5rcy5BY3RpdmVTb2Z0d2FyZSBpbWFnZS4NCj4gDQo+IA0KPiBPbiB0aGUgSGFy
ZHdhcmUgcGFnZSB1c2VzIHRoZSBCTUMgc3RvcmUgdGhhdCBhbHNvIHVzZXMNCj4gcmVkZmlzaC92
MS9NYW5hZ2Vycy9ibWMNCj4gYW5kIGl0IGdldHMgdGhlIHZlcnNpb24gZnJvbSB0aGUgRmlybXdh
cmVWZXJzaW9uIHByb3BlcnR5IHJldHVybmVkLg0KPiANCj4gSSB3b3VsZCBleHBlY3QgeW91IHRv
IGFsc28gYmUgbWlzc2luZyB0aGUgRlcgdmVyc2lvbnMgb24gdGhlIEZXIHBhZ2UNCj4gYWxzby4N
Cj4gDQo+IGh0dHBzOi8vaW1ndXIuY29tL2EvVG9qRU5ZWA0KPiANCj4gSXMgdGhhdCB0cnVlPw0K
PiANCj4gDQoNCg0KWWVzLCB0aGF0IGlzIFRSVUUuDQoNCg0KVGhpcyBpcyB3aGF0IEkgaGF2ZSBv
biB0aGUgUGhvZW5peCB2ZXJzaW9uOg0Kew0KICAgICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEv
TWFuYWdlcnMvYm1jIiwNCiAgICAiQG9kYXRhLnR5cGUiOiAiI01hbmFnZXIudjFfOV8wLk1hbmFn
ZXIiLA0KICAgICJBY3Rpb25zIjogew0KICAgICAgICAiI01hbmFnZXIuUmVzZXQiOiB7DQogICAg
ICAgICAgICAiQFJlZGZpc2guQWN0aW9uSW5mbyI6ICIvcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMv
UmVzZXRBY3Rpb25JbmZvIiwNCiAgICAgICAgICAgICJ0YXJnZXQiOiAiL3JlZGZpc2gvdjEvTWFu
YWdlcnMvYm1jL0FjdGlvbnMvTWFuYWdlci5SZXNldCINCiAgICAgICAgfSwNCiAgICAgICAgIiNN
YW5hZ2VyLlJlc2V0VG9EZWZhdWx0cyI6IHsNCiAgICAgICAgICAgICJSZXNldFR5cGVAUmVkZmlz
aC5BbGxvd2FibGVWYWx1ZXMiOiBbDQogICAgICAgICAgICAgICAgIlJlc2V0QWxsIg0KICAgICAg
ICAgICAgXSwNCiAgICAgICAgICAgICJ0YXJnZXQiOiAiL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1j
L0FjdGlvbnMvTWFuYWdlci5SZXNldFRvRGVmYXVsdHMiDQogICAgICAgIH0NCiAgICB9LA0KICAg
ICJEYXRlVGltZSI6ICIyMDIwLTEwLTI4VDE3OjU4OjU4KzAwOjAwIiwNCiAgICAiRGVzY3JpcHRp
b24iOiAiQmFzZWJvYXJkIE1hbmFnZW1lbnQgQ29udHJvbGxlciIsDQogICAgIkV0aGVybmV0SW50
ZXJmYWNlcyI6IHsNCiAgICAgICAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9NYW5hZ2Vycy9i
bWMvRXRoZXJuZXRJbnRlcmZhY2VzIg0KICAgIH0sDQogICAgIkZpcm13YXJlVmVyc2lvbiI6ICJ2
MC4wNS01LWcwNzNiYjYwYjYiLA0KICAgICJHcmFwaGljYWxDb25zb2xlIjogew0KICAgICAgICAi
Q29ubmVjdFR5cGVzU3VwcG9ydGVkIjogWw0KICAgICAgICAgICAgIktWTUlQIg0KICAgICAgICBd
LA0KICAgICAgICAiTWF4Q29uY3VycmVudFNlc3Npb25zIjogNCwNCiAgICAgICAgIlNlcnZpY2VF
bmFibGVkIjogdHJ1ZQ0KICAgIH0sDQogICAgIklkIjogImJtYyIsDQogICAgIkxhc3RSZXNldFRp
bWUiOiAiMjAyMC0xMC0yOFQxNjo1MjoxOCswMDowMCIsDQogICAgIkxpbmtzIjogew0KICAgICAg
ICAiQWN0aXZlU29mdHdhcmVJbWFnZSI6IHsNCiAgICAgICAgICAgICJAb2RhdGEuaWQiOiAiL3Jl
ZGZpc2gvdjEvVXBkYXRlU2VydmljZS9GaXJtd2FyZUludmVudG9yeS9kYjE2N2M2NCINCiAgICAg
ICAgfSwNCiAgICAgICAgIk1hbmFnZXJGb3JTZXJ2ZXJzIjogWw0KICAgICAgICAgICAgew0KICAg
ICAgICAgICAgICAgICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvU3lzdGVtcy9zeXN0ZW0iDQog
ICAgICAgICAgICB9DQogICAgICAgIF0sDQogICAgICAgICJNYW5hZ2VyRm9yU2VydmVyc0BvZGF0
YS5jb3VudCI6IDENCiAgICB9LA0KICAgICJMb2dTZXJ2aWNlcyI6IHsNCiAgICAgICAgIkBvZGF0
YS5pZCI6ICIvcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMvTG9nU2VydmljZXMiDQogICAgfSwNCiAg
ICAiTWFuYWdlclR5cGUiOiAiQk1DIiwNCiAgICAiTW9kZWwiOiAiT3BlbkJtYyIsDQogICAgIk5h
bWUiOiAiT3BlbkJtYyBNYW5hZ2VyIiwNCiAgICAiTmV0d29ya1Byb3RvY29sIjogew0KICAgICAg
ICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYy9OZXR3b3JrUHJvdG9jb2wi
DQogICAgfSwNCiAgICAiT2VtIjogew0KICAgICAgICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3Yx
L01hbmFnZXJzL2JtYyMvT2VtIiwNCiAgICAgICAgIkBvZGF0YS50eXBlIjogIiNPZW1NYW5hZ2Vy
Lk9lbSIsDQogICAgICAgICJPcGVuQm1jIjogew0KICAgICAgICAgICAgIkBvZGF0YS5pZCI6ICIv
cmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMjL09lbS9PcGVuQm1jIiwNCiAgICAgICAgICAgICJAb2Rh
dGEudHlwZSI6ICIjT2VtTWFuYWdlci5PcGVuQm1jIiwNCiAgICAgICAgICAgICJDZXJ0aWZpY2F0
ZXMiOiB7DQogICAgICAgICAgICAgICAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9NYW5hZ2Vy
cy9ibWMvVHJ1c3RzdG9yZS9DZXJ0aWZpY2F0ZXMiDQogICAgICAgICAgICB9DQogICAgICAgIH0N
CiAgICB9LA0KICAgICJQb3dlclN0YXRlIjogIk9uIiwNCiAgICAiU2VyaWFsQ29uc29sZSI6IHsN
CiAgICAgICAgIkNvbm5lY3RUeXBlc1N1cHBvcnRlZCI6IFsNCiAgICAgICAgICAgICJJUE1JIiwN
CiAgICAgICAgICAgICJTU0giDQogICAgICAgIF0sDQogICAgICAgICJNYXhDb25jdXJyZW50U2Vz
c2lvbnMiOiAxNSwNCiAgICAgICAgIlNlcnZpY2VFbmFibGVkIjogdHJ1ZQ0KICAgIH0sDQogICAg
IlNlcnZpY2VFbnRyeVBvaW50VVVJRCI6ICJkZDY2MDBjYS1iMDQ5LTQxYmQtOTJiNi1kZDNmN2Ex
YTJmNTgiLA0KICAgICJTdGF0dXMiOiB7DQogICAgICAgICJIZWFsdGgiOiAiT0siLA0KICAgICAg
ICAiSGVhbHRoUm9sbHVwIjogIk9LIiwNCiAgICAgICAgIlN0YXRlIjogIkVuYWJsZWQiDQogICAg
fSwNCiAgICAiVVVJRCI6ICJkMDQ1MzBkMC01NDk2LTRkNDMtOWVkZS00NjRmMjY3NDA0ZGEiDQp9
DQo=

