Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A352D39ED2B
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 05:51:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzbrS1MtBz307N
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 13:51:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=asrockrack.com (client-ip=43.251.62.79;
 helo=ms.pegatroncorp.com;
 envelope-from=prvs=7865c0f22=jeff9_chan@asrockrack.com; receiver=<UNKNOWN>)
Received: from ms.pegatroncorp.com (ms9.pegatroncorp.com [43.251.62.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fzbr86yLzz2yXL
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 13:50:58 +1000 (AEST)
IronPort-SDR: Xsj9YkX4zjxufjUNxys2zrzT4SuVMI1XWMtIk099AUMRaH5ai82hZ+nxwiXoDXTiVmiHsXKTaT
 uekRUVQxHqa/7vlOG7M/1jlDTnPB90qlynw9BJlOE+qzq3sbngG8t/hJVZ6k3I0/oZ9QdJLa3k
 FykcP3qSY2e0oJubYE2hkvRYu+FEauNfQtHPv+4oZSJJmtloOrzr17u2tnMMkR95RIMvUz+hFb
 bHjviU4ytScUtVLacH3ViG8eX2O7WjEVaUqvrG8sAlkiLiuehMXooWKNBz9QKlNFTp3uz9B1LL
 Uvo=
Received: from unknown (HELO PTW-MSE-AP01.pegatroncorp.com) ([172.18.6.20])
 by ms.pegatroncorp.com with ESMTP; 08 Jun 2021 11:50:56 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON
 (ptw-ex-mbs11.pega.corp.pegatron [172.18.192.66])
 by PTW-MSE-AP01.pegatroncorp.com with ESMTP id 1583oni7041977;
 Tue, 8 Jun 2021 11:50:49 +0800 (GMT-8)
 (envelope-from Jeff9_Chan@asrockrack.com)
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) by
 PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 8 Jun 2021 11:50:50 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037])
 by PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::35ca:6b59:40d1:9037%3]) with mapi
 id 15.01.1847.012; Tue, 8 Jun 2021 11:50:50 +0800
From: =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
To: Milton Miller II <miltonm@us.ibm.com>
Subject: RE: OPENBMC ASRock Rack
Thread-Topic: OPENBMC ASRock Rack
Thread-Index: AdY9OXpuPaiukNl5Rq6zENcUsPakygASUFgAABxnw6AAcpRYAAAlt3/wAAUnEIAAnS95QAAtf9yAPKwW60AADRa7AAA0of1ACS8FOkAAAHVfgP//hlWA//9oS/A=
Date: Tue, 8 Jun 2021 03:50:50 +0000
Message-ID: <aae2e2f2dfa944d48c68ec88e8737184@asrockrack.com>
References: <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>,
 <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>, 
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>,
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>,
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>,
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
 <OF7C257395.C3DF5032-ON002586EE.000EE5B8-002586EE.000F1B0F@ibm.com>
In-Reply-To: <OF7C257395.C3DF5032-ON002586EE.000EE5B8-002586EE.000F1B0F@ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-AP01.pegatroncorp.com 1583oni7041977
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

SGkgTWlsdG9uLA0KCU15IHVzZXIgYWNjb3VudCBpbiBHaXRodWIvR2Vycml0IGlzIEplZmY5Q2hh
biwgYnV0IHJlZ2lzdGVyZWQgQ0xBIGFjY291bnQgaXMgJ0plZmYgQ2hhbiA8IEplZmY5X0NoYW5A
YXNyb2NrcmFjay5jb20+Jw0KCVNob3VsZCBJIHJlLXJlZ2lzdGVyIENMQSBpbmZvPw0KDQpiZXN0
IHJlZ2FyZHMNCg0KSmVmZiBDaGFuDQpBU1JvY2sgSW5jLiANClRlbDogKzg4Ni0yLTU1NTk5NjAw
IGV4dC4zODY3MA0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNaWx0b24g
TWlsbGVyIElJIFttYWlsdG86bWlsdG9ubUB1cy5pYm0uY29tXSANClNlbnQ6IFR1ZXNkYXksIEp1
bmUgOCwgMjAyMSAxMDo0NSBBTQ0KVG86IEplZmY5IENoYW4o6Zmz5p2+5YSJX0FTUm9ja1JhY2sp
DQpDYzogQnJhZGxleSBXIEJpc2hvcDsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBtYW5hZ2Vy
QGxmcHJvamVjdHMub3JnDQpTdWJqZWN0OiBSRTogT1BFTkJNQyBBU1JvY2sgUmFjaw0KDQpPbiBK
dW5lIDYsIDIwMjEsIEplZmYgQ2hhbiB3cm90ZToNCj4gIEhpIEJyYWRsZXksDQo+ICAgICAgICAg
IEkgZ290IGJlbG93IGVycm9yIHdoZW4gSSB0cnkgdG8gcHVzaCBtZXRhLWFzcm9ja3JhY2sgbGF5
ZXINCj50byBnZXJyaXQuDQo+ICAgICAgICAgIElzIHRoYXQgbWVhbnMgbXkgZW1haWwgaXMgbm90
IGxpc3RlZCBpbiB0aGUgbGlzdD8NCj4gICANCj4gIFRvIHNzaDovL29wZW5ibWMuZ2Vycml0L29w
ZW5ibWMvb3BlbmJtYw0KPiAgISBbcmVtb3RlIHJlamVjdGVkXSAgICAgSEVBRCAtPiByZWZzL2Zv
ci9tYXN0ZXIgKGNvbW1pdCAxZDk5NTFjOg0KPm5vdCBTaWduZWQtb2ZmLWJ5IGF1dGhvci9jb21t
aXR0ZXIvdXBsb2FkZXIgaW4gbWVzc2FnZSBmb290ZXIpDQo+ICBlcnJvcjogZmFpbGVkIHRvIHB1
c2ggc29tZSByZWZzIHRvDQo+J3NzaDovL29wZW5ibWMuZ2Vycml0L29wZW5ibWMvb3BlbmJtYycN
Cj4gICANCj4gICAgICAgICAgTXkgcHJvY2VkdXJlIGlzOg0KPiAgICAxLiAgICAgICBHaXQgY2xv
bmUgb3BlbmJtYw0KPiAgICAyLiAgICAgICBBZGQgbWV0YS1hc3JvY2tyYWNrIGxheWVyDQo+ICAg
IDMuICAgICAgIGdpdCByZW1vdGUgYWRkIGdlcnJpdA0KPnNzaDovL29wZW5ibWMuZ2Vycml0L29w
ZW5ibWMvb3BlbmJtYw0KPiAgICA0LiAgICAgICBnaXQgY29tbWl0DQo+ICAgIDUuICAgICAgIGdp
dCBwdXNoIGdlcnJpdA0KPiAgIA0KPiAgTXkgZ2l0IGxvZzoNCj4gIGNvbW1pdCAxZDk5NTFjNTUx
OGE3YmRmODhhNWRlMTZhNDFhZTJmMzM3ZTFiMmVkIChIRUFEIC0+IG1hc3RlcikNCj4gIEF1dGhv
cjogSmVmZjlDaGFuIDxqZWZmOV9jaGFuQGFzcm9ja3JhY2suY29tPg0KDQpUaGUgQXV0aG9yIG5h
bWUgaXMgSmVmZjlDaGFuIGhlcmUNCg0KPiAgRGF0ZTogICBUdWUgSnVuIDggMDk6MTU6NDQgMjAy
MSArMDgwMA0KPiAgIA0KPiAgICAgIGFkZCBtZXRhLWFzcm9ja3JhY2sgbGF5ZXINCj4gICAgICBT
aWduZWQtb2ZmLWJ5OiBKZWZmIENoYW4gPEplZmY5X0NoYW5AYXNyb2NrcmFjay5jb20+DQoNClRo
ZSBTaWduZWQtb2ZmLWJ5IGlzIEplZmYgQ2hhbiBoZXJlLg0KDQpUaGUgZW1haWwgaGFzIGRpZmZl
cmVudCBjYXNlLCBub3Qgc3VyZSBpZiB0aGF0IG1hdHRlcnMuICBCdXQgdGhlIA0KbmFtZSBmb3Jt
YXQgbGlrbGV5IGRvZXMuDQoNCllvdSBjYW4gY29udHJvbCB0aGUgZm9ybWF0IG9mIHRoZSBhdXRo
b3IgYW5kIGNvbW1pdHRlciB2aWEgDQpnaXQgY29uZmlnIC0tZ2xvYmFsIHVzZXIubmFtZSAgIkpl
ZmYgQ2hhbiINCmdpdCBjb25maWcgLS1nbG9iYWwgdXNlci5lbWFpbCBKZWZmOV9DaGFuQGFzcm9j
a3JhY2suY29tDQoNCllvdSBjYW4gYW1lbmQgdGhlIGF1dGhvciB3aXRoIGdpdCBjb21taXQgLS1h
bWVuZCAtLXJlc2V0LWF1dGhvcg0KDQpIb3BlIHRoaXMgaGVscHMsDQptaWx0b24NCg==
