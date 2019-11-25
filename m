Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C69108E7F
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 14:09:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M6nc0Xh9zDqVW
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 00:09:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=2252f2e9b=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47M6kb0ksgzDqTT
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 00:06:54 +1100 (AEDT)
IronPort-SDR: ofGXRZzuMEzStnDnujcWUkdE4doDD/FuyCV7NJdpSCLICILHB01UvaJ87L8nplUVmQY2+nOuAC
 i/IphtYL/8yQ==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 25 Nov 2019 21:06:49 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 21:06:46 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 25 Nov 2019 21:06:46 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: phosphor-sel-logger package
Thread-Topic: phosphor-sel-logger package
Thread-Index: AdWjidUs4+61ydjpQbO3ulOUSrb2pg==
Date: Mon, 25 Nov 2019 13:06:46 +0000
Message-ID: <40989749b52f46a585c025f6e87c2c06@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25064.007
x-tm-as-result: No-10--4.709000-8.000000
x-tmase-matchedrid: w2TFuZOvAteb5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmcqm
 rem+KXPdX5okd8k19iZDo8hSKUhJ6WFqPXSLpNdAUeavKZUnS5DVao4X08bWR8nJhTYnTng9jzr
 oMRry5yL2xaaBn3jEofq/furHWjNmIqRxG3EBiTfnzlXMYw4XMIGsNX5eg/aOC24oEZ6SpSk6XE
 E7Yhw4FiNHvc2bQV8QxyhkZDyNlsQw6qaFxxbxJpCXXKB7hHfRK2MkAcUt2L0kkloQkUSsItqrS
 TKx6rzLkb8b494U9+B2cVtXQaDI6yis9jscQpKczRtC/fI/GzL62iqv7ym1n2PqXSKGf39K1Zv3
 zS/4qbM=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--4.709000-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25064.007
x-tm-snts-smtp: 73DC266AB31C514116727DB6F5B13073460A1F952D1F21F7FE82EA1090603F132000:B
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

SEkgSmFzb24sDQoNCldoZW4gSSB1c2UgdGhlIGxhdGVzdCBjb21taXQoN2Q1MDU0YWMpLCBpdCBj
YW4gb25seSByZWNvcmQgb25lIHNlbCBsb2codGhlIGxhdGVzdCBzZWwpLg0KQWZ0ZXIgdHJhY2lu
ZyBjb2RlIEkgZm91bmQgdGhhdCB0aGUgcmVjb3JkSWQgWzFdIGFsd2F5cyBiZSAxLg0KWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvYmxvYi83ZDUwNTRh
YzE1YmVlOTk0NWFjMDBjNDcwYzM2Yzk0YjU2NWFjOGZhL3NyYy9zZWxfbG9nZ2VyLmNwcCNMMTEy
DQoNCkkgaGF2ZSBxdWVzdGlvbnMgYWJvdXQgdGhlIGFib3ZlIHNpdHVhdGlvbi4NCg0KMS4gd2hl
cmUgdGhlICJzZWxMb2dGaWxlbmFtZSJbMl0gZmlsZSBiZSBjcmVhdGVkPyANCiAgQ29kZSBbM10g
Y2hlY2tzIHRoZSBmaWxlIGJ1dCBjYW4ndCBmaW5kIHdoZXJlIHRvIGNyZWF0ZSBpdCBpbiB0aGlz
IHBhY2thZ2UuDQogIFsyXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1zZWwt
bG9nZ2VyL2Jsb2IvN2Q1MDU0YWMxNWJlZTk5NDVhYzAwYzQ3MGMzNmM5NGI1NjVhYzhmYS9pbmNs
dWRlL3NlbF9sb2dnZXIuaHBwI0wzNw0KICBbM10gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3Itc2VsLWxvZ2dlci9ibG9iLzdkNTA1NGFjMTViZWU5OTQ1YWMwMGM0NzBjMzZjOTRi
NTY1YWM4ZmEvc3JjL3NlbF9sb2dnZXIuY3BwI0w1NQ0KDQoyLiBBZnRlciBtYW51YWxseSBjcmVh
dGluZyBhIGZpbGUgb24gL3Zhci9sb2cvLCB0aGUgc2VsIGxvZyBiZWhhdmlvciBpcyBub3JtYWwu
IEl0IGNhbiBsb2cgc2V2ZXJhbCBsb2dzLg0KICBidXQgYWZ0ZXIgSSBjbGVhciB0aGUgc2VsIGxv
ZywgdGhlIHJlY29yZCBpZCBkb2VzIG5vdCByZXN0YXJ0IGF0IDEuIA0KICBDb21taXQgaWQgOiA2
YWZlOTU2MDg1MmM2NDMxYzQzYzhlNzlhMjhlMmI3Y2I0OThlMzU1DQoNCkJScywNCndpbGwNCg==
