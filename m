Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC03A36BE77
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 06:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTpby57C1z302Y
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 14:26:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=asrockrack.com (client-ip=43.251.62.79;
 helo=ms.pegatroncorp.com;
 envelope-from=prvs=7449c8fcc=charlotte_li@asrockrack.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Tue, 27 Apr 2021 13:46:19 AEST
Received: from ms.pegatroncorp.com (ms9.pegatroncorp.com [43.251.62.79])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FTnk30gYJz2xYx
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 13:46:17 +1000 (AEST)
IronPort-SDR: P5Hs0yck4KR+DHo5g6LzipDkbogQO2t5N2U8xzXD0b4WkCjN9FHXMNIwEWy7AN7ANZFI4c7nZb
 M4/BPDo8WT9DC6nsDr/zaINAQXrM+V8bGrY61JNUnr8jjNpQYZgSLeDt8XsiVFwoPaF8FeZGm+
 C+vngTFsVxYdVtp9BnYbzPwgUS3lR74Zogn3iMd2weCB4/m4kSIC0GyvrSGAxl7sXi3/eD4R+U
 YNLn3UtlLMRJ1Uy3v+fp+qhg6yPU7vC2zwO77R1KyOHaFRakE2NGBDWUyTjrLlaMYSWGmiCeRw
 AWw=
Received: from unknown (HELO PTW-MSE-AP01.pegatroncorp.com) ([172.18.6.20])
 by ms.pegatroncorp.com with ESMTP; 27 Apr 2021 11:45:04 +0800
Received: from PTW-EX-MBS04.PEGA.CORP.PEGATRON
 (ptw-ex-mbs04.pega.corp.pegatron [172.18.192.57])
 by PTW-MSE-AP01.pegatroncorp.com with ESMTP id 13R3iuGU054663;
 Tue, 27 Apr 2021 11:44:56 +0800 (GMT-8)
 (envelope-from Charlotte_Li@asrockrack.com)
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON (172.18.192.66) by
 PTW-EX-MBS04.PEGA.CORP.PEGATRON (172.18.192.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 27 Apr 2021 11:44:56 +0800
Received: from PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::1443:9952:a67d:5272])
 by PTW-EX-MBS11.PEGA.CORP.PEGATRON ([fe80::1443:9952:a67d:5272%3]) with mapi
 id 15.01.1847.012; Tue, 27 Apr 2021 11:44:56 +0800
From: =?utf-8?B?Q2hhcmxvdHRlIExpKOadjuS9s+S/kF9BU1JvY2tSYWNrKQ==?=
 <Charlotte_Li@asrockrack.com>
To: Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: asrock rack layer
Thread-Topic: asrock rack layer
Thread-Index: AQHXN3NAHLVt5DvQeEiU1BW0RvY3O6rAGYgAgAedeuA=
Date: Tue, 27 Apr 2021 03:44:56 +0000
Message-ID: <83f10aa7d0a84a2085c97d01168f2e84@asrockrack.com>
References: <20210422123001.fb6knneedeqrfgaz@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBB78A=7GTPEpfKBJSGgc=Ei_DaFN0p2F4NEKbsHxJfWA@mail.gmail.com>
In-Reply-To: <CAH2-KxBB78A=7GTPEpfKBJSGgc=Ei_DaFN0p2F4NEKbsHxJfWA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [220.129.239.141]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-AP01.pegatroncorp.com 13R3iuGU054663
X-Mailman-Approved-At: Tue, 27 Apr 2021 14:25:56 +1000
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
 =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRWQsDQoNCk5pY2UgdG8ga25vdyB5b3UhDQoNCkl0IHNlZW1zIFg1NzBENFUgaXMgbm90IHN1
Ym1pdHRlZCBieSBvdXIgdGVhbS4uLg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5
ei9jL29wZW5ibWMvb3BlbmJtYy8rLzQwNDYzDQoNCkp1c3QgY3VyaW91cywgdGhlIGRldmVsb3Bl
cnMgbGlzdGVkIGluIHNjaGVkdWxlIEEgYXJlIEplZmYgYW5kIExlbywgY2FuIHNvbWVvbmUgZWxz
ZSBtYWtlIGNvbnRyaWJ1dGlvbiBmb3IgQVNSb2NrIFJhY2sgdG9vPw0KDQpKZWZmIENoYW46IEpl
ZmY5X0NoYW5AYXNyb2NrcmFjay5jb20NCkxlbyBDaGFuZzogTGVvMl9DaGFuZ0Bhc3JvY2tyYWNr
LmNvbQ0KDQpUaGFuayB5b3UsDQoNCkNoYXJsb3R0ZQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IEVkIFRhbm91cyBbbWFpbHRvOmVkdGFub3VzQGdvb2dsZS5jb21dIA0KU2VudDog
VGh1cnNkYXksIEFwcmlsIDIyLCAyMDIxIDEwOjU0IFBNDQpUbzogQnJhZCBCaXNob3ANCkNjOiBD
aGFybG90dGUgTGko5p2O5L2z5L+QX0FTUm9ja1JhY2spOyBKZWZmOSBDaGFuKOmZs+advuWEiV9B
U1JvY2tSYWNrKTsgT3BlbkJNQyBNYWlsbGlzdA0KU3ViamVjdDogUmU6IGFzcm9jayByYWNrIGxh
eWVyDQoNCk9uIFRodSwgQXByIDIyLCAyMDIxIGF0IDU6MzAgQU0gQnJhZCBCaXNob3AgPGJyYWRs
ZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIEVkDQo+DQo+IFRoZSBmb2xr
cyBhdCBBU1JvY2sgUmFjayBhcmUgbG9va2luZyB0byBnZXQgYSBsYXllciBhZGRlZCB0byBPcGVu
Qk1DLg0KDQpGcm9tIGEgY29udmVyc2F0aW9uIHdpdGggdGhlIGFzcm9jayBzdXBwb3J0IGZvbGtz
IGl0IHNvdW5kZWQgbGlrZQ0KdGhlcmUgd2Fzbid0IGludGVyZXN0IGluIE9wZW5CTUMsIHNvIEkn
bSBnbGFkIHRvIGhlYXIgSSB3YXMgaWxsDQppbmZvcm1lZC4NCg0KPiBZb3UgYWxyZWFkeSBzdGFy
dGVkIHRoaXMgaGVyZToNCj4NCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9j
L29wZW5ibWMvb3BlbmJtYy8rLzQwNDYzDQo+DQo+IFlvdSBtZW50aW9uZWQgdGhlIGRldmljZSB0
cmVlIG5lZWRzIHRvIGJlIHVwc3RyZWFtZWQgLSBpcyB0aGF0IHRoZSBvbmx5DQo+IHJlbWFpbmlu
ZyB3b3JrIGl0ZW0/DQoNClRoZSBkZXZpY2UgdHJlZSByZWFsbHkgbmVlZHMgZmlsbGVkIG91dCBi
ZXR0ZXIsIHdoaWNoIGlzIHdoYXQgSSB3YXMNCnN0YWxsaW5nIG9uLiAgSSB3YXMgaGF2aW5nIHNv
bWUgdHJvdWJsZSBmaWd1cmluZyBvdXQgc29tZSBvZiB0aGUNCmRldmljZSBtYXBwaW5ncyB3aXRo
b3V0IHNjaGVtYXRpY3MsIHNvIHRoYXQgd291bGQgcHJvYmFibHkgYmUgdGhlIG5leHQNCndvcmsg
aXRlbS4NCg0KSSB3YXMgYWxzbyBwbGFubmluZyBvbiBtYWtpbmcgaXQgZW50aXR5LW1hbmFnZXIg
ZW5hYmxlZDsgIEknbSBhc3N1bWluZw0KdGhlIEFzcm9jayB0ZWFtIGlzIG9rIHdpdGggdGhhdCAo
YXMgb3Bwb3NlZCB0byBwaG9zcGhvci1od21vbiBiYXNlZCk/DQoNCkkgYWxzbyBiYXNlZCBpdCBv
biBhIFVCSSBpbWFnZSwgd2hpY2ggaXNuJ3QgdmVyeSBzdGFuZGFyZDsgIEknbQ0KZ3Vlc3Npbmcg
d2UnbGwgd2FudCB0byBhZGp1c3QgaXQgdG8gdXNlIGEgbW9yZSBjb21tb24gaW1hZ2UgbGF5b3V0
Lg0KDQo+DQo+IEFTUm9jayBSYWNrIHRlYW0gLSBpZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGFi
b3V0IGhvdyB0byBoZWxwIEVkIChvcg0KPiBldmVuIHRha2Ugb3ZlciB0aGUgcGF0Y2gpIHBsZWFz
ZSBhc2sgaGVyZSAtIHdlIGFyZSBoZXJlIHRvIGhlbHAhDQoNCkdsYWQgdG8gaGF2ZSB5b3UgZ3V5
cyBvbmJvYXJkLg0KDQo+DQo+IHRoeCAtIGJyYWQNCg==
