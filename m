Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82BF0E86
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 06:53:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477G130H4nzDqPg
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 16:53:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=206d7b4a4=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 477G0J229BzF5X1
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 16:52:42 +1100 (AEDT)
IronPort-SDR: uCxOObl+5gm9z5iquV/Qoz3c6KHjK+KedscMUhpLMODoCkBDSVkgQpnSqhN2S9C87ulzpyIejg
 9lXvWPs4Dydg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 06 Nov 2019 13:52:39 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 13:52:37 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Wed, 6 Nov 2019 13:52:37 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Questions about openbmc-test-automation
Thread-Topic: Questions about openbmc-test-automation
Thread-Index: AdWTti27hCt8Gg0PRByoyfDQiVK6a///m0GA//49oFA=
Date: Wed, 6 Nov 2019 05:52:37 +0000
Message-ID: <37a55521de3843c6a407e7faeb68f693@quantatw.com>
References: <937d3cf0ee5b42559e145fbf87c5c9b3@quantatw.com>
 <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
In-Reply-To: <CAAMkS12QPgcdawwV0OdvB_xFB5C78o7AqvTmKcZWYqeTgjCioQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25024.004
x-tm-as-result: No-10--5.282000-5.000000
x-tmase-matchedrid: vEvJ7Rh1lGjuo96mfIBuopzEHTUOuMX33dCmvEa6IiGoLZarzrrPmaLm
 lxP63kmZopwLVp6yT62/a7VA1xg9U/WF5puj6f41ryZo29uPUV4KogTtqoQiBkE3/qvOjgFLUIt
 SuNQYAOLRH78Ygif3X7tCCJ8Cv8fx2cr27ZsPYuFirYvHHJjfEwPQogCre6qltXl9IxEPXOrxBZ
 9GZhVcJ8EdglAiCXqg7RXmDQXnRKJn7D3GC4BpdOIfK/Jd5eHmVFeUPAjsd8Zs98Z8fG/6kQYj+
 P9XfeSQ5FG8mnmnbWOU445mRfcQTr9jX++auvv+bRZGrsoeW/hDfut2Lc1Yh7xgMf9QE2ebc3wu
 qc+4Wow8MwCgiSCug3lySYZqUQo4IqRxG3EBiTfnzlXMYw4XMD3Al4zalJpFwrbXMGDYqV+FR9H
 au8GO7u7bzaWrH1CRV+YCnewsI0ZhaCXwJEixx8WkVY187wsRfPt2JiIJMmg=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--5.282000-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25024.004
x-tm-snts-smtp: 197907759C3B4A87FCC5CB7929ACC9CE1DFE1EE455489A1DA3D31A7F6579D19C2000:B
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

SGkgUmFodWwsDQoNCkZvciBleGFtcGxlLCBjYXNlICJSZXRyaWV2ZSBJUCBBZGRyZXNzIFZpYSBJ
UE1JIEFuZCBWZXJpZnkgVXNpbmcgUmVkZmlzaCIgaW4gL2lwbWkvdGVzdF9pcG1pX25ldHdvcmsu
cm9ib3QuDQpUaGUgbmV3IHdheSBpcyBhcyBmb2xsb3dzOg0KDQpJUE1JIG5ldHdvcmsgY2hhbm5l
bCBsb2dpY2FsbHkgc3RhcnRzIGZyb20gMS4gRm9yIGV4YW1wbGUsIG9uY2UgaXQgZmlndXJlIG91
dCB0aGUgY2hhbm5lbCBjb3VudCBpcyAzLA0Kd2UgY2FuIHJldHJpZXZlIElQIGFkZHJlc3NlcyB0
aHJvdWdoIGNoYW5uZWxzIDEsIDIsIGFuZCAzLCBhbmQgdmVyaWZ5IHRoZW0gY29ycmVzcG9uZCB0
byBldGgwLCBldGgxLCBhbmQgZXRoMiwgcmVzcGVjdGl2ZWx5IGJ5IHJlZGZpc2guDQpJcyBpdCBy
aWdodD8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCkZyb206IFJhaHVsIE1haGVz
aHdhcmkgPHJhaHVsbWFoZXNod2FyaTAxQGdtYWlsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBOb3Zl
bWJlciA1LCAyMDE5IDY6NTEgUE0NClRvOiBUb255IExlZSAo5p2O5paH5a+MKSA8VG9ueS5MZWVA
cXVhbnRhdHcuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6
IFF1ZXN0aW9ucyBhYm91dCBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KDQpUaGFua3MgZm9yIHBv
aW50aW5nIHRoYXQgb3V0LiBQYXNzaW5nIGludGVyZmFjZS9jaGFubmVsIG51bWJlciBpcyBhbiBl
YXNpZXIgb3B0aW9uIGJ1dCB3ZSBzaG91bGQgYmUgYXZvaWRpbmcgcGFzc2luZyBlbnZpcm9ubWVu
dMKgdmFyaWFibGUgdW5sZXNzIHRoZXJlIGlzIG5vIG90aGVyIHdheS4gSSB3b3VsZCBzYXkgYmV0
dGVyIHdheSB0byBvdmVyY29tZSB0aGlzIGlzIHRvIGZpZ3VyZSBvdXQgdGhlIGNoYW5uZWwgY291
bnQgdXNpbmcgImlwIGFkZHIiIGNvbW1hbmQgZnJvbSBCTUMgY2xpLsKgDQpMZXQgdXMga25vdyBp
ZiB0aGF0IHNvdW5kcyBnb29kwqB0byB5b3UuDQpBbHNvIGxldCB1cyBrbm93IGlmIHlvdSB3b3Vs
ZCBsaWtlIHRvIGRyb3AgY29kZSBjaGFuZ2UgZm9yIHRoZSBzYW1lP8KgDQoNClRoYW5rcw0KUmFo
dWwNCg0KDQoNCg0KwqANCg0KT24gVHVlLCBOb3YgNSwgMjAxOSBhdCAyOjI4IFBNIFRvbnkgTGVl
ICjmnY7mloflr4wpIDxtYWlsdG86VG9ueS5MZWVAcXVhbnRhdHcuY29tPiB3cm90ZToNCkhpIFJh
aHVsLA0KwqANCkknbSB3b25kZXJpbmcgdGhhdCB3aHkgIlJFREZJU0hfTldfRVRIMCIgaXMgaGFy
ZGNvZGUgYXMgIk1hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMvZXRoMC8iIGluIC9kYXRh
L3ZhcmlhYmxlcy5weQ0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0LWF1
dG9tYXRpb24vYmxvYi9tYXN0ZXIvZGF0YS92YXJpYWJsZXMucHkjTDE1NQ0KRnVydGhlcm1vcmUs
IHRoZSBjb21tYW5kICJsYW4gcHJpbnQiIGRpZG4ndCBzcGVjaWZ5IHRoZSBjaGFubmVsIG51bWJl
ciBpbiAvaXBtaS90ZXN0X2lwbWlfbmV0d29yay5yb2JvdC4NClRoZXJlZm9yZSwgdGhlIGRlZmF1
bHQgd2lsbCBwcmludCBpbmZvcm1hdGlvbiBvbiB0aGUgZmlyc3QgZm91bmQgTEFOIGNoYW5uZWwu
IA0KwqANCklzbid0IGl0IG1vcmUgcmVhc29uYWJsZSB0byBzZXQgdGhlIGludGVyZmFjZSBhbmQg
dGhlIGNoYW5uZWwgbnVtYmVyIGFzIGVudmlyb25tZW50IHZhcmlhYmxlcyBhbmQgZ2l2ZSB0aGVt
IGRlZmF1bHQgdmFsdWVzPw0KwqANClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KwqANCg==
