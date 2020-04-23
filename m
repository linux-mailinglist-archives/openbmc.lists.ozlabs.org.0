Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979ED1B59A6
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 12:49:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497DZg0kfGzDqxZ
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 20:49:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=375fe1c2c=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Apr 2020 20:48:45 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 497DYn0PBXzDqZq
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 20:48:43 +1000 (AEST)
IronPort-SDR: taBkdwrA1yWc8MFXLTf6t5Ez6OtrtgChaoSze852yrBb15oIF4xJTp6G1ngRNk78gsH3rzb6Zb
 d0nz0LVT7XcQ==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 23 Apr 2020 18:47:32 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 Apr
 2020 18:47:27 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Thu, 23 Apr 2020 18:47:27 +0800
From: =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
To: "ztai@google.com" <ztai@google.com>
Subject: Re: mTLS on bmcweb
Thread-Topic: mTLS on bmcweb
Thread-Index: AQHWGVyUYDFPzhylEE64ge0yqb7UkA==
Date: Thu, 23 Apr 2020 10:47:27 +0000
Message-ID: <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.14)
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: AF988409A0862D5011C01C984925D51B3CB1E47AE5B4921EADB4A635DE4E9E272000:8
Content-Type: text/plain; charset="big5"
Content-ID: <91F6B9E2F37A6046880182D7554BAAB8@quantatw.com>
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

SGksDQoNCkkgZW5jb3VudGVyZWQgdGhlIHNhbWUgaXNzdWUgd2hlbiB1c2luZyBSZWRmaXNoIHRv
IHJlcGxhY2UgdGhlIGNlcnRpZmljYXRlLg0KUmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBwYXJh
bWV0ZXJzIGluY2x1ZGUgLS1jZXJ0IC0ta2V5IC0tY2FjZXJ0IG9yIG9ubHkgLS1jYWNlcnQsIHRo
ZSBhdXRoZW50aWNhdGlvbiBjYW4gc3RpbGwgc3VjY2VlZC4NCg0KQmVzdCwNClAuSy4NCg0KPiBE
YXRlOiBXZWQsIDIyIEFwciAyMDIwIDE0OjU4OjA2IC0wNzAwDQo+IEZyb206IFpoZW5mZWkgVGFp
IDx6dGFpQGdvb2dsZS5jb20+DQo+IFRvOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3Vi
amVjdDogbVRMUyBvbiBibWN3ZWINCj4gTWVzc2FnZS1JRDoNCj4gCTxDQU1Ydzk2UHA1MTFzVU89
cTFYTHoydUp6aDRTNkQ3dFV3bWt2cGJucV95VS1pSmZpS2dAbWFpbC5nDQo+IG1haWwuY29tPg0K
PiBDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9InV0Zi04Ig0KPiANCj4gSGksDQo+
IA0KPiBJJ20gdHJ5aW5nIG91dCBibWN3ZWIgbVRMUyB3aGljaCBzaG91bGQgYmUgZW5hYmxlZCBi
eSBkZWZhdWx0IGJ5DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9ibG9iL21h
c3Rlci9DTWFrZUxpc3RzLnR4dCNMODkNCj4gDQo+IEluIG15IHRlc3QsIEkgY3JlYXRlZCBhIHNl
bGYgc2lnbmVkIGtleSBhbmQgY2VydGlmaWNhdGUgcGFpciwgc3RhY2tlZCB0aGVtDQo+IHVwIGlu
dG8gc2VydmVyLnBlbSBpbiAvZXRjL3NzbC9jZXJ0cy9odHRwcyB0aGF0IGJtY3dlYiB1c2VzLg0K
PiANCj4gSG93ZXZlciB3aGVuIEkgdHJpZWQgdG8gY3VybCBibWN3ZWIgc2VydmljZSwgSSB3YXMg
YWJsZSB0byBnZXQgcmVzcG9uc2UgYnkNCj4gb25seSBzdXBwbHlpbmcgdGhlIGNlcnQuDQo+IA0K
PiBjdXJsIC0tY2FjZXJ0IGNlcnQucGVtICBodHRwczovLyR7Ym1jfS9yZWRmaXNoL3YxDQo+IA0K
PiBXaXRoIHRoZSBtVExTIGVuYWJsZWQsIEkgZXhwZWN0ZWQgaXQgc2hvdWxkIGVycm9yIG91dCBz
aW5jZSBubyBjbGllbnQNCj4gY2VydGlmaWNhdGUgaXMgcHJvdmlkZWQuDQo+IA0KPiBDb3VsZCBz
b21lb25lIHdpdGggcmVsZXZhbnQga25vd2xlZGdlIGhlbHAgd2l0aCBteSBxdWVzdGlvbj8NCj4g
DQo+IFRoYW5rcywNCj4gWmhlbmZlaQ0KDQo=
