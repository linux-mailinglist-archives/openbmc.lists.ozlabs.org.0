Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C616426C348
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 15:32:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs1HH2F0kzDqbF
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 23:32:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=521980842=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Sep 2020 23:31:34 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bs1GG57LmzDqb5
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 23:31:33 +1000 (AEST)
IronPort-SDR: xc395nD1ST99oNfRXhVgw63Lf3A78Koj7IprCvAjcf82anpgixi1yNmjyCAHOG3J9WTaWPN1fH
 yCJwHkYOw+Aw==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 16 Sep 2020 21:30:18 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 16 Sep
 2020 21:30:17 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.2044.004;
 Wed, 16 Sep 2020 21:30:17 +0800
From: =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Quanta requests to create a repo in OpenBMC github
Thread-Topic: Quanta requests to create a repo in OpenBMC github
Thread-Index: AdaMLGuWTuwJ71raTmGk0qtBNsizig==
Date: Wed, 16 Sep 2020 13:30:17 +0000
Message-ID: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: text/plain; charset="big5"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwNCglUaGlzIGlzIEZyYW4gZnJvbSBRdWFudGEgQ29tcHV0ZXIuDQpRdWFudGEgT3Bl
bkJNQyB0ZWFtIHdvdWxkIGxpa2UgdG8gc2hhcmUgc29tZSB1c2VmdWwgdG9vbHMgdG8gdGhlIE9w
ZW5CTUMgY29tbXVuaXR5Lg0KU3VjaCBhcyB0aGUgcmVhZC1tYXJnaW4tdGVtcCBkYWVtb24gKGh0
dHBzOi8vZ2l0aHViLmNvbS9xdWFudGEtYm1jL3JlYWQtbWFyZ2luLXRlbXApLCB3ZSBhcmUgdXNp
bmcgdGhpcyBkYWVtb24gdG8gZmlsbCBzZW5zb3IgbWFyZ2luIHZhbHVlIHRvIFBJRCB0byBkbyBm
YW4gY29udHJvbC4NCg0KV2Ugd291bGQgbGlrZSB0byBoYXZlIGEgcmVwbyBuYW1lZCAicXVhbnRh
LW1pc2MiIHVuZGVyIHRoZSBPcGVuQk1DIGdpdGh1Yi4NCg0KSGVyZSBpcyB0aGUgbWFpbnRhaW5l
ciBsaXN0Og0KTTogIEJlbmphbWluIEZhaXIgPGJlbmphbWluZmFpckBnb29nbGUuY29tPiA8YmVu
amFtaW5mYWlyIT4NCk06ICBCcmFuZG9uIEtpbSA8YnJhbmRvbmtpbUBnb29nbGUuY29tPiA8YnJh
bmRvbmshPg0KTTogIEZyYW4gSHN1IDxmcmFuLmhzdUBxdWFudGF0dy5jb20+IDxmcmFuaHN1IT4N
Ck06ICBHZW9yZ2UgSHVuZyA8Z2VvcmdlLmh1bmdAcXVhbnRhdHcuY29tPiA8Z2h1bmchPg0KTTog
IEJ1ZGR5IEh1YW5nIDxidWRkeS5odWFuZ0BxdWFudGF0dy5jb20+IDxidWRkeWh1bmFnIT4NCg0K
VGhhbmsgeW91Lg0KRnJhbiBIc3UNCkUtTWFpbCA6IEZyYW4uSHN1QFF1YW50YVRXLmNvbQ0KVGVs
OiArODg2LTMtMzI3LTIzNDUgRXh0OiAxNjkzNQ0KDQoNCg==
