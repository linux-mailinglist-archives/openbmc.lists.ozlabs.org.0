Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CCB9578C0
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 01:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnpyx2Qddz2yyR
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 09:41:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=mic.com.tw
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.130.36.7
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mic.com.tw (client-ip=220.130.36.7; helo=micmsefe01.mic.com.tw; envelope-from=hancock.chang@mic.com.tw; receiver=lists.ozlabs.org)
Received: from MICMSEFE01.mic.com.tw (mail22.mic.com.tw [220.130.36.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnQGs5wpVz2xs0
	for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2024 18:09:09 +1000 (AEST)
Received: from MICEXCH02.mitacad.com (MICEXCH02.mitacad.com [10.88.25.250])
	by MICMSEFE01.mic.com.tw with ESMTPS id 47J88wmC055987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2024 16:08:58 +0800 (GMT-8)
	(envelope-from hancock.chang@mic.com.tw)
Received: from MICEXCH01.mitacad.com (10.88.25.249) by MICEXCH02.mitacad.com
 (10.88.25.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 19 Aug
 2024 16:08:59 +0800
Received: from MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977]) by
 MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977%2]) with mapi id
 15.01.2507.016; Mon, 19 Aug 2024 16:08:59 +0800
From: <hancock.chang@mic.com.tw>
To: <geissonator@gmail.com>, <openbmc@lists.ozlabs.org>
Subject: RE: CCLA for MiTAC_Tyan needs to be updated
Thread-Topic: CCLA for MiTAC_Tyan needs to be updated
Thread-Index: AdrjwXUBfqDR7HEyTE+LHeS/OByuhQJj/BiAAS749rA=
Date: Mon, 19 Aug 2024 08:08:59 +0000
Message-ID: <a29ac713d0dd4dd98d2a64bdfbad9808@mic.com.tw>
References: <9b6b8fbff7924cb6a505f028f68e51b3@mic.com.tw>
 <3a962617-2447-447a-bedb-f9911757558f@gmail.com>
In-Reply-To: <3a962617-2447-447a-bedb-f9911757558f@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.25.29]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: MICMSEFE01.mic.com.tw 47J88wmC055987
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:41:43 +1000
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
Cc: eric_kuo@mic.com.tw
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3DQoNClRoYW5rIHlvdSBzbyBtdWNoLiBXZSBoYXZlIGNoZWNrZWQgdGhlIG9yaWdp
bmFsIENDTEEgaGFyZGNvcHkgeW91IGhlbHBlZCB0byBmaW5kIG91dCwgaXQgd2FzIHNpZ25lZCB3
aXRoICJNaVRBQyBDb21wdXRpbmcgVGVjaG5vbG9neSIsIHNvIHRvIE1pVEFDLCBpdCBpcyBubyBj
b25jZXJuIHRvIGtlZXAgdGhpcyBDQ0xBIGZyb20gbGVnYWwgcGVyc3BlY3RpdmUgc2luY2Ugd2Ug
d2lsbCBrZWVwICJNaVRBQyIgYXMgb3VyIG9ubHkgYnJhbmQgbmFtZSBsYXRlciBmcm9tIHRoaXMg
eWVhci4NCg0KSnVzdCBjaGVja2VkIHRoZSBDTEEgbWFuYWdlciBuYW1lIGxpc3Qgd2hpY2ggd291
bGQgbmVlZCB0byBiZSB1cGRhdGVkLCBwZXIgdGhlIHByb2Nlc3MgYW5kIHJ1bGUsIEkgcmVtZW1i
ZXIgdGhlIENMQSBtYW5hZ2VyIGxpc3QgaXMgYWxsb3dlZCB0byBiZSB1cGRhdGVkIGJ5IG91cnNl
bHZlcyBhbmQgdXBsb2FkIHRvIGdvb2dsZSBkcml2ZSBkaXJlY3RseSwgc28gaWYgSSBhbSBjb3Jy
ZWN0LCB3ZSB3aWxsIHVwZGF0ZSB0aGUgQ0xBIG1hbmFnZXIgbmFtZSBsaXN0IHRoZW4gbWF5IGFz
ayBmb3IgeW91ciBoZWxwIGZvciBhZGRpbmcgcGVvcGxlIHRvIHRoZSBnZXJyaXQgQ0kgZ3JvdXAg
KGZvciBDSSBhcHByb3ZhbCkNCg0KVGhhbmsgeW91DQoNCg0KSGFuY29jaw0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBnbWFp
bC5jb20+IA0KU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDI0IDExOjIxIFBNDQpUbzogaGFu
Y29jay5jaGFuZyAo5by16IKy6KqgIC0gTUNUKSA8aGFuY29jay5jaGFuZ0BtaWMuY29tLnR3Pjsg
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpDYzogZXJpY19rdW8gKOmDreWuiOWghSAtIE1DVCkg
PGVyaWNfa3VvQG1pYy5jb20udHc+DQpTdWJqZWN0OiBSZTogQ0NMQSBmb3IgTWlUQUNfVHlhbiBu
ZWVkcyB0byBiZSB1cGRhdGVkDQoNCg0KICAgVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0
c2lkZSBvZiBNaVRBQyBncm91cC4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLg0KDQoNCk9uIDgvMS8yMDI0IDEyOjI2IEFNLCBoYW5jb2NrLmNoYW5nQG1pYy5jb20u
dHcgd3JvdGU6DQo+DQo+IERlYXIgT3BlbkJNQyBvcmcsDQo+DQo+IFR5YW4sIHRoZSBicmFuZGVk
IGJ1c2luZXNzIGdyb3VwIG9mIE1pVEFDIENvbXB1dGluZyBUZWNobm9sb2d5LCBoYXMgDQo+IHNp
Z25lZCBDQ0xBIG9mIE9wZW5CTUMgaW4gc2V2ZXJhbCB5ZWFycyBhZ28sIHNpbmNlIGxvdHMgb2Yg
bWVtYmVyIA0KPiBjaGFuZ2UgaW4gdGhlc2UgeWVhciwgYWxzbyB0aGUgb3JnYW5pemF0aW9uIGNo
YW5nZSB3aXRoIGJyYW5kIG5hbWUgDQo+IGNoYW5nZSwgd2Ugd2lsbCB1bmlmeSBvdXIgYnJhbmQg
dG8gY29tYmluZSDigJxUeWFu4oCdIGFuZCDigJxNaVRBQ+KAnSB0aGVuIA0KPiBqdXN0IGtlZXAg
4oCcTWlUQUPigJ0gYXMgb3VyIHNpbmdsZSBicmFuZCBmcm9tIDIwMjQgUTM7IGFzc3VtZSBpdCBt
aWdodCANCj4gbmVlZCB0byByZS1uZXcgdGhlIG9yaWdpbmFsIENDTEEgYmV0d2VlbiBUeWFuIGFu
ZCBMaW51eCBGb3VuZGF0aW9uIGZvciANCj4gT3BlbkJNQywgc2hvdWxkIHdlIHJlLXN1Ym1pdCBh
IG5ldyBDQ0xBPw0KPg0KSGksIHdlbGNvbWUgYmFjay4gSSBkb24ndCBzZWUgYSBDTEEgZm9yIFR5
YW4gaW4gb3VyIGdvb2dsZSBkcml2ZS4gSSBkbyBzZWUgb25lIGZvciBNaVRBQw0KDQp1cCBhdA0K
aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2RyaXZlL2ZvbGRlcnMvMXZLQ1NHR1hsVWJFWmdBeG5D
NTRwU01rbFNoX3hUelJjDQoNCklmIHlvdSBjYW4gIGp1c3Qgc3VibWl0IG9uZSBDTEEgZm9yIGJv
dGggVHlhbiBhbmQgTWlUQUMgdGhlbiB0aGF0IHdvdWxkIGJlIHNpbXBsZXN0Lg0KDQpZb3UgY2Fu
IHNlbmQgdG8gdGhlIG1haWxpbmcgbGlzdCBhbmQgSSdsbCByZXZpZXcgYW5kIHVwZGF0ZSBpdCBp
biBvdXIgZ29vZ2xlIGRyaXZlLg0KDQpUaGFua3MsDQoNCkFuZHJldw0KDQo+IEJUVywgbWF5IHdl
IGhhdmUgaGVscCBmcm9tIE9wZW5CTUMgb3JnLCB0byBjaGVjayBhbmQgZ2V0IHRoZSBvcmlnaW5h
bCANCj4gQ0NMQSBiZXR3ZWVuIFR5YW4gYW5kIExpbnV4IEZvdW5kYXRpb24/DQo+DQo+IFRoYW5r
IHlvdQ0KPg0KPiBIYW5jb2NrIENoYW5nDQo+DQo+IERpcmVjdG9yLCBTb2x1dGlvbiBFbmFibGlu
ZyBEZXB0LiwgQkVPQw0KPg0KPiBNaVRBQyBDb21wdXRpbmcgVGVjaG5vbG9neQ0KPg0KPiBUZWw6
ICs4ODYzLTMyNy01OTg4ICM3MzU5DQo+DQo+IENlbGw6ICs4ODY5MzU1NDc2NjUNCj4NCg==
