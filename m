Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B3229D20D
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 21:20:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM0L74hs9zDqW3
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 07:19:59 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=L1hv1w0q; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=L1hv1w0q; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM0KH2PDszDqLh
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 07:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603916348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=bhU1VCxebyZhnyX1IZhhN9cr7S7F2vWnGvCKGj2VGRQ=;
 b=L1hv1w0quP3WHQ4JHC5kTsllVOqLLe6+unZhW2VNU/FlyeY5fiNfaBkUNfKBQzR5JFITBf
 f1IHah4gnezeK6vmKYoFScspqPMDOiyHWYZ8FacVkCuo3Fl9DLYpfTleZ2m4KWShefscnr
 Ao5m6l+5X25wSlBoV6gdWZdleusB3eM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603916348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=bhU1VCxebyZhnyX1IZhhN9cr7S7F2vWnGvCKGj2VGRQ=;
 b=L1hv1w0quP3WHQ4JHC5kTsllVOqLLe6+unZhW2VNU/FlyeY5fiNfaBkUNfKBQzR5JFITBf
 f1IHah4gnezeK6vmKYoFScspqPMDOiyHWYZ8FacVkCuo3Fl9DLYpfTleZ2m4KWShefscnr
 Ao5m6l+5X25wSlBoV6gdWZdleusB3eM=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-L5DDoDZBNEWMVfZ-dEUSHA-1; Wed, 28 Oct 2020 16:19:04 -0400
X-MC-Unique: L5DDoDZBNEWMVfZ-dEUSHA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 28 Oct 2020 13:19:02 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 28 Oct 2020 13:19:02 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: RE: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Topic: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Index: AdatTyI5t5CLRj2MQ0iaFWWZIGQPrAAP0yWAAA6h3bAAGHMU0A==
Date: Wed, 28 Oct 2020 20:19:01 +0000
Message-ID: <40cd49cc097b4befb30465c782be3a26@SCL-EXCHMB-13.phoenix.com>
References: <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
 <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJydWNlIE1pdGNoZWxsDQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyOCwgMjAyMCAxMTowMg0KPiBUbzogJ0RlcmljayBN
b250YWd1ZScNCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSRTog
V2l0aCB3ZWJ1aS12dWUgRmlybXdhcmUgdmVyc2lvbiBvbiBPdmVydmlldyB2cyBIYXJkd2FyZQ0K
PiBzdGF0dXMgQk1DIG1hbmFnZXIgbm90IGFsd2F5cyBtYXRjaGluZy4NCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBEZXJpY2sgTW9udGFndWUgW21haWx0bzpE
ZXJpY2suTW9udGFndWVAaWJtLmNvbV0NCj4gPiBTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMjgs
IDIwMjAgMTA6NTcNCj4gPiBUbzogQnJ1Y2UgTWl0Y2hlbGwNCj4gPiBDYzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQo+ID4gU3ViamVjdDogUmU6IFdpdGggd2VidWktdnVlIEZpcm13YXJlIHZl
cnNpb24gb24gT3ZlcnZpZXcgdnMNCj4gSGFyZHdhcmUNCj4gPiBzdGF0dXMgQk1DIG1hbmFnZXIg
bm90IGFsd2F5cyBtYXRjaGluZy4NCj4gPg0KPiA+ID4gV2l0aCB3ZWJ1aS12dWUgRmlybXdhcmUg
dmVyc2lvbiBvbiBPdmVydmlldyB2cyBIYXJkd2FyZSBzdGF0dXMNCj4gPiBCTUMgbWFuYWdlciBu
b3QgYWx3YXlzIG1hdGNoaW5nLg0KPiA+ID4NCj4gPiA+IFRoZXNlIGFyZSBzY3JlZW4gc2hvdHMu
DQo+ID4gPg0KPiA+ID4gSSBmaW5kIFJvbXVsdXMgaXMgbm90IGhhdmluZyB0aGlzIGlzc3VlOg0K
PiA+ID4gCU92ZXJ2aWV3IC0gaHR0cHM6Ly9ibWMtDQo+ID4gYnJ1Y2UuZ2l0aHViLmlvL1JvbXVs
dXNfT3ZlcnZpZXdfRmlybXdhcmUtdmVyc2lvbi5wbmcNCj4gPiA+IAlIYXJkd2FyZSBzdGF0dXMg
LSBodHRwczovL2JtYy0NCj4gPiBicnVjZS5naXRodWIuaW8vUm9tdWx1c19IYXJkd2FyZS1zdGF0
dXNfRmlybXdhcmUtdmVyc2lvbi5wbmcNCj4gPiA+DQo+ID4gPiBXaGVyZSBvdXIgYnVpbGQgZG9l
cyBzaG93IHRoaXMgaXNzdWU6DQo+ID4gPiAJT3ZlcnZpZXcgLSBodHRwczovL2JtYy0NCj4gPiBi
cnVjZS5naXRodWIuaW8vUGhvZW5peF9PdmVydmlld19GaXJtd2FyZS12ZXJzaW9uLnBuZw0KPiA+
ID4gCUhhcmR3YXJlIHN0YXR1cyAtIGh0dHBzOi8vYm1jLQ0KPiA+IGJydWNlLmdpdGh1Yi5pby9Q
aG9lbml4X0hhcmR3YXJlLXN0YXR1c19GaXJtd2FyZS12ZXJzaW9uLnBuZw0KPiA+DQo+ID4gPiBJ
IGFtIGN1cmlvdXMgYXMgdG8gaG93IEhhcmR3YXJlIHN0YXR1cyBnZXRzIHRoZSAoQk1DKSBGaXJt
d2FyZQ0KPiA+IHZlcnNpb24gYXMgY29tcGFyZWQgdG8gaG93IE92ZXJ2aWV3IGdldHMgdGhlIChC
TUMpIEZpcm13YXJlIHZlcnNpb24uDQo+ID4NCj4gPiBUaGV5IGFyZSBsb29raW5nIGluIGRpZmZl
cmVudCBwcm9wZXJ0aWVzLiBJIGFtIG5vdCAxMDAlIHN1cmUgd2h5IGFuZCBpdA0KPiA+IG1pZ2h0
DQo+ID4gYmUgYWJsZSB0byBiZSBzaW1wbGlmaWVkLiBIb3dldmVyLCBnaXZlbiB0aGUgaW5mb3Jt
YXRpb24sIEkgd291bGQNCj4gZXhwZWN0DQo+ID4gdGhhdA0KPiA+IHlvdSBhcmUgYWxzbyBtaXNz
aW5nIHRoZSBGVyB2ZXJzaW9ucyBvbiB0aGUgRlcgdXBkYXRlIHBhZ2UgYWxzby4NCj4gPg0KPiA+
IEl0IGxvb2tzIGxpa2UgdGhlIE92ZXJ2aWV3IHBhZ2UgdXNlcyB0aGUgRmlybXdhcmUgc3RvcmUg
dGhhdCBjYWxscw0KPiA+IC9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYyBhbmQgZ2V0cyB0aGUgdmFs
dWUgZnJvbSB0aGUNCj4gPiBMaW5rcy5BY3RpdmVTb2Z0d2FyZSBpbWFnZS4NCj4gPg0KPiA+DQo+
ID4gT24gdGhlIEhhcmR3YXJlIHBhZ2UgdXNlcyB0aGUgQk1DIHN0b3JlIHRoYXQgYWxzbyB1c2Vz
DQo+ID4gcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMNCj4gPiBhbmQgaXQgZ2V0cyB0aGUgdmVyc2lv
biBmcm9tIHRoZSBGaXJtd2FyZVZlcnNpb24gcHJvcGVydHkgcmV0dXJuZWQuDQo+ID4NCj4gPiBJ
IHdvdWxkIGV4cGVjdCB5b3UgdG8gYWxzbyBiZSBtaXNzaW5nIHRoZSBGVyB2ZXJzaW9ucyBvbiB0
aGUgRlcgcGFnZQ0KPiA+IGFsc28uDQo+ID4NCj4gPiBodHRwczovL2ltZ3VyLmNvbS9hL1RvakVO
WVgNCj4gPg0KPiA+IElzIHRoYXQgdHJ1ZT8NCj4gPg0KPiA+DQo+IA0KPiANCj4gWWVzLCB0aGF0
IGlzIFRSVUUuDQo+IA0KPiANCj4gVGhpcyBpcyB3aGF0IEkgaGF2ZSBvbiB0aGUgUGhvZW5peCB2
ZXJzaW9uOg0KPiB7DQo+ICAgICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3YxL01hbmFnZXJzL2Jt
YyIsDQo+ICAgICAiQG9kYXRhLnR5cGUiOiAiI01hbmFnZXIudjFfOV8wLk1hbmFnZXIiLA0KPiAg
ICAgIkFjdGlvbnMiOiB7DQo+ICAgICAgICAgIiNNYW5hZ2VyLlJlc2V0Ijogew0KPiAgICAgICAg
ICAgICAiQFJlZGZpc2guQWN0aW9uSW5mbyI6DQo+ICIvcmVkZmlzaC92MS9NYW5hZ2Vycy9ibWMv
UmVzZXRBY3Rpb25JbmZvIiwNCj4gICAgICAgICAgICAgInRhcmdldCI6ICIvcmVkZmlzaC92MS9N
YW5hZ2Vycy9ibWMvQWN0aW9ucy9NYW5hZ2VyLlJlc2V0Ig0KPiAgICAgICAgIH0sDQo+ICAgICAg
ICAgIiNNYW5hZ2VyLlJlc2V0VG9EZWZhdWx0cyI6IHsNCj4gICAgICAgICAgICAgIlJlc2V0VHlw
ZUBSZWRmaXNoLkFsbG93YWJsZVZhbHVlcyI6IFsNCj4gICAgICAgICAgICAgICAgICJSZXNldEFs
bCINCj4gICAgICAgICAgICAgXSwNCj4gICAgICAgICAgICAgInRhcmdldCI6DQo+ICIvcmVkZmlz
aC92MS9NYW5hZ2Vycy9ibWMvQWN0aW9ucy9NYW5hZ2VyLlJlc2V0VG9EZWZhdWx0cyINCj4gICAg
ICAgICB9DQo+ICAgICB9LA0KPiAgICAgIkRhdGVUaW1lIjogIjIwMjAtMTAtMjhUMTc6NTg6NTgr
MDA6MDAiLA0KPiAgICAgIkRlc2NyaXB0aW9uIjogIkJhc2Vib2FyZCBNYW5hZ2VtZW50IENvbnRy
b2xsZXIiLA0KPiAgICAgIkV0aGVybmV0SW50ZXJmYWNlcyI6IHsNCj4gICAgICAgICAiQG9kYXRh
LmlkIjogIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMiDQo+ICAg
ICB9LA0KPiAgICAgIkZpcm13YXJlVmVyc2lvbiI6ICJ2MC4wNS01LWcwNzNiYjYwYjYiLA0KPiAg
ICAgIkdyYXBoaWNhbENvbnNvbGUiOiB7DQo+ICAgICAgICAgIkNvbm5lY3RUeXBlc1N1cHBvcnRl
ZCI6IFsNCj4gICAgICAgICAgICAgIktWTUlQIg0KPiAgICAgICAgIF0sDQo+ICAgICAgICAgIk1h
eENvbmN1cnJlbnRTZXNzaW9ucyI6IDQsDQo+ICAgICAgICAgIlNlcnZpY2VFbmFibGVkIjogdHJ1
ZQ0KPiAgICAgfSwNCj4gICAgICJJZCI6ICJibWMiLA0KPiAgICAgIkxhc3RSZXNldFRpbWUiOiAi
MjAyMC0xMC0yOFQxNjo1MjoxOCswMDowMCIsDQo+ICAgICAiTGlua3MiOiB7DQo+ICAgICAgICAg
IkFjdGl2ZVNvZnR3YXJlSW1hZ2UiOiB7DQo+ICAgICAgICAgICAgICJAb2RhdGEuaWQiOg0KPiAi
L3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZS9GaXJtd2FyZUludmVudG9yeS9kYjE2N2M2NCINCj4g
ICAgICAgICB9LA0KPiAgICAgICAgICJNYW5hZ2VyRm9yU2VydmVycyI6IFsNCj4gICAgICAgICAg
ICAgew0KPiAgICAgICAgICAgICAgICAgIkBvZGF0YS5pZCI6ICIvcmVkZmlzaC92MS9TeXN0ZW1z
L3N5c3RlbSINCj4gICAgICAgICAgICAgfQ0KPiAgICAgICAgIF0sDQo+ICAgICAgICAgIk1hbmFn
ZXJGb3JTZXJ2ZXJzQG9kYXRhLmNvdW50IjogMQ0KPiAgICAgfSwNCj4gICAgICJMb2dTZXJ2aWNl
cyI6IHsNCj4gICAgICAgICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYy9M
b2dTZXJ2aWNlcyINCj4gICAgIH0sDQo+ICAgICAiTWFuYWdlclR5cGUiOiAiQk1DIiwNCj4gICAg
ICJNb2RlbCI6ICJPcGVuQm1jIiwNCj4gICAgICJOYW1lIjogIk9wZW5CbWMgTWFuYWdlciIsDQo+
ICAgICAiTmV0d29ya1Byb3RvY29sIjogew0KPiAgICAgICAgICJAb2RhdGEuaWQiOiAiL3JlZGZp
c2gvdjEvTWFuYWdlcnMvYm1jL05ldHdvcmtQcm90b2NvbCINCj4gICAgIH0sDQo+ICAgICAiT2Vt
Ijogew0KPiAgICAgICAgICJAb2RhdGEuaWQiOiAiL3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jIy9P
ZW0iLA0KPiAgICAgICAgICJAb2RhdGEudHlwZSI6ICIjT2VtTWFuYWdlci5PZW0iLA0KPiAgICAg
ICAgICJPcGVuQm1jIjogew0KPiAgICAgICAgICAgICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3Yx
L01hbmFnZXJzL2JtYyMvT2VtL09wZW5CbWMiLA0KPiAgICAgICAgICAgICAiQG9kYXRhLnR5cGUi
OiAiI09lbU1hbmFnZXIuT3BlbkJtYyIsDQo+ICAgICAgICAgICAgICJDZXJ0aWZpY2F0ZXMiOiB7
DQo+ICAgICAgICAgICAgICAgICAiQG9kYXRhLmlkIjoNCj4gIi9yZWRmaXNoL3YxL01hbmFnZXJz
L2JtYy9UcnVzdHN0b3JlL0NlcnRpZmljYXRlcyINCj4gICAgICAgICAgICAgfQ0KPiAgICAgICAg
IH0NCj4gICAgIH0sDQo+ICAgICAiUG93ZXJTdGF0ZSI6ICJPbiIsDQo+ICAgICAiU2VyaWFsQ29u
c29sZSI6IHsNCj4gICAgICAgICAiQ29ubmVjdFR5cGVzU3VwcG9ydGVkIjogWw0KPiAgICAgICAg
ICAgICAiSVBNSSIsDQo+ICAgICAgICAgICAgICJTU0giDQo+ICAgICAgICAgXSwNCj4gICAgICAg
ICAiTWF4Q29uY3VycmVudFNlc3Npb25zIjogMTUsDQo+ICAgICAgICAgIlNlcnZpY2VFbmFibGVk
IjogdHJ1ZQ0KPiAgICAgfSwNCj4gICAgICJTZXJ2aWNlRW50cnlQb2ludFVVSUQiOiAiZGQ2NjAw
Y2EtYjA0OS00MWJkLTkyYjYtZGQzZjdhMWEyZjU4IiwNCj4gICAgICJTdGF0dXMiOiB7DQo+ICAg
ICAgICAgIkhlYWx0aCI6ICJPSyIsDQo+ICAgICAgICAgIkhlYWx0aFJvbGx1cCI6ICJPSyIsDQo+
ICAgICAgICAgIlN0YXRlIjogIkVuYWJsZWQiDQo+ICAgICB9LA0KPiAgICAgIlVVSUQiOiAiZDA0
NTMwZDAtNTQ5Ni00ZDQzLTllZGUtNDY0ZjI2NzQwNGRhIg0KPiB9DQoNCkRlcmljaywgSSBhbSBu
b3Qgc2VlaW5nIGEgcmVhbCBkaWZmZXJlbmNlIGJldHdlZW4gUm9tdWx1cyBhbmQgUGhvZW5peCBo
ZXJlLg0KDQpTY3JlZW4gc2hvdHMgYWdhaW4uDQoNClJvbXVsdXMgUmVkZmlzaCBGaXJtd2FyZUlu
dmVudG9yeQ0KCWh0dHBzOi8vYm1jLWJydWNlLmdpdGh1Yi5pby9Sb211bHVzX1JlZGZpc2hfRmly
bXdhcmVJbnZlbnRvcnkucG5nDQoNClBob2VuaXggUmVkZmlzaCBGaXJtd2FyZUludmVudG9yeQ0K
CWh0dHBzOi8vYm1jLWJydWNlLmdpdGh1Yi5pby9QaG9lbml4X1JlZGZpc2hfRmlybXdhcmVJbnZl
bnRvcnkucG5nDQoNCg==

