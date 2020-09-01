Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B322598BB
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:31:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgsyy1JnSzDqVd
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:31:38 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=t++K222D; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=t++K222D; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgsqg5y89zDqQL
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:25:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8n/dehmytWtPZAY1lGumcdODRF3U+n1O9apCsBd9/k=;
 b=t++K222Dns0vZW3xRpx35bSruWQjdGABR1F4e0LPB3Ho1jPsKKDjFXmhevnhTGf9ZwgIks
 CkY1GXbJpmqzqC0SK/D2Y61J79EVcPIYmH8pv993oQLLHI2x3HH8qGkUlI/qnvk1jNCHt9
 q+KpokI4pZ1vs2r/AwUR09CXxLagh0Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8n/dehmytWtPZAY1lGumcdODRF3U+n1O9apCsBd9/k=;
 b=t++K222Dns0vZW3xRpx35bSruWQjdGABR1F4e0LPB3Ho1jPsKKDjFXmhevnhTGf9ZwgIks
 CkY1GXbJpmqzqC0SK/D2Y61J79EVcPIYmH8pv993oQLLHI2x3HH8qGkUlI/qnvk1jNCHt9
 q+KpokI4pZ1vs2r/AwUR09CXxLagh0Q=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-C9zHonWlPTS7x9ZF4z3kOA-1; Tue, 01 Sep 2020 12:25:11 -0400
X-MC-Unique: C9zHonWlPTS7x9ZF4z3kOA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 1 Sep 2020 09:25:09 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 1 Sep 2020 09:25:09 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAlZGEAAA69zED//4xygP/+Zesg
Date: Tue, 1 Sep 2020 16:25:08 +0000
Message-ID: <f7ba4d4d8f2a4f0997494800195df937@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <A951892D-226B-45F4-97C1-963AB8E4B2BD@fb.com>
 <655f7aab1c5c44a2a47280f1957fff27@SCL-EXCHMB-13.phoenix.com>
 <86DB51C5-7661-422C-AA3D-CDD2A242D7B8@fb.com>
In-Reply-To: <86DB51C5-7661-422C-AA3D-CDD2A242D7B8@fb.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.131]
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

VGhhbmsgeW91IFZpamF5Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFZpamF5IEtoZW1rYSBbbWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbV0NCj4gU2VudDogTW9uZGF5
LCBBdWd1c3QgMzEsIDIwMjAgMTU6NTcNCj4gVG86IEJydWNlIE1pdGNoZWxsOyBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFdoZW4gYnVpbGRpbmcgT3BlbkJNQyAuIC4g
LiA/DQo+IA0KPiBZZXMsIHBsZWFzZSBhZGQgYW55IHBhdGNoIGluIHRoZSBzYW1lIHRpb2dhcGFz
cyBwbGF0Zm9ybSBsYXllcg0KPiANCj4g77u/T24gOC8zMS8yMCwgMzo1MSBQTSwgIkJydWNlIE1p
dGNoZWxsIiA8QnJ1Y2VfTWl0Y2hlbGxAcGhvZW5peC5jb20+DQo+IHdyb3RlOg0KPiANCj4gICAg
IFNvIHlvdSBhcmUgaW1wbHlpbmcgdG8gbm90IGFkZCBhIHNlY29uZCB0aW9nYXBhc3MsIGNvcnJl
Y3Q/DQo+IA0KPiAgICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiAgICAgPiBGcm9t
OiBWaWpheSBLaGVta2EgW21haWx0bzp2aWpheWtoZW1rYUBmYi5jb21dDQo+ICAgICA+IFNlbnQ6
IE1vbmRheSwgQXVndXN0IDMxLCAyMDIwIDE1OjQ5DQo+ICAgICA+IFRvOiBCcnVjZSBNaXRjaGVs
bDsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+ICAgICA+IFN1YmplY3Q6IFJlOiBXaGVuIGJ1
aWxkaW5nIE9wZW5CTUMgLiAuIC4gPw0KPiAgICAgPg0KPiAgICAgPg0KPiAgICAgPg0KPiAgICAg
PiBPbiA4LzMwLzIwLCAzOjA0IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJ1Y2UgTWl0Y2hl
bGwiDQo+IDxvcGVuYm1jLQ0KPiAgICAgPiBib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0
cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZg0KPiAgICAgPiBCcnVjZV9NaXRjaGVsbEBwaG9lbml4
LmNvbT4gd3JvdGU6DQo+ICAgICA+DQo+ICAgICA+ICAgICBXaGVuIHNlbGVjdGluZyBUYXJnZXQg
aGFyZHdhcmUNCj4gICAgID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYyMzLXRh
cmdldC15b3VyLWhhcmR3YXJlDQo+ICAgICA+ICAgICB0byBidWlsZCBmb3IgdGhlIGlzIGEgdGlv
Z2FwYXNzLCBub3cgaWYgSSBhZGQgYSBtZXRhLXBob2VuaXgvbWV0YS0NCj4gICAgID4gdGlvZ2Fw
YXNzL2NvbmYgIGhvdyBkb2VzDQo+ICAgICA+ICAgICAJc291cmNlIHNldHVwIHRpb2dhcGFzcyBi
dWlsZA0KPiAgICAgPiAgICAga25vdyB3aGljaCB0aW9nYXBhc3MgdG8gYnVpbGQ/DQo+ICAgICA+
IFRoZXJlIGlzIG9ubHkgb25lIHRpb2dhcGFzcyBpbiB0aGUgc3lzdGVtIGFuZCBpdCBrYm93cyB3
aGVyZSB0byBidWlsZA0KPiAgICAgPiBmcm9tLg0KPiAgICAgPg0KPiAgICAgPiAgICAgT3IgYW0g
SSBub3Qgc3VwcG9zZWQgdG8gY2hvb3NlIGEgbmFtZSAoaS5lLiB0aW9nYXBhc3MgaW4gdGhpcw0K
PiBleGFtcGxlKQ0KPiAgICAgPiB0aGF0IGlzIGFscmVhZHkgaW4gdGhlIGxpc3QNCj4gICAgID4g
ICAgIHdoZW4gSSBuZWVkIHRvIGNyZWF0ZSBhIG5ldyBtZXRhLXBob2VuaXgvbWV0YS08bWFjaGlu
ZT4vY29uZj8NCj4gICAgID4NCj4gICAgID4gICAgIFRoYW5rcyENCj4gICAgID4NCj4gICAgID4g
ICAgIC0tDQo+ICAgICA+ICAgICBCcnVjZQ0KPiAgICAgPg0KPiANCg0K

