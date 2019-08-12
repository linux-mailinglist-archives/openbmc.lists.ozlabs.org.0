Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FAF8991F
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 10:59:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466VCR6XJDzDqYX
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 18:59:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=liuxiwei@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
X-Greylist: delayed 136 seconds by postgrey-1.36 at bilbo;
 Mon, 12 Aug 2019 18:58:56 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466VBm1yGTzDqYP
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 18:58:55 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net (Antispam) with ASMTP (SSL) id DQO28736
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:54:36 +0800
Received: from Jtjnmail201618.home.langchao.com (10.100.2.18) by
 Jtjnmail201613.home.langchao.com (10.100.2.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Aug 2019 16:54:37 +0800
Received: from Jtjnmail201618.home.langchao.com ([fe80::e8a5:9069:4c1e:2304])
 by Jtjnmail201618.home.langchao.com ([fe80::e8a5:9069:4c1e:2304%14])
 with mapi id 15.01.1713.004; Mon, 12 Aug 2019 16:54:37 +0800
From: =?utf-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re-use witherspoon-psu-monitor
Thread-Topic: Re-use witherspoon-psu-monitor
Thread-Index: AQHVUOuS1gGZ/91Bi0yPyZ19fRawow==
Date: Mon, 12 Aug 2019 08:54:37 +0000
Message-ID: <l7vrab9ffh6cynjgiq6wmlqm.1565599934470@email.jadenine.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D42AE3FED6E054596F2541958A5970B@inspur.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpSZWNlbnRseSBJIG5lZWQgdG8gZ2V0IHRoZSBhc3NldCBpbmZvcm1hdGlvbiBv
ZiBwc3Ugb24gdGhlIGZwNTI4MGcyIG1hY2hpbmUuIEZvciB0aGUgZG93bnN0cmVhbSwgSSB0aGlu
ayByZS11c2Ugd2l0aGVyc3Bvb24tcHN1LW1vbml0b3IgaXMgYmV0dGVyLiBidXQgY3VycmVudGx5
IGl0YHMgb25seSBhZGFwdGVkIHdpdGhlcnNwb29uIG1hY2hpbmUuSXMgaXQgcG9zc2libGUgdG8g
Y2hhbmdlIHRoaXMgcmVjaXBlcyB0byBhIGdlbmVyYWwgcmVwbywgc28gdGhhdCBhIHJlcG8gY2Fu
IGJlIGFkYXB0ZWQgdG8gYSB2YXJpZXR5IG9mIG1hY2hpbmVzIGZvciBmdXR1cmUgbWFpbnRlbmFu
Y2UgYW5kIHVwZGF0ZXM/DQoNCkkgaGF2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbjoNCg0KMS4gRm9y
IHRoZSByZWNpcGVzIG9mIHRoZSB3aXRoZXJzcG9vbi1wc3UtbW9uaXRvciwgY291bGQgaXQgYmUg
Y2hhbmdlZCB0byBhIGdlbmVyaWMgbmFtZSwgZm9yIGV4YW1wbGUuLi4NCg0KMi4gV2hlbiByZWFk
aW5nIGFuZCB1cGRhdGluZyB0aGUgcHJvcGVydGllcyBvZiB0aGUgeHl6Lm9wZW5ibWNfcHJvamVj
dC5JbnZlbnRvcnkuRGVjb3JhdG9yLkFzc2V0IGludGVyZmFjZSB2aWEgdGhlIHBtYnVzIGRyaXZl
ciwgY291bGQgaXQgYmUgY2hhbmdlZCB0byBhIGNvbW1vbiBjb25maWd1cmF0aW9uIChlZyB5YW1s
IG9yIGpzb24sIGV0Yy4pDQoNCjMuIC9zeXMva2VuZXJsL2RlYnVnL3BtYnVzL2h3bW9uWC9YWFgv
Li4uIERvZXMgZWFjaCBmaWxlIG5hbWUgbmVlZCB0byBiZSB1bmlmaWVkPw0KDQpUaGFua3MhDQo=
