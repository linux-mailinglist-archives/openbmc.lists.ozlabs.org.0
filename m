Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9909961F
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 16:17:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DmnN665FzDqXt
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 00:17:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.212; helo=mail1.bemta24.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DmNg5vc1zDrS5
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 23:59:13 +1000 (AEST)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.us-west-2.aws.symcld.net id BF/73-31648-EAF9E5D5;
 Thu, 22 Aug 2019 13:59:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRWlGSWpSXmKPExsWS8eIhr+7a+XG
 xBj/nqFoc3uFpcarlBYsDk8fiPS+ZPM7PWMgYwBTFmpmXlF+RwJrxsuM3W8FK2Yrn878yNTD+
 kOli5OIQEmhgklg9ZRI7hPOaUeLCxElMEM4+RolFPz4xdjFycrAJqEpsefaEBcQWEYiWmLN1J
 ZDNwSEsYC6x7bwsRNhCYvuyfiaQsIiAkcTUO5wgYRagzg8ti1hBbF4BS4lLj1+zQIw/wyixeQ
 LILk4OTgFbie8d78BWMQrISjxZ8AwsziwgLnHuYis7iC0hICCxZM95ZghbVOLl43+sELaCRPO
 e12DnMAtoSqzfpQ/RqigxpfshO8ReQYmTM5+wTGAUmYVk6iyEjllIOmYh6VjAyLKK0TypKDM9
 oyQ3MTNH19DAQNfQ0EjX0NhA19hEL7FKN1GvtFi3PLW4RNdIL7G8WK+4Mjc5J0UvL7VkEyMwi
 lIKmpR2MJ6Z9UbvEKMkB5OSKO/dqXGxQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4i+YA5QSLUt
 NTK9Iyc4ARDZOW4OBREuEVmweU5i0uSMwtzkyHSJ1itOSY8HLuImaOg0fnAckjc5cuYhZiycv
 PS5US5y0CaRAAacgozYMbB0s6lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ856fCzSFJzOv
 BG7rK6CDmIAOqtwRC3JQSSJCSqqBSfK7bytL/7XjG7PNBB2V5GT6/AOd9NbZf6h4tUZ7pdqai
 NUlravfZvRaSxSvaK5gvzb5W4Z3rKZxq6wX76yC/IU1ghNqZQV8vJskv8ntaa6vftdSbDGxs9
 u83joxMOR71uLb3LKsjmfD/zvz/n3+NpirNOhyxfZdD8Jtr3iE2einHwiVO/z1WtXaQzv/TTl
 uZPbeuPnLvGB3eS3/xWlfZNafM/wd4dFovsJZpG21g9nzuEOc+9SOePrfVOzZL8I+e2//wp5q
 y7X+jZ8St/3gyG61mLStya7JZs62N+zXmoTFa4skZmiLL/wT9bX3+0q2DVYmpxezLNsZf9CW8
 ZTVldi5n761t7xMY1irukuJpTgj0VCLuag4EQAWFuqqtQMAAA==
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-21.tower-326.messagelabs.com!1566482348!4772!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18819 invoked from network); 22 Aug 2019 13:59:09 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-21.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Aug 2019 13:59:09 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id EF66754F547E1EDE568C;
 Thu, 22 Aug 2019 09:59:07 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 22 Aug 2019 21:58:54 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Thu, 22 Aug 2019 21:58:54 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Re: ipmitool FRU write question
Thread-Topic: [External] Re: ipmitool FRU write question
Thread-Index: AQHVVFlR/zYONFI3yEua6a58sZO9YKcHOM7g
Date: Thu, 22 Aug 2019 13:58:54 +0000
Message-ID: <c61260a5aedb49d6a65e221135d81610@lenovo.com>
References: <4a91e18f7195458193f673c26986421a@lenovo.com>
 <e9ba404c-a35e-1c46-2a0c-a4fd971312a6@intel.com>
 <6ca6d992e4a248828063ff9f6a8e6c87@lenovo.com>
 <7c781d83-b9a4-16e4-6233-7bad9942c04b@intel.com>
In-Reply-To: <7c781d83-b9a4-16e4-6233-7bad9942c04b@intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gOC8xNi8xOSA5OjUyIEFNLCBIYXJyeSBTdW5nMSB3cm90ZToNCj4gPg0KPiA+IEhp
IEVkLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIGtpbmRseSByZXBseSEgSSBoYXZlIHN1cnZl
eWVkIHRoZSBlbnRpdHktbWFuYWdlciBiZWZvcmUuDQo+ID4gQnV0IEkgZW5jb3VudGVyZWQgYW4g
aXNzdWUgd2hlbiBJIHVzaW5nIHBob3NwaG9yLWludmVudG9yeS1tYW5hZ2VyIGFuZA0KPiBlbnRp
dHktbWFuYWdlciBhdCB0aGUgc2FtZSB0aW1lLg0KPiA+IEJvdGggb2YgdGhlbSBoYXZlIHNhbWUg
bWV0aG9kICJOb3RpZnkiIHVuZGVyIHNhbWUgaW50ZXJmYWNlICINCj4geHl6Lm9wZW5ibWNfcHJv
amVjdC5JbnZlbnRvcnkuTWFuYWdlciAiLCBidXQgZGlmZmVyZW50IHNpZ25hdHVyZS4NCj4gPg0K
PiA+IHBob3NwaG9yLWludmVudG9yeS1tYW5hZ2VyOg0KPiA+IE5BTUUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgVFlQRSAgICBTSUdOQVRVUkUNCj4gUkVTVUxUL1ZBTFVFICAgRkxB
R1MNCj4gPiB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5NYW5hZ2VyIGludGVyZmFjZSAt
ICAgICAgICAgICAgIC0NCj4gLQ0KPiA+IC5Ob3RpZnkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbWV0aG9kICAgIGF7b2F7c2F7c3Z9fX0gLQ0KPiAtDQo+ID4NCj4gPiBlbnRpdHktbWFu
YWdlcg0KPiA+IE5BTUUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRSAgICBT
SUdOQVRVUkUNCj4gUkVTVUxUL1ZBTFVFICAgRkxBR1MNCj4gPiB4eXoub3BlbmJtY19wcm9qZWN0
LkludmVudG9yeS5NYW5hZ2VyIGludGVyZmFjZSAtICAgICAgICAgLQ0KPiAtDQo+ID4gLk5vdGlm
eSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZXRob2QgICAgYXtzYXtzdn19IC0NCj4g
LQ0KPiANCj4gTG9va2luZyBhdCB0aGUgY29kZSwgdGhlcmUncyBzb21lIGlyb255IHRoZXJlLiAg
VGhhdCBmdW5jdGlvbiBhcHBlYXJzIHRvIGJlDQo+IGltcGxlbWVudGVkIGZvciBjb21wYXRpYmls
aXR5LCBhcyBpdCBkb2Vzbid0IGFjdHVhbGx5IGRvIGFueXRoaW5nIGV4Y2VwdCByZXR1cm4NCj4g
aW1tZWRpYXRlbHkuDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5hZ2Vy
L2Jsb2IvYjAwOTdkNDFkMjA2MDA2YTZjOWEwDQo+IGU0NjRjYjg3Y2NiZjc5NzkyMWIvc3JjL0Vu
dGl0eU1hbmFnZXIuY3BwI0wxNjQxDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgY2xlYXIgcmVwbHku
IEkgd2lsbCBsb29rIGludG8gaXQuIA0KDQo+IFRoZSBpcm9ueSBpcyB0aGF0IChhcyB5b3UndmUg
Zm91bmQpIGl0IGdvdCB0aGUgaW50ZXJmYWNlIHdyb25nLCBzbyBpdCBkb2Vzbid0DQo+IHJlYWxs
eSBkbyBhbnl0aGluZyB1c2VmdWwgaW4gdGVybXMgb2YgY29tcGF0aWJpbGl0eS4NCj4gDQo+ID4N
Cj4gPiBTbyB3aGVuIHNvbWUgc2VydmljZXMgY2FsbCB0aGUgJ05vdGlmeScgbWV0aG9kIGZhaWxl
ZCBiZWNhdXNlIG9mIGdldHRpbmcNCj4gd3Jvbmcgc2VydmljZS4NCj4gPiBFeDoNCj4gPiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9pcG1pLWZydS1wYXJzZXIvYmxvYi9tYXN0ZXIvd3JpdGVm
cnVkYXRhLmNwDQo+ID4gcCNMMjA2DQo+ID4gSGF2ZSB5b3UgZXZlciBzZWVuIHRoaXMgaXNzdWUg
YmVmb3JlPw0KPiANCj4gSWYgeW91IGFyZSB1c2luZyBGcnVEZXZpY2UsIHlvdSBzaG91bGQgdXNl
IGl0IGluIHRhbmRlbSB3aXRoIHRoZSBjb21tYW5kIHNldHMNCj4gSSBsaW5rZWQgcHJldmlvdXNs
eS4gIEdpdmVuIGhvdyBlbnRpdHktbWFuYWdlciBpcyBhcmNoaXRlY3RlZCwgdGhlcmUgaXMgbm8N
Cj4gY29uY2VwdCBvZiBhICJOb3RpZnkiLiAgRW50aXR5IG1hbmFnZXIgcmVsaWVzIG9uIHRoZSBw
dWJsaXNoZWQgT2JqZWN0TWFuYWdlcg0KPiBpbnRlcmZhY2VzIHRvIGtub3cgd2hlbiB0aGluZ3Mg
aGF2ZSBiZWVuIGFkZGVkL3JlbW92ZWQuICBJbiB0aGUgY29tbWFuZA0KPiBzZXRzIEkgbGlua2Vk
LCB0aGV5IGludGVyYWN0IHdpdGggRnJ1RGV2aWNlIGRpcmVjdGx5LCBzbyB0ZWNobmljYWxseSBl
bnRpdHkNCj4gbWFuYWdlciBpc24ndCBldmVuIHJlcXVpcmVkIGZvciBpbnRlcmFjdGluZyB3aXRo
IHRoZSBwaHlzaWNhbCBmcnUgZGV2aWNlcy4NCj4gRW50aXR5IG1hbmFnZXIgaXMgdXNlZCBmb3Ig
cmVjb25maWd1cmluZyB0aGUgc3lzdGVtIG9uY2UgdGhlIGhhcmR3YXJlIGhhcw0KPiBiZWVuIGRl
dGVjdGVkIHZpYSBGcnVEZXZpY2UuDQoNCklmIEkgb25seSB3YW50IHRvIHVzZSB0aGUgRlJVIGNv
bW1hbmQgc2V0cyB5b24gbGlua2VkIHByZXZpb3VzbHkuIA0KSXMgaXQgYWxsb3cgdG8gYWRkIElu
dGVsIElQTUkgT0VNIGNvbW1hbmRzIGludG8gb3VyIElQTUkgT0VNIGxpYnJhcnk/DQoNCj4gDQo+
ID4NCj4gPiBTaG91bGQgSSB1c2UgaW50ZWwtZGJ1cy1pbnRlcmZhY2VzIGlmIEkgd2FudCB0byB1
c2UgRnJ1ZGV2aWNlIChlbnRpdHktbWFuYWdlcikNCj4gYW5kIHdyaXRlIEZSVSBjb21tYW5kKGlu
dGVsLWlwbWktb2VtKT8NCj4gPiBPciBpdCBpcyBjb21wYXRpYmxlIHdpdGggb3JpZ2luYWwgZGJ1
cy1pbnRlcmZhY2U/DQo+IA0KPiBJIGRvbid0IGJlbGlldmUgYW55dGhpbmcgeW91J3ZlIGxvb2tl
ZCBhdCBzbyBmYXIgcmVxdWlyZXMgaW50ZWwtZGJ1cy1pbnRlcmZhY2VzLg0KPiBNb3N0IG9mIHRo
ZSBlbnRpdHktbWFuYWdlci9mcnVkZXZpY2UgYmluZGluZ3MgYXJlIHVzaW5nIHNkYnVzcGx1cyBk
aXJlY3RseSB0bw0KPiBjcmVhdGUgdGhlaXIgaW50ZXJmYWNlcy4NCg==
