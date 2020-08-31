Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814E258438
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:52:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgQSM13m9zDq9Z
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:52:03 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=Jw+4VwXt; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Jw+4VwXt; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgQRY2b3QzDqQC
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 08:51:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598914275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aotnRfvzeglr2bdq7DmMizmIblUh0pdvNgB4yG+ccjI=;
 b=Jw+4VwXtBUs4ucNnOEmFUlYWtHUgcdadsGyx4m130mJViT7BWNP2e4vkWkThpUwaq372CN
 7Gf6tCx5wiqrbarLYA4y2Hg9Lvqksjc7kuZ+dcO38HL2buWGpsp9mBNRwzApguAvvJ1Coz
 WqIpm6383ZMVMQSOI2E3w+y5lidMdiU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598914275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aotnRfvzeglr2bdq7DmMizmIblUh0pdvNgB4yG+ccjI=;
 b=Jw+4VwXtBUs4ucNnOEmFUlYWtHUgcdadsGyx4m130mJViT7BWNP2e4vkWkThpUwaq372CN
 7Gf6tCx5wiqrbarLYA4y2Hg9Lvqksjc7kuZ+dcO38HL2buWGpsp9mBNRwzApguAvvJ1Coz
 WqIpm6383ZMVMQSOI2E3w+y5lidMdiU=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-fPLViIVrNYaFpu6cZGa7FA-1; Mon, 31 Aug 2020 18:51:13 -0400
X-MC-Unique: fPLViIVrNYaFpu6cZGa7FA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 31 Aug 2020 15:51:10 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 31 Aug 2020 15:51:10 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAlZGEAAA69zEA=
Date: Mon, 31 Aug 2020 22:51:10 +0000
Message-ID: <655f7aab1c5c44a2a47280f1957fff27@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <A951892D-226B-45F4-97C1-963AB8E4B2BD@fb.com>
In-Reply-To: <A951892D-226B-45F4-97C1-963AB8E4B2BD@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

U28geW91IGFyZSBpbXBseWluZyB0byBub3QgYWRkIGEgc2Vjb25kIHRpb2dhcGFzcywgY29ycmVj
dD8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWpheSBLaGVta2Eg
W21haWx0bzp2aWpheWtoZW1rYUBmYi5jb21dDQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDMxLCAy
MDIwIDE1OjQ5DQo+IFRvOiBCcnVjZSBNaXRjaGVsbDsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQo+IFN1YmplY3Q6IFJlOiBXaGVuIGJ1aWxkaW5nIE9wZW5CTUMgLiAuIC4gPw0KPiANCj4gDQo+
IA0KPiDvu79PbiA4LzMwLzIwLCAzOjA0IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJ1Y2Ug
TWl0Y2hlbGwiIDxvcGVuYm1jLQ0KPiBib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZg0KPiBCcnVjZV9NaXRjaGVsbEBwaG9lbml4LmNvbT4gd3Jv
dGU6DQo+IA0KPiAgICAgV2hlbiBzZWxlY3RpbmcgVGFyZ2V0IGhhcmR3YXJlDQo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMjMy10YXJnZXQteW91ci1oYXJkd2FyZQ0KPiAgICAg
dG8gYnVpbGQgZm9yIHRoZSBpcyBhIHRpb2dhcGFzcywgbm93IGlmIEkgYWRkIGEgbWV0YS1waG9l
bml4L21ldGEtDQo+IHRpb2dhcGFzcy9jb25mICBob3cgZG9lcw0KPiAgICAgCXNvdXJjZSBzZXR1
cCB0aW9nYXBhc3MgYnVpbGQNCj4gICAgIGtub3cgd2hpY2ggdGlvZ2FwYXNzIHRvIGJ1aWxkPw0K
PiBUaGVyZSBpcyBvbmx5IG9uZSB0aW9nYXBhc3MgaW4gdGhlIHN5c3RlbSBhbmQgaXQga2Jvd3Mg
d2hlcmUgdG8gYnVpbGQNCj4gZnJvbS4NCj4gDQo+ICAgICBPciBhbSBJIG5vdCBzdXBwb3NlZCB0
byBjaG9vc2UgYSBuYW1lIChpLmUuIHRpb2dhcGFzcyBpbiB0aGlzIGV4YW1wbGUpDQo+IHRoYXQg
aXMgYWxyZWFkeSBpbiB0aGUgbGlzdA0KPiAgICAgd2hlbiBJIG5lZWQgdG8gY3JlYXRlIGEgbmV3
IG1ldGEtcGhvZW5peC9tZXRhLTxtYWNoaW5lPi9jb25mPw0KPiANCj4gICAgIFRoYW5rcyENCj4g
DQo+ICAgICAtLQ0KPiAgICAgQnJ1Y2UNCj4gDQoNCg==

