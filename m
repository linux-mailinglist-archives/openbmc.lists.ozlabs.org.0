Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333EED827
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 05:00:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475zb32y3RzF4xM
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 14:59:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.117;
 helo=mail1.bemta24.messagelabs.com; envelope-from=dlin23@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BfN19dbzF2X0
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:11:39 +1100 (AEDT)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.us-west-2.aws.symcld.net id 14/1C-07076-89CCBBD5;
 Fri, 01 Nov 2019 06:11:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRWlGSWpSXmKPExsWS8eIhj+6EM7t
 jDdbPULb4vnYfi8WplhcsFnsPbGRxYPbYOesuu8eCTaUe52csZAxgjmLNzEvKr0hgzdj8rYO1
 oF+o4tfLT4wNjB8Euxi5OIQEGpgkGuafY4RwXjFKdByZywbh7GOU+LT6L5DDwcEmoCpxfxp3F
 yMnh4iAu0RXfxcriM0soC/xcfpLsBJhAV2JqTdNIUr0JCae3MsKYTtJTL3TxgZiswioSKxp3M
 cEYvMKWEp0HlvNDLHqKKPEyQlzwBo4BQIlel9NBmtgFJCVeLLgGRPELnGJcxdb2UFsCQEBiSV
 7zjND2KISLx//Y4WwFSSa97xmAbmHWUBTYv0ufYhWRYkp3Q/ZIfYKSpyc+YRlAqPoLCRTZyF0
 zELSMQtJxwJGllWMFklFmekZJbmJmTm6hgYGuoaGRrqGxqa6hiYmeolVukl6pcW65anFJbpGe
 onlxXrFlbnJOSl6eaklmxiBMZdS0D5hB+OcT2/1DjFKcjApifKWndgdK8SXlJ9SmZFYnBFfVJ
 qTWnyIUYaDQ0mCN+Q0UE6wKDU9tSItMwcY/zBpCQ4eJRFeNpA0b3FBYm5xZjpE6hSjJceEl3M
 XMXMcPDoPSB6Zu3QRsxBLXn5eqpQ4byxIgwBIQ0ZpHtw4WIq6xCgrJczLyMDAIMRTkFqUm1mC
 Kv+KUZyDUUmYVxVkCk9mXgncVmCiAfpFhDfs3S6Qg0oSEVJSDUyT5RMnK7d+6apqCflWuvi6u
 GtktOSfo+ucDpyW+XFqVfLGazwTJ5YY8i/NeMHX3b80c133m3eJXO0HnNgzL2lsncEb1qv6Ya
 vVrHyL2ddY2v4szy7838OQdO24+QylWs+Xy7Kql8+QS16Sckr93fyC2oCvBT8PPU+WEUwvNax
 cHDqn+VT3koQdty88TA5tvvRj7bWfB/Uzbn65XbZcdep8cWevpy0yYRIbuc/vzw6PWxr8fYZa
 iqfsAsbi74Hf/CrN3py7a3L/Z9HHWRcmqaklnTb2OVfbvyFdefOz7ayl9+oV6h2mXX/UW1/4g
 qGr46J6bdzPY7Z2DfYVyz89zVBgbeGYfEj9wXRmx5uRZo1KLMUZiYZazEXFiQCnJytkzAMAAA
 ==
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-3.tower-346.messagelabs.com!1572588687!58086!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14310 invoked from network); 1 Nov 2019 06:11:28 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-3.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2019 06:11:28 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 94EEE3186D58D7CDF9DB;
 Fri,  1 Nov 2019 02:11:26 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 1 Nov 2019 14:11:24 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Fri, 1 Nov 2019 14:11:24 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: Lei YU <mine260309@gmail.com>, Patrick Venture <venture@google.com>
Subject: RE: [External]  Re: FanPwm interface
Thread-Topic: [External]  Re: FanPwm interface
Thread-Index: AdWPBzXsXQVBY5D1TJ+9eIoikR+YRAA8K1aAAAlL3QAAF2BXYA==
Date: Fri, 1 Nov 2019 06:11:24 +0000
Message-ID: <b11cc578535f47aaa542d1e32bad3122@lenovo.com>
References: <fed4bf71fdbf452f955f527b20c36c08@lenovo.com>
 <CAO=notyoynBRNHg9fgPX1QgJ_kghX_=uKbeJ+CCmsv5mPubNKg@mail.gmail.com>
 <CAARXrtkEPRj+CwPr032-D5nmh_q=c_sRz6kUNu5To=LjZzS9zA@mail.gmail.com>
In-Reply-To: <CAARXrtkEPRj+CwPr032-D5nmh_q=c_sRz6kUNu5To=LjZzS9zA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2019 14:59:29 +1100
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMZWkgWVUgPG1pbmUyNjAzMDlA
Z21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDEsIDIwMTkgMTA6NTggQU0NCj4g
VG86IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0KPiBDYzogRGVyZWsgTGlu
MjMgPGRsaW4yM0BsZW5vdm8uY29tPjsgT3BlbkJNQyBNYWlsbGlzdA0KPiA8b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnPg0KPiBTdWJqZWN0OiBbRXh0ZXJuYWxdIFJlOiBGYW5Qd20gaW50ZXJmYWNl
DQo+IA0KPiBPbiBGcmksIE5vdiAxLCAyMDE5IGF0IDY6MzIgQU0gUGF0cmljayBWZW50dXJlIDx2
ZW50dXJlQGdvb2dsZS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gVGh1LCBPY3QgMzEsIDIwMTkg
YXQgMzoyNyBQTSBEZXJlayBMaW4yMyA8ZGxpbjIzQGxlbm92by5jb20+IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+IEhpIHRlYW06DQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiAgICAgICAgICAgSSBo
YXZlIGEgcXVlc3Rpb24gcmVnYXJkaW5nIG9mIEZhblB3bSBpbnRlcmZhY2Ugb24gaHdtb24uDQo+
ID4gPg0KPiA+ID4gICAgICAgICAgIERvZXMgdGhpcyBpbnRlcmZhY2UgZ2V0IHVwZGF0ZWQgd2hp
bGUgUFdNIGlzIGNoYW5naW5nIGluDQo+IHN5c2ZzPw0KPiA+ID4NCj4gPiA+ICAgICAgICAgICBG
b3IgZXhhbXBsZSwgaWYgSSBzZXR1cCBhIGZhbiBwb2ludHMgdG8gYSBQV00gbGlrZSBiZWxvdw0K
PiBjb25maWd1cmF0aW9uLCBub3csIEZhblB3bSBpbnRlcmZhY2UgZG9lcyBub3QgZ2V0IHVwZGF0
ZWQgd2hlbiBJIHVwZGF0ZQ0KPiBQV00gaW4gc3lzZnMsIG9ubHkgbXkgZmFuIGlucHV0cyAocnBt
cykgZG8uDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiAgICAgICAgICAgRXhhbXBsZToNCj4g
PiA+DQo+ID4gPiAgICAgICAgICAgTEFCRUxfZmFuMSA9ICJGQU4wX1NwZWVkIg0KPiA+ID4NCj4g
PiA+ICAgICAgICAgICDigKYNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgUFdNX1RBUkdFVF9mYW4x
ID0gIjEiDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiAgICAgICAgICAgSXMgdGhlcmUgYSBj
b25maWd1cmF0aW9uIG9yIGxhYmVsIHdoaWNoIEkgY2FuIHVzZSBzbyBGYW5Qd20NCj4gaW50ZXJm
YWNlIHdvdWxkIGdldCB1cGRhdGVkIHdoZW4gSSBjaGFuZ2UgUFdNIGluIHN5c2ZzPw0KPiA+DQo+
ID4gVW5sZXNzIEknbSBtaXN0YWtlbiwgaXQncyBjdXJyZW50bHkgdHJlYXRlZCBvbmx5IGFzIGEg
VGFyZ2V0IC0tIHNvDQo+ID4gaXQncyB1cGRhdGVkIG9ubHkgdmlhIGRidXMgY2FsbHMgdG8gc2V0
IGl0Lg0KPiANCj4gRXhhY3RseSwgaXQgd2lsbCBub3QgdXBkYXRlIGlmIHlvdSBjaGFuZ2UgaXQg
ZGlyZWN0bHkgaW4gc3lzZnMuDQo+IFRoaXMgaXMgT0sgaW4gZmllbGQgYmVjYXVzZSBhIHJlZ3Vs
YXIgdXNlciBzaG91bGQgYWNjZXNzIHRoZSBCTUMgdmlhDQo+IFJlZGZpc2gvUkVTVCBBUEkvaXBt
aS4NCj4gDQo+IEJ1dCBmb3IgZGVidWdnaW5nIHB1cnBvc2UgaXQgZG9lcyBoYXZlIHNvbWUgdHJv
dWJsZSB0aGF0IHVwZGF0aW5nIHB3bSBpbg0KPiBzeXNmcyBkb2VzIG5vdCByZWZsYWN0IG9uIEQt
QnVzLg0KPiBTbyBwYXRjaGVzIGFyZSB3ZWxjb21lIDopDQoNCkhpIFBhdHJpY2sgJiBMZWk6DQoN
CglUaGFuayB5b3UgZm9yIHlvdXIgY29tbWVudHMuIEFwcHJlY2lhdGUgdGhlIGhlbHAuIA0KDQpE
ZXJlaw0K
