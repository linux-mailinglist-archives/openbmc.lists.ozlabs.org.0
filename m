Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08D2932B7
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 03:38:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFbqc6YpCzDqT5
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 12:38:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=P8LAMwMx; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=P8LAMwMx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFbpn5mRwzDqSW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 12:37:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603157852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBG4E4YhoGFezMc8kheLT+VA9EEqsUZ9MH7mkbZ1in0=;
 b=P8LAMwMxZ8y8ehDgIs4jzd8sJrdSgNoJLGdJZW06/ZsGB7h1czrEGqLGdjPpmJOAgFZREi
 5hRMwk2lpPhz91C5OVxCy9DGaEicUbbADGqfT/9hnqQBnci3PfrCCq+aAbav7wCfugeQ7d
 bdIUCZbB8uTL5UClKm8J1rW9dS0Zw48=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1603157852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBG4E4YhoGFezMc8kheLT+VA9EEqsUZ9MH7mkbZ1in0=;
 b=P8LAMwMxZ8y8ehDgIs4jzd8sJrdSgNoJLGdJZW06/ZsGB7h1czrEGqLGdjPpmJOAgFZREi
 5hRMwk2lpPhz91C5OVxCy9DGaEicUbbADGqfT/9hnqQBnci3PfrCCq+aAbav7wCfugeQ7d
 bdIUCZbB8uTL5UClKm8J1rW9dS0Zw48=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Ws-PN5e_PHOHSRPM-H8q_Q-1; Mon, 19 Oct 2020 17:35:46 -0400
X-MC-Unique: Ws-PN5e_PHOHSRPM-H8q_Q-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 19 Oct 2020 14:35:44 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 19 Oct 2020 14:35:44 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: Andrew Geissler <geissonator@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Critical BMC process failure recovery
Thread-Topic: Critical BMC process failure recovery
Thread-Index: AQHWplGZfOhEzZa7m0y6Af3HsuId7KmfbrcQ
Date: Mon, 19 Oct 2020 21:35:43 +0000
Message-ID: <95ad99d7921c405e93b794463d702853@SCL-EXCHMB-13.phoenix.com>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
In-Reply-To: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.43.115.205]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
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

SGV5IEFuZHJldyENCg0KQXQgbGVhc3QgaW5pdGlhbGx5LCB0aGUgcmVxdWlyZW1lbnRzIGRvbid0
IHJlYWxseSBzZWVtIGxpa2UgcmVxdWlyZW1lbnRzIC0gdGhleSBzZWVtIGxpa2Ugd2hhdCBzb21l
b25lJ3MgaWRlYSBvZiB3aGF0IHRoZXkgdGhpbmsgYSBzb2x1dGlvbiB3b3VsZCBiZS4gIEZvciBl
eGFtcGxlLCB3aHkgcmVzZXQgMyB0aW1lcz8gV2h5IG5vdCAxMD8gT3IgMj8gU2VlbXMgY29tcGxl
dGVseSBhcmJpdHJhcnkuIElmIHRoZSBCTUMgcmVzZXRzIHR3aWNlIGluIGEgcm93LCB0aGVyZSdz
IG5vIHJlYXNvbiB0byB0aGluayBpdCB3b3VsZCBiZSBPSyB0aGUgM3JkIHRpbWUuIEl0J3Mga2lu
ZGEgbGlrZSBob3cgcGVvcGxlIGhhdmUgYmVlbiBrbm93biBkbyA0LTUgZmlybXdhcmUgdXBkYXRl
cyB0byAiZml4IiBhIHByb2JsZW0gYW5kIGl0ICJzdGlsbCBkb2Vzbid0IHdvcmsiLiDwn5iJDQoN
CklmIHRoZSB1bHRpbWF0ZSBnb2FsIGlzIGF2YWlsYWJpbGl0eSwgdGhlbiB0aGVyZSdzIG1vcmUg
bnVhbmNlIHRvIHRoZSBkaXNjdXNzaW9uIHRvIGJlIGhhZC4gTGV0J3MgYXNzdW1lIHRoZSBnb2Fs
IGlzICJoaWdoZXN0IGF2YWlsYWJpbGl0eSBwb3NzaWJsZSIuDQoNCldpdGggdGhhdCBpbiBtaW5k
LCBkZWZpbmluZyB3aGF0ICJmYWlsdXJlIiBpcyBnZXRzIHRvIGJlIGEgYml0IG1vcmUgY29udm9s
dXRlZC4gQmFjayB3aGVuIHdlIGRpZCB0aGUgQ01NIGNvZGUgZm9yIHRoZSBJbnRlbCBtb2R1bGFy
IHNlcnZlciwgd2UgaGFkIGEgc2V2ZXJhbC1wcm9uZ2VkIGFwcHJvYWNoOg0KDQoxKSBSdW4gcHJv
Y21vbiAtIExvb2sgZm9yIGFueSBzZXJ2aWNlIHRoYXQgaXMgc3VwcG9zZWQgdG8gYmUgcnVubmlu
ZyAoYnV0IGlzbid0KSBhbmQgcmVzdGFydCBpdCBhbmQvb3IgaXRzIHByb2Nlc3MgZGVwZW5kZW5j
eSB0cmVlLg0KMikgQ3JlYXRlIGEgbW9uaXRvciAoZWl0aGVyIGEgc3RhbmRhbG9uZSBwcm9ncmFt
IG9yIGEgc2NyaXB0KSB0aGF0IHBlcmlvZGljYWxseSBjb25uZWN0cyB0byB0aGUgdmFyaW91cyBz
ZXJ2aWNlcyBhdmFpbGFibGUgLSBJUE1JLCB3ZWIsIEtWTSwgZXRjLi4uLiAtIHRoaW5rIG9mIGl0
IGxpa2UgYSBmdW5jdGlvbmFsICJwaW5nIi4gQSBiaXQgbW9yZSBpbnZvbHZlZCwgYXMgdGhpcyBt
YXN0ZXIgY29udHJvbCBwcm9ncmFtIChUcm9uIHJlZmVyZW5jZSDwn5iJICkgd291bGQgaGF2ZSB0
byBzcGVhayBzZW50aWVudGx5IHRvIGVhY2ggc2VydmljZSB0byBnYXVnZSBob3cgYWxpdmUgaXQg
aXMuIFRoZXJlIGhhdmUgYmVlbiBwbGVudHkgb2Ygc2l0dWF0aW9ucyB3aGVyZSBhIEJNQyBpcyBv
dGhlcndpc2UgaGVhbHRoeSBidXQgb25lIHNlcnZpY2Ugd2Fzbid0IHdvcmtpbmcsIGFuZCBpdCdz
IG92ZXJraWxsIHRvIGhhdmUgYSAzMC00NSBzZWNvbmQgb3V0YWdlIHdoaWxlIHRoZSBCTUMgcmVz
dGFydHMuDQozKSBLZXJuZWwgcGFuaWNzIHdlcmUgc2V0IHRvIGF1dG9tYXRpY2FsbHkgcmVib290
IHRoZSBCTUMsIHdpdGggYSBkb3VibGUgd2hhbW15IG9mIHRoZSBoYXJkd2FyZSB3YXRjaGRvZyBi
ZWluZyBlbmFibGVkIGluIGNhc2UgdGhlIENQVSBkaWRuJ3QgcmVzZXQuDQoNClRoZXJlJ3MgbW9y
ZSB0byBpdCB0aGFuIHRoaXMsIGFzIHNvbWV0aW1lcyB5b3UnZCBoYXZlIHRvIHF1aWVzY2UgcHJv
Y21vbiB0byBub3QgcmVzdGFydCBzZXJ2aWNlcyB0aGF0LCB0aHJvdWdoIG5vcm1hbCBvcGVyYXRp
b24sIHdvdWxkIGNlYXNlIGZ1bmN0aW9uaW5nIGZvciBhIGJyaWVmIHBlcmlvZCBvZiB0aW1lLCBz
byB0dW5pbmcgd291bGQgYmUgcmVxdWlyZWQuDQoNCi0tPk5laWwNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytuZWlsX2JyYWRsZXk9
cGhvZW5peC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJldyBHZWlzc2xl
cg0KU2VudDogTW9uZGF5LCBPY3RvYmVyIDE5LCAyMDIwIDEyOjUzIFBNDQpUbzogT3BlbkJNQyBN
YWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogQ3JpdGljYWwgQk1D
IHByb2Nlc3MgZmFpbHVyZSByZWNvdmVyeQ0KDQpHcmVldGluZ3MsDQoNCkkndmUgc3RhcnRlZCBp
bml0aWFsIGludmVzdGlnYXRpb24gaW50byB0d28gSUJNIHJlcXVpcmVtZW50czoNCg0KLSBSZWJv
b3QgdGhlIEJNQyBpZiBhICJjcml0aWNhbCIgcHJvY2VzcyBmYWlscyBhbmQgY2FuIG5vdCByZWNv
dmVyDQotIExpbWl0IHRoZSBhbW91bnQgb2YgdGltZXMgdGhlIEJNQyByZWJvb3RzIGZvciByZWNv
dmVyeQ0KICAtIExpbWl0IHNob3VsZCBiZSBjb25maWd1cmFibGUsIGkuZS4gMyByZXNldHMgd2l0
aGluIDUgbWludXRlcw0KICAtIElmIGxpbWl0IHJlYWNoZWQsIGRpc3BsYXkgZXJyb3IgdG8gcGFu
ZWwgKGlmIG9uZSBhdmFpbGFibGUpIGFuZCBoYWx0DQogICAgdGhlIEJNQy4NCg0KVGhlIGdvYWwg
aGVyZSBpcyB0byBoYXZlIHRoZSBCTUMgdHJ5IGFuZCBnZXQgaXRzZWxmIGJhY2sgaW50byBhIHdv
cmtpbmcgc3RhdGUgdmlhIGEgcmVib290IG9mIGl0c2VsZi4NCg0KVGhpcyBzYW1lIHJlYm9vdCBs
b2dpYyBhbmQgbGltaXRzIHdvdWxkIGFsc28gYXBwbHkgdG8ga2VybmVsIHBhbmljcyBhbmQvb3Ig
Qk1DIGhhcmR3YXJlIHdhdGNoZG9nIGV4cGlyYXRpb25zLg0KDQpTb21lIHRob3VnaHRzIHRoYXQg
aGF2ZSBiZWVuIHRocm93biBhcm91bmQgaW50ZXJuYWxseToNCg0KLSBTcGVuZCBtb3JlIHRpbWUg
ZW5zdXJpbmcgY29kZSBkb2Vzbid0IGZhaWwgdnMuIGhhbmRsaW5nIHRoZW0gZmFpbGluZw0KLSBQ
dXQgYWxsIEJNQyBjb2RlIGludG8gYSBzaW5nbGUgYXBwbGljYXRpb24gc28gaXQncyBhbGwgb3Ig
bm90aGluZyAodnMuIA0KICB0cnlpbmcgdG8gcGljayBhbmQgY2hvb3NlIHNwZWNpZmljIGFwcGxp
Y2F0aW9ucyBhbmQgZGVhbGluZyB3aXRoIGFsbCBvZg0KICB0aGUgaW50cmljYWNpZXMgb2YgcmVz
dGFydGluZyBpbmRpdmlkdWFsIG9uZXMpDQotIFJlYm9vdGluZyB0aGUgQk1DIGFuZCBnZXR0aW5n
IHRoZSBwcm9wZXIgb3JkZXJpbmcgb2Ygc2VydmljZSBzdGFydHMgaXMNCiAgc29tZXRpbWVzIGVh
c2llciB0aGVuIHRlc3RpbmcgZXZlcnkgaW5kaXZpZHVhbCBzZXJ2aWNlIHJlc3RhcnQgZm9yIHJl
Y292ZXJ5DQogIHBhdGhzDQoNCiJDcml0aWNhbCIgcHJvY2Vzc2VzIHdvdWxkIGJlIHRoaW5ncyBs
aWtlIG1hcHBlciBvciBkYnVzLWJyb2tlci4gVGhlcmUncyBkZWZpbml0ZWx5IGEgZ3JleSBhcmVh
IHRob3VnaCB3aXRoIG90aGVyIHNlcnZpY2VzIHNvIHdlJ2QgbmVlZCBzb21lIGd1aWRlbGluZXMg
YXJvdW5kIGRlZmluaW5nIHRoZW0gYW5kIGFsbG93IHRoZSBtZXRhIGxheWVycyB0byBoYXZlIGEg
d2F5IHRvIGRlZW0gd2hpY2hldmVyIHRoZXkgd2FudCBjcml0aWNhbC4NCg0KU28gYW55d2F5LCBq
dXN0IHRocm93aW5nIHRoaXMgb3V0IHRoZXJlIHRvIHNlZSBpZiBhbnlvbmUgaGFzIGFueSBpbnB1
dCBvciBpcyBsb29raW5nIGZvciBzb21ldGhpbmcgc2ltaWxhci4NCg0KSGlnaCBsZXZlbCwgSSdk
IHByb2JhYmx5IHN0YXJ0IGxvb2tpbmcgaW50byB1dGlsaXppbmcgc3lzdGVtZCBhcyBtdWNoIGFz
IHBvc3NpYmxlLiAiRmFpbHVyZUFjdGlvbj1yZWJvb3QtZm9yY2UiIGluIHRoZSBjcml0aWNhbCBz
ZXJ2aWNlcyBhbmQgc29tZXRoaW5nIHRoYXQgbW9uaXRvcnMgZm9yIHRoZXNlIHR5cGVzIG9mIHJl
Ym9vdHMgYW5kIGVuZm9yY2VzIHRoZSByZWJvb3QgbGltaXRzLg0KDQpBbmRyZXcNCg0K

