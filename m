Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FE14AD5C
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:52:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4867Ph2Qf4zDqDs
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:52:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=kk21VYpY; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4867N522GszDqFJ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:51:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1580172673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXrs4mIzoiW8QZQh39HqIhhFM5B/Dp4pHM6vly8C0v0=;
 b=kk21VYpY/a1uW2AiMSA4jQWYlXPE0d2PBkLhRPQtWfw/y3nRWjRje+CMK2xj7ybizy+RRa
 2Me2EPd2gi+XFZSoL6bb8im257Vd8J2aETItybOl/YmWGw+1faFI40qf8XC8WXSvqimbMW
 OqJYG7lJdYrTC2YQ6B9kGA69o4idZSo=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-It7Id7suOHmHvz2NeYdGPA-1; Mon, 27 Jan 2020 19:51:07 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 27 Jan 2020 16:50:58 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 27 Jan 2020 16:50:58 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Andrew Jeffery <andrew@aj.id.au>, "Thomaiyar, Richard Marian"
 <richard.marian.thomaiyar@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>, "Winiarska, Iwona"
 <iwona.winiarska@intel.com>, "piotr.matuszczak@intel.com"
 <piotr.matuszczak@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>, James Mihm
 <james.mihm@intel.com>
Subject: RE: Reg OpenBMC PMCI Workgroup
Thread-Topic: Reg OpenBMC PMCI Workgroup
Thread-Index: AQHV0GyZad7DSuc7sUqDvNFIWJ81tKf/y10A//99xbA=
Date: Tue, 28 Jan 2020 00:50:57 +0000
Message-ID: <acadebfec93f429e804443d76462456e@SCL-EXCHMB-13.phoenix.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
 <4469ca80-8df5-43be-876b-f3e393407e59@www.fastmail.com>
In-Reply-To: <4469ca80-8df5-43be-876b-f3e393407e59@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: It7Id7suOHmHvz2NeYdGPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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

SWYgeW91IHdhbnQgdG8gaW5jbHVkZSBTaWxpY29uIFZhbGxleSBpdCBzZWVtIGxpa2UgMjI6MDAs
IDIzOjAwLCAwMDowMCwgMDE6MDAsIGFuZCAwMjowMCBVVEMvR01UIGFyZSB0aGUgb25seSByZWFs
IG9wdGlvbnMuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFtt
YWlsdG86b3BlbmJtYy1ib3VuY2VzK2JydWNlX21pdGNoZWxsPXBob2VuaXguY29tQGxpc3RzLm96
bGFicy5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZXcgSmVmZmVyeQ0KU2VudDogTW9uZGF5LCBKYW51
YXJ5IDI3LCAyMDIwIDE2OjM3DQpUbzogVGhvbWFpeWFyLCBSaWNoYXJkIE1hcmlhbjsgT3BlbkJN
QyBNYWlsbGlzdDsgRGVlcGFrIEtvZGloYWxsaTsgdG9tam9zZXBoQGluLmlibS5jb207IFdpbmlh
cnNrYSwgSXdvbmE7IHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tOyBCcmFkIEJpc2hvcDsgc3Vt
YW50aC5iaGF0QGxpbnV4LmludGVsLmNvbTsgSmFtZXMgTWlobQ0KU3ViamVjdDogUmU6IFJlZyBP
cGVuQk1DIFBNQ0kgV29ya2dyb3VwDQoNCg0KDQpPbiBXZWQsIDIyIEphbiAyMDIwLCBhdCAwMToz
MiwgVGhvbWFpeWFyLCBSaWNoYXJkIE1hcmlhbiB3cm90ZToNCj4gIA0KPiANCj4gQWxsLCANCj4g
DQo+IEluIG9yZGVyIHRvIGNvLW9yZGluYXRlIHRoZSBQTUNJIGltcGxlbWVudGF0aW9uIGluIE9w
ZW5CTUMgKE1DVFAsIFBMRE0sIA0KPiBTUERNIGV0Yy4pLCB0aG91Z2h0IG9mIGhhdmluZyBPcGVu
Qk1DIFBNQ0kgd29ya2dyb3VwLiBXb3JrZ3JvdXBzIG1haW4gDQo+IG9iamVjdGl2ZSB3aWxsIGJl
IHRvIGRpc2N1c3MgUE1DSSByZWxhdGVkIGRlc2lnbiwgYW5kIHRvIHNwZWVkIHVwIHRoZSANCj4g
aW1wbGVtZW50YXRpb24gaW4gYSBjb2xsYWJvcmF0aXZlIG1hbm5lciB3aXRoIHRoZSBjb21tdW5p
dHkuIFRoaXMgaGFzIA0KPiBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkIGluIElSQywgYW5kIGZldyBw
ZW9wbGUgYWxyZWFkeSBzaG93ZWQgaW50ZXJlc3QgDQo+IGluIGhhdmluZyBhIHdlZWtseSAvIGJp
LXdlZWtseSBjYWxsIGZvciB0aGUgc2FtZS4gDQo+IA0KPiBMZXQgbWUga25vdyBpZiB5b3UgYXJl
IGludGVyZXN0ZWQgaW4gam9pbmluZyBhbmQgY29udHJpYnV0aW5nIHRoZSBzYW1lLCANCj4gYW5k
IHdoYXQgdGltZSB3aWxsIGJlIGNvbnZlbmllbnQgZm9yIHlvdS4gRmluZGluZyB0aW1lIGNvbnZl
bmllbnQgZm9yIA0KPiBhbGwgdGltZSB6b25l4oCZcyB3aWxsIGJlIGRpZmZpY3VsdCBidXQgd2ls
bCB0cnkgdG8gc2VlLiBTbyBmYXIgcGVvcGxlIA0KPiBmcm9tIEJhbmdhbG9yZSwgQXVzdHJhbGlh
ICYgUG9sYW5kIGhhdmUgc2hvd24gaW50ZXJlc3QgLyBhbHJlYWR5IA0KPiBjb250cmlidXRpbmcs
IGFuZCBoZW5jZSBsaXN0ZWQgb3V0IHRpbWVzIGNvbnZlbmllbnQgZm9yIHRoZW0uIFBsZWFzZSAN
Cj4gcmVwbHkgdG8gbWUgeW91ciBjb252ZW5pZW50IHRpbWUsIGlmIGJlbG93IG1lbnRpb25lZCB0
aW1lIGRvZXNu4oCZdCBzdWl0LiANCj4gKEJhc2VkIG9uIHRoZSByZXBseSwgd2lsbCB0cnkgdG8g
c2VsZWN0KS4gDQo+IA0KPiBPcHRpb24xIDogTW9uZGF5IC0gMyBQTSB0byA0IFBNIElTVCAoMTA6
MzAgdG8gMTE6MzAgQU0gUG9sYW5kIC8gODozMCB0byANCj4gOTozMCBQTSBBQ1QpLg0KDQpUaGlz
IGlzIHByb2JhYmx5IGdvaW5nIHRvIHdvcmsgYmVzdCBmb3IgbWUgb3V0IG9mIGFsbCBvcHRpb25z
Lg0KDQo+IA0KPiBPcHRpb24yOiBUdWVzZGF5IChTYW1lIGFzIGFib3ZlKQ0KDQpUaGlzIGlzIG15
IHNlY29uZCBjaG9pY2UuDQoNCj4gDQo+IE9wdGlvbiAzOiBNb25kYXkgLSBBbiBob3VyIGVhcmxp
ZXIuICgyIFBNIHRvIDMgUE0gSVNUICg5OjMwIHRvIDEwOjMwIEFNIA0KPiBQb2xhbmQgLyA3OjMw
IHRvIDg6MzAgUE0gQUNUKS4NCj4gDQo+IE9wdGlvbiA0OiBUdWVzZGF5IOKAkyBzYW1lIHRpbWUg
YXMgb3B0aW9uIDMNCj4gDQo+IA0KDQpDaGVlcnMsDQoNCkFuZHJldw0KDQo=

