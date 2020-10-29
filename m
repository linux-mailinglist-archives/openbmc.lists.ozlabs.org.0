Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B694D29F6F1
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 22:34:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMdxd5dX7zDqLP
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 08:34:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=psdBnprf; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=ZvceGYN0; 
 dkim-atps=neutral
X-Greylist: delayed 15537 seconds by postgrey-1.36 at bilbo;
 Fri, 30 Oct 2020 08:33:38 AEDT
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMdwf1cJMzDqZW
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 08:33:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604007208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9vsR0E2eztg39rs7bAnv9NLXAOoi/IpDklhGYaO3Mw=;
 b=psdBnprfVfWf7blRf1pUvn5434p2stJl8v6ep1UbhOZ+PqUxTJNRyeFd+9zJPVgP4P2yIW
 rEsEa/zUbG994EggANlAA9f1dTw/itAgQs+7+1zL7HnNbEV93cup8iXs/hSmPqxDTKMUrk
 hC8W8lTsS0T40jopRQXAOyY0GR51zU0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604007209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9vsR0E2eztg39rs7bAnv9NLXAOoi/IpDklhGYaO3Mw=;
 b=ZvceGYN0r0F7M+HHgt/n3AzBsUnR2NFzgh3LpICXxXyl1UeUu7GTX8YQGuCI4N5LRrR9rK
 r1oEEWKHz82Lxk3ajcotCIBwz/vNZ2Qj6GBLKxgC300Vu9mGiKISKIGUlO9+8CzYlN9jzr
 hxgkiT4rd8Pf67TNQ7f/+qMN+aIjhcU=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-5CoYJ98PPtiXtvdUafFYzA-1; Thu, 29 Oct 2020 17:33:26 -0400
X-MC-Unique: 5CoYJ98PPtiXtvdUafFYzA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 29 Oct 2020 14:33:24 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 29 Oct 2020 14:33:24 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "OpenBMC (openbmc@lists.ozlabs.org)"
 <openbmc@lists.ozlabs.org>
Subject: RE: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837nv//sAwA//9nhrA=
Date: Thu, 29 Oct 2020 21:33:23 +0000
Message-ID: <20cf0460e28a4950b0b3429d77da276c@SCL-EXCHMB-13.phoenix.com>
References: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
 <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
In-Reply-To: <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
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

VmlqYXksIHRoYXQgZGlkbid0IG1ha2UgYW55IGRpZmZlcmVuY2UuICBJIGdldCB0aGUgc2FtZSBy
ZXN1bHQuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVmlqYXkgS2hl
bWthIFttYWlsdG86dmlqYXlraGVta2FAZmIuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAyOSwgMjAyMCAxMjoyNyBQTQ0KPiBUbzogUGF0cmljayBWb2Vsa2VyOyBPcGVuQk1DIChvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcpDQo+IFN1YmplY3Q6IFJlOiBVc2luZyBsb2NhbCBnaXQgcmVw
byBmb3IgcmVjaXBlIGRldmVsb3BtZW50DQo+IA0KPiANCj4gDQo+IO+7v09uIDEwLzI5LzIwLCAx
MDoxNyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFBhdHJpY2sgVm9lbGtlciIgPG9wZW5ibWMt
DQo+IGJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxm
IG9mDQo+IFBhdHJpY2tfVm9lbGtlckBwaG9lbml4LmNvbT4gd3JvdGU6DQo+IA0KPiAgICAgSSdt
IGNyZWF0aW5nIGEgbmV3IHJlY2lwZSBmb3IgbG9jYWwgZGV2ZWxvcG1lbnQgYnV0IHdoZW4gSSBk
byBhICdkZXZ0b29sDQo+IG1vZGlmeSA8cmVjaXBlPicgaXQgYWx3YXlzIHNlZW1zIHRvIG1ha2Ug
YW4gZW1wdHkgZGlyZWN0b3J5ICh0aGF0IGNvbnRhaW5zDQo+IG9ubHkgLmdpdC4pDQo+IA0KPiAg
ICAgSGVyZSdzIHRoZSByZWxldmFudCBsaW5lcyBmcm9tIG15IC5iYiBmaWxlOg0KPiAgICAgU1JD
X1VSSSA9ICJnaXQ6Ly8vaG9tZS9wdm9lbGtlci9ibWMvZGV2L29lbTtwcm90b2NvbD1maWxlIg0K
PiANCj4gSSBhbSBub3QgdG9vIHN1cmUgYnV0IHRoaXMgc2hvdWxkIGJlIGZpbGU6Ly8sIFlvdSBt
YXkgaGF2ZSB0byBmaXggYWJvdmUgbGluZS4NCj4gDQo+ICAgICBTUkNSRVYgPSAiNGRiMTdmNDgy
YjBiZGNkY2Y1NjU4YzdkMzIzY2M1NjNlYjc4NTU2YSINCj4gICAgIGluaGVyaXQgYXV0b3Rvb2xz
DQo+IA0KPiAgICAgSGVyZSdzIHRoZSB3YXJuaW5nIGZyb20gJ2RldnRvb2wgbW9kaWZ5JzoNCj4g
ICAgIFdBUk5JTkc6IE5vIHNvdXJjZSB1bnBhY2tlZCB0byBTIC0gZWl0aGVyIHRoZSBwaG9lbml4
LW9lbSByZWNpcGUNCj4gZG9lc24ndCB1c2UgYW55IHNvdXJjZSBvciB0aGUgY29ycmVjdCBzb3Vy
Y2UgZGlyZWN0b3J5IGNvdWxkIG5vdCBiZQ0KPiBkZXRlcm1pbmVkDQo+IA0KPiAgICAgSWYgSSBj
aGFuZ2UgZWl0aGVyIHRoZSBTUkNfVVJJIG9yIHRoZSBTUkNSRVYgdG8gYmUgaW52YWxpZCwgSSBn
ZXQgYW4gZXJyb3INCj4gaW5zdGVhZCBvZiBhIHdhcm5pbmcgc28gaXQncyBkZWZpbml0ZWx5IGZp
bmRpbmcgdGhlIGxvY2FsIHJlcG8uDQo+IA0KPiAgICAgSSBjYW4ndCBmaWd1cmUgb3V0IHdoeSBu
b25lIG9mIHRoZSBmaWxlcyBpbiBteSBjb21taXQgYXJlIG1ha2luZyBpdCBpbnRvIHRoZQ0KPiB1
bnBhY2sgZGlyZWN0b3J5LiAgQW55IGlkZWFzIG9yIHRpcHMgb24gZGVidWdnaW5nPyAgSSBhbHNv
IHRyaWVkIHVzaW5nICBhIC50YXIuZ3oNCj4gZmlsZSBpbnN0ZWFkIG9mIGEgbG9jYWwgZ2l0IHJl
cG8gYW5kIGhhZCB0aGUgc2FtZSByZXN1bHQuDQo+IA0KDQo=

