Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1F8E565
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 09:17:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468HpV2bdRzDqym
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 17:17:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.211; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Hnm0gDlzDqvh
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 17:16:58 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-west-2.aws.symcld.net id F1/C3-04226-7E6055D5;
 Thu, 15 Aug 2019 07:16:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRWlGSWpSXmKPExsWS8eIhj+5zttB
 Yg90bOCxOtbxgsdh7YCOLA5PHgk2lHudnLGQMYIpizcxLyq9IYM34+mQnW8FTtYre7sWMDYxL
 1LoYuTiEBP4zSiy8cp4VwnnJKLH57U/2LkZOCGfbsSCIxB5Gic6Nc5lAEmwCWhIL/+8Bsjk4R
 AQ0JP6/ywQJMwtYSmz+eIkdpF5YoJ1R4uPH+ywgCRGBIIlnb68xQthWEj0nprCB2CwCqhIPWp
 eD1fACNZ98f4MFYtkuJomdhyYwgyzgFAiUePRPH6SGUUBWYtqj+0wQy8Ql5k6bxQpiSwgISCz
 Zc54ZwhaVePn4H1RcQaK9/TELyBhmAU2J9bv0IVoVJaZ0P2SHWCsocXLmE5YJjGKzkEydhdAx
 C0nHLCQdCxhZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6RoaW+oaGpnpJVbpJuuVFuuWpxaX6BrpJ
 ZYX6xVX5ibnpOjlpZZsYgRGXkpBd90OxsWz3ugdYpTkYFIS5S2fGhwrxJeUn1KZkVicEV9Ump
 NafIhRhoNDSYJXhzk0VkiwKDU9tSItMweYBGDSEhw8SiK8d1mB0rzFBYm5xZnpEKlTjN4cE17
 OXcTM8Xb5PCDZthVEHjwKIr83LwSSR+YuXcQsxJKXn5cqJc7LDkxHQgIgIzJK8+AWwJLZJUZZ
 KWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvE4gU3gy80rg7ngFdCIT0IlvbgSCnFiSiJCSamByl
 jiuw7slrOhM1+1aD76bmz1idi26eOdeckiOsl3l4+R+FoYVvVqiXzd6p3v3rIz5fCeHPXBV99
 lzzmd+CX3TcOn3fVj81l20ekZyigTLvQte/CdDM1Mm9KR9Wyffoh/RMa/QkS3MhkvA95HvLzb
 XRW8nS8ZN2HTKlPlByOkLNx/4eu7a/u5B9J3S6EvNimLzMv5Fs/OczowLVFktwaWdtUj2iu9m
 5scr2FL5U7c0yhd//HlqieTVK0ICa/i5eRVqX/abezq+uGkq8C7w9O2gu74ngy+dcfqux2j24
 dLuhF4G7n9XLr12vpFt4fZFLOde03nup2+YzzKG/VhvnvXzko+lxrklblxRm54YKiuxFGckGm
 oxFxUnAgChm/Hy4QMAAA==
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-28.tower-366.messagelabs.com!1565853414!156120!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12976 invoked from network); 15 Aug 2019 07:16:54 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-28.tower-366.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2019 07:16:54 -0000
Received: from pekwpmail05.lenovo.com (unknown [10.96.93.83])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 44E069720479D5B48F91;
 Thu, 15 Aug 2019 03:16:53 -0400 (EDT)
Received: from pekwpmail07.lenovo.com (10.96.17.29) by pekwpmail05.lenovo.com
 (10.96.93.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 15 Aug
 2019 15:16:51 +0800
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail07.lenovo.com
 (10.96.17.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 15 Aug
 2019 15:16:51 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Thu, 15 Aug 2019 15:16:51 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWxdIFJlOiBDbGFyaWZ5IHNvbWUgcXVlc3Rpb25z?=
 =?utf-8?B?IGFib3V0IGhvc3QgdG9vbCAoYnVybl9teV9ibWMp?=
Thread-Topic: [External] Re: Clarify some questions about host tool
 (burn_my_bmc)
Thread-Index: AQHVUe61YuzBTdDikUChu8E7Yz/Td6b5CKmAgAK1o5A=
Date: Thu, 15 Aug 2019 07:16:50 +0000
Message-ID: <916df189468a4716b9cabc5652d1cf47@lenovo.com>
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
 <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
 <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
 <CAO=notwDt+KHOih1JFxOeuU1N6aDTK6qqhOzMJ0nFzRvF9EYdQ@mail.gmail.com>
 <CAO=notwMVACreG5JnxUFLLuY6_rQ4yms9dErrRwg=kXapS3gNQ@mail.gmail.com>
In-Reply-To: <CAO=notwMVACreG5JnxUFLLuY6_rQ4yms9dErrRwg=kXapS3gNQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.250]
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

DQoNCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUGF0cmljayBWZW50dXJlIDx2
ZW50dXJlQGdvb2dsZS5jb20+IA0K5Y+R6YCB5pe26Ze0OiAyMDE55bm0OOaciDE05pelIDQ6NTUN
CuaUtuS7tuS6ujogQW5kcmV3IE1TMSBQZW5nIDxwZW5nbXMxQGxlbm92by5jb20+DQrmioTpgIE6
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0K5Li76aKYOiBSZTogW0V4dGVybmFsXSBSZTogQ2xh
cmlmeSBzb21lIHF1ZXN0aW9ucyBhYm91dCBob3N0IHRvb2wgKGJ1cm5fbXlfYm1jKQ0KDQpPbiBU
dWUsIEF1ZyAxMywgMjAxOSBhdCA4OjQ5IEFNIFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29n
bGUuY29tPiB3cm90ZToNCj4NCj4gT24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgODoxNSBBTSBBbmRy
ZXcgTVMxIFBlbmcgPHBlbmdtczFAbGVub3ZvLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+DQo+
ID4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiA+IOWPkeS7tuS6ujogUGF0cmljayBWZW50dXJl
IDx2ZW50dXJlQGdvb2dsZS5jb20+DQo+ID4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0OOaciDEz5pel
IDIyOjM0DQo+ID4g5pS25Lu25Lq6OiBBbmRyZXcgTVMxIFBlbmcgPHBlbmdtczFAbGVub3ZvLmNv
bT4NCj4gPiDmioTpgIE6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiA+IOS4u+mimDogW0V4
dGVybmFsXSBSZTogQ2xhcmlmeSBzb21lIHF1ZXN0aW9ucyBhYm91dCBob3N0IHRvb2wgDQo+ID4g
KGJ1cm5fbXlfYm1jKQ0KPiA+DQo+ID4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMjo0MyBBTSBB
bmRyZXcgTVMxIFBlbmcgPHBlbmdtczFAbGVub3ZvLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4g
SGkgUGF0cmljaywNCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IDEuICAgICAgSXQgdG9vayBh
Ym91dCA0IG1pbnV0ZXMgYW5kIDMwIHNlY29uZHMgZm9yIEJJT1MgdXBkYXRlIHdpdGggNjRNQiBy
b20gaW1hZ2UuIENvdWxkIHdlIGV4dGVuc2lvbiB0aGUgcG9sbHN0YXR1cyB0aW1lIGZyb20gMTAw
IHNlYyB0byAzMDAgc2VjIHRvIGdldCB0aGUgZmluYWwgc3RhdHVzPw0KPiA+DQo+ID4gSSdtIGN1
cmlvdXMgd2h5IGl0J3MgaGFybWZ1bCB0byBjaGVjayBtb3JlIGZyZXF1ZW50bHk/DQo+ID4NCj4g
PiAgICAgICAgICAgICAgICAgSSBzaG93ZWQgc29tZSBzb3VyY2UgY29kZSBvZiBoZWxwZXIuY3Bw
IGFzIGJlbG93LCB0aGUgY2hlY2tpbmcgc3RhdHVzIHRvdGFsIHRpbWUgd2FzIDEwMCBzZWMgKDUq
MjApIGJ1dCBpdCB3YXMgbm90IGVub3VnaCBmb3IgYmlvcyB1cGRhdGUgYW5kIHRoZXJlZm9yZSBJ
IHdvdWxkIGxpa2UgdG8gZXh0ZW5zaW9uIHRoZSB0aW1lIGZyb20gMTAwIHNlYyB0byAzMDAgc2Vj
Lg0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRp
YyBjb25zdGV4cHIgYXV0byB2ZXJpZmljYXRpb25TbGVlcCA9IDVzOw0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaXBtaV9mbGFzaDo6QWN0aW9uU3RhdHVzIHJlc3VsdCA9IA0K
PiA+IGlwbWlfZmxhc2g6OkFjdGlvblN0YXR1czo6dW5rbm93bjsNCj4gPg0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnkNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RhdGljIGNvbnN0ZXhwciBpbnQgY29tbWFuZEF0dGVtcHRzID0gMjA7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgYXR0ZW1wdHMgPSAwOw0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQo+DQo+IFNvIHlvdSdyZSBu
b3QgYXNraW5nIHRvIGNoZWNrIGl0IGxlc3MgZnJlcXVlbnRseSwgeW91J3JlIGFza2luZyBpdCB0
byANCj4gYWxsb3cgZm9yIGEgbG9uZ2VyIHBlcmlvZCBiZWZvcmUgdGltaW5nIG91dC4NCj4NCj4g
Pg0KPiA+ID4NCj4gPiA+IDIuICAgICAgSWYgdXNlciBjYW4gY2hvb3NlIHRvIHByZXNlcnZlIEJN
QyBjb25maWd1cmF0aW9uIChydyBhcmVhKSBvciBCSU9TIGNvbmZpZ3VyYXRpb24gd2hlbiB1cGdy
YWRlIGZpcm13YXJlLCBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgd2l0aCByZWdhcmRzIHRv
IHByZXNlcnZlIGNvbmZpZ3VyYXRpb24gaW1wbGVtZW50YXRpb24gb3IgY291bGQgdGhlIGhvc3Qg
dG9vbCBzdXBwb3J0IHRvIHNlbmQgYSBwYXJhbWV0ZXIgdG8gc3VwcG9ydCBpdD8NCg0KVG9kYXkg
SSdtIHN1Ym1pdHRpbmcgaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8yNDQwMiBm
b3IgcmV2aWV3IHRvIGp1c3QgbGVuZ3RoZW4gdGhlIHdhaXQuICBJJ2xsIHN1Ym1pdCBhIHBhdGNo
IHBhcmFtZXRlcml6aW5nIGl0IGxhdGVyLg0KDQo+ID4NCj4gPiBTaW5jZSBvbmUgb2YgdGhlIGRl
c2lnbiBnb2FscyB3YXMgdG8ga2VlcCB0aGUgaW50ZXJmYWNlIGZyb20gdGhlIGhvc3Qgc2ltcGxl
LCBhbmQgbW9zdGx5IGFnb25pc3RpYyB0byB3aGF0IHdhcyB0YWtpbmcgcGxhY2UsIGNvbnNpZGVy
YXRpb24gd2Fzbid0IGdpdmVuIGZvciBhIG1lY2hhbmlzbSBmb3IgYWRkaW5nIGV4dHJhIHBhcmFt
ZXRlcnMuICBXZSdyZSBpbiBhIHNpbWlsYXIgYm9hdCB3aGVyZSB3ZSB3YW50IGEgbWVjaGFuaXNt
IGZvciBjaGFuZ2luZyB0aGUgbGV2ZWwgb2YgdXBncmFkZSwgc28gSSdsbCBnbyBvdmVyIHRoZSBk
ZXNpZ24gdG9kYXkgYXQgc29tZSBwb2ludCBhbmQgc2VlIHdoZXRoZXIgd2UgY2FuIGRvIGl0IGFn
bm9zdGljYWxseS4NCg0KRm9yIHRoaXMsIEkgdGhpbmsgaXQgY291bGQgbWFrZSBzZW5zZSB0byBq
dXN0IGhhdmUgbXVsdGlwbGUgdGFyZ2V0cyBmb3IgQk1DIHVwZGF0ZXMuICBZb3UgY2FuIGRlZmlu
ZSBtdWx0aXBsZSBpbiBhIHNpbmdsZSBqc29uIChieSB0aGUgd2F5KSwgc28geW91IGNvdWxkIGhh
dmUgbXVsdGlwbGUgL2ZsYXNoL2ltYWdlLCAvZmxhc2gvZmFjdG9yeSBvciBzb21ldGhpbmcgYW5k
IGNob29zaW5nIG9uZSB3b3VsZCBoYXZlIGEgZGlmZmVyZW50IGJlaGF2aW9yIGJlY2F1c2UgaXQg
d291bGQgc3RhcnQgYSBkaWZmZXJlbnQgdXBkYXRlIHNlcnZpY2UuDQoJCUkgYWRkZWQgdHdvIG9i
amVjdCBpbiBzaW5nbGUganNvbiBmaWxlLCB0aGUgY29uZmlndXJhdGlvbiBjb3VsZCBiZSBsb2Fk
ZWQgYXMgYmVsb3cgYW5kIGl0IHNlZW1zIHRvIHdvcmsgd2VsbC4gRG8geW91IGhhdmUgYW55IHBs
YW5zIHRvIHN1cHBvcnQgZmxleGlibGUgYmxvYi1pZCBpbiBob3N0IGZsYXNoIHRvb2wgb3Igd2Ug
bmVlZCB0byBtb2RpZnkgaXQgYnkgb3Vyc2VsdmVzPyANCgkJCUF1ZyAxMiAyMDo1NDoyMiBocjYz
MCBpcG1pZFs3NzhdOiBjb25maWcgbG9hZGVkOiAvZmxhc2gvYmlvcw0KCQkJQXVnIDEyIDIwOjU0
OjIyIGhyNjMwIGlwbWlkWzc3OF06IGNvbmZpZyBsb2FkZWQ6IC9mbGFzaC9iaW9zMQ0KCQkJQXVn
IDEyIDIwOjU0OjIyIGhyNjMwIGlwbWlkWzc3OF06IGNvbmZpZyBsb2FkZWQ6IC9mbGFzaC9pbWFn
ZQ0KDQo+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPg0KPiA+
ID4gQW5kcmV3DQo+ID4gPg0KPiA+ID4NCg==
