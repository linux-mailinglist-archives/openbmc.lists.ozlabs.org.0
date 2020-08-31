Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6483B257B59
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 16:35:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgCRL4lfRzDqVQ
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:35:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=E1ts/RTp; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=c8440fAs; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCNK0CgBzDqC7
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598884363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj4eXpRHEWYm3EGPYvSatTbSz1p+nnNO7PDmdIYQVug=;
 b=E1ts/RTp+kNvfGvnQFvaZ5fh1PhnI982G70agVcxLBPMRsvVfPnHa8iMFUJxa71LCF87rb
 N0jAIwy7sEXe07QLPVSHZc3syZxys1LPHuSi6B//sV+qW+MUHjTHRD/Ab5EkZB06OyR/93
 VXlB/Kf0OVOO7XDuS0ozbwQxlQKDV5w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598884364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj4eXpRHEWYm3EGPYvSatTbSz1p+nnNO7PDmdIYQVug=;
 b=c8440fAsD08IaJaOmWEhSj37R427Bzz6r1TAzWSzY5WBjns/YCEn29cda8pIZRZjKTPXUH
 fZ87DDjbqQVYqo3c6X/j1vY0SeTyIGXcoPEQAJsZH9CIUACmuXB7CbO2aYXppMt3Z+kIzn
 Ukd7CLwwD3FmPCsIB1cDC63UAQzpURQ=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-usBJeqB3PteDxR6BKV89MQ-1; Mon, 31 Aug 2020 10:32:41 -0400
X-MC-Unique: usBJeqB3PteDxR6BKV89MQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 31 Aug 2020 07:32:39 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 31 Aug 2020 07:32:39 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Looking to do multiple platform ports uniformly with the ability
 to easily add more to follow.
Thread-Topic: Looking to do multiple platform ports uniformly with the ability
 to easily add more to follow.
Thread-Index: AdZ8rYI+aL15o6qDRKG4658L6my7NADL5p0AAA5o/uA=
Date: Mon, 31 Aug 2020 14:32:38 +0000
Message-ID: <3aae208e29aa47d59222d721404f21d9@SCL-EXCHMB-13.phoenix.com>
References: <92e6ad599b10400885d44e9d6b9c28ef@SCL-EXCHMB-13.phoenix.com>
 <CACWQX81DSFDNoLRKuidgMSDAkphPywLkb2ELBV=MEMi0f5nJWg@mail.gmail.com>
In-Reply-To: <CACWQX81DSFDNoLRKuidgMSDAkphPywLkb2ELBV=MEMi0f5nJWg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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

VGhhbmsgeW91IEVkLA0KSSB3aWxsIHdvcmsgd2l0aCBvdXIgYnVpbGQgYW5kIGFyY2hpdGVjdHMu
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRWQgVGFub3VzIFttYWls
dG86ZWRAdGFub3VzLm5ldF0NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgMzEsIDIwMjAgMDc6MjUN
Cj4gVG86IEJydWNlIE1pdGNoZWxsDQo+IENjOiBPcGVuQk1DIE1haWxsaXN0DQo+IFN1YmplY3Q6
IFJlOiBMb29raW5nIHRvIGRvIG11bHRpcGxlIHBsYXRmb3JtIHBvcnRzIHVuaWZvcm1seSB3aXRo
IHRoZQ0KPiBhYmlsaXR5IHRvIGVhc2lseSBhZGQgbW9yZSB0byBmb2xsb3cuDQo+IA0KPiBPbiBU
aHUsIEF1ZyAyNywgMjAyMCBhdCAxOjA4IFBNIEJydWNlIE1pdGNoZWxsDQo+IDxCcnVjZV9NaXRj
aGVsbEBwaG9lbml4LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPdXIgZGVzaXJlIGlzIHRvIGhhdmUg
b3VyIG93biBwbGF0Zm9ybSBwb3J0cyBmb3IgV29sZiBQYXNzIGFuZCBUaW9nYQ0KPiBQYXNzLCB3
aXRoIG1vcmUgdG8gY29tZSwgd2l0aCBhIGNvbnNpc3RlbnQgdW5pZmllZCBtZXRhLXBob2VuaXgv
bWV0YS0NCj4gPHBsYXRmb3JtPg0KPiANCj4gV2hhdCBpcyBhICJwbGF0Zm9ybSBwb3J0IiBpbiB0
aGlzIGNhc2U/ICBUaGVyZSdzIGFscmVhZHkgbWV0YSBsYXllcnMNCj4gZm9yIGJvdGggcGxhdGZv
cm1zIGluIHVwc3RyZWFtLCBhbmQgdGhhdCB3b3VsZCBiZSB0aGUgYmVzdCBwbGFjZSB0bw0KPiBj
aGVjayBpbiBhbnkgcGxhdGZvcm0gc3BlY2lmaWMgZml4ZXMgb3IgZnVuY3Rpb25hbGl0eS4gIFBs
ZWFzZSBkbyBub3QNCj4gY2hlY2sgaW4gcGxhdGZvcm0tc3BlY2lmaWMgY29kZSBpbnRvIG1ldGEt
cGhvZW5peC4NCj4gDQo+ID4gQW5kIGxvb2tpbmcgdG8gY2hvb3NlIHRoZSBiZXN0IGtub3cgbWV0
aG9kcyBhbmQgKHJlLSlzdGFydGluZw0KPiBwb2ludChzKS4NCj4gPiBOZWVkIHRvIHJvdyB3aXRo
IHRoZSBPcGVuQk1DIGNvbW11bml0eSBhbmQgZ2V0IGl0IGNvcnJlY3QgZnJvbSB0aGUNCj4gc3Rh
cnQuDQo+ID4NCj4gPiBUaGFua3MhDQo+ID4NCj4gPiAtLQ0KPiA+IEJydWNlDQo+ID4NCj4gPg0K
DQo=

