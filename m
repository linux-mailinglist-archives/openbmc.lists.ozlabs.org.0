Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2583BF3A8
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 03:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKzkZ46R0z30H2
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 11:49:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=asrockrack.com (client-ip=43.251.60.7; helo=ms.pegatroncorp.com;
 envelope-from=jeff9_chan@asrockrack.com; receiver=<UNKNOWN>)
Received: from ms.pegatroncorp.com (ms.pegatroncorp.com [43.251.60.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GKzkK424Lz2yxF
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 11:49:39 +1000 (AEST)
IronPort-SDR: 9XuW5LVBpADztbcwqd8exkqvfs7XGTKtEkS6vAmwGjoBgpslQ7BQFiPucDL5lDCJrSxblywN9A
 YRCTia8A48oweuM7mbvz1FanuNMpTYQi7lExex3v6VakTM3Sl5++lyqbHSrXdJcmPG3sTsEVLh
 R34OAZpHKvHE1rRTs/Q5I7ciRV51Od96XU/n93gVLpgPp9MIRXx+NFbB+AZnVnSyj3TK7pEoxW
 rb8RTgDAb4DSmYdQlKjbMdYIXf6aD8J4ZFVdtn9hlA3vYURYdp6ZvyhNuwMVYEzwB5mfy0Zem/
 onc=
Received: from unknown (HELO PTW-MSE-AP01.pegatroncorp.com) ([172.18.6.20])
 by ms.pegatroncorp.com with ESMTP; 08 Jul 2021 09:49:35 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON
 (ptw-ex-mbs11.pega.corp.pegatron [172.18.192.66])
 by PTW-MSE-AP01.pegatroncorp.com with ESMTP id 1681nMW1079410;
 Thu, 8 Jul 2021 09:49:22 +0800 (GMT-8)
 (envelope-from Jeff9_Chan@asrockrack.com)
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) by
 PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 8 Jul 2021 09:49:23 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037])
 by PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037%3]) with mapi
 id 15.01.1847.012; Thu, 8 Jul 2021 09:49:23 +0800
From: =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: OPENBMC ASRock Rack
Thread-Topic: OPENBMC ASRock Rack
Thread-Index: AdY9OXpuPaiukNl5Rq6zENcUsPakygASUFgAABxnw6AAcpRYAAAlt3/wAAUnEIAAnS95QAAtf9yAPKwW60AADRa7AAA0of1ACS8FOkAAAHVfgP//vMeA//9szMD/0AeBkA==
Date: Thu, 8 Jul 2021 01:49:23 +0000
Message-ID: <b3df546e778b456dac24cbb170e66bb1@asrockrack.com>
References: <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
 <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
 <CACPK8Xfi9FBjPyLdy45C=hy-e4wktLrTp3UmFhH59oaaz0yTYQ@mail.gmail.com> 
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-AP01.pegatroncorp.com 1681nMW1079410
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoJSXQgaGFzIGJlZW4gYSB3aGlsZSBhZnRlciB1cGxvYWRpbmcgYXNyb2NrcmFjayBsYXll
ciwgbG9va3MgbGlrZSBubyBvbmUgaXMgcmV2aWV3aW5nIGl0LCB3aGF0J3MgdGhlIG5leHQgc3Rl
cCBmb3IgbWU/DQoNCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1j
L29wZW5ibWMvKy80Mzg1MA0KDQoNCmJlc3QgcmVnYXJkcw0KDQpKZWZmIENoYW4NCkFTUm9jayBJ
bmMuIA0KVGVsOiArODg2LTItNTU1OTk2MDAgZXh0LjM4NjcwDQoNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEplZmY5IENoYW4o6Zmz5p2+5YSJX0FTUm9ja1JhY2spIA0KU2Vu
dDogVHVlc2RheSwgSnVuZSA4LCAyMDIxIDI6NDggUE0NClRvOiAnSm9lbCBTdGFubGV5Jw0KQ2M6
IEJyYWRsZXkgVyBCaXNob3A7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgbWFuYWdlckBsZnBy
b2plY3RzLm9yZw0KU3ViamVjdDogUkU6IE9QRU5CTUMgQVNSb2NrIFJhY2sNCg0KVGhhbmtzIEpv
ZWwsIGl0IHdvcmtzIG5vdy4NCg0KYmVzdCByZWdhcmRzDQoNCkplZmYgQ2hhbg0KQVNSb2NrIElu
Yy4gDQpUZWw6ICs4ODYtMi01NTU5OTYwMCBleHQuMzg2NzANCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogSm9lbCBTdGFubGV5IFttYWlsdG86am9lbEBqbXMuaWQuYXVdIA0K
U2VudDogVHVlc2RheSwgSnVuZSA4LCAyMDIxIDI6MDAgUE0NClRvOiBKZWZmOSBDaGFuKOmZs+ad
vuWEiV9BU1JvY2tSYWNrKQ0KQ2M6IEJyYWRsZXkgVyBCaXNob3A7IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZzsgbWFuYWdlckBsZnByb2plY3RzLm9yZw0KU3ViamVjdDogUmU6IE9QRU5CTUMgQVNS
b2NrIFJhY2sNCg0KT24gVHVlLCA4IEp1biAyMDIxIGF0IDAyOjAxLCBKZWZmOSBDaGFuKOmZs+ad
vuWEiV9BU1JvY2tSYWNrKQ0KPEplZmY5X0NoYW5AYXNyb2NrcmFjay5jb20+IHdyb3RlOg0KPg0K
PiBSZS1zZW5kDQoNClBsZWFzZSB1c2UgcGxhaW4gdGV4dCBlbWFpbCB3aGVuIHBvc3RpbmcgdG8g
dGhlIGxpc3QuIFRoaXMgaXMgYSBnb29kDQpydWxlIHRvIGZvbGxvdyBmb3IgYWxsIG9wZW4gc291
cmNlIG1haWxpbmcgbGlzdHMuDQoNCj4gICAgICAgICBJIGdvdCBiZWxvdyBlcnJvciB3aGVuIEkg
dHJ5IHRvIHB1c2ggbWV0YS1hc3JvY2tyYWNrIGxheWVyIHRvIGdlcnJpdC4NCj4NCj4gICAgICAg
ICBJcyB0aGF0IG1lYW5zIG15IGVtYWlsIGlzIG5vdCBsaXN0ZWQgaW4gdGhlIGxpc3Q/DQo+DQo+
DQo+DQo+IFRvIHNzaDovL29wZW5ibWMuZ2Vycml0L29wZW5ibWMvb3BlbmJtYw0KPg0KPiAhIFty
ZW1vdGUgcmVqZWN0ZWRdICAgICBIRUFEIC0+IHJlZnMvZm9yL21hc3RlciAoY29tbWl0IDFkOTk1
MWM6IG5vdCBTaWduZWQtb2ZmLWJ5IGF1dGhvci9jb21taXR0ZXIvdXBsb2FkZXIgaW4gbWVzc2Fn
ZSBmb290ZXIpDQoNCkhlcmUgaXMgdGhlIGVycm9yOg0KDQogIChjb21taXQgMWQ5OTUxYzogbm90
IFNpZ25lZC1vZmYtYnkgYXV0aG9yL2NvbW1pdHRlci91cGxvYWRlciBpbg0KbWVzc2FnZSBmb290
ZXIpDQoNCj4gY29tbWl0IDFkOTk1MWM1NTE4YTdiZGY4OGE1ZGUxNmE0MWFlMmYzMzdlMWIyZWQg
KEhFQUQgLT4gbWFzdGVyKQ0KPg0KPiBBdXRob3I6IEplZmY5Q2hhbiA8amVmZjlfY2hhbkBhc3Jv
Y2tyYWNrLmNvbT4NCj4NCj4gRGF0ZTogICBUdWUgSnVuIDggMDk6MTU6NDQgMjAyMSArMDgwMA0K
Pg0KPg0KPg0KPiAgICAgYWRkIG1ldGEtYXNyb2NrcmFjayBsYXllcg0KPg0KPiAgICAgU2lnbmVk
LW9mZi1ieTogSmVmZiBDaGFuIDxKZWZmOV9DaGFuQGFzcm9ja3JhY2suY29tPg0KPg0KPg0KPg0K
PiAgICAgQ2hhbmdlLUlkOiBJMTY4NjEzM2UwMDkzZTRlMDBhZGVhZGMwNjg5NzIzOTZjOGRjNGZh
Yg0KDQogSSBzdXNwZWN0IEdlcnJpdCdzIGZpbHRlcmluZyBkaWRkbid0IG5vdGljZSB0aGUgcy1v
LWIgaW4gdGhlIG1pZGRsZQ0Kb2YgeW91ciBjb21taXQgbWVzc2FnZS4gTm9ybWFsIHN0eWxlIGlz
IHRvIHBsYWNlIGl0IGF0IHRoZSBib3R0b20gb2YNCnRoZSBvbiB0aGUgbGluZSBpbW1lZGlhdGVs
eSBhYm92ZSBvciBiZWxvdyB0aGUgY2hhbmdlIGlkLiBUcnkgZ2l0DQpjb21taXQgLS1hbWVuZCBh
bmQgbW92aW5nIGl0IHNvIHRoZSBtZXNzYWdlIGxvb2tzIGxpa2UgdGhpczoNCg0KQWRkIG1ldGEt
YXNyb2NrcmFjayBsYXllcg0KDQpDaGFuZ2UtSWQ6IEkxNjg2MTMzZTAwOTNlNGUwMGFkZWFkYzA2
ODk3MjM5NmM4ZGM0ZmFiDQpTaWduZWQtb2ZmLWJ5OiBKZWZmIENoYW4gPEplZmY5X0NoYW5AYXNy
b2NrcmFjay5jb20+DQoNCkNoZWVycywNCg0KSm9lbA0K
