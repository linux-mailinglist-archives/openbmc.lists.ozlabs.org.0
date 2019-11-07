Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBA1F245D
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:38:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477mHx3cKpzDrQW
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 12:38:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=207dc2916=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 477mHG6NrPzF3tP
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 12:37:25 +1100 (AEDT)
IronPort-SDR: 86Mnr1GkIvSo+WbBljTZ+07slJPrBvfY/tp3yyrng0js5Xx16ZPY7dyCVPASGxsy5YJPShOBi/
 EHQPImzVCUQg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 07 Nov 2019 09:37:23 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 09:37:19 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 7 Nov 2019 09:37:19 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Questions about openbmc-test-automation
Thread-Topic: Questions about openbmc-test-automation
Thread-Index: AdWTti27hCt8Gg0PRByoyfDQiVK6a///m0GA//49oFCAAxfEAP/+R8Lw
Date: Thu, 7 Nov 2019 01:37:19 +0000
Message-ID: <dea6fe3ac2b44de881f105adc9a0f8ba@quantatw.com>
References: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
 <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
 <37a55521de3843c6a407e7faeb68f693@quantatw.com>
 <CAAMkS10zqHVNv-x8pLBtyDJVm2xTjTROHSqsA6SeELZ953wz-w@mail.gmail.com>
In-Reply-To: <CAAMkS10zqHVNv-x8pLBtyDJVm2xTjTROHSqsA6SeELZ953wz-w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25026.004
x-tm-as-result: No-10--5.282000-5.000000
x-tmase-matchedrid: vEvJ7Rh1lGjuo96mfIBuopzEHTUOuMX33dCmvEa6IiGoLZarzrrPmdou
 H2hORci0i8nLlIazgBj4t7nX2oD1r9wGyLnS1FSdANnNowADAjtYO2sJv8HaEE9CJC/MWIZ4oua
 XE/reSZmea2VosLlQqxTPLzDwJ6seJNdcnIl+MB8WqJ/PBjhtWqcaC4L+0t7ARZrOmBLNtw90Ev
 cZ8PCAVxW7SA7Yt0qBn45TzlTUSPmD66TlvUkVYNbgzPjrV+wc9VTWHezETrwREWgPwB+LAZAaN
 p2uvngx2K0n174XRBaU445mRfcQTr9jX++auvv+bRZGrsoeW/hDfut2Lc1Yh7xgMf9QE2ebc3wu
 qc+4Wow8MwCgiSCug3lySYZqUQo4IqRxG3EBiTfnzlXMYw4XMD3Al4zalJpFwrbXMGDYqV+FR9H
 au8GO7hXaZD8cTk9u6ORqTko5XSVHU/up884/9JMCArjrcNouPQqW0p4jTjs=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.282000-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25026.004
x-tm-snts-smtp: 235862DAC1FCECC7DABC903C8C18F96757D8294E6C9869FB02E7185356F135922000:B
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGkgUmFodWwsDQoNCkl0IHNvdW5kcyBnb29kIHRvIG1lIGFuZCBJIHdvdWxkIGxpa2UgdG8gZHJv
cCBjb2RlIGNoYW5nZS4NCg0KRnJvbTogUmFodWwgTWFoZXNod2FyaSA8cmFodWxtYWhlc2h3YXJp
MDFAZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgNiwgMjAxOSAzOjEzIFBN
DQpUbzogVG9ueSBMZWUgKOadjuaWh+WvjCkgPFRvbnkuTGVlQHF1YW50YXR3LmNvbT4NCkNjOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBRdWVzdGlvbnMgYWJvdXQgb3Bl
bmJtYy10ZXN0LWF1dG9tYXRpb24NCg0KWWVzLCB0aGF0IGlzIGNvcnJlY3Qgd2F5Lg0KDQpPbiBX
ZWQsIE5vdiA2LCAyMDE5IGF0IDExOjIyIEFNIFRvbnkgTGVlICjmnY7mloflr4wpIDxtYWlsdG86
VG9ueS5MZWVAcXVhbnRhdHcuY29tPiB3cm90ZToNCkhpIFJhaHVsLA0KDQpGb3IgZXhhbXBsZSwg
Y2FzZSAiUmV0cmlldmUgSVAgQWRkcmVzcyBWaWEgSVBNSSBBbmQgVmVyaWZ5IFVzaW5nIFJlZGZp
c2giIGluIC9pcG1pL3Rlc3RfaXBtaV9uZXR3b3JrLnJvYm90Lg0KVGhlIG5ldyB3YXkgaXMgYXMg
Zm9sbG93czoNCg0KSVBNSSBuZXR3b3JrIGNoYW5uZWwgbG9naWNhbGx5IHN0YXJ0cyBmcm9tIDEu
IEZvciBleGFtcGxlLCBvbmNlIGl0IGZpZ3VyZSBvdXQgdGhlIGNoYW5uZWwgY291bnQgaXMgMywN
CndlIGNhbiByZXRyaWV2ZSBJUCBhZGRyZXNzZXMgdGhyb3VnaCBjaGFubmVscyAxLCAyLCBhbmQg
MywgYW5kIHZlcmlmeSB0aGVtIGNvcnJlc3BvbmQgdG8gZXRoMCwgZXRoMSwgYW5kIGV0aDIsIHJl
c3BlY3RpdmVseSBieSByZWRmaXNoLg0KSXMgaXQgcmlnaHQ/DQoNClRoYW5rcw0KQmVzdCBSZWdh
cmRzLA0KVG9ueQ0KDQpGcm9tOiBSYWh1bCBNYWhlc2h3YXJpIDxtYWlsdG86cmFodWxtYWhlc2h3
YXJpMDFAZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDUsIDIwMTkgNjo1MSBQ
TQ0KVG86IFRvbnkgTGVlICjmnY7mloflr4wpIDxtYWlsdG86VG9ueS5MZWVAcXVhbnRhdHcuY29t
Pg0KQ2M6IG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBRdWVz
dGlvbnMgYWJvdXQgb3BlbmJtYy10ZXN0LWF1dG9tYXRpb24NCg0KVGhhbmtzIGZvciBwb2ludGlu
ZyB0aGF0IG91dC4gUGFzc2luZyBpbnRlcmZhY2UvY2hhbm5lbCBudW1iZXIgaXMgYW4gZWFzaWVy
IG9wdGlvbiBidXQgd2Ugc2hvdWxkIGJlIGF2b2lkaW5nIHBhc3NpbmcgZW52aXJvbm1lbnTCoHZh
cmlhYmxlIHVubGVzcyB0aGVyZSBpcyBubyBvdGhlciB3YXkuIEkgd291bGQgc2F5IGJldHRlciB3
YXkgdG8gb3ZlcmNvbWUgdGhpcyBpcyB0byBmaWd1cmUgb3V0IHRoZSBjaGFubmVsIGNvdW50IHVz
aW5nICJpcCBhZGRyIiBjb21tYW5kIGZyb20gQk1DIGNsaS7CoA0KTGV0IHVzIGtub3cgaWYgdGhh
dCBzb3VuZHMgZ29vZMKgdG8geW91Lg0KQWxzbyBsZXQgdXMga25vdyBpZiB5b3Ugd291bGQgbGlr
ZSB0byBkcm9wIGNvZGUgY2hhbmdlIGZvciB0aGUgc2FtZT/CoA0KDQpUaGFua3MNClJhaHVsDQoN
Cg0KDQoNCsKgDQoNCk9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgMjoyOCBQTSBUb255IExlZSAo5p2O
5paH5a+MKSA8bWFpbHRvOm1haWx0bzpUb255LkxlZUBxdWFudGF0dy5jb20+IHdyb3RlOg0KSGkg
UmFodWwsDQrCoA0KSSdtIHdvbmRlcmluZyB0aGF0IHdoeSAiUkVERklTSF9OV19FVEgwIiBpcyBo
YXJkY29kZSBhcyAiTWFuYWdlcnMvYm1jL0V0aGVybmV0SW50ZXJmYWNlcy9ldGgwLyIgaW4gL2Rh
dGEvdmFyaWFibGVzLnB5DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3Qt
YXV0b21hdGlvbi9ibG9iL21hc3Rlci9kYXRhL3ZhcmlhYmxlcy5weSNMMTU1DQpGdXJ0aGVybW9y
ZSwgdGhlIGNvbW1hbmQgImxhbiBwcmludCIgZGlkbid0IHNwZWNpZnkgdGhlIGNoYW5uZWwgbnVt
YmVyIGluIC9pcG1pL3Rlc3RfaXBtaV9uZXR3b3JrLnJvYm90Lg0KVGhlcmVmb3JlLCB0aGUgZGVm
YXVsdCB3aWxsIHByaW50IGluZm9ybWF0aW9uIG9uIHRoZSBmaXJzdCBmb3VuZCBMQU4gY2hhbm5l
bC4gDQrCoA0KSXNuJ3QgaXQgbW9yZSByZWFzb25hYmxlIHRvIHNldCB0aGUgaW50ZXJmYWNlIGFu
ZCB0aGUgY2hhbm5lbCBudW1iZXIgYXMgZW52aXJvbm1lbnQgdmFyaWFibGVzIGFuZCBnaXZlIHRo
ZW0gZGVmYXVsdCB2YWx1ZXM/DQrCoA0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQrCoA0K
