Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6111193
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 04:37:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vfZ535NXzDqKV
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 12:37:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=018bedac0=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 44vfYG3jCrzDqNt
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 12:37:01 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 02 May 2019 10:36:58 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 2 May 2019
 10:36:57 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 2 May 2019 10:36:57 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: A question about phosphor-sel-logger
Thread-Topic: A question about phosphor-sel-logger
Thread-Index: AdUAjyy781fIgI1HTSKO9wlhvkw5CQ==
Date: Thu, 2 May 2019 02:36:57 +0000
Message-ID: <f68b269b1a854bfabfb021c1ae1955cc@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24582.006
x-tm-as-result: No--7.668300-0.000000-31
x-tm-as-matchedid: 140026-701625-704425-700685-700752-700153-700767-106470-7
 02507-704980-139504-700264-702609-707321-700016-105700-701594-148004-148133
 -10019-41000-42000-42003-63
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCk91ciBCTUMgaXMgdXNpbmcgcGFja2FnZSAicGhvc3Bob3Itc2VsLWxvZ2dlciIgdG8g
c3VwcG9ydCBJUE1JIFNFTC4gaXQgc2F2ZWQgdGhlIGV2ZW50IGRhdGEgaW4gdGhlIGpvdXJuYWwg
YW5kIHRoZSBpZCBpcyAxLTY1NTM0LiANCkl0IG1lYW5zIGl0IGNhbiBzYXZlIDY1NTM0IHJlY29y
ZHMuIEFjdHVhbGx5LCB3ZSBmb3VuZCB0aGUgZmlsZSBzaXplIG9mIHNpbmdsZSBqb3VybmFsIGZp
bGUgaXMgYXJvdW5kIDhNQih0aGUgZGVmYXVsdCBvZiBqb3VybmFsIGZpbGUgaXMgNjRNQiwgaXQg
d2lsbCBiZSBzZXBhcmF0ZWQgYnkgOCBmaWxlcykuDQpXZSBjYW5ub3Qgc2hvdyBhbGwgU0VMcyg2
NTUzNCByZWNvcmRzKSBpbiBJUE1JLiBpdCBtaWdodCBiZSBhIGJ1ZyBoZXJlIGlmIHdlIGRvbid0
IGxpbWl0IHRoZSBtYXhpbXVtLg0KDQpJcyBpdCBuZWNlc3NhcnkgdG8gbGltaXQgdGhlIG51bWJl
ciBvZiBTRUxzIHRvIHNtYWxsZXI/DQoNCkJScywNCldpbGwNCg==
