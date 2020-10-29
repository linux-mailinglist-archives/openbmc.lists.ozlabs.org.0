Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DF29F929
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 00:37:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMhgF1VrqzDqT2
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 10:37:13 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=grWiTDGt; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=grWiTDGt; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMhbC1F1zzDqjR
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 10:33:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604014418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25CYWPqQRBdv9Z46yw1K6KVWFL/qX/9AqyW+qxrJ0Kg=;
 b=grWiTDGtnHrig/rQKJyfR9kmw0nMbr2lEh9yhFoQSaxCPwtU0fFjreDmBXRgjZ2bRTb8lU
 aU8I/p1m7W7X0QxY1Sp8gGYjGX9iLUcFZ4436lHg6b2awBNXj5DjhKrFWhBdnQG95/L7UL
 TzaeUwWie9cUnwX84FDYYxMBdj0OjDY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604014418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25CYWPqQRBdv9Z46yw1K6KVWFL/qX/9AqyW+qxrJ0Kg=;
 b=grWiTDGtnHrig/rQKJyfR9kmw0nMbr2lEh9yhFoQSaxCPwtU0fFjreDmBXRgjZ2bRTb8lU
 aU8I/p1m7W7X0QxY1Sp8gGYjGX9iLUcFZ4436lHg6b2awBNXj5DjhKrFWhBdnQG95/L7UL
 TzaeUwWie9cUnwX84FDYYxMBdj0OjDY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-iqBQ0LxhPimGQQdRXqQhBA-1; Thu, 29 Oct 2020 19:33:36 -0400
X-MC-Unique: iqBQ0LxhPimGQQdRXqQhBA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 29 Oct 2020 16:33:34 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 29 Oct 2020 16:33:34 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: RE: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Topic: With webui-vue Firmware version on Overview vs Hardware status
 BMC manager not always matching.
Thread-Index: AdatTyI5t5CLRj2MQ0iaFWWZIGQPrAAP0yWAAA6h3bAAGHMU0P/++EuA//63INA=
Date: Thu, 29 Oct 2020 23:33:33 +0000
Message-ID: <5a07e2da7d324150a83cee88d50ce153@SCL-EXCHMB-13.phoenix.com>
References: <40cd49cc097b4befb30465c782be3a26@SCL-EXCHMB-13.phoenix.com>,
 <2332af3cb404478cbd7bc0902167c7ea@SCL-EXCHMB-13.phoenix.com>
 <OF96903A57.FBB55CE2-ON0025860F.0060C60B-0025860F.00629E7F@notes.na.collabserv.com>
 <OFDAC419AA.680D743E-ON0025860F.0072895A-0025860F.0072A8FD@notes.na.collabserv.com>
In-Reply-To: <OFDAC419AA.680D743E-ON0025860F.0072895A-0025860F.0072A8FD@notes.na.collabserv.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEZXJpY2sgTW9udGFndWUgW21h
aWx0bzpEZXJpY2suTW9udGFndWVAaWJtLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDI4LCAyMDIwIDEzOjUyDQo+IFRvOiBCcnVjZSBNaXRjaGVsbA0KPiBDYzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBXaXRoIHdlYnVpLXZ1ZSBGaXJtd2FyZSB2ZXJz
aW9uIG9uIE92ZXJ2aWV3IHZzIEhhcmR3YXJlDQo+IHN0YXR1cyBCTUMgbWFuYWdlciBub3QgYWx3
YXlzIG1hdGNoaW5nLg0KPiANCj4gPiBEZXJpY2ssIEkgYW0gbm90IHNlZWluZyBhIHJlYWwgZGlm
ZmVyZW5jZSBiZXR3ZWVuIFJvbXVsdXMgYW5kIFBob2VuaXgNCj4gaGVyZS4NCj4gPg0KPiA+IFNj
cmVlbiBzaG90cyBhZ2Fpbi4NCj4gDQo+ID4gUm9tdWx1cyBSZWRmaXNoIEZpcm13YXJlSW52ZW50
b3J5DQo+ID4gaHR0cHM6Ly9ibWMtYnJ1Y2UuZ2l0aHViLmlvL1JvbXVsdXNfUmVkZmlzaF9GaXJt
d2FyZUludmVudG9yeS5wbmcNCj4gDQo+ID4gUGhvZW5peCBSZWRmaXNoIEZpcm13YXJlSW52ZW50
b3J5DQo+ID4gaHR0cHM6Ly9ibWMtYnJ1Y2UuZ2l0aHViLmlvL1Bob2VuaXhfUmVkZmlzaF9GaXJt
d2FyZUludmVudG9yeS5wbmcNCj4gDQo+IENhbiB5b3UgbG9vayBhdCBlYWNoIG9mIHRob3NlIGl0
ZW0ncyBpbnZlbnRvcnk/IFdlIGFyZSBtYWtpbmcgYXQNCj4gcmVxdWVzdCBhbmQgZ2V0dGluZw0K
PiB0aGUgdmVyc2lvbiBmcm9tIHRoZXJlLiBIZXJlIGlzIHRoZSBjb2RlIGluIEdpdEh1Yi4gV2Ug
YXJlIGdyYWJiaW5nIHRoZQ0KPiBwYXRoIGluIHRoZSBAb2RhdGEuaWQNCj4gYW5kIG1ha2luZyBh
IHJlcXVlc3QgdG8gZ2V0IHRoZSBGVyBkYXRhLg0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvd2VidWktDQo+IHZ1ZS9ibG9iL2EwNGQ0NmY3Y2FkMzU2ZGEyMmQ3OTRlOTk0MTk1ZTgw
MWY1OTk4Yjcvc3JjL3N0b3JlL21vZHUNCj4gbGVzL0NvbmZpZ3VyYXRpb24vRmlybXdhcmVTdG9y
ZS5qcyNMNDINCg0KSSBoYXZlIHVzZWQgUmVkZmlzaC1TZXJ2aWNlLVZhbGlkYXRvciB0byBpbnNw
ZWN0IHRoZSBSZWRmaXNoIGVsZW1lbnRzIGZvciBib3RoIFJvbXVsdXMgYW5kIFBob2VuaXguDQpI
ZXJlIGFyZSBzY3JlZW4gc2hvdHM6DQoJUm9tdWx1cyAtIGh0dHBzOi8vYm1jLWJydWNlLmdpdGh1
Yi5pby9Sb211bHVzX1JlZGZpc2gtU2VydmljZS1WYWxpZGF0b3IucG5nDQoJUGhvZW5peCAtIGh0
dHBzOi8vYm1jLWJydWNlLmdpdGh1Yi5pby9QaG9lbml4X1JlZGZpc2gtU2VydmljZS1WYWxpZGF0
b3IucG5nDQoNCkkgYW0gbm90IHNlZWluZyBhbnkgcmVhbCBkaWZmZXJlbmNlLCBvdGhlciB0aGFu
IHRoZSBWZXJzaW9uIGl0c2VsZiBhbmQgYXJiaXRyYXJ5IGhhc2hlcy4NCg0KDQo=

