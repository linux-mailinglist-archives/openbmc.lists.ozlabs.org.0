Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C5839EBEF
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 04:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzYyh11Gdz306Z
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:26:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=asrockrack.com (client-ip=43.251.62.79;
 helo=ms.pegatroncorp.com;
 envelope-from=prvs=7865c0f22=jeff9_chan@asrockrack.com; receiver=<UNKNOWN>)
Received: from ms.pegatroncorp.com (ms9.pegatroncorp.com [43.251.62.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FzYyQ5j9gz2xts
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 12:26:18 +1000 (AEST)
IronPort-SDR: 5/YcjeyfQ9GUsewAVHhhZ0rVsmJKT7rOsy94f9Y3IdkSP61dT+JPiYYWsjuicedYqUAl3RsUj9
 EH4Qew/Z8xq3T3tOPatOzTLKn1txXPCz+TYX/k+yeDS6Opbg5TdLeo9X/0BWWrquKsyag2GbaB
 gbZ/0MoK9LylOxx/GaaCzUuh5KHuVKDlVeICRSReH14SwQrsWkbUxJ6Ij3mBINBhWARekTokTi
 xXEh+05PXzEbMAvktrdI78JGWKyJIDU7OF5Nj2IFmRz3d1rKcGFmHIex4bFcyO6BaXJ0rz0aHS
 dgI=
Received: from unknown (HELO PTW-MSE-AP01.pegatroncorp.com) ([172.18.6.20])
 by ms.pegatroncorp.com with ESMTP; 08 Jun 2021 10:26:15 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON
 (ptw-ex-mbs11.pega.corp.pegatron [172.18.192.66])
 by PTW-MSE-AP01.pegatroncorp.com with ESMTP id 1582Q7Kj010084;
 Tue, 8 Jun 2021 10:26:07 +0800 (GMT-8)
 (envelope-from Jeff9_Chan@asrockrack.com)
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) by
 PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 8 Jun 2021 10:26:08 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037])
 by PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037%3]) with mapi
 id 15.01.1847.012; Tue, 8 Jun 2021 10:26:08 +0800
From: =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
To: Ed Tanous <edtanous@google.com>, "outlook_60A7133428934D5F@outlook.com"
 <ckimchan17@gmail.com>
Subject: RE: How to submit meta subfolder
Thread-Topic: How to submit meta subfolder
Thread-Index: AQHXV8Kgi/pOX9lzdEqBCLcrQgWq1KsJatZA
Date: Tue, 8 Jun 2021 02:26:07 +0000
Message-ID: <2e22794576244c2c926631e3e6093a38@asrockrack.com>
References: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>
 <YK+SUUXRcek2KzBv@heinlein> <DE99272B-68FA-4E37-9804-05EACE890184@hxcore.ol>
 <CAH2-KxD+-qc1EBOU5yXJb9ijjcpmLym-g5Kjqp5gkc1Eq9vPeg@mail.gmail.com>
In-Reply-To: <CAH2-KxD+-qc1EBOU5yXJb9ijjcpmLym-g5Kjqp5gkc1Eq9vPeg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-AP01.pegatroncorp.com 1582Q7Kj010084
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

SGksDQpUaGFua3MgZm9yIGhlbHBpbmcuDQogICAgICAgIEkgZ290IGJlbG93IGVycm9yIHdoZW4g
SSB0cnkgdG8gcHVzaCBtZXRhLWFzcm9ja3JhY2sgbGF5ZXIgdG8gZ2Vycml0Lg0KICAgICAgICBJ
cyB0aGF0IG1lYW5zIG15IGVtYWlsIGlzIG5vdCBsaXN0ZWQgaW4gdGhlIGxpc3Q/DQoNClRvIHNz
aDovL29wZW5ibWMuZ2Vycml0L29wZW5ibWMvb3BlbmJtYw0KISBbcmVtb3RlIHJlamVjdGVkXSAg
ICAgSEVBRCAtPiByZWZzL2Zvci9tYXN0ZXIgKGNvbW1pdCAxZDk5NTFjOiBub3QgU2lnbmVkLW9m
Zi1ieSBhdXRob3IvY29tbWl0dGVyL3VwbG9hZGVyIGluIG1lc3NhZ2UgZm9vdGVyKQ0KZXJyb3I6
IGZhaWxlZCB0byBwdXNoIHNvbWUgcmVmcyB0byAnc3NoOi8vb3BlbmJtYy5nZXJyaXQvb3BlbmJt
Yy9vcGVuYm1jJw0KDQogICAgICAgIE15IHByb2NlZHVyZSBpczoNCjEuCUdpdCBjbG9uZSBvcGVu
Ym1jDQoyLglBZGQgbWV0YS1hc3JvY2tyYWNrIGxheWVyDQozLglnaXQgcmVtb3RlIGFkZCBnZXJy
aXQgc3NoOi8vb3BlbmJtYy5nZXJyaXQvb3BlbmJtYy9vcGVuYm1jDQo0LglnaXQgY29tbWl0DQo1
LglnaXQgcHVzaCBnZXJyaXQNCg0KTXkgZ2l0IGxvZzoNCmNvbW1pdCAxZDk5NTFjNTUxOGE3YmRm
ODhhNWRlMTZhNDFhZTJmMzM3ZTFiMmVkIChIRUFEIC0+IG1hc3RlcikNCkF1dGhvcjogSmVmZjlD
aGFuIDxqZWZmOV9jaGFuQGFzcm9ja3JhY2suY29tPg0KRGF0ZTogICBUdWUgSnVuIDggMDk6MTU6
NDQgMjAyMSArMDgwMA0KDQogICAgYWRkIG1ldGEtYXNyb2NrcmFjayBsYXllcg0KICAgIFNpZ25l
ZC1vZmYtYnk6IEplZmYgQ2hhbiA8SmVmZjlfQ2hhbkBhc3JvY2tyYWNrLmNvbT4NCiAgICANCiAg
ICBDaGFuZ2UtSWQ6IEkxNjg2MTMzZTAwOTNlNGUwMGFkZWFkYzA2ODk3MjM5NmM4ZGM0ZmFiDQoN
Cg0KYmVzdCByZWdhcmRzDQoNCkplZmYgQ2hhbg0KQVNSb2NrIEluYy4gDQpUZWw6ICs4ODYtMi01
NTU5OTYwMCBleHQuMzg2NzANCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
RWQgVGFub3VzIFttYWlsdG86ZWR0YW5vdXNAZ29vZ2xlLmNvbV0gDQpTZW50OiBXZWRuZXNkYXks
IEp1bmUgMiwgMjAyMSAxMToxOSBQTQ0KVG86IG91dGxvb2tfNjBBNzEzMzQyODkzNEQ1RkBvdXRs
b29rLmNvbQ0KQ2M6IFBhdHJpY2sgV2lsbGlhbXM7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsg
SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjaykNClN1YmplY3Q6IFJlOiBIb3cgdG8gc3Vi
bWl0IG1ldGEgc3ViZm9sZGVyDQoNCk9uIFRodSwgTWF5IDI3LCAyMDIxIGF0IDU6NDkgUE0gb3V0
bG9va182MEE3MTMzNDI4OTM0RDVGQG91dGxvb2suY29tDQo8Y2tpbWNoYW4xN0BnbWFpbC5jb20+
IHdyb3RlOg0KPg0KPiBIaSBQYXRyaWNrLA0KPg0KPiAgICAgICAgIFRoYW5rcyBmb3IgaGVscGlu
ZywgSSBjaGVja2VkIGJlbG93IGRvY3VtZW50IGFuZCBpdCBzYWlkOg0KPg0KPg0KPg0KPiBGcm9t
IHlvdXIgT3BlbkJNQyBnaXQgcmVwb3NpdG9yeSwgYWRkIGEgcmVtb3RlIHRvIHRoZSBHZXJyaXQg
c2VydmVyLCB3aGVyZSAnb3BlbmJtY19yZXBvJyBpcyB0aGUgY3VycmVudCBnaXQgcmVwb3NpdG9y
eSB5b3UncmUgd29ya2luZyBvbiwgc3VjaCBhcyBwaG9zcGhvci1zdGF0ZS1tYW5hZ2VyLCBhbmQg
J29wZW5ibWMuZ2Vycml0JyBpcyB0aGUgbmFtZSBvZiB0aGUgSG9zdCBwcmV2aW91c2x5IGFkZGVk
Og0KPg0KPiBnaXQgcmVtb3RlIGFkZCBnZXJyaXQgc3NoOi8vb3BlbmJtYy5nZXJyaXQvb3BlbmJt
Yy9vcGVuYm1jX3JlcG8NCj4NCj4NCj4NCj4NCj4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvZG9jcy9ibG9iL21hc3Rlci9DT05UUklCVVRJTkcubWQjc3VibWl0dGluZy1jaGFuZ2VzLXZp
YS1nZXJyaXQtc2VydmVyLXRvLW9wZW5ibWMNCj4NCj4NCj4NCj4gc2hvdWxkIEkgdXNlIGJlbG93
IGNvbW1hbmQgdG8gY3JlYXRlIG1ldGEgbGF5ZXI/DQo+DQo+IGdpdCByZW1vdGUgYWRkIGdlcnJp
dCBzc2g6Ly9vcGVuYm1jLmdlcnJpdC9vcGVuYm1jL29wZW5ibWMvbWV0YS1hc3JvY2tyYWNrDQoN
ClRoZXJlIGlzIG5vIGdpdCByZXBvIGNhbGxlZCBtZXRhLWFzcm9ja3JhY2suICBUbyBkbyB0aGlz
IHlvdSBuZWVkIHRvDQpzdWJtaXQgdGhpcyBhcyBhIG5ldyBmb2xkZXIgdG8NCnNzaDovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6OjI5NDE4L29wZW5ibWMvb3BlbmJtYw0KDQo+DQo+DQo+DQo+
IEplZmYNCj4NCj4NCj4NCj4g5a+E5Lu26ICFOiBQYXRyaWNrIFdpbGxpYW1zDQo+IOWCs+mAgeaZ
gumWkzogMjAyMeW5tDXmnIgyN+aXpSDkuIvljYggMDg6MzYNCj4g5pS25Lu26ICFOiBKZWZmDQo+
IOWJr+acrDogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBqZWZmOV9jaGFuQGFzcm9ja3JhY2su
Y29tDQo+IOS4u+aXqDogUmU6IEhvdyB0byBzdWJtaXQgbWV0YSBzdWJmb2xkZXINCj4NCj4NCj4N
Cj4gT24gVGh1LCBNYXkgMjcsIDIwMjEgYXQgMDE6MDQ6MzdQTSArMDgwMCwgSmVmZiB3cm90ZToN
Cj4NCj4gPiBIaSwNCj4NCj4gPg0KPg0KPiA+IFdlIHdvdWxkIGxpa2UgdG8gc3VibWl0IG1ldGEt
YXNyb2NrcmFjayBhcyBhIHN1YiBmb2xkZXIgb2Ygb3BlbmJtYy4NCj4NCj4gPg0KPg0KPiA+IEkg
Zm9sbG93ZWQgdGhlIHN0ZXBzIGRlc2NyaWJlIGluIHRoZSBkb2N1bWVudCB0byBhZGQgcmVtb3Rl
IHNlcnZlcjoNCj4NCj4gPiAgICAgICBnaXQgcmVtb3RlIGFkZCBnZXJyaXQgc3NoOi8vb3BlbmJt
Yy5nZXJyaXQvb3BlbmJtYy9tZXRhLWFzcm9ja3JhY2sNCj4NCj4NCj4NCj4gV2hpY2ggZG9jdW1l
bnQgaXMgdGhpcz8NCj4NCj4NCj4NCj4gUHJldmlvdXNseSB5b3UgaGFkIHRvIHJlcXVlc3QgYSBt
ZXRhLWxheWVyIHJlcG9zaXRvcnkgYmUgY3JlYXRlZCBidXQNCj4NCj4gYWJvdXQgNC02IG1vbnRo
cyBhZ28gd2UgbW92ZWQgdG8gYSBtb2RlbCB3aGVyZSBhbGwgbGF5ZXIgY29kZSBpcyBpbiB0aGUN
Cj4NCj4gc2luZ2xlIG9wZW5ibWMvb3BlbmJtYyByZXBvc2l0b3J5LiAgV2UgbWF5IGhhdmUgbWlz
c2VkIGEgZG9jdW1lbnRhdGlvbg0KPg0KPiB1cGRhdGUgc29tZXdoZXJlLg0KPg0KPg0KPg0KPiA+
IHdoZW4gSSB0cmllZCB0byBwdXNoIGl0IEkgZ290IGJlbG93IGVycm9yOg0KPg0KPiA+ICAgICAg
ZmF0YWw6IHByb2plY3Qgb3BlbmJtYy9tYXRhLWFzcm9ja3JhY2sgbm90IGZvdW5kDQo+DQo+ID4g
ICAgICBmYXRhbDogQ291bGQgbm90IHJlYWQgZnJvbSByZW1vdGUgcmVwb3NpdG9yeS4NCj4NCj4g
Pg0KPg0KPiA+ICAgICAgUGxlYXNlIG1ha2Ugc3VyZSB5b3UgaGF2ZSB0aGUgY29ycmVjdCBhY2Nl
c3MgcmlnaHRzDQo+DQo+ID4gICAgICBhbmQgdGhlIHJlcG9zaXRvcnkgZXhpc3RzLg0KPg0KPg0K
Pg0KPiBZb3UnbGwgd2FudCB0byBzZXQgeW91ciByZW1vdGUgdG8gc3NoOi8vb3BlbmJtYy5nZXJy
aXQvb3BlbmJtYy9vcGVuYm1jDQo+DQo+IGFuZCBwdXNoIHRoZXJlLiAgSWRlYWxseSB5b3Ugd291
bGQgaGF2ZSBvcmlnaW5hbGx5IGNsb25lZCBmcm9tIHRoZXJlIGFuZA0KPg0KPiBkb25lIHlvdXIg
d29yayBvbiB0aGF0IHJlcG9zaXRvcnkuDQo+DQo+DQo+DQo+IC0tDQo+DQo+IFBhdHJpY2sgV2ls
bGlhbXMNCj4NCj4NCg==
