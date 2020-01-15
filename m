Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3813B75F
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 03:02:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47y9Yy2kSjzDqS9
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 13:02:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=276038038=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47y9Y00CC1zDqRy
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 13:01:19 +1100 (AEDT)
IronPort-SDR: fsm/WQoHl6kLdSF4FeIg6X9H9QzI8IP+lH9NoZAWbHPlDe9MQMBqeFR7M0Ve78xmW8IvUeJmtJ
 sPKyGHb6Z9ow==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 15 Jan 2020 10:01:15 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 Jan
 2020 10:01:14 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Wed, 15 Jan 2020 10:01:14 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: RE: Unable to use IPMI command "set lan access"
Thread-Topic: Unable to use IPMI command "set lan access"
Thread-Index: AdW+4ER9o+VFu5YZR7i1TDBMqzBZCwL0ZEsAACR2szA=
Date: Wed, 15 Jan 2020 02:01:14 +0000
Message-ID: <1ed21362142940c387ef603715719168@quantatw.com>
References: <81e3354bd54948f8a1ead51c5e1487d4@quantatw.com>
 <3cfcdfe7-b84a-f722-207f-dc299133e4bf@linux.intel.com>
In-Reply-To: <3cfcdfe7-b84a-f722-207f-dc299133e4bf@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 1180149C89480B73056BC6C87181816F8E1C5B887BFF46DC4901CEA8E456B1632000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBzZWUsIHRoYW5rIHlvdSBmb3IgeW91ciByZXBseSBhbmQgZXhwbGFuYXRpb24NCg0KQmVzdCBS
ZWdhcmRzLA0KVG9ueQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRo
b21haXlhciwgUmljaGFyZCBNYXJpYW4gPHJpY2hhcmQubWFyaWFuLnRob21haXlhckBsaW51eC5p
bnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAxNSwgMjAyMCAxMjowOSBBTQ0K
PiBUbzogVG9ueSBMZWUgKKf1pOW0SSkgPFRvbnkuTGVlQHF1YW50YXR3LmNvbT4NCj4gQ2M6IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogVW5hYmxlIHRvIHVzZSBJUE1J
IGNvbW1hbmQgInNldCBsYW4gYWNjZXNzIg0KPiANCj4gSGkgVG9ueSwNCj4gDQo+IFdpbGwgc3Rh
cnQgYWRkcmVzc2luZyB0aGUgY29tbWVudHMgLyByZXNwb25kIHRvIHRoZSBjb21tZW50cyBhbmQg
cmViYXNlIHRoZQ0KPiBwYXRjaC4gQmFzaWNhbGx5IG9uZSBvZiB0aGUgZGlzY3Vzc2lvbiB3ZSBo
YWQgd2FzIHdoZXRoZXIgaXQgaXMgcmVxdWlyZWQNCj4gZ2xvYmFsbHkgb3IgdG8gbGltaXQgaXQg
dG8gSVBNSS4gSSB3YW50IHRvIGNoZWNrIHdpdGggRE1URiByZWxhdGVkIHRvIHRoZWlyDQo+IHN0
cmF0ZWd5IG9uIGNoYW5uZWwgYmFzZWQgcmVzdHJpY3Rpb24gPyB3aWxsIHBvc3QgYSBxdWVzdGlv
biBhbmQgYWNjb3JkaW5nbHkNCj4gdXBkYXRlIHRoZSBwYXRjaC4NCj4gDQo+IFJlZ2FyZHMsDQo+
IA0KPiBSaWNoYXJkDQo+IA0KPiBPbiAxMi8zMC8yMDE5IDEyOjQ2IFBNLCBUb255IExlZSAop/Wk
5bRJKSB3cm90ZToNCj4gPiBoIHJlc29sdmVzIHRoaXMgaXNzdWUuIFdpbGwgdGhlIHBhdGNoIGJl
IHVwZGF0ZWQgaW4gdGhlIGZ1dHVyZSBvciBpcw0KPiA+IHRoZXJlIGFub3RoZXIgc29sdXRpb24g
dG8gdGhpcyBwcm9ibGVtPw0K
