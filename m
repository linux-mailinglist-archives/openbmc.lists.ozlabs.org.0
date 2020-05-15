Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5251D458A
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 08:03:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NdBZ5jz0zDqyh
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 16:03:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=39752365e=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Nd9s42KrzDqmf
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 16:02:52 +1000 (AEST)
IronPort-SDR: SwiPBAANE4Yhv7FbUxalHjdUTMsdatVvgOZZFUEdc11Xr+MJh4um3IoCpY9PM1w8xb3HMmuD7v
 oxAiip6i7tKA==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 15 May 2020 14:02:42 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 May
 2020 14:01:28 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 15 May 2020 14:01:28 +0800
From: =?utf-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>
To: =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Subject: RE: Openbmc-test-automation checking service root URL "/"
Thread-Topic: Openbmc-test-automation checking service root URL "/"
Thread-Index: AdYp4qgyJHxzOCQnQC+Zg+5dnQ7fJv//vqOAgAC3AgD//0Kf8A==
Date: Fri, 15 May 2020 06:01:28 +0000
Message-ID: <ce18cdc261594db5bd9c745f416752b5@quantatw.com>
References: <a8c9861001b14bf7ba2bd6cba832d2f5@quantatw.com>
 <9390dab8-9e8a-64e7-572a-52fcbca4b215@linux.ibm.com>
 <CAGm54UF3MzDqk8eEJY+Vkiepe1+PRQL6kh6N7_VB_7eqnzn8rg@mail.gmail.com>
In-Reply-To: <CAGm54UF3MzDqk8eEJY+Vkiepe1+PRQL6kh6N7_VB_7eqnzn8rg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: C1658EE59865565044377A5418A8F9E36C970DFE0F1C6AC6CBC2DF7D3C3BA71F2000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "gkeishin@in.ibm.com" <gkeishin@in.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

WWVzLCBpdCB3b3JrcyBhZnRlciBJIGluc3RhbGwgInBob3NwaG9yLXdlYnVpIiBwYWNrYWdlIGlu
IG15IGJtYy4gDQpBbmQgdGhlIEJNQ1dFQl9FTkFCTEVfU1RBVElDX0hPU1RJTkcgY29tcGlsZSBm
bGFnIGlzIGVuYWJsZSBpbiBkZWZhdWx0IGluIGJtY3dlYi4NCg0KVGhlbiBJIGNhbiBnZXQgc29t
ZSBiaW5hcnkgcmVzcG9uc2UgYnkgcnVubmluZw0KY3VybCAtayBodHRwczovLyR7Ym1jfS8gLS1v
dXRwdXQNCg0KYW5kIGVuY29kaW5nIGJ5DQpjdXJsIC1rIC1IICJBY2NlcHQtRW5jb2Rpbmc6IGd6
aXAiIGh0dHBzOi8vJHtibWN9LyAtLW91dHB1dCAtIHwgZ3VuemlwIHwgbW9yZQ0KDQp0aGVuIHNl
ZSB0aGUgcmVhZGFibGUgcGFnZSBpbmZvLg0KVGhhbmsgeW91IGZvciB0aGUgaW5mb3JtYXRpb24s
IGl0J3MgdmVyeSBoZWxwZnVsLg0KDQpEYXZpZA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTog6YOB6Zu3IDx5dWxlaS5zaEBieXRlZGFuY2UuY29tPiANClNlbnQ6IEZyaWRheSwg
TWF5IDE1LCAyMDIwIDEwOjI5IEFNDQpUbzogSm9zZXBoIFJleW5vbGRzIDxqcmV5QGxpbnV4Lmli
bS5jb20+DQpDYzogRGF2aWQgV2FuZyAo546L5oyv5a6HKSA8RGF2aWRXYW5nQHF1YW50YXR3LmNv
bT47IGdrZWlzaGluQGluLmlibS5jb207IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVj
dDogUmU6IE9wZW5ibWMtdGVzdC1hdXRvbWF0aW9uIGNoZWNraW5nIHNlcnZpY2Ugcm9vdCBVUkwg
Ii8iDQoNCk9uIFRodSwgTWF5IDE0LCAyMDIwIGF0IDExOjM0IFBNIEpvc2VwaCBSZXlub2xkcyA8
anJleUBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4NCj4gSSB1bmRlcnN0YW5kIEdFVCByZXF1ZXN0
cyBmb3IgVVJJICIvIiB0byByZXR1cm4gdGhlIHdlYiBhcHAsIGlmIA0KPiBCTUNXRUJfRU5BQkxF
X1NUQVRJQ19IT1NUSU5HIGlzIGVuYWJsZWQgYW5kIHRoZSB3ZWIgYXBwIGlzIHByZXNlbnQuIA0K
PiBTZWUNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvYm1jd2ViL2Jsb2IvbWFzdGVyL0NN
YWtlTGlzdHMudHh0I0w0OQ0KPiBhbmQgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bo
b3Itd2VidWkNCg0KWXVwLCB0aGUgVVJJICIvIiBpcyBzdXBwb3NlZCB0byBiZSB0aGUgd2VidWku
DQpCeSBkZWZhdWx0LCBpdCBpcyBwaG9zcGhvci13ZWJ1aSdzIGxvZ2luIHBhZ2UsIGJ1dCBiZSBu
b3RlZCB0aGF0IGl0IGNvdWxkIGJlIGluIGEgY29tcHJlc3NlZCBmb3JtYXQuDQo=
