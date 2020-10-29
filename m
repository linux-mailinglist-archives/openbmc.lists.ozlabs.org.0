Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99E29F7A1
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 23:16:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMfsj3rmVzDqc3
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 09:16:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=qo1MdoJy; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=qo1MdoJy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMfp26H7hzDqc3
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 09:12:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604009572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r517ST+jB/a/vTiZtvZZh+TNX56MDyzbhR9WGR5JDzk=;
 b=qo1MdoJybJKj0+FFfT8Lfja271vyyTvfOudUi0HEm86MDzi4GdaQGBTSl4Dp65ALP4zbR4
 RoO+jmh3ns7vGnlx1O1GAIrqPmFFLMdCsTmk8Qxmcv3LCCp9vjupAUnhIsUnxa5nlt66vk
 YHqc5gAiRjEy9V6Bpslf9o9W3K7J6x4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604009572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r517ST+jB/a/vTiZtvZZh+TNX56MDyzbhR9WGR5JDzk=;
 b=qo1MdoJybJKj0+FFfT8Lfja271vyyTvfOudUi0HEm86MDzi4GdaQGBTSl4Dp65ALP4zbR4
 RoO+jmh3ns7vGnlx1O1GAIrqPmFFLMdCsTmk8Qxmcv3LCCp9vjupAUnhIsUnxa5nlt66vk
 YHqc5gAiRjEy9V6Bpslf9o9W3K7J6x4=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-R7bzlrlgOeC-V8kUyFiX3A-1; Thu, 29 Oct 2020 18:12:50 -0400
X-MC-Unique: R7bzlrlgOeC-V8kUyFiX3A-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 29 Oct 2020 15:12:46 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 29 Oct 2020 15:12:46 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "OpenBMC (openbmc@lists.ozlabs.org)"
 <openbmc@lists.ozlabs.org>
Subject: RE: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837nv//sAwA//9nhrCAAMYGgP//ih3A
Date: Thu, 29 Oct 2020 22:12:46 +0000
Message-ID: <0c4bf44913a04a0fb667fbdf82ea07be@SCL-EXCHMB-13.phoenix.com>
References: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
 <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
 <20cf0460e28a4950b0b3429d77da276c@SCL-EXCHMB-13.phoenix.com>
 <FA7A7193-3946-44AC-BF2E-6A5071D35690@fb.com>
In-Reply-To: <FA7A7193-3946-44AC-BF2E-6A5071D35690@fb.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.164.179]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
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

TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGlmIGRldnRvb2wgY2FuJ3QgZmluZCB0aGUgc291cmNl
IHRoZW4gYml0YmFrZSB3b24ndCBiZSBhYmxlIHRvIGJ1aWxkIGl0IGVpdGhlci4NCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWpheSBLaGVta2EgW21haWx0bzp2aWph
eWtoZW1rYUBmYi5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI5LCAyMDIwIDM6MTAg
UE0NCj4gVG86IFBhdHJpY2sgVm9lbGtlcjsgT3BlbkJNQyAob3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnKQ0KPiBTdWJqZWN0OiBSZTogVXNpbmcgbG9jYWwgZ2l0IHJlcG8gZm9yIHJlY2lwZSBkZXZl
bG9wbWVudA0KPiANCj4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBhY2hpZXZlIGhlcmUsIGRldnRv
b2wgaXMgZm9yIGxvY2FsIHNvdXJjZSBhbmQgeW91DQo+IGFscmVhZHkgaGF2ZSBsb2NhbCBzb3Vy
Y2UsIGp1c3QgYnVpbGQgaXQgZnJvbSB0aGVyZS4NCj4gDQo+IO+7v09uIDEwLzI5LzIwLCAyOjMz
IFBNLCAiUGF0cmljayBWb2Vsa2VyIiA8UGF0cmlja19Wb2Vsa2VyQHBob2VuaXguY29tPg0KPiB3
cm90ZToNCj4gDQo+ICAgICBWaWpheSwgdGhhdCBkaWRuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZS4g
IEkgZ2V0IHRoZSBzYW1lIHJlc3VsdC4NCj4gDQo+ICAgICA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ICAgICA+IEZyb206IFZpamF5IEtoZW1rYSBbbWFpbHRvOnZpamF5a2hlbWthQGZi
LmNvbV0NCj4gICAgID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMjksIDIwMjAgMTI6MjcgUE0N
Cj4gICAgID4gVG86IFBhdHJpY2sgVm9lbGtlcjsgT3BlbkJNQyAob3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnKQ0KPiAgICAgPiBTdWJqZWN0OiBSZTogVXNpbmcgbG9jYWwgZ2l0IHJlcG8gZm9yIHJl
Y2lwZSBkZXZlbG9wbWVudA0KPiAgICAgPg0KPiAgICAgPg0KPiAgICAgPg0KPiAgICAgPiBPbiAx
MC8yOS8yMCwgMTA6MTcgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBQYXRyaWNrIFZvZWxrZXIi
DQo+IDxvcGVuYm1jLQ0KPiAgICAgPiBib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZg0KPiAgICAgPiBQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5j
b20+IHdyb3RlOg0KPiAgICAgPg0KPiAgICAgPiAgICAgSSdtIGNyZWF0aW5nIGEgbmV3IHJlY2lw
ZSBmb3IgbG9jYWwgZGV2ZWxvcG1lbnQgYnV0IHdoZW4gSSBkbyBhDQo+ICdkZXZ0b29sDQo+ICAg
ICA+IG1vZGlmeSA8cmVjaXBlPicgaXQgYWx3YXlzIHNlZW1zIHRvIG1ha2UgYW4gZW1wdHkgZGly
ZWN0b3J5ICh0aGF0DQo+IGNvbnRhaW5zDQo+ICAgICA+IG9ubHkgLmdpdC4pDQo+ICAgICA+DQo+
ICAgICA+ICAgICBIZXJlJ3MgdGhlIHJlbGV2YW50IGxpbmVzIGZyb20gbXkgLmJiIGZpbGU6DQo+
ICAgICA+ICAgICBTUkNfVVJJID0gImdpdDovLy9ob21lL3B2b2Vsa2VyL2JtYy9kZXYvb2VtO3By
b3RvY29sPWZpbGUiDQo+ICAgICA+DQo+ICAgICA+IEkgYW0gbm90IHRvbyBzdXJlIGJ1dCB0aGlz
IHNob3VsZCBiZSBmaWxlOi8vLCBZb3UgbWF5IGhhdmUgdG8gZml4IGFib3ZlIGxpbmUuDQo+ICAg
ICA+DQo+ICAgICA+ICAgICBTUkNSRVYgPSAiNGRiMTdmNDgyYjBiZGNkY2Y1NjU4YzdkMzIzY2M1
NjNlYjc4NTU2YSINCj4gICAgID4gICAgIGluaGVyaXQgYXV0b3Rvb2xzDQo+ICAgICA+DQo+ICAg
ICA+ICAgICBIZXJlJ3MgdGhlIHdhcm5pbmcgZnJvbSAnZGV2dG9vbCBtb2RpZnknOg0KPiAgICAg
PiAgICAgV0FSTklORzogTm8gc291cmNlIHVucGFja2VkIHRvIFMgLSBlaXRoZXIgdGhlIHBob2Vu
aXgtb2VtIHJlY2lwZQ0KPiAgICAgPiBkb2Vzbid0IHVzZSBhbnkgc291cmNlIG9yIHRoZSBjb3Jy
ZWN0IHNvdXJjZSBkaXJlY3RvcnkgY291bGQgbm90IGJlDQo+ICAgICA+IGRldGVybWluZWQNCj4g
ICAgID4NCj4gICAgID4gICAgIElmIEkgY2hhbmdlIGVpdGhlciB0aGUgU1JDX1VSSSBvciB0aGUg
U1JDUkVWIHRvIGJlIGludmFsaWQsIEkgZ2V0IGFuDQo+IGVycm9yDQo+ICAgICA+IGluc3RlYWQg
b2YgYSB3YXJuaW5nIHNvIGl0J3MgZGVmaW5pdGVseSBmaW5kaW5nIHRoZSBsb2NhbCByZXBvLg0K
PiAgICAgPg0KPiAgICAgPiAgICAgSSBjYW4ndCBmaWd1cmUgb3V0IHdoeSBub25lIG9mIHRoZSBm
aWxlcyBpbiBteSBjb21taXQgYXJlIG1ha2luZyBpdCBpbnRvDQo+IHRoZQ0KPiAgICAgPiB1bnBh
Y2sgZGlyZWN0b3J5LiAgQW55IGlkZWFzIG9yIHRpcHMgb24gZGVidWdnaW5nPyAgSSBhbHNvIHRy
aWVkIHVzaW5nDQo+IGEgLnRhci5neg0KPiAgICAgPiBmaWxlIGluc3RlYWQgb2YgYSBsb2NhbCBn
aXQgcmVwbyBhbmQgaGFkIHRoZSBzYW1lIHJlc3VsdC4NCj4gICAgID4NCj4gDQoNCg==

