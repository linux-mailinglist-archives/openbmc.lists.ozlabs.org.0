Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFAB8BCD3
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 17:16:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467GWY1D42zDqWf
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 01:16:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.214; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467GVn0P6wzDqVB
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 01:15:26 +1000 (AEST)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-west-2.aws.symcld.net id 7F/A2-22840-C04D25D5;
 Tue, 13 Aug 2019 15:15:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBKsWRWlGSWpSXmKPExsWSLveKXZf7SlC
 swaHLehanWl6wWOw9sJHFgcljwaZSj/MzFjIGMEWxZuYl5VcksGb8OfuVuWCGcMXLvXkNjD+E
 uhi5OIQEWpkk/i84zgjhrGaUeP3yDhuE85JR4vbCiVDOHkaJF29fsncxcnKwCWhJLPy/h6mLk
 YNDREBD4v+7TJAws4ClxOaPl9hB6oUFuhklPrYsYAZJiAgESxxdcpAdwraSWLGhlQXEZhFQlb
 jyYC0TiM0L1LzhxEawuJBAvcT8ozPBejkFAiVOz3rICmIzCshKTHt0nwlimbjE3GmzwOISAgI
 SS/acZ4awRSVePv4HFVeQmPF2C9idzAKaEut36UO0KkpM6X7IDrFWUOLkzCcsExjFZiGZOguh
 YxaSjllIOhYwsqxitEgqykzPKMlNzMzRNTQw0DU0NNI1NDYFso30Eqt0k/RKi3XLU4tLdIHc8
 mK94src5JwUvbzUkk2MwMhLKWhP28G4aNYbvUOMkhxMSqK8088ExgrxJeWnVGYkFmfEF5XmpB
 YfYpTh4FCS4O24FBQrJFiUmp5akZaZA0wCMGkJDh4lEd7DIGne4oLE3OLMdIjUKUZXjgkv5y5
 i5mjbOg9IHjwKIr83LwSSR+YuXcQsxJKXn5cqJc6rAdIsANKcUZoHNxqWwC4xykoJ8zIyMDAI
 8RSkFuVmlqDKv2IU52BUEuZdchFoCk9mXgncBa+AjmMCOu7NjUCQ40oSEVJSDUxc6fL6H28nt
 zhGCnj9fl1+Rnv/Wtnw2SV7z3FlKFr3vj+25kVKone439+Zfa+zJedw9BqfP1g6acY/jRNrmd
 t2vX9fpBjYqGZatk9dujBDZue7/y4b9eJ+3bj+4LkVu63Qqicqk0u5nh98b19adftpMMMf1wV
 HTA0STi7Zy9S6M5uzY2/sbOn7Oysffdz2fVYJ76tXGyc/XXBoVZCx6R0G7vrTmt+O5HWvTtPR
 jnbS233lXr/VpYevD0R73Wy5H7dx+bIfyc9XyTx7+UO3eNlJ9l9PP3j9SH7S/eTQyuQeo7CDD
 C/bzz/Q+Xz2zprbhxm4M38Wqq3Z/HjGTZ0L1S7rFBK2K7HP5Tq/4WGOx5IaIyWW4oxEQy3mou
 JEABiwaN/bAwAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-25.tower-346.messagelabs.com!1565709320!3862!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4736 invoked from network); 13 Aug 2019 15:15:23 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-25.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Aug 2019 15:15:23 -0000
Received: from CNMAILEX02.lenovo.com (unknown [10.96.80.2])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 57690B73F06CC882DE2E;
 Tue, 13 Aug 2019 23:15:20 +0800 (CST)
Received: from pekwpmail07.lenovo.com (10.96.17.29) by CNMAILEX02.lenovo.com
 (10.96.80.2) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 13 Aug 2019
 23:15:19 +0800
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail07.lenovo.com
 (10.96.17.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 13 Aug
 2019 23:15:19 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Tue, 13 Aug 2019 23:15:19 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWxdICBSZTogQ2xhcmlmeSBzb21lIHF1ZXN0aW9u?=
 =?utf-8?B?cyBhYm91dCBob3N0IHRvb2wgKGJ1cm5fbXlfYm1jKQ==?=
Thread-Topic: [External]  Re: Clarify some questions about host tool
 (burn_my_bmc)
Thread-Index: AdVQ3W50GCnSA9PWRhaBmkYUGq9iDAAw6JOAABGQMwA=
Date: Tue, 13 Aug 2019 15:15:19 +0000
Message-ID: <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
 <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
In-Reply-To: <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
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
ZW50dXJlQGdvb2dsZS5jb20+IA0K5Y+R6YCB5pe26Ze0OiAyMDE55bm0OOaciDEz5pelIDIyOjM0
DQrmlLbku7bkuro6IEFuZHJldyBNUzEgUGVuZyA8cGVuZ21zMUBsZW5vdm8uY29tPg0K5oqE6YCB
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCuS4u+mimDogW0V4dGVybmFsXSBSZTogQ2xhcmlm
eSBzb21lIHF1ZXN0aW9ucyBhYm91dCBob3N0IHRvb2wgKGJ1cm5fbXlfYm1jKQ0KDQpPbiBNb24s
IEF1ZyAxMiwgMjAxOSBhdCAyOjQzIEFNIEFuZHJldyBNUzEgUGVuZyA8cGVuZ21zMUBsZW5vdm8u
Y29tPiB3cm90ZToNCj4NCj4gSGkgUGF0cmljaywNCj4NCj4NCj4NCj4gMS4gICAgICBJdCB0b29r
IGFib3V0IDQgbWludXRlcyBhbmQgMzAgc2Vjb25kcyBmb3IgQklPUyB1cGRhdGUgd2l0aCA2NE1C
IHJvbSBpbWFnZS4gQ291bGQgd2UgZXh0ZW5zaW9uIHRoZSBwb2xsc3RhdHVzIHRpbWUgZnJvbSAx
MDAgc2VjIHRvIDMwMCBzZWMgdG8gZ2V0IHRoZSBmaW5hbCBzdGF0dXM/DQoNCkknbSBjdXJpb3Vz
IHdoeSBpdCdzIGhhcm1mdWwgdG8gY2hlY2sgbW9yZSBmcmVxdWVudGx5Pw0KDQoJCUkgc2hvd2Vk
IHNvbWUgc291cmNlIGNvZGUgb2YgaGVscGVyLmNwcCBhcyBiZWxvdywgdGhlIGNoZWNraW5nIHN0
YXR1cyB0b3RhbCB0aW1lIHdhcyAxMDAgc2VjICg1KjIwKSBidXQgaXQgd2FzIG5vdCBlbm91Z2gg
Zm9yIGJpb3MgdXBkYXRlIGFuZCB0aGVyZWZvcmUgSSB3b3VsZCBsaWtlIHRvIGV4dGVuc2lvbiB0
aGUgdGltZSBmcm9tIDEwMCBzZWMgdG8gMzAwIHNlYy4NCg0KCQkJCSAgCXN0YXRpYyBjb25zdGV4
cHIgYXV0byB2ZXJpZmljYXRpb25TbGVlcCA9IDVzOw0KICAgIAkJCQlpcG1pX2ZsYXNoOjpBY3Rp
b25TdGF0dXMgcmVzdWx0ID0gaXBtaV9mbGFzaDo6QWN0aW9uU3RhdHVzOjp1bmtub3duOw0KDQog
ICAJCQkJCXRyeQ0KICAgIAkJCQl7DQogICAgICAgIAkJCQlzdGF0aWMgY29uc3RleHByIGludCBj
b21tYW5kQXR0ZW1wdHMgPSAyMDsNCiAgICAgICAJCQkJCSBpbnQgYXR0ZW1wdHMgPSAwOw0KCQkJ
CQkJLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCg0KPg0KPiAy
LiAgICAgIElmIHVzZXIgY2FuIGNob29zZSB0byBwcmVzZXJ2ZSBCTUMgY29uZmlndXJhdGlvbiAo
cncgYXJlYSkgb3IgQklPUyBjb25maWd1cmF0aW9uIHdoZW4gdXBncmFkZSBmaXJtd2FyZSwgZG8g
eW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHdpdGggcmVnYXJkcyB0byBwcmVzZXJ2ZSBjb25maWd1
cmF0aW9uIGltcGxlbWVudGF0aW9uIG9yIGNvdWxkIHRoZSBob3N0IHRvb2wgc3VwcG9ydCB0byBz
ZW5kIGEgcGFyYW1ldGVyIHRvIHN1cHBvcnQgaXQ/DQoNClNpbmNlIG9uZSBvZiB0aGUgZGVzaWdu
IGdvYWxzIHdhcyB0byBrZWVwIHRoZSBpbnRlcmZhY2UgZnJvbSB0aGUgaG9zdCBzaW1wbGUsIGFu
ZCBtb3N0bHkgYWdvbmlzdGljIHRvIHdoYXQgd2FzIHRha2luZyBwbGFjZSwgY29uc2lkZXJhdGlv
biB3YXNuJ3QgZ2l2ZW4gZm9yIGEgbWVjaGFuaXNtIGZvciBhZGRpbmcgZXh0cmEgcGFyYW1ldGVy
cy4gIFdlJ3JlIGluIGEgc2ltaWxhciBib2F0IHdoZXJlIHdlIHdhbnQgYSBtZWNoYW5pc20gZm9y
IGNoYW5naW5nIHRoZSBsZXZlbCBvZiB1cGdyYWRlLCBzbyBJJ2xsIGdvIG92ZXIgdGhlIGRlc2ln
biB0b2RheSBhdCBzb21lIHBvaW50IGFuZCBzZWUgd2hldGhlciB3ZSBjYW4gZG8gaXQgYWdub3N0
aWNhbGx5Lg0KDQo+DQo+DQo+DQo+IFJlZ2FyZHMsDQo+DQo+IEFuZHJldw0KPg0KPg0K
