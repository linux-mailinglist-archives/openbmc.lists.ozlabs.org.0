Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B8143212
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 03:16:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PQmT28W4zDqpL
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 11:16:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=060c5fbd9=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 45PQlm38lKzDq7d
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 11:15:27 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 13 Jun 2019 09:15:23 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 13 Jun
 2019 09:14:21 +0800
Received: from mailbx07.quanta.corp ([192.168.1.7]) by mailbx07.quanta.corp
 ([192.168.1.7]) with mapi id 15.01.1713.004; Thu, 13 Jun 2019 09:14:21 +0800
From: =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Gerrit replication for quanta-ipmi-oem
Thread-Topic: Gerrit replication for quanta-ipmi-oem
Thread-Index: AQHVIVpqDF38XAtXNUWQgjNydGTHHaaYxLqA
Date: Thu, 13 Jun 2019 01:14:21 +0000
Message-ID: <525c2d59451f4b17b99d9214d1c42ed5@quantatw.com>
References: <20190612200853.qgpy6z5hopheoz7g@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190612200853.qgpy6z5hopheoz7g@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24670.001
x-tm-as-result: No--5.304500-0.000000-31
x-tm-as-matchedid: 140026-150567-151271-700225-703140-701090-703503-704708-7
 04704-139010-139006-702605-106660-863519-703238-701590-703945-704015-704706
 -148004-148133-41000-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

SGkgQnJhZCwNCg0KVGhhdCdzIGp1c3QgZ3JlYXQhIFRoYW5rIHlvdS4NCg0KQmVzdCwNClAuSy4N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcmFkIEJpc2hvcCBbbWFp
bHRvOmJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIEp1bmUg
MTMsIDIwMTkgNDowOSBBTQ0KPiBUbzogUC4gSy4gTGVlICin9axmvGUpIDxQLksuTGVlQHF1YW50
YXR3LmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBHZXJy
aXQgcmVwbGljYXRpb24gZm9yIHF1YW50YS1pcG1pLW9lbQ0KPiANCj4gSGkgUC5LLg0KPiANCj4g
SSBqdXN0IGVuYWJsZWQgR2Vycml0IHJlcGxpY2F0aW9uIG9uIHRoZSBxdWFudGEtaXBtaS1vZW0g
cmVwb3NpdG9yeS4NCj4gWW91IGNhbiB1c2UgR2Vycml0IHRvIGNvbmR1Y3QgY29kZSByZXZpZXdz
IGZvciB0aGlzIHJlcG9zaXRvcnkgbm93Lg0KPiANCj4gVGhhbmtzIQ0KPiANCj4gLWJyYWQNCg==
