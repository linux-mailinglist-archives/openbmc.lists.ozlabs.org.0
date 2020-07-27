Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A165722F3A0
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFk2D66qCzF0WH
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:17:40 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=StI5pHsh; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=lnX29KPJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFjzm0CtqzDr7M
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 01:15:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1595862924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5otiXhyDToiIeOKUrBenT0QxdFE5wnjTfCM/8yU6fQs=;
 b=StI5pHshcGA89yKM4BoaANrjWMuizd5ale8eI+wTrhO5r1FJTG5I2Dx0tlgVvMgwAw+zMk
 KukvIrEM48oB/7qkFAr1WL8vTyKZVuNzpVpS5xlqO+oclrmi2OD4omUcoxikbQHj/McQ8A
 2Eroa59dTKv01r8X4IpA4V7SeaY9iqQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1595862925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5otiXhyDToiIeOKUrBenT0QxdFE5wnjTfCM/8yU6fQs=;
 b=lnX29KPJHKQGscmsPuu0tuNa6T4ZcmZfa4kfa4ZEEnIFHiDCMtEkKIXkwSIh9EOkEcskaz
 x7ZlHlZU3Zv+McNZFEn7L1j3dRCX1suzwWaFDfBqkGd+Rtl/CQgtHr8MJ8dxo0avvOeEeL
 UQ77LiSe1vHvQJry9k3Lg9IWCLR7Neg=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-l3l6FCgHPFCrzm_ZO06FMQ-1; Mon, 27 Jul 2020 11:15:22 -0400
X-MC-Unique: l3l6FCgHPFCrzm_ZO06FMQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 27 Jul 2020 08:15:19 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 27 Jul 2020 08:15:19 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Michael Richardson <mcr@sandelman.ca>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: BMCWeb policy for HTTPS site identity certificate
Thread-Topic: BMCWeb policy for HTTPS site identity certificate
Thread-Index: AQHWYQW/V1kfQjtxV0GqYlSYRw4dLKkay9kAgADDJTA=
Date: Mon, 27 Jul 2020 15:15:18 +0000
Message-ID: <b7860a2905f04fc8b539a34f730f7b12@SCL-EXCHMB-13.phoenix.com>
References: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
 <14851.1595795718@localhost>
In-Reply-To: <14851.1595795718@localhost>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRv
Om9wZW5ibWMtDQo+IGJvdW5jZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21AbGlzdHMub3ps
YWJzLm9yZ10gT24gQmVoYWxmIE9mDQo+IE1pY2hhZWwgUmljaGFyZHNvbg0KPiBTZW50OiBTdW5k
YXksIEp1bHkgMjYsIDIwMjAgMTM6MzUNCj4gVG86IG9wZW5ibWMNCj4gU3ViamVjdDogUmU6IEJN
Q1dlYiBwb2xpY3kgZm9yIEhUVFBTIHNpdGUgaWRlbnRpdHkgY2VydGlmaWNhdGUNCj4gDQo+IA0K
PiBKb3NlcGggUmV5bm9sZHMgPGpyZXlAbGludXguaWJtLmNvbT4gd3JvdGU6DQo+ICAgICA+IFBy
b2JsZW06DQo+ICAgICA+IEJNQ1dlYiBhcHBhcmVudGx5IHRyZWF0cyBjZXJ0aWZpY2F0ZXMgdGhh
dCBhcmUgZWl0aGVyIGV4cGlyZWQgb3Igbm90DQo+IHZhbGlkDQo+ICAgICA+IHVudGlsIGEgZnV0
dXJlIGRhdGUgYXMgdW51c2FibGUgKGludmVzdGlnYXRpb24gbmVlZGVkKS4gIEFuZCBCTUNXZWIN
Cj4gZGVsZXRlcw0KPiAgICAgPiB1bnVzYWJsZSBjZXJ0aWZpY2F0ZXMuICBUaGlzIGNhbiBjb25m
dXNlIHRoZSBhZG1pbmlzdHJhdG9yLCBlc3BlY2lhbGx5DQo+ICAgICA+IGNvbnNpZGVyaW5nIHRo
ZSBCTUMncyB0aW1lLW9mLWRheSBjbG9jayBtYXkgbm90IGJlIHNldCBhcyBleHBlY3RlZC4NCj4g
DQo+ICAgICA+IFByb3Bvc2FsOg0KPiAgICAgPiBXaGF0IGNlcnRpZmljYXRlIG1hbmFnZW1lbnQg
cG9saWN5IHNob3VsZCBCTUNXZWIgdXNlPyAgSGVyZSBpcyBhbg0KPiBpbml0aWFsDQo+ICAgICA+
IHByb3Bvc2FsOg0KPiAgICAgPiAxLiBjZXJ0aWZpY2F0ZSBpcyBwZXJmZWN0bHkgZ29vZCAtIFVz
ZSB0aGUgY2VydGlmaWNhdGUuDQo+IA0KPiBva2F5Lg0KPiANCj4gICAgID4gMi4gY2VydGlmaWNh
dGUgaXMgZ29vZCBidXQgZXhwaXJlZCBvciBub3QgeWV0IHZhbGlkIC0gVXNlIHRoZSBjZXJ0aWZp
Y2F0ZQ0KPiBhbmQNCj4gICAgID4gbG9nIGEgd2FybmluZy4NCj4gDQo+IHZlcnkgZ29vZC4NCj4g
DQo+ICAgICA+IDMuIGNlcnRpZmljYXRlIGlzIG1pc3Npbmcgb3IgYmFkIGZvcm1hdCBvciBhbGdv
cml0aG0gdG9vIG9sZCAtIFVzZQ0KPiBhbm90aGVyDQo+ICAgICA+IGNlcnRpZmljYXRlIG9yIHNl
bGYtZ2VuZXJhdGUgYSBjZXJ0aWZpY2F0ZSAoYW5kIGxvZyB0aGF0IGFjdGlvbikuDQo+ICAgICA+
IEluIG5vIGNhc2Ugc2hvdWxkIEJNQ1dlYiBzaG91bGQgZGVsZXRlIGFueSBjZXJ0aWZpY2F0ZS4N
Cj4gDQo+IEkgdGhpbmsgdGhhdCB0aGVyZSBpcyBhIHByb2JsZW0gaW4gMy4NCj4gDQo+ICJjZXJ0
aWZpY2F0ZSBpcyBtaXNzaW5nIiBpcyBwcmV0dHkgbXVjaCB1bmFtYmlndW91cy4NCj4gImJhZCBm
b3JtYXQiIGRlcGVuZHMgYSBiaXQgdXBvbiBldm9sdXRpb24gb2YgbGlicmFyaWVzLg0KPiBJbiBw
YXJ0aWN1bGFyLCBhIG5ldyB2ZXJzaW9uIG9mIGxpYnNzbCBtaWdodCBzdXBwb3J0IHNvbWUgbmV3
IGFsZ29yaXRobSwNCj4gYW5kIHRoZW4gc2hvdWxkIHRoZSBmaXJtd2FyZSBiZSByb2xsZWQgYmFj
aywgaXQgd2lsbCAiYmFkIGZvcm1hdCIuDQo+IA0KPiBTbyBJIHN1Z2dlc3QgdGhhdCB0aGUgY2Vy
dGlmaWNhdGUra2V5cGFpciBpcyBuZXZlciBkZWxldGVkLCBidXQgbWF5IGJlDQo+IHJlbmFtZWQu
DQo+IEkgdGhpbmsgdGhhdCB3ZSBjb3VsZCBoYXZlIGEgZGViYXRlIGFib3V0IGdldHRpbmcgdGVs
ZW1ldHJ5IGFib3V0IGJhZA0KPiBjZXJ0aWZpY2F0ZXMgYmFjayB2aWEgSFRUUC4NCj4gDQo+IEkg
dGhpbmsgdGhhdCB0aGVyZSBhcmUgc29tZSBvcGVyYXRpb25hbCBjb25zaWRlcmF0aW9ucyByZWxh
dGluZyB0bw0KPiBkZXRlcm1pbmluZyByb290IGNhdXNlIHRoYXQgbWF5IHRydW1wIHNvbWUgc2Vj
dXJpdHkgaXNzdWVzIHJlbGF0aW5nIHRvDQo+IHRlbGxpbmcgYmFkIGFjdG9ycyB3aGV0aGVyIHRo
ZXkgaGF2ZSBzdWNjZWVkZWQgaW4gZGFtYWdpbmcgYSBjZXJ0aWZpY2F0ZS4NCg0KT25lIG1vcmUg
dGhpbmcgaXMgZm9yIDMgaXMgdGhhdCB0aGUgaW5jaWRlbnQgbXVzdCBiZSBsb2dnZWQuDQoNCj4g
DQo+IC0tDQo+IF0gICAgICAgICAgICAgICBOZXZlciB0ZWxsIG1lIHRoZSBvZGRzISAgICAgICAg
ICAgICAgICAgfCBpcHY2IG1lc2gNCj4gbmV0d29ya3MgWw0KPiBdICAgTWljaGFlbCBSaWNoYXJk
c29uLCBTYW5kZWxtYW4gU29mdHdhcmUgV29ya3MgICAgICAgIHwgICAgSW9UDQo+IGFyY2hpdGVj
dCAgIFsNCj4gXSAgICAgbWNyQHNhbmRlbG1hbi5jYSAgaHR0cDovL3d3dy5zYW5kZWxtYW4uY2Ev
ICAgICAgICB8ICAgcnVieSBvbg0KPiByYWlscyAgICBbDQo+IA0KPiANCj4gDQoNCg==

