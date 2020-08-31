Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91990257B5E
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 16:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgCTJ0vq4zDqPg
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:37:08 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=Y8MaxCQ0; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Y8MaxCQ0; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCQ62Z11zDqV1
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 00:34:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598884459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4ngFWscbTNtkwa5ksyyyz6qJlobdUwEwNaDrmh3CQg=;
 b=Y8MaxCQ0Vp8e1A/G65Q8VuB/W36TTmDkFJYKbgSxyZ4zq60ZCpUbPWiZ7/d72HFZv+7pUZ
 3j7e/CVPArFJmr1YcY5KywqUCPp0Fj588b7P+CotdTP0/gdOuFVSOVkOcoijLblJKkOD7O
 uyvB4Nt8hwoFUcXmYTdsK3erDvUuQoI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598884459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4ngFWscbTNtkwa5ksyyyz6qJlobdUwEwNaDrmh3CQg=;
 b=Y8MaxCQ0Vp8e1A/G65Q8VuB/W36TTmDkFJYKbgSxyZ4zq60ZCpUbPWiZ7/d72HFZv+7pUZ
 3j7e/CVPArFJmr1YcY5KywqUCPp0Fj588b7P+CotdTP0/gdOuFVSOVkOcoijLblJKkOD7O
 uyvB4Nt8hwoFUcXmYTdsK3erDvUuQoI=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ANmHod9mOvqx6EEW4zHO3g-1; Mon, 31 Aug 2020 10:34:15 -0400
X-MC-Unique: ANmHod9mOvqx6EEW4zHO3g-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 31 Aug 2020 07:34:13 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 31 Aug 2020 07:34:13 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAp4sAAAAeh65D///5LAIAAdEcQ
Date: Mon, 31 Aug 2020 14:34:12 +0000
Message-ID: <33455399c4c748e9b8304b4ade883061@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200831105718.o2ic4dvqhde5qrh7@thinkpad.dyn.fuzziesquirrel.com>
 <67f35707fd1844cea64708f64f41224e@SCL-EXCHMB-13.phoenix.com>
 <CACWQX81o5SMhoGrJwvJhTxNXa5iM77v+eFGYUEeH=6-7U3nxWg@mail.gmail.com>
In-Reply-To: <CACWQX81o5SMhoGrJwvJhTxNXa5iM77v+eFGYUEeH=6-7U3nxWg@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IEVkLA0KQWdhaW4gSSB3aWxsIG5lZWQgdG8gd29yayB3aXRoIG91ciBidWlsZCBw
ZW9wbGUgYW5kIGFyY2hpdGVjdHMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogRWQgVGFub3VzIFttYWlsdG86ZWRAdGFub3VzLm5ldF0NCj4gU2VudDogTW9uZGF5LCBB
dWd1c3QgMzEsIDIwMjAgMDc6MzANCj4gVG86IEJydWNlIE1pdGNoZWxsDQo+IENjOiBCcmFkIEJp
c2hvcDsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBXaGVuIGJ1aWxk
aW5nIE9wZW5CTUMgLiAuIC4gPw0KPiANCj4gT24gTW9uLCBBdWcgMzEsIDIwMjAgYXQgNzoyMyBB
TSBCcnVjZSBNaXRjaGVsbA0KPiA8QnJ1Y2VfTWl0Y2hlbGxAcGhvZW5peC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gV2UgYXJlIGJ1aWxkaW5nIGEgc2VwYXJhdGUgcG9ydCBmb3IgVGlvZ2EgUGFzcywg
c28gdGhlIHF1ZXN0aW9uIGlzDQo+IHNob3VsZCBiZSBub3QgY2FsbCBpdCB0aW9nYXBhc3M/DQo+
ID4NCj4gDQo+IERvbid0IGNyZWF0ZSBhIHNlcGFyYXRlICJwb3J0Ii4gIENoZWNrIHlvdXIgZml4
ZXMgaW50byB0aGUgVGlvZ2EgcGFzcw0KPiBtYWNoaW5lIGFuZCBnZXQgdGhlbSByZXZpZXdlZC4g
IElmIHRoZXJlJ3MgY29uZmxpY3RzIHdpdGggZmVhdHVyZXNldHMNCj4gd2l0aCBvdGhlciB0aW9n
YSBwYXNzIHVzZXJzIChhcyBJJ20gc3VyZSB0aGVyZSB3aWxsIGJlKSBkZXRlcm1pbmUgd2hhdA0K
PiB0aGV5IGFyZSwgdGhlbiByb2xsIHRoZSByZXF1aXJlZCBjb25maWd1cmFiaWxpdHkgb3B0aW9u
cyB1cCB0byB0aGUNCj4gcHJvamVjdCBsZXZlbCBsYXllcnMgc28gdXNlcnMgY2FuIHNlbGVjdCB0
aGUgZmVhdHVyZXMgdGhleSB3YW50IGluIGENCj4gYnVpbGQuDQo+IA0KPiBQbGVhc2UgZG8gbm90
IGFkZCBtZXRhLXBob2VuaXgvbWV0YS10aW9nYS4gIFRoZSBwZXItbWFjaGluZSBtZXRhDQo+IGxh
eWVycyBhcmUgY29tcGxpY2F0ZWQgZW5vdWdoIGFzLWlzLg0KDQo=

