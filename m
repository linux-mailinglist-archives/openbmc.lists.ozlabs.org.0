Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B576D15B374
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:14:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hv7z14mTzDqS5
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:14:39 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=bdbn+uaK; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Hv7J5YbbzDqMN
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:14:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1581545640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inma/Wxkwmi1OyWvoKYHOfVbhkUHgobHabd26uhGy7E=;
 b=bdbn+uaK1iG84BhaEpH2GwPLQoavEq/en58f7raWPLi8ohHhxr99RuC0J5nFd5du3m4kxb
 b9dld8m/b1Xa+HSNouftQ6SOhIimY6wiGH7L7sBcsEZ5vh27CzkgPeUDAw9xm1KQt79nb9
 SIbABZRioHe92VftmFoA8vu+wzHrSU8=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-5N-pytnONf-G8spPFlEDQA-1; Wed, 12 Feb 2020 17:13:58 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 12 Feb 2020 14:13:56 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 12 Feb 2020 14:13:56 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, James Feist
 <james.feist@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Functionality vs Security
Thread-Topic: Functionality vs Security
Thread-Index: AQHV4enNPeoxyyP830OfwL7PLSmB1KgYoUYA//9980A=
Date: Wed, 12 Feb 2020 22:13:55 +0000
Message-ID: <392e05f5bba64cc6a9079dc2680baa5a@SCL-EXCHMB-13.phoenix.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <36a83c91-dfde-6048-14b5-f35a004f8e37@linux.ibm.com>
In-Reply-To: <36a83c91-dfde-6048-14b5-f35a004f8e37@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: 5N-pytnONf-G8spPFlEDQA-1
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm,
 James" <james.mihm@intel.com>, Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

UGxlYXNlIHJlbWVtYmVyIHRoYXQgYSAiZGlzZ3J1bnRsZWQgZW1wbG95ZWUiIGNhbiBiZSAiIGF1
dGhlbnRpY2F0ZWQgdXNlciIgYW5kIHRoZXJlIGZvciBhIFNlY3VyaXR5IFRocmVhdC4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgW21haWx0bzpvcGVuYm1jLWJv
dW5jZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVo
YWxmIE9mIEpvc2VwaCBSZXlub2xkcw0KU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAxMiwgMjAy
MCAxMzo1OA0KVG86IEphbWVzIEZlaXN0OyBPcGVuQk1DIE1haWxsaXN0DQpDYzogQnJhZCBCaXNo
b3A7IEd1bm5hciBNaWxsczsgTWlobSwgSmFtZXMNClN1YmplY3Q6IFJlOiBGdW5jdGlvbmFsaXR5
IHZzIFNlY3VyaXR5DQoNCk9uIDIvMTIvMjAgMzoxNiBQTSwgSmFtZXMgRmVpc3Qgd3JvdGU6DQo+
IEluIElSQyB5ZXN0ZXJkYXkgSSBwcm9wb3NlZCB0aGUgcXVlc3Rpb24gb2Ygd2hldGhlciB0byBj
aGFuZ2UgdGhlIA0KPiBkZWZhdWx0IG9mIGJtY3dlYiB0byBkaXNhYmxlIFJFU1QgRC1CdXMsIG9y
IHRvIGNoYW5nZSBpdCBpbiBvdXIgDQo+IG1ldGEtbGF5ZXJzIG9ubHkuIEkgY3JlYXRlZCB0aGUg
cGF0Y2ggaGVyZTogDQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL2JtY3dlYi8rLzI5MzQ0IGFuZCBJIGFtIA0KPiBsb29raW5nIGZvciBmZWVkYmFjay4gV2hp
bGUgUkVTVCBELUJ1cyBkb2VzIGV4cG9zZSBtYW55IHVzZWZ1bCBBUElzLCANCj4gYW5kIHBob3Nw
aG9yLXdlYnVpIGRlcGVuZHMgaGVhdmlseSBvbiBpdCwgaXQgZG9lcyBsZWFrIGluZm9ybWF0aW9u
IHRvIA0KPiBhbnkgbG9nZ2VkIGluIHVzZXIuIFRoaXMgY29tZXMgdG8gdGhlIHF1ZXN0aW9uLCBz
aG91bGQgd2UgcHJlZmVyIA0KPiBmdW5jdGlvbmFsaXR5IGJ5IGRlZmF1bHQgb3Igc2VjdXJpdHkg
YnkgZGVmYXVsdD8gSXQgaXMgYSBjb21waWxlIA0KPiBzd2l0Y2ggZWl0aGVyIHdheSwgc28gZWFj
aCB1c2VyIGNhbiBzdGlsbCBkZWNpZGUgd2hpY2ggdGhleSBwcmVmZXIuIEkgDQo+IGhhdmUgdGhl
IG9waW5pb24gdGhhdCB0aGUgZGVmYXVsdCBzaG91bGQgYmUgdGhlIHNhZmVzdCBjb25maWd1cmF0
aW9uLCANCj4gYW5kIGlmIHNvbWVvbmUgd2FudHMgdG8gY2hhbmdlIHRoYXQsIHRoZW4gdGhleSBj
YW4gYWNjZXB0IHRoZSByaXNrIGFuZCANCj4gY2hhbmdlIHRoZSBidWlsZCBmbGFnLg0KPg0KPiBU
aG91Z2h0cz8NCg0KVGhhbmtzIGZvciB0aGUgZW1haWwuwqAgU29tZSB0aG91Z2h0cyB0byBoZWxw
IGlsbHVtaW5hdGUgdGhlIHNpdHVhdGlvbi4uLi4NCg0KT3BlbkJNQyBvdWdodCB0byBiZSAic2Vj
dXJlIGJ5IGRlZmF1bHQiLsKgIEkgYWdyZWUgdGhlIFJlc3QtREJ1cyBBUElzIA0KcmVwcmVzZW50
IGFuIHVubmVjZXNzYXJ5IGluZm9ybWF0aW9uIGV4cG9zdXJlLCBhbGJlaXQgb25seSB0byANCmF1
dGhlbnRpY2F0ZWQgdXNlcnMuwqAgVGhhdCBpcywgSSBoYXZlIG5vIGRvdWJ0IHRoZSBBUElzIHNo
b3VsZCBiZSANCmRpc2FibGVkIGJ5IGRlZmF1bHQuDQoNCkkgdW5kZXJzdGFuZCB0aGUgcmVhc29u
IHdoeSB0aGUgRC1CdXMgQVBJcyBhcmUgZW5hYmxlZC1ieS1kZWZhdWx0IGlzIA0KYmVjYXVzZSB0
aGV5IHdlcmUgZGV2ZWxvcGVkIGZpcnN0LCBiZWZvcmUgdGhlIFJlZGZpc2ggQVBJcyB3ZXJlIA0K
YXZhaWxhYmxlLsKgIEFuZCBJIHVuZGVyc3RhbmQgdGhlIGRpcmVjdGlvbiBhbmQgY3VycmVudCBl
ZmZvcnRzIGFyZSB0byANCmRldmVsb3AgUmVkZmlzaCBBUElzIHRvIHJlcGxhY2UgYWxsIEQtQnVz
IEFQSXMsIHRoZW4gZGlzYWJsZSB0aGUgRC1CdXMgDQpBUElzIGJ5IGRlZmF1bHQuDQoNCkluIHRo
YXQgY29udGV4dCwgeW91IGFyZSBhc2tpbmcgaWYgdGhpcyBjYW4gaGFwcGVuIG5vdy7CoCBMZXQn
cyBleHBsb3JlIHRoYXQ6DQoNCklmIHdlIGRpc2FibGUgRC1CdXMgQVBJcyBub3csIHdlJ2xsIGFs
c28gZGlzYWJsZSB0aGUgd2ViIGFjY2Vzcy4gVXNlcnMgDQp3aG8gZG9uJ3QgdXNlIHdlYiBhY2Nl
c3Mgd2lsbCBub3QgYmUgYWZmZWN0ZWQuwqAgQW55b25lIHdobyB3YW50cyB3ZWIgDQphY2Nlc3Mg
Y2FuIGVhc2lseSBjb25maWd1cmUgdGhlaXIgYm1jd2ViIHJlY2lwZSB0byByZS1lbmFibGUgdGhl
IEQtQnVzIA0KQVBJcy7CoCA9PT4gSW4gdGhlIGZ1dHVyZSAoYSB5ZWFyIGZyb20gbm93Pykgd2hl
biB0aGUgd2ViIGFwcCBpcyB1c2luZyANCm9ubHkgUmVkZmlzaCBBUElzIChhbmQgbm8gbG9uZ2Vy
IHVzaW5nIGFueSBELUJ1cyBBUElzKSwgdGhlIGJtY3dlYiANCnJlY2lwZXMgY2FuIGJlIGNoYW5n
ZWQgYmFjay4NCg0KKFRoZSBwcm9qZWN0IHJlYWxseSBuZWVkcyBhIGJ1aWxkLXRpbWXCoCBzZWN1
cml0eSBjb25maWd1cmF0aW9uIGd1aWRlLikNCg0KLSBKb3NlcGgNCg0KQk1DV0VCX0VOQUJMRV9E
QlVTX1JFU1Q6DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIvYmxvYi9tYXN0ZXIv
Q01ha2VMaXN0cy50eHQNCg0KPg0KPiBUaGFua3MsDQo+DQo+IEphbWVzDQoNCg==

