Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9F439EEF2
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 08:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzgmV6p87z301D
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 16:48:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=asrockrack.com (client-ip=43.251.60.7; helo=ms.pegatroncorp.com;
 envelope-from=jeff9_chan@asrockrack.com; receiver=<UNKNOWN>)
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FzgmC6jCcz2xvZ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 16:47:51 +1000 (AEST)
IronPort-SDR: bfRANRC8FNClM4yWnmb7eKbkYQF42YE8ChDNH4u/ZGyBqHRq0YdcncoHxr4dM/hk9L69JJ9eok
 j2Sd+uLXnwoQfAgxlo4CKB2W2ZVBdT26KW/BELQJJ0VgZmcE+GHdQ9oD4em+oLagFXbHgqFlqe
 rLhMVqb2Mh7yWAhCjEgs3doiD9r8kKkM3TGoLqB9gTQ4Ia3Asc+3tJEJIXSkoLH0oGHCHHgbzU
 QZmlqbrVQDhuG5bEy8g4iyhzdJFHI+PJU88B/S62e4TskJxHtXBERMxyWLXU0JHzNvMyTNA+WF
 QJc=
Received: from unknown (HELO PTW-MSE-DB01.pegatroncorp.com) ([172.18.6.20])
 by ms.pegatroncorp.com with ESMTP; 08 Jun 2021 14:47:48 +0800
Received: from PTW-EX-MBS04.PEGA.CORP.PEGATRON
 (ptw-ex-mbs04.pega.corp.pegatron [172.18.192.57])
 by PTW-MSE-DB01.pegatroncorp.com with ESMTP id 1586laRn008349;
 Tue, 8 Jun 2021 14:47:36 +0800 (GMT-8)
 (envelope-from Jeff9_Chan@asrockrack.com)
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) by
 PTW-EX-MBS04.PEGA.CORP.PEGATRON (172.18.192.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 8 Jun 2021 14:47:37 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037])
 by PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037%3]) with mapi
 id 15.01.1847.012; Tue, 8 Jun 2021 14:47:37 +0800
From: =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: OPENBMC ASRock Rack
Thread-Topic: OPENBMC ASRock Rack
Thread-Index: AdY9OXpuPaiukNl5Rq6zENcUsPakygASUFgAABxnw6AAcpRYAAAlt3/wAAUnEIAAnS95QAAtf9yAPKwW60AADRa7AAA0of1ACS8FOkAAAHVfgP//vMeA//9szMA=
Date: Tue, 8 Jun 2021 06:47:37 +0000
Message-ID: <6ae23bb96e4d45eabfce5dfca603eed9@asrockrack.com>
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
In-Reply-To: <CACPK8Xfi9FBjPyLdy45C=hy-e4wktLrTp3UmFhH59oaaz0yTYQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-DB01.pegatroncorp.com 1586laRn008349
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

VGhhbmtzIEpvZWwsIGl0IHdvcmtzIG5vdy4NCg0KYmVzdCByZWdhcmRzDQoNCkplZmYgQ2hhbg0K
QVNSb2NrIEluYy4gDQpUZWw6ICs4ODYtMi01NTU5OTYwMCBleHQuMzg2NzANCg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSm9lbCBTdGFubGV5IFttYWlsdG86am9lbEBqbXMu
aWQuYXVdIA0KU2VudDogVHVlc2RheSwgSnVuZSA4LCAyMDIxIDI6MDAgUE0NClRvOiBKZWZmOSBD
aGFuKOmZs+advuWEiV9BU1JvY2tSYWNrKQ0KQ2M6IEJyYWRsZXkgVyBCaXNob3A7IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsgbWFuYWdlckBsZnByb2plY3RzLm9yZw0KU3ViamVjdDogUmU6IE9Q
RU5CTUMgQVNSb2NrIFJhY2sNCg0KT24gVHVlLCA4IEp1biAyMDIxIGF0IDAyOjAxLCBKZWZmOSBD
aGFuKOmZs+advuWEiV9BU1JvY2tSYWNrKQ0KPEplZmY5X0NoYW5AYXNyb2NrcmFjay5jb20+IHdy
b3RlOg0KPg0KPiBSZS1zZW5kDQoNClBsZWFzZSB1c2UgcGxhaW4gdGV4dCBlbWFpbCB3aGVuIHBv
c3RpbmcgdG8gdGhlIGxpc3QuIFRoaXMgaXMgYSBnb29kDQpydWxlIHRvIGZvbGxvdyBmb3IgYWxs
IG9wZW4gc291cmNlIG1haWxpbmcgbGlzdHMuDQoNCj4gICAgICAgICBJIGdvdCBiZWxvdyBlcnJv
ciB3aGVuIEkgdHJ5IHRvIHB1c2ggbWV0YS1hc3JvY2tyYWNrIGxheWVyIHRvIGdlcnJpdC4NCj4N
Cj4gICAgICAgICBJcyB0aGF0IG1lYW5zIG15IGVtYWlsIGlzIG5vdCBsaXN0ZWQgaW4gdGhlIGxp
c3Q/DQo+DQo+DQo+DQo+IFRvIHNzaDovL29wZW5ibWMuZ2Vycml0L29wZW5ibWMvb3BlbmJtYw0K
Pg0KPiAhIFtyZW1vdGUgcmVqZWN0ZWRdICAgICBIRUFEIC0+IHJlZnMvZm9yL21hc3RlciAoY29t
bWl0IDFkOTk1MWM6IG5vdCBTaWduZWQtb2ZmLWJ5IGF1dGhvci9jb21taXR0ZXIvdXBsb2FkZXIg
aW4gbWVzc2FnZSBmb290ZXIpDQoNCkhlcmUgaXMgdGhlIGVycm9yOg0KDQogIChjb21taXQgMWQ5
OTUxYzogbm90IFNpZ25lZC1vZmYtYnkgYXV0aG9yL2NvbW1pdHRlci91cGxvYWRlciBpbg0KbWVz
c2FnZSBmb290ZXIpDQoNCj4gY29tbWl0IDFkOTk1MWM1NTE4YTdiZGY4OGE1ZGUxNmE0MWFlMmYz
MzdlMWIyZWQgKEhFQUQgLT4gbWFzdGVyKQ0KPg0KPiBBdXRob3I6IEplZmY5Q2hhbiA8amVmZjlf
Y2hhbkBhc3JvY2tyYWNrLmNvbT4NCj4NCj4gRGF0ZTogICBUdWUgSnVuIDggMDk6MTU6NDQgMjAy
MSArMDgwMA0KPg0KPg0KPg0KPiAgICAgYWRkIG1ldGEtYXNyb2NrcmFjayBsYXllcg0KPg0KPiAg
ICAgU2lnbmVkLW9mZi1ieTogSmVmZiBDaGFuIDxKZWZmOV9DaGFuQGFzcm9ja3JhY2suY29tPg0K
Pg0KPg0KPg0KPiAgICAgQ2hhbmdlLUlkOiBJMTY4NjEzM2UwMDkzZTRlMDBhZGVhZGMwNjg5NzIz
OTZjOGRjNGZhYg0KDQogSSBzdXNwZWN0IEdlcnJpdCdzIGZpbHRlcmluZyBkaWRkbid0IG5vdGlj
ZSB0aGUgcy1vLWIgaW4gdGhlIG1pZGRsZQ0Kb2YgeW91ciBjb21taXQgbWVzc2FnZS4gTm9ybWFs
IHN0eWxlIGlzIHRvIHBsYWNlIGl0IGF0IHRoZSBib3R0b20gb2YNCnRoZSBvbiB0aGUgbGluZSBp
bW1lZGlhdGVseSBhYm92ZSBvciBiZWxvdyB0aGUgY2hhbmdlIGlkLiBUcnkgZ2l0DQpjb21taXQg
LS1hbWVuZCBhbmQgbW92aW5nIGl0IHNvIHRoZSBtZXNzYWdlIGxvb2tzIGxpa2UgdGhpczoNCg0K
QWRkIG1ldGEtYXNyb2NrcmFjayBsYXllcg0KDQpDaGFuZ2UtSWQ6IEkxNjg2MTMzZTAwOTNlNGUw
MGFkZWFkYzA2ODk3MjM5NmM4ZGM0ZmFiDQpTaWduZWQtb2ZmLWJ5OiBKZWZmIENoYW4gPEplZmY5
X0NoYW5AYXNyb2NrcmFjay5jb20+DQoNCkNoZWVycywNCg0KSm9lbA0K
