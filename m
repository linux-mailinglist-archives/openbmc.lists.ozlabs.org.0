Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E2BF010
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:50:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fBXv6nPLzDqd2
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 20:50:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.10.14; helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="r+0bC//Z"; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010014.outbound.protection.outlook.com [40.92.10.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fBX83Yp0zDqNt
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 20:49:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq0RVjMVqwhTIFCOomfjWMtZz9PpM+zd+TIX5Nng3kfTTYYfsZzZNQTaT/k9Dd+ZcGNCd/eny5zwNybz1K7Ma/6xhV2kalAWvT3Ir5oLexcgd9VEcodfn8GcZFIwbP/9N0tKbhk6g5747pIsLOzD6Xw1RVLRHKM8NfMzo/D5OrC4KTCe3BV3Ry7GMh14GyNF+nABwdLn5eCtAH+nxI5JpHMCcw+7Kvrz+x5zHHGuCMEi00bbh+mpKddV1OUzZ6V2VAARRedUwodhbNoNtFI0sFoDMp0wFiNi5+MAJriAM7F3We7NLbfCjdhQcJFYwJndL7qkobXY/LGdf8lOw43dWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xykxBl9hFSJuDWsMcUz8+B0RvNk+18zXgTO78oNXQRQ=;
 b=Ljm29mlUZVqA+a/Z3j+qHlF/Ys+opjVkBP9IyTWRDtcYRTETLfN/uQj0sc5OyT87cUSQ/j8Fwp4X4X5AjRBykheswo2/L5JI2DVmQQ9dnG2o5i1EJcx/RmGPHrSIRvZh22jH7SvDroYpQ+LrxcCdIL2FCynVj1SgQxZyW15tetum16KM5RfmXBRO0TPDrC3zN9ci6mMhcXrl8zv6xj0egILDEM2dNbsJ85hrbzRcnwbdgNlqnvDSfDJgAI6/K0nZCXHDL9bYOsoOmB8CZJHSanXMgUIu7hIXdVOh1UpFc99Kt7oxHGHwJGgrE2RIB0gwih6rgEnFQcC5Afqc2WXbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xykxBl9hFSJuDWsMcUz8+B0RvNk+18zXgTO78oNXQRQ=;
 b=r+0bC//Zzn9fjlzkFi+DLZTmx2gjQP7RaCTewFBAxvq4NJnr/ujVFvjVpxEJcD3Y4KIZB0dvZ08oI6kI6jf0ZM1PnfP0AAwGP97wHCVTHu+SbrY4BUgAZw4XGnadNkMnQorVggJeXj6yL6VlZ3NnuJJYpQnhzjqHcXVVizW4gsr0gaY638e4+2GBafiIM79xDtr1+BzG1qERjP4Syn6PZ/wlrk7Pg+mLi2ocH6qSMHdeK5piDhtuCE8jqI3XuqTo5SukPP4zEVc3A9X5mJWZ3rGmu0snH9CBKcxa5D+jUaiFmjoH9UuSYvSIr9Aeq2q7OyXETkfU2xFxrxW2F1G1UQ==
Received: from SN1NAM04FT013.eop-NAM04.prod.protection.outlook.com
 (10.152.88.56) by SN1NAM04HT225.eop-NAM04.prod.protection.outlook.com
 (10.152.88.185) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.25; Thu, 26 Sep
 2019 10:49:55 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.88.51) by
 SN1NAM04FT013.mail.protection.outlook.com (10.152.88.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 10:49:55 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 10:49:55 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [AST2500]The eth0 interface can not work
Thread-Topic: [AST2500]The eth0 interface can not work
Thread-Index: AQHVdFdbcJs/Slel4kClfvSqSubl0Kc9x22i
Date: Thu, 26 Sep 2019 10:49:54 +0000
Message-ID: <MN2PR04MB66690AB5ACEC2097E729B50CCD860@MN2PR04MB6669.namprd04.prod.outlook.com>
References: <MN2PR04MB66691B6B826B456D250D21E9CD860@MN2PR04MB6669.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB66691B6B826B456D250D21E9CD860@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:E2B6D6C3EBD04B93D5A45F317D53A43B1D6E8B10DF61D1531CA3DEDEF27BE1C1;
 UpperCasedChecksum:D404C338CBBFAA66DFD9AC41E52A59C821F90CFF1604CB72094DDD8A267BEDE3;
 SizeAsReceived:6858; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [qvu/tfbFs2Ywnbpu6tahVh9NWmmZ2yyN]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119205)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(2017031321001)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM04HT225; 
x-ms-traffictypediagnostic: SN1NAM04HT225:
x-microsoft-antispam-message-info: nkHlXZwgkBllCGymsHObiftpa59Hl+qqFfCEkRDwit13KADeF3Zgllu32ZWpIiwFV5ozmWpEY41PrAgJ3tWChhPipg69Rp4OfVZBXUt08JtSBn/xwgdPVpr0eQe3ccibAcvKjmIDEQ01T2RGIelYU2mP3gVVJycPONbTW9hKvPaVOUCB1jLMK+6RGt+frSsX
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66690AB5ACEC2097E729B50CCD860MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1a148c-8557-4f1c-f220-08d7426f4448
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 10:49:54.9578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT225
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

--_000_MN2PR04MB66690AB5ACEC2097E729B50CCD860MN2PR04MB6669namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhlIHdob2xlIGRtZXNnIGlzIGhlcmUuDQoNCnJvb3RAczI2MDB3Zjp+IyBkbWVzZw0KWyAgICAw
LjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwDQpbICAgIDAuMDAwMDAw
XSBMaW51eCB2ZXJzaW9uIDUuMi4xNC05ZjRmNWZmIChvZS11c2VyQG9lLWhvc3QpIChnY2MgdmVy
c2lvbiA5LjIuMCAoR0NDKSkgIzEgV2VkIFNlcCAyNSAyMjoyNzo1MSBVVEMgMjAxOQ0KWyAgICAw
LjAwMDAwMF0gQ1BVOiBBUk12Ni1jb21wYXRpYmxlIHByb2Nlc3NvciBbNDEwZmI3NjddIHJldmlz
aW9uIDcgKEFSTXY3KSwgY3I9MDBjNTM4N2QNClsgICAgMC4wMDAwMDBdIENQVTogUElQVCAvIFZJ
UFQgbm9uYWxpYXNpbmcgZGF0YSBjYWNoZSwgVklQVCBub25hbGlhc2luZyBpbnN0cnVjdGlvbiBj
YWNoZQ0KWyAgICAwLjAwMDAwMF0gT0Y6IGZkdDogTWFjaGluZSBtb2RlbDogUzI2MDBXRiBCTUMN
ClsgICAgMC4wMDAwMDBdIE1lbW9yeSBwb2xpY3k6IERhdGEgY2FjaGUgd3JpdGViYWNrDQpbICAg
IDAuMDAwMDAwXSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDlkODAwMDAwDQpbICAgIDAuMDAw
MDAwXSBPbiBub2RlIDAgdG90YWxwYWdlczogMTI2OTc2DQpbICAgIDAuMDAwMDAwXSAgIE5vcm1h
bCB6b25lOiA5OTIgcGFnZXMgdXNlZCBmb3IgbWVtbWFwDQpbICAgIDAuMDAwMDAwXSAgIE5vcm1h
bCB6b25lOiAwIHBhZ2VzIHJlc2VydmVkDQpbICAgIDAuMDAwMDAwXSAgIE5vcm1hbCB6b25lOiAx
MjY5NzYgcGFnZXMsIExJRk8gYmF0Y2g6MzENClsgICAgMC4wMDAwMDBdIHBjcHUtYWxsb2M6IHMw
IHIwIGQzMjc2OCB1MzI3NjggYWxsb2M9MSozMjc2OA0KWyAgICAwLjAwMDAwMF0gcGNwdS1hbGxv
YzogWzBdIDANClsgICAgMC4wMDAwMDBdIEJ1aWx0IDEgem9uZWxpc3RzLCBtb2JpbGl0eSBncm91
cGluZyBvbi4gIFRvdGFsIHBhZ2VzOiAxMjU5ODQNClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21t
YW5kIGxpbmU6IGNvbnNvbGU9dHR5UzQsMTE1MjAwbjggcm9vdD0vZGV2L3JhbSBydw0KWyAgICAw
LjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNjU1MzYgKG9yZGVyOiA2
LCAyNjIxNDQgYnl0ZXMpDQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVu
dHJpZXM6IDMyNzY4IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQ0KWyAgICAwLjAwMDAwMF0gTWVt
b3J5OiA0NzU3MDRLLzUwNzkwNEsgYXZhaWxhYmxlICg2MTQ0SyBrZXJuZWwgY29kZSwgMzg1SyBy
d2RhdGEsIDE0MDhLIHJvZGF0YSwgMTAyNEsgaW5pdCwgMTQ1SyBic3MsIDE1ODE2SyByZXNlcnZl
ZCwgMTYzODRLDQpjbWEtcmVzZXJ2ZWQpDQpbICAgIDAuMDAwMDAwXSByYW5kb206IGdldF9yYW5k
b21fdTMyIGNhbGxlZCBmcm9tIGNhY2hlX2FsbG9jX3JlZmlsbCsweDNkMC8weDhmYyB3aXRoIGNy
bmdfaW5pdD0wDQpbICAgIDAuMDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRpbmcgMjA2ODEgZW50cmll
cyBpbiA0MSBwYWdlcw0KWyAgICAwLjAwMDAwMF0gTlJfSVJRUzogMTYsIG5yX2lycXM6IDE2LCBw
cmVhbGxvY2F0ZWQgaXJxczogMTYNClsgICAgMC4wMDAwMDBdIGkyYyBjb250cm9sbGVyIHJlZ2lz
dGVyZWQsIGlycSAxNg0KWyAgICAwLjAwMDAwMF0gY2xvY2tzb3VyY2U6IEZUVE1SMDEwLVRJTUVS
MjogbWFzazogMHhmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczog
NzcyMjI2NDQzMzQgbnMNClsgICAgMC4wMDAwMTldIHNjaGVkX2Nsb2NrOiAzMiBiaXRzIGF0IDI0
TUh6LCByZXNvbHV0aW9uIDQwbnMsIHdyYXBzIGV2ZXJ5IDg2NzY3MDE1OTE1bnMNClsgICAgMC4w
MDAwODldIFN3aXRjaGluZyB0byB0aW1lci1iYXNlZCBkZWxheSBsb29wLCByZXNvbHV0aW9uIDQw
bnMNClsgICAgMC4wMDExODFdIENhbGlicmF0aW5nIGRlbGF5IGxvb3AgKHNraXBwZWQpLCB2YWx1
ZSBjYWxjdWxhdGVkIHVzaW5nIHRpbWVyIGZyZXF1ZW5jeS4uIDQ5LjUwIEJvZ29NSVBTIChscGo9
MjQ3NTAwKQ0KWyAgICAwLjAwMTIzMl0gcGlkX21heDogZGVmYXVsdDogMzI3NjggbWluaW11bTog
MzAxDQpbICAgIDAuMDAxOTU4XSBNb3VudC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQg
KG9yZGVyOiAwLCA0MDk2IGJ5dGVzKQ0KWyAgICAwLjAwMjAwMV0gTW91bnRwb2ludC1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzKQ0KWyAgICAwLjAw
MzU5NF0gQ1BVOiBUZXN0aW5nIHdyaXRlIGJ1ZmZlciBjb2hlcmVuY3k6IG9rDQpbICAgIDAuMDA1
MzQ3XSBTZXR0aW5nIHVwIHN0YXRpYyBpZGVudGl0eSBtYXAgZm9yIDB4ODAxMDAwMDAgLSAweDgw
MTAwMDM4DQpbICAgIDAuMDA5Mjg3XSBkZXZ0bXBmczogaW5pdGlhbGl6ZWQNClsgICAgMC4wMjI2
NzddIGNsb2Nrc291cmNlOiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4
ZmZmZmZmZmYsIG1heF9pZGxlX25zOiAxOTExMjYwNDQ2Mjc1MDAwMCBucw0KWyAgICAwLjAyMjcz
MV0gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiAyNTYgKG9yZGVyOiAtMSwgMzA3MiBieXRlcykN
ClsgICAgMC4wMjU4ODhdIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGluY3RybCBzdWJzeXN0
ZW0NClsgICAgMC4wMjY5NThdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTYNClsg
ICAgMC4wMjg4MDZdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWljIGNv
aGVyZW50IGFsbG9jYXRpb25zDQpbICAgIDAuMDMwODk0XSBody1icmVha3BvaW50OiBmb3VuZCA2
IGJyZWFrcG9pbnQgYW5kIDEgd2F0Y2hwb2ludCByZWdpc3RlcnMuDQpbICAgIDAuMDMwOTI2XSBo
dy1icmVha3BvaW50OiBtYXhpbXVtIHdhdGNocG9pbnQgc2l6ZSBpcyA0IGJ5dGVzLg0KWyAgICAw
LjA2NjU3NV0gdmlkZW9kZXY6IExpbnV4IHZpZGVvIGNhcHR1cmUgaW50ZXJmYWNlOiB2Mi4wMA0K
WyAgICAwLjA2OTYzOV0gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIEZUVE1S
MDEwLVRJTUVSMg0KWyAgICAwLjExODYwNF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWls
eSAyDQpbICAgIDAuMTE5OTIxXSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFzaCB0YWJsZSBl
bnRyaWVzOiA1MTIgKG9yZGVyOiAwLCA0MDk2IGJ5dGVzKQ0KWyAgICAwLjEyMDAxM10gVENQIGVz
dGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVz
KQ0KWyAgICAwLjEyMDEwMV0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiA0MDk2IChvcmRl
cjogMiwgMTYzODQgYnl0ZXMpDQpbICAgIDAuMTIwMTcxXSBUQ1A6IEhhc2ggdGFibGVzIGNvbmZp
Z3VyZWQgKGVzdGFibGlzaGVkIDQwOTYgYmluZCA0MDk2KQ0KWyAgICAwLjEyMDQwNl0gVURQIGhh
c2ggdGFibGUgZW50cmllczogMjU2IChvcmRlcjogMCwgNDA5NiBieXRlcykNClsgICAgMC4xMjA0
NjVdIFVEUC1MaXRlIGhhc2ggdGFibGUgZW50cmllczogMjU2IChvcmRlcjogMCwgNDA5NiBieXRl
cykNClsgICAgMC4xMjA5OTddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMQ0KWyAg
ICAwLjEyMTg1N10gVW5wYWNraW5nIGluaXRyYW1mcy4uLg0KWyAgICAxLjgwNDcwMF0gRnJlZWlu
ZyBpbml0cmQgbWVtb3J5OiAxNDkySw0KWyAgICAxLjgwNzM0Ml0gd29ya2luZ3NldDogdGltZXN0
YW1wX2JpdHM9MzAgbWF4X29yZGVyPTE3IGJ1Y2tldF9vcmRlcj0wDQpbICAgIDEuODA3ODY4XSBz
cXVhc2hmczogdmVyc2lvbiA0LjAgKDIwMDkvMDEvMzEpIFBoaWxsaXAgTG91Z2hlcg0KWyAgICAx
LjgwNzkwM10gamZmczI6IHZlcnNpb24gMi4yLiAoU1VNTUFSWSkgIMKpIDIwMDEtMjAwNiBSZWQg
SGF0LCBJbmMuDQpbICAgIDEuODA4NjExXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5
IDM4DQpbICAgIDEuODE0NzMxXSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCA2IHBvcnRzLCBJ
UlEgc2hhcmluZyBlbmFibGVkDQpbICAgIDEuODE4OTI5XSBwcmludGs6IGNvbnNvbGUgW3R0eVM0
XSBkaXNhYmxlZA0KWyAgICAxLjgxOTA3M10gMWU3ODQwMDAuc2VyaWFsOiB0dHlTNCBhdCBNTUlP
IDB4MWU3ODQwMDAgKGlycSA9IDMwLCBiYXNlX2JhdWQgPSAxNTAwMDAwKSBpcyBhIDE2NTUwQQ0K
WyAgICAyLjE1MTU5OF0gcHJpbnRrOiBjb25zb2xlIFt0dHlTNF0gZW5hYmxlZA0KWyAgICAyLjE1
Nzg0NF0gdGltZXJpb21lbV9ybmcgMWU2ZTIwNzguaHdybmc6IDMyYml0cyBmcm9tIDB4KHB0cnZh
bCkgQCAxdXMNClsgICAgMi4xNjU2MDddIGFzcGVlZF9nZnggMWU2ZTYwMDAuZGlzcGxheTogZmFp
bGVkIHRvIGluaXRpYWxpemUgcmVzZXJ2ZWQgbWVtOiAtMTkNClsgICAgMi4xNzM0NTRdIHJhbmRv
bTogZmFzdCBpbml0IGRvbmUNClsgICAgMi4xODQyMDVdIHJhbmRvbTogY3JuZyBpbml0IGRvbmUN
ClsgICAgMi4xOTg3MTRdIGxvb3A6IG1vZHVsZSBsb2FkZWQNClsgICAgMi4yNDY2NjhdIGFzcGVl
ZC1zbWMgMWU2MjAwMDAuc3BpOiBVc2luZyA1MCBNSHogU1BJIGZyZXF1ZW5jeQ0KWyAgICAyLjI1
MjgzMl0gYXNwZWVkLXNtYyAxZTYyMDAwMC5zcGk6IHcyNXEyNTYgKDMyNzY4IEtieXRlcykNClsg
ICAgMi4yNTg0MzddIGFzcGVlZC1zbWMgMWU2MjAwMDAuc3BpOiBDRTAgd2luZG93IFsgMHgyMDAw
MDAwMCAtIDB4MjIwMDAwMDAgXSAzMk1CDQpbICAgIDIuMjY1OTQ5XSBhc3BlZWQtc21jIDFlNjIw
MDAwLnNwaTogQ0UxIHdpbmRvdyBbIDB4MjIwMDAwMDAgLSAweDJhMDAwMDAwIF0gMTI4TUINClsg
ICAgMi4yNzM1MjldIGFzcGVlZC1zbWMgMWU2MjAwMDAuc3BpOiByZWFkIGNvbnRyb2wgcmVnaXN0
ZXI6IDIwM2IwNjQxDQpbICAgIDIuNDE2NDYyXSA1IGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9u
cyBmb3VuZCBvbiBNVEQgZGV2aWNlIGJtYw0KWyAgICAyLjQyMjY5MV0gQ3JlYXRpbmcgNSBNVEQg
cGFydGl0aW9ucyBvbiAiYm1jIjoNClsgICAgMi40MjcyNDldIDB4MDAwMDAwMDAwMDAwLTB4MDAw
MDAwMDYwMDAwIDogInUtYm9vdCINClsgICAgMi40MzQ1ODVdIDB4MDAwMDAwMDYwMDAwLTB4MDAw
MDAwMDgwMDAwIDogInUtYm9vdC1lbnYiDQpbICAgIDIuNDQyMzUwXSAweDAwMDAwMDA4MDAwMC0w
eDAwMDAwMDRjMDAwMCA6ICJrZXJuZWwiDQpbICAgIDIuNDQ5NzUwXSAweDAwMDAwMDRjMDAwMC0w
eDAwMDAwMWMwMDAwMCA6ICJyb2ZzIg0KWyAgICAyLjQ1Njg5M10gMHgwMDAwMDFjMDAwMDAtMHgw
MDAwMDIwMDAwMDAgOiAicndmcyINClsgICAgMi40NjU2ODFdIGFzcGVlZC1zbWMgMWU2MzAwMDAu
c3BpOiBVc2luZyA1MCBNSHogU1BJIGZyZXF1ZW5jeQ0KWyAgICAyLjQ3MTgwM10gYXNwZWVkLXNt
YyAxZTYzMDAwMC5zcGk6IHVucmVjb2duaXplZCBKRURFQyBpZCBieXRlczogMDAgMDAgMDAgMDAg
MDAgMDANClsgICAgMi40Nzk0OTBdIGFzcGVlZC1zbWMgMWU2MzAwMDAuc3BpOiBBc3BlZWQgU01D
IHByb2JlIGZhaWxlZCAtMg0KWyAgICAyLjQ5MDMzOV0gYXNwZWVkLXNtYzogcHJvYmUgb2YgMWU2
MzAwMDAuc3BpIGZhaWxlZCB3aXRoIGVycm9yIC0yDQpbICAgIDIuNDk4MjMyXSBsaWJwaHk6IEZp
eGVkIE1ESU8gQnVzOiBwcm9iZWQNClsgICAgMi41MDMzNzJdIGZ0Z21hYzEwMCAxZTY2MDAwMC5l
dGhlcm5ldDogRXJyb3IgYXBwbHlpbmcgc2V0dGluZywgcmV2ZXJzZSB0aGluZ3MgYmFjaw0KWyAg
ICAyLjUxMTUwOV0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0OiBHZW5lcmF0ZWQgcmFuZG9t
IE1BQyBhZGRyZXNzIDUyOjQ3OmRhOjkyOmEzOmU2DQpbICAgIDIuNTE5NTU0XSBmdGdtYWMxMDAg
MWU2NjAwMDAuZXRoZXJuZXQ6IFVzaW5nIE5DU0kgaW50ZXJmYWNlDQpbICAgIDIuNTI2NTk2XSBm
dGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogaXJxIDE5LCBtYXBwZWQgYXQgZTg0NjQ0
M2UNClsgICAgMi41MzM4MThdIGZ0Z21hYzEwMCAxZTY4MDAwMC5ldGhlcm5ldDogRXJyb3IgYXBw
bHlpbmcgc2V0dGluZywgcmV2ZXJzZSB0aGluZ3MgYmFjaw0KWyAgICAyLjU0MTkzN10gZnRnbWFj
MTAwIDFlNjgwMDAwLmV0aGVybmV0OiBHZW5lcmF0ZWQgcmFuZG9tIE1BQyBhZGRyZXNzIDBhOjRm
OmE3OmVhOjIyOmIzDQpbICAgIDIuNTU2NzI2XSBsaWJwaHk6IGZ0Z21hYzEwMF9tZGlvOiBwcm9i
ZWQNClsgICAgMi41NjA5NTNdIGZ0Z21hYzEwMCAxZTY4MDAwMC5ldGhlcm5ldCAodW5uYW1lZCBu
ZXRfZGV2aWNlKSAodW5pbml0aWFsaXplZCk6IGV0aCVkOiBubyBQSFkgZm91bmQNClsgICAgMi41
Njk5MThdIGZ0Z21hYzEwMCAxZTY4MDAwMC5ldGhlcm5ldDogTUlJIFByb2JlIGZhaWxlZCENClsg
ICAgMi41NzYyODhdIHVkYy1jb3JlOiBjb3VsZG4ndCBmaW5kIGFuIGF2YWlsYWJsZSBVREMgLSBh
ZGRlZCBbZ19tYXNzX3N0b3JhZ2VdIHRvIGxpc3Qgb2YgcGVuZGluZyBkcml2ZXJzDQpbICAgIDIu
NTg2MzY2XSBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcg0KWyAgICAyLjU5MTYxNF0gYXNwZWVkLWky
Yy1idXMgMWU3OGEwODAuaTJjLWJ1czogaTJjIGJ1cyAxIHJlZ2lzdGVyZWQgKGJ5dGUgbW9kZSks
IGlycSAzMQ0KWyAgICAyLjYwMTIzMl0gYXNwZWVkLWkyYy1idXMgMWU3OGEwYzAuaTJjLWJ1czog
aTJjIGJ1cyAyIHJlZ2lzdGVyZWQgKGJ5dGUgbW9kZSksIGlycSAzMg0KWyAgICAyLjYxMDc1MV0g
YXNwZWVkLWkyYy1idXMgMWU3OGExMDAuaTJjLWJ1czogaTJjIGJ1cyAzIHJlZ2lzdGVyZWQgKGJ5
dGUgbW9kZSksIGlycSAzMw0KWyAgICAyLjYyMDI5NF0gYXNwZWVkLWkyYy1idXMgMWU3OGExNDAu
aTJjLWJ1czogaTJjIGJ1cyA0IHJlZ2lzdGVyZWQgKGJ5dGUgbW9kZSksIGlycSAzNA0KWyAgICAy
LjYyOTg1NF0gYXNwZWVkLWkyYy1idXMgMWU3OGExODAuaTJjLWJ1czogaTJjIGJ1cyA1IHJlZ2lz
dGVyZWQgKGJ5dGUgbW9kZSksIGlycSAzNQ0KWyAgICAyLjYzOTMwOF0gYXNwZWVkLWkyYy1idXMg
MWU3OGExYzAuaTJjLWJ1czogaTJjIGJ1cyA2IHJlZ2lzdGVyZWQgKGJ5dGUgbW9kZSksIGlycSAz
Ng0KWyAgICAyLjY0ODg4MV0gYXNwZWVkLWkyYy1idXMgMWU3OGEzMDAuaTJjLWJ1czogaTJjIGJ1
cyA3IHJlZ2lzdGVyZWQgKGJ5dGUgbW9kZSksIGlycSAzNw0KWyAgICAyLjY1ODUwMV0gYXNwZWVk
LWkyYy1idXMgMWU3OGE0ODAuaTJjLWJ1czogaTJjIGJ1cyAxMyByZWdpc3RlcmVkIChieXRlIG1v
ZGUpLCBpcnEgMzgNClsgICAgMi42NjcyNzBdIERyaXZlciBmb3IgMS13aXJlIERhbGxhcyBuZXR3
b3JrIHByb3RvY29sLg0KWyAgICAyLjY4MDQzNF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZh
bWlseSAxMA0KWyAgICAyLjY4NzIxMl0gU2VnbWVudCBSb3V0aW5nIHdpdGggSVB2Ng0KWyAgICAy
LjY5MTY5Nl0gc2l0OiBJUHY2LCBJUHY0IGFuZCBNUExTIG92ZXIgSVB2NCB0dW5uZWxpbmcgZHJp
dmVyDQpbICAgIDIuNjk4OTk5XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE3DQpb
ICAgIDIuNzAzNjIyXSA4MDIxcTogODAyLjFRIFZMQU4gU3VwcG9ydCB2MS44DQpbICAgIDIuNzE1
NDU3XSBwcmludGs6IGNvbnNvbGUgW25ldGNvbjBdIGVuYWJsZWQNClsgICAgMi43MTk5NDBdIG5l
dGNvbnNvbGU6IG5ldHdvcmsgbG9nZ2luZyBzdGFydGVkDQpbICAgIDIuNzI0NzcwXSBoY3Rvc3lz
OiB1bmFibGUgdG8gb3BlbiBydGMgZGV2aWNlIChydGMwKQ0KWyAgICAyLjczNTk2NV0gRnJlZWlu
ZyB1bnVzZWQga2VybmVsIG1lbW9yeTogMTAyNEsNClsgICAgMi43NDI1NDldIENoZWNrZWQgVytY
IG1hcHBpbmdzOiBwYXNzZWQsIG5vIFcrWCBwYWdlcyBmb3VuZA0KWyAgICAyLjc0ODIzNV0gUnVu
IC9pbml0IGFzIGluaXQgcHJvY2Vzcw0KWyAgICAzLjcwMDIyOF0gamZmczI6IG5vdGljZTogKDc3
KSBqZmZzMl9idWlsZF94YXR0cl9zdWJzeXN0ZW06IGNvbXBsZXRlIGJ1aWxkaW5nIHhhdHRyIHN1
YnN5c3RlbSwgMjQgb2YgeGRhdHVtICgxNSB1bmNoZWNrZWQsIDEgb3JwaGFuKSBhbmQgNQ0KMSBv
ZiB4cmVmICgxIGRlYWQsIDAgb3JwaGFuKSBmb3VuZC4NClsgICAgMy43NTY2NDRdIG92ZXJsYXlm
czogdXBwZXIgZnMgZG9lcyBub3Qgc3VwcG9ydCB0bXBmaWxlLg0KWyAgICA2LjA4Njk3MV0gc3lz
dGVtZFsxXTogc3lzdGVtZCAyNDItMTA4LWdmODc1ZGNlKyBydW5uaW5nIGluIHN5c3RlbSBtb2Rl
LiAoK1BBTSAtQVVESVQgLVNFTElOVVggLUlNQSAtQVBQQVJNT1IgLVNNQUNLICtTWVNWSU5JVCAt
VVRNUCAtTElCQw0KUllQVFNFVFVQIC1HQ1JZUFQgLUdOVVRMUyAtQUNMICtYWiAtTFo0IC1TRUND
T01QICtCTEtJRCAtRUxGVVRJTFMgLUtNT0QgLUlETjIgLUlETiAtUENSRTIgZGVmYXVsdC1oaWVy
YXJjaHk9aHlicmlkKQ0KWyAgICA2LjExMTYzNV0gc3lzdGVtZFsxXTogRGV0ZWN0ZWQgYXJjaGl0
ZWN0dXJlIGFybS4NClsgICAgNi4yMjY1ODZdIHN5c3RlbWRbMV06IFNldCBob3N0bmFtZSB0byA8
czI2MDB3Zj4uDQpbICAgIDcuMDEzMjU1XSBzeXN0ZW1kWzFdOiBGaWxlIC9saWIvc3lzdGVtZC9z
eXN0ZW0vc3lzdGVtZC1qb3VybmFsZC5zZXJ2aWNlOjE0IGNvbmZpZ3VyZXMgYW4gSVAgZmlyZXdh
bGwgKElQQWRkcmVzc0Rlbnk9YW55KSwgYnV0IHRoZSBsb2NhbCBzDQp5c3RlbSBkb2VzIG5vdCBz
dXBwb3J0IEJQRi9jZ3JvdXAgYmFzZWQgZmlyZXdhbGxpbmcuDQpbICAgIDcuMDMwNDk2XSBzeXN0
ZW1kWzFdOiBQcm9jZWVkaW5nIFdJVEhPVVQgZmlyZXdhbGxpbmcgaW4gZWZmZWN0ISAoVGhpcyB3
YXJuaW5nIGlzIG9ubHkgc2hvd24gZm9yIHRoZSBmaXJzdCBsb2FkZWQgdW5pdCB1c2luZyBJUCBm
aXJld2FsbGluDQpnLikNClsgICAgNy40MjcxOTRdIHN5c3RlbWRbMV06IC9saWIvc3lzdGVtZC9z
eXN0ZW0vZGJ1cy5zb2NrZXQ6NTogTGlzdGVuU3RyZWFtPSByZWZlcmVuY2VzIGEgcGF0aCBiZWxv
dyBsZWdhY3kgZGlyZWN0b3J5IC92YXIvcnVuLywgdXBkYXRpbmcgL3Zhci8NCnJ1bi9kYnVzL3N5
c3RlbV9idXNfc29ja2V0IOKGPy9ydW4vZGJ1cy9zeXN0ZW1fYnVzX3NvY2tldDsgcGxlYXNlIHVw
ZGF0ZSB0aGUgdW5pdCBmaWxlIGFjY29yZGluZ2x5Lg0KWyAgICA4Ljc2Nzg3MF0gc3lzdGVtZFsx
XTogL2xpYi9zeXN0ZW1kL3N5c3RlbS9waG9zcGhvci1pcG1pLW5ldEAuc29ja2V0OjM6IEludmFs
aWQgaW50ZXJmYWNlIG5hbWUsIGlnbm9yaW5nOiBzeXMtc3Vic3lzdGVtLW5ldC1kZXZpY2VzLSVp
LmRldg0KaWNlDQpbICAgIDguOTE0MDg2XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gSm91cm5h
bCBTb2NrZXQgKC9kZXYvbG9nKS4NClsgICAgOC45NTQzMjldIHN5c3RlbWRbMV06IENyZWF0ZWQg
c2xpY2Ugc3lzdGVtLXBob3NwaG9yXHgyZHJlc2V0XHgyZHNlbnNvclx4MmRzdGF0ZXMuc2xpY2Uu
DQpbICAgIDkuMDAyMDkyXSBzeXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIHN5c3RlbS1vcmcub3Bl
bmJtYy5jb250cm9sLkJtYy5zbGljZS4NClsgICAxMC45NjgxNTRdIHN5c3RlbWQtam91cm5hbGRb
MTAyXTogUmVjZWl2ZWQgcmVxdWVzdCB0byBmbHVzaCBydW50aW1lIGpvdXJuYWwgZnJvbSBQSUQg
MQ0KWyAgIDE1LjYzNDcxN10gODAyMXE6IGFkZGluZyBWTEFOIDAgdG8gSFcgZmlsdGVyIG9uIGRl
dmljZSBldGgwDQpbICAgMzIuMjQ5ODc3XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRo
MDogTkNTSTogTm8gY2hhbm5lbCBmb3VuZCB0byBjb25maWd1cmUhDQpbICAgMzMuMjg5ODEzXSBm
dGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogV3JvbmcgTkNTSSBzdGF0ZSAweDEwMCBp
biB3b3JrcXVldWUNClsgICA2OC4wODk2ODVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0t
LS0tLS0tLQ0KWyAgIDY4LjA5NDM4NV0gV0FSTklORzogQ1BVOiAwIFBJRDogMjczIGF0IG5ldC9z
Y2hlZC9zY2hfZ2VuZXJpYy5jOjQ0MiBkZXZfd2F0Y2hkb2crMHgyNjgvMHgyODgNClsgICA2OC4x
MDI5NDVdIE5FVERFViBXQVRDSERPRzogZXRoMCAoZnRnbWFjMTAwKTogdHJhbnNtaXQgcXVldWUg
MCB0aW1lZCBvdXQNClsgICA2OC4xMDk4NDFdIENQVTogMCBQSUQ6IDI3MyBDb21tOiBybmdkIE5v
dCB0YWludGVkIDUuMi4xNC05ZjRmNWZmICMxDQpbICAgNjguMTE2MjA5XSBIYXJkd2FyZSBuYW1l
OiBHZW5lcmljIERUIGJhc2VkIHN5c3RlbQ0KWyAgIDY4LjEyMTA3N10gQmFja3RyYWNlOg0KWyAg
IDY4LjEyMzU5Nl0gWzw4MDEwN2QyYz5dIChkdW1wX2JhY2t0cmFjZSkgZnJvbSBbPDgwMTA3ZjYw
Pl0gKHNob3dfc3RhY2srMHgyMC8weDI0KQ0KWyAgIDY4LjEzMTI3Ml0gIHI3OjgwYTEyZDAwIHI2
OjAwMDAwMDAwIHI1OjljNjBiZTA0IHI0OjAwMDAwMDA5DQpbICAgNjguMTM2OTc0XSBbPDgwMTA3
ZjQwPl0gKHNob3dfc3RhY2spIGZyb20gWzw4MDY2Y2VkMD5dIChkdW1wX3N0YWNrKzB4MjAvMHgy
OCkNClsgICA2OC4xNDQzMjRdIFs8ODA2NmNlYjA+XSAoZHVtcF9zdGFjaykgZnJvbSBbPDgwMTE2
MzA4Pl0gKF9fd2Fybi5wYXJ0LjArMHhiNC8weGRjKQ0KWyAgIDY4LjE1MTkyMl0gWzw4MDExNjI1
ND5dIChfX3dhcm4ucGFydC4wKSBmcm9tIFs8ODAxMTYzYTA+XSAod2Fybl9zbG93cGF0aF9mbXQr
MHg3MC8weDk4KQ0KWyAgIDY4LjE2MDEwOV0gIHI2OjgwNTc5NTRjIHI1OjAwMDAwMWJhIHI0Ojgw
ODNlZmI4DQpbICAgNjguMTY0Nzc5XSBbPDgwMTE2MzM0Pl0gKHdhcm5fc2xvd3BhdGhfZm10KSBm
cm9tIFs8ODA1Nzk1NGM+XSAoZGV2X3dhdGNoZG9nKzB4MjY4LzB4Mjg4KQ0KWyAgIDY4LjE3MzA1
Ml0gIHIzOjlkNjFjMDAwIHIyOjgwODNlZjdjDQpbICAgNjguMTc2NjQ3XSAgcjY6MDAwMDAwMDAg
cjU6OWMwZTkxMDAgcjQ6OWQ2MWMyMmMNClsgICA2OC4xODEzODNdIFs8ODA1NzkyZTQ+XSAoZGV2
X3dhdGNoZG9nKSBmcm9tIFs8ODAxNTk4Yjg+XSAoY2FsbF90aW1lcl9mbisweDQwLzB4MTI0KQ0K
WyAgIDY4LjE4OTE0NF0gIHI5OjAwMDAwMDAwIHI4OmZmZmZhNTY4IHI3OjAwMDAwMTAwIHI2Ojgw
NTc5MmU0IHI1OjlkNjFjMjJjIHI0OjlkNjFjMjJjDQpbICAgNjguMTk2OTk2XSBbPDgwMTU5ODc4
Pl0gKGNhbGxfdGltZXJfZm4pIGZyb20gWzw4MDE1OWEzOD5dIChleHBpcmVfdGltZXJzKzB4OWMv
MHhkNCkNClsgICA2OC4yMDQ4NzNdICByODpmZmZmYTU2OCByNzo4MGExM2EyMCByNjo5YzYwYmVj
YyByNTo5YzYwYmVjYyByNDo5ZDYxYzIyYw0KWyAgIDY4LjIxMTY4OF0gWzw4MDE1OTk5Yz5dIChl
eHBpcmVfdGltZXJzKSBmcm9tIFs8ODAxNTliMTA+XSAocnVuX3RpbWVyX3NvZnRpcnErMHhhMC8w
eDE5OCkNClsgICA2OC4yMTk5NjhdICByMTA6MDAwMDAwMDIgcjk6MDAwMDAxMDAgcjg6ODBhMTJk
MDAgcjc6ODBhMTNhMjAgcjY6ODBhMTNhMjAgcjU6OWM2MGJlY2MNClsgICA2OC4yMjc4MDRdICBy
NDo5YzYwYmVjYyByMzpmZmZmYTU2OQ0KWyAgIDY4LjIzMTQ5NF0gWzw4MDE1OWE3MD5dIChydW5f
dGltZXJfc29mdGlycSkgZnJvbSBbPDgwMTAyMmNjPl0gKF9fZG9fc29mdGlycSsweGRjLzB4MzE0
KQ0KWyAgIDY4LjIzOTYwMl0gIHI4OjAwMDAwMDAwIHI3OjljNjBhMDAwIHI2OjgwYTYwZDM0IHI1
OjAwMDAwMDAyIHI0OjAwMDAwMDAxDQpbICAgNjguMjQ2NDIxXSBbPDgwMTAyMWYwPl0gKF9fZG9f
c29mdGlycSkgZnJvbSBbPDgwMTFhMzNjPl0gKGlycV9leGl0KzB4YWMvMHhlNCkNClsgICA2OC4y
NTM3NTNdICByMTA6MDAwMDAwMDEgcjk6MDAwMDAwMDAgcjg6MDAwMDAwMDAgcjc6OWQ0MTM2MDAg
cjY6MDAwMDAwMDEgcjU6ODBhNDkzNzANClsgICA2OC4yNjE2NzFdICByNDowMDAwMDAwMA0KWyAg
IDY4LjI2NDI2MV0gWzw4MDExYTI5MD5dIChpcnFfZXhpdCkgZnJvbSBbPDgwMTRiZTM4Pl0gKF9f
aGFuZGxlX2RvbWFpbl9pcnErMHg2MC8weGI0KQ0KWyAgIDY4LjI3MjIxNl0gWzw4MDE0YmRkOD5d
IChfX2hhbmRsZV9kb21haW5faXJxKSBmcm9tIFs8ODAxMDIxZTQ+XSAoYXZpY19oYW5kbGVfaXJx
KzB4NjgvMHg3MCkNClsgICA2OC4yODA3NTldICByOTowMDAwMDAwMCByODowMGM1Mzg3ZCByNzow
MGM1Mzg3ZCByNjpmZmZmZmZmZiByNTo5YzYwYmZiMCByNDo5ZDQwMmU0MA0KWyAgIDY4LjI4ODUz
MF0gWzw4MDEwMjE3Yz5dIChhdmljX2hhbmRsZV9pcnEpIGZyb20gWzw4MDEwMWUzND5dIChfX2ly
cV91c3IrMHg1NC8weDgwKQ0KWyAgIDY4LjI5NjE5M10gRXhjZXB0aW9uIHN0YWNrKDB4OWM2MGJm
YjAgdG8gMHg5YzYwYmZmOCkNClsgICA2OC4zMDEzMzhdIGJmYTA6ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDAwMDAwMDA0IDAwMDAwMDFjIDAwMDI2MjdiIDAwMDAwMDAwDQpb
ICAgNjguMzA5NTI5XSBiZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCA2
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMSA3NmZjMmQyNA0KWyAgIDY4LjMxNzc4OF0gYmZlMDog
ZmZmZmZmZmMgNzZmYzJjNjAgNDVjNDBiZjAgNDVjNDBkMzAgODAwMDAwMTAgZmZmZmZmZmYNClsg
ICA2OC4zMjQ0OTBdICByNTo4MDAwMDAxMCByNDo0NWM0MGQzMA0KWyAgIDY4LjMyODA3Nl0gLS0t
WyBlbmQgdHJhY2UgYTc2ZDIwOWRlYzdhMjBiNCBdLS0tDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrZmlzaGJhb3o9aG90
bWFpbC5jb21AbGlzdHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIFpoZW5nIEJhbyA8ZmlzaGJh
b3pAaG90bWFpbC5jb20+DQpTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI2LCAyMDE5IDEwOjQ3
IEFNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3Vi
amVjdDogW0FTVDI1MDBdVGhlIGV0aDAgaW50ZXJmYWNlIGNhbiBub3Qgd29yaw0KDQpbICAgMTUu
NjM0NzE3XSA4MDIxcTogYWRkaW5nIFZMQU4gMCB0byBIVyBmaWx0ZXIgb24gZGV2aWNlIGV0aDAN
ClsgICAzMi4yNDk4NzddIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiBO
byBjaGFubmVsIGZvdW5kIHRvIGNvbmZpZ3VyZSENClsgICAzMy4yODk4MTNdIGZ0Z21hYzEwMCAx
ZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBXcm9uZyBOQ1NJIHN0YXRlIDB4MTAwIGluIHdvcmtxdWV1
ZQ0KDQpJIHRyaWVkIHRvIHVzZSB0aGUgbmV0d29yayBvbiBBU1QyNTAwLiBFdmVyeXRoaW5nIHNl
ZW1zIHRvIGJlIGdvb2QgYW5kIEkgY2FuIHVzZSBwaW5nIGFuZCB3ZWJ1aSwNCnVudGlsIEkgcmVi
dWlsdCBhbiBpbWFnZS4NClRoZSBwYXJ0IG9mIGRtZXNnIGlzIGFib3ZlLiBJIGNhbiBub3QgdHJh
Y2UgYmFjayB0byBhIHdvcmtpbmcgaW1hZ2UuIDooDQoNCklzIHRoZXJlIGFueSBzdWdnZXN0aW9u
Pw0KDQpaaGVuZw0K

--_000_MN2PR04MB66690AB5ACEC2097E729B50CCD860MN2PR04MB6669namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div><span>The whole dmesg is here.<br>
</span></div>
<div><span><br>
</span></div>
<div><span>root@s2600wf:~# dmesg</span></div>
<div><span></span></div>
<div>[ &nbsp; &nbsp;0.000000] Booting Linux on physical CPU 0x0<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Linux version 5.2.14-9f4f5ff (oe-user@oe-host=
) (gcc version 9.2.0 (GCC)) #1 Wed Sep 25 22:27:51 UTC 2019<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] CPU: ARMv6-compatible processor [410fb767] re=
vision 7 (ARMv7), cr=3D00c5387d<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT=
 nonaliasing instruction cache<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] OF: fdt: Machine model: S2600WF BMC<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Memory policy: Data cache writeback<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] cma: Reserved 16 MiB at 0x9d800000<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] On node 0 totalpages: 126976<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] &nbsp; Normal zone: 992 pages used for memmap=
<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] &nbsp; Normal zone: 0 pages reserved<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] &nbsp; Normal zone: 126976 pages, LIFO batch:=
31<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*327=
68<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] pcpu-alloc: [0] 0<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Built 1 zonelists, mobility grouping on. &nbs=
p;Total pages: 125984<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Kernel command line: console=3DttyS4,115200n8=
 root=3D/dev/ram rw<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Dentry cache hash table entries: 65536 (order=
: 6, 262144 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Inode-cache hash table entries: 32768 (order:=
 5, 131072 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] Memory: 475704K/507904K available (6144K kern=
el code, 385K rwdata, 1408K rodata, 1024K init, 145K bss, 15816K reserved, =
16384K<br>
</div>
<div>cma-reserved)<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] random: get_random_u32 called from cache_allo=
c_refill&#43;0x3d0/0x8fc with crng_init=3D0<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] ftrace: allocating 20681 entries in 41 pages<=
br>
</div>
<div>[ &nbsp; &nbsp;0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: =
16<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] i2c controller registered, irq 16<br>
</div>
<div>[ &nbsp; &nbsp;0.000000] clocksource: FTTMR010-TIMER2: mask: 0xfffffff=
f max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns<br>
</div>
<div>[ &nbsp; &nbsp;0.000019] sched_clock: 32 bits at 24MHz, resolution 40n=
s, wraps every 86767015915ns<br>
</div>
<div>[ &nbsp; &nbsp;0.000089] Switching to timer-based delay loop, resoluti=
on 40ns<br>
</div>
<div>[ &nbsp; &nbsp;0.001181] Calibrating delay loop (skipped), value calcu=
lated using timer frequency.. 49.50 BogoMIPS (lpj=3D247500)<br>
</div>
<div>[ &nbsp; &nbsp;0.001232] pid_max: default: 32768 minimum: 301<br>
</div>
<div>[ &nbsp; &nbsp;0.001958] Mount-cache hash table entries: 1024 (order: =
0, 4096 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.002001] Mountpoint-cache hash table entries: 1024 (or=
der: 0, 4096 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.003594] CPU: Testing write buffer coherency: ok<br>
</div>
<div>[ &nbsp; &nbsp;0.005347] Setting up static identity map for 0x80100000=
 - 0x80100038<br>
</div>
<div>[ &nbsp; &nbsp;0.009287] devtmpfs: initialized<br>
</div>
<div>[ &nbsp; &nbsp;0.022677] clocksource: jiffies: mask: 0xffffffff max_cy=
cles: 0xffffffff, max_idle_ns: 19112604462750000 ns<br>
</div>
<div>[ &nbsp; &nbsp;0.022731] futex hash table entries: 256 (order: -1, 307=
2 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.025888] pinctrl core: initialized pinctrl subsystem<b=
r>
</div>
<div>[ &nbsp; &nbsp;0.026958] NET: Registered protocol family 16<br>
</div>
<div>[ &nbsp; &nbsp;0.028806] DMA: preallocated 256 KiB pool for atomic coh=
erent allocations<br>
</div>
<div>[ &nbsp; &nbsp;0.030894] hw-breakpoint: found 6 breakpoint and 1 watch=
point registers.<br>
</div>
<div>[ &nbsp; &nbsp;0.030926] hw-breakpoint: maximum watchpoint size is 4 b=
ytes.<br>
</div>
<div>[ &nbsp; &nbsp;0.066575] videodev: Linux video capture interface: v2.0=
0<br>
</div>
<div>[ &nbsp; &nbsp;0.069639] clocksource: Switched to clocksource FTTMR010=
-TIMER2<br>
</div>
<div>[ &nbsp; &nbsp;0.118604] NET: Registered protocol family 2<br>
</div>
<div>[ &nbsp; &nbsp;0.119921] tcp_listen_portaddr_hash hash table entries: =
512 (order: 0, 4096 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.120013] TCP established hash table entries: 4096 (ord=
er: 2, 16384 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.120101] TCP bind hash table entries: 4096 (order: 2, =
16384 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.120171] TCP: Hash tables configured (established 4096=
 bind 4096)<br>
</div>
<div>[ &nbsp; &nbsp;0.120406] UDP hash table entries: 256 (order: 0, 4096 b=
ytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.120465] UDP-Lite hash table entries: 256 (order: 0, 4=
096 bytes)<br>
</div>
<div>[ &nbsp; &nbsp;0.120997] NET: Registered protocol family 1<br>
</div>
<div>[ &nbsp; &nbsp;0.121857] Unpacking initramfs...<br>
</div>
<div>[ &nbsp; &nbsp;1.804700] Freeing initrd memory: 1492K<br>
</div>
<div>[ &nbsp; &nbsp;1.807342] workingset: timestamp_bits=3D30 max_order=3D1=
7 bucket_order=3D0<br>
</div>
<div>[ &nbsp; &nbsp;1.807868] squashfs: version 4.0 (2009/01/31) Phillip Lo=
ugher<br>
</div>
<div>[ &nbsp; &nbsp;1.807903] jffs2: version 2.2. (SUMMARY) &nbsp;=C2=A9 20=
01-2006 Red Hat, Inc.<br>
</div>
<div>[ &nbsp; &nbsp;1.808611] NET: Registered protocol family 38<br>
</div>
<div>[ &nbsp; &nbsp;1.814731] Serial: 8250/16550 driver, 6 ports, IRQ shari=
ng enabled<br>
</div>
<div>[ &nbsp; &nbsp;1.818929] printk: console [ttyS4] disabled<br>
</div>
<div>[ &nbsp; &nbsp;1.819073] 1e784000.serial: ttyS4 at MMIO 0x1e784000 (ir=
q =3D 30, base_baud =3D 1500000) is a 16550A<br>
</div>
<div>[ &nbsp; &nbsp;2.151598] printk: console [ttyS4] enabled<br>
</div>
<div>[ &nbsp; &nbsp;2.157844] timeriomem_rng 1e6e2078.hwrng: 32bits from 0x=
(ptrval) @ 1us<br>
</div>
<div>[ &nbsp; &nbsp;2.165607] aspeed_gfx 1e6e6000.display: failed to initia=
lize reserved mem: -19<br>
</div>
<div>[ &nbsp; &nbsp;2.173454] random: fast init done<br>
</div>
<div>[ &nbsp; &nbsp;2.184205] random: crng init done<br>
</div>
<div>[ &nbsp; &nbsp;2.198714] loop: module loaded<br>
</div>
<div>[ &nbsp; &nbsp;2.246668] aspeed-smc 1e620000.spi: Using 50 MHz SPI fre=
quency<br>
</div>
<div>[ &nbsp; &nbsp;2.252832] aspeed-smc 1e620000.spi: w25q256 (32768 Kbyte=
s)<br>
</div>
<div>[ &nbsp; &nbsp;2.258437] aspeed-smc 1e620000.spi: CE0 window [ 0x20000=
000 - 0x22000000 ] 32MB<br>
</div>
<div>[ &nbsp; &nbsp;2.265949] aspeed-smc 1e620000.spi: CE1 window [ 0x22000=
000 - 0x2a000000 ] 128MB<br>
</div>
<div>[ &nbsp; &nbsp;2.273529] aspeed-smc 1e620000.spi: read control registe=
r: 203b0641<br>
</div>
<div>[ &nbsp; &nbsp;2.416462] 5 fixed-partitions partitions found on MTD de=
vice bmc<br>
</div>
<div>[ &nbsp; &nbsp;2.422691] Creating 5 MTD partitions on &quot;bmc&quot;:=
<br>
</div>
<div>[ &nbsp; &nbsp;2.427249] 0x000000000000-0x000000060000 : &quot;u-boot&=
quot;<br>
</div>
<div>[ &nbsp; &nbsp;2.434585] 0x000000060000-0x000000080000 : &quot;u-boot-=
env&quot;<br>
</div>
<div>[ &nbsp; &nbsp;2.442350] 0x000000080000-0x0000004c0000 : &quot;kernel&=
quot;<br>
</div>
<div>[ &nbsp; &nbsp;2.449750] 0x0000004c0000-0x000001c00000 : &quot;rofs&qu=
ot;<br>
</div>
<div>[ &nbsp; &nbsp;2.456893] 0x000001c00000-0x000002000000 : &quot;rwfs&qu=
ot;<br>
</div>
<div>[ &nbsp; &nbsp;2.465681] aspeed-smc 1e630000.spi: Using 50 MHz SPI fre=
quency<br>
</div>
<div>[ &nbsp; &nbsp;2.471803] aspeed-smc 1e630000.spi: unrecognized JEDEC i=
d bytes: 00 00 00 00 00 00<br>
</div>
<div>[ &nbsp; &nbsp;2.479490] aspeed-smc 1e630000.spi: Aspeed SMC probe fai=
led -2<br>
</div>
<div>[ &nbsp; &nbsp;2.490339] aspeed-smc: probe of 1e630000.spi failed with=
 error -2<br>
</div>
<div>[ &nbsp; &nbsp;2.498232] libphy: Fixed MDIO Bus: probed<br>
</div>
<div>[ &nbsp; &nbsp;2.503372] ftgmac100 1e660000.ethernet: Error applying s=
etting, reverse things back<br>
</div>
<div>[ &nbsp; &nbsp;2.511509] ftgmac100 1e660000.ethernet: Generated random=
 MAC address 52:47:da:92:a3:e6<br>
</div>
<div>[ &nbsp; &nbsp;2.519554] ftgmac100 1e660000.ethernet: Using NCSI inter=
face<br>
</div>
<div>[ &nbsp; &nbsp;2.526596] ftgmac100 1e660000.ethernet eth0: irq 19, map=
ped at e846443e<br>
</div>
<div>[ &nbsp; &nbsp;2.533818] ftgmac100 1e680000.ethernet: Error applying s=
etting, reverse things back<br>
</div>
<div>[ &nbsp; &nbsp;2.541937] ftgmac100 1e680000.ethernet: Generated random=
 MAC address 0a:4f:a7:ea:22:b3<br>
</div>
<div>[ &nbsp; &nbsp;2.556726] libphy: ftgmac100_mdio: probed<br>
</div>
<div>[ &nbsp; &nbsp;2.560953] ftgmac100 1e680000.ethernet (unnamed net_devi=
ce) (uninitialized): eth%d: no PHY found<br>
</div>
<div>[ &nbsp; &nbsp;2.569918] ftgmac100 1e680000.ethernet: MII Probe failed=
!<br>
</div>
<div>[ &nbsp; &nbsp;2.576288] udc-core: couldn't find an available UDC - ad=
ded [g_mass_storage] to list of pending drivers<br>
</div>
<div>[ &nbsp; &nbsp;2.586366] i2c /dev entries driver<br>
</div>
<div>[ &nbsp; &nbsp;2.591614] aspeed-i2c-bus 1e78a080.i2c-bus: i2c bus 1 re=
gistered (byte mode), irq 31<br>
</div>
<div>[ &nbsp; &nbsp;2.601232] aspeed-i2c-bus 1e78a0c0.i2c-bus: i2c bus 2 re=
gistered (byte mode), irq 32<br>
</div>
<div>[ &nbsp; &nbsp;2.610751] aspeed-i2c-bus 1e78a100.i2c-bus: i2c bus 3 re=
gistered (byte mode), irq 33<br>
</div>
<div>[ &nbsp; &nbsp;2.620294] aspeed-i2c-bus 1e78a140.i2c-bus: i2c bus 4 re=
gistered (byte mode), irq 34<br>
</div>
<div>[ &nbsp; &nbsp;2.629854] aspeed-i2c-bus 1e78a180.i2c-bus: i2c bus 5 re=
gistered (byte mode), irq 35<br>
</div>
<div>[ &nbsp; &nbsp;2.639308] aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c bus 6 re=
gistered (byte mode), irq 36<br>
</div>
<div>[ &nbsp; &nbsp;2.648881] aspeed-i2c-bus 1e78a300.i2c-bus: i2c bus 7 re=
gistered (byte mode), irq 37<br>
</div>
<div>[ &nbsp; &nbsp;2.658501] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 13 r=
egistered (byte mode), irq 38<br>
</div>
<div>[ &nbsp; &nbsp;2.667270] Driver for 1-wire Dallas network protocol.<br=
>
</div>
<div>[ &nbsp; &nbsp;2.680434] NET: Registered protocol family 10<br>
</div>
<div>[ &nbsp; &nbsp;2.687212] Segment Routing with IPv6<br>
</div>
<div>[ &nbsp; &nbsp;2.691696] sit: IPv6, IPv4 and MPLS over IPv4 tunneling =
driver<br>
</div>
<div>[ &nbsp; &nbsp;2.698999] NET: Registered protocol family 17<br>
</div>
<div>[ &nbsp; &nbsp;2.703622] 8021q: 802.1Q VLAN Support v1.8<br>
</div>
<div>[ &nbsp; &nbsp;2.715457] printk: console [netcon0] enabled<br>
</div>
<div>[ &nbsp; &nbsp;2.719940] netconsole: network logging started<br>
</div>
<div>[ &nbsp; &nbsp;2.724770] hctosys: unable to open rtc device (rtc0)<br>
</div>
<div>[ &nbsp; &nbsp;2.735965] Freeing unused kernel memory: 1024K<br>
</div>
<div>[ &nbsp; &nbsp;2.742549] Checked W&#43;X mappings: passed, no W&#43;X =
pages found<br>
</div>
<div>[ &nbsp; &nbsp;2.748235] Run /init as init process<br>
</div>
<div>[ &nbsp; &nbsp;3.700228] jffs2: notice: (77) jffs2_build_xattr_subsyst=
em: complete building xattr subsystem, 24 of xdatum (15 unchecked, 1 orphan=
) and 5<br>
</div>
<div>1 of xref (1 dead, 0 orphan) found.<br>
</div>
<div>[ &nbsp; &nbsp;3.756644] overlayfs: upper fs does not support tmpfile.=
<br>
</div>
<div>[ &nbsp; &nbsp;6.086971] systemd[1]: systemd 242-108-gf875dce&#43; run=
ning in system mode. (&#43;PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK &#43;S=
YSVINIT -UTMP -LIBC<br>
</div>
<div>RYPTSETUP -GCRYPT -GNUTLS -ACL &#43;XZ -LZ4 -SECCOMP &#43;BLKID -ELFUT=
ILS -KMOD -IDN2 -IDN -PCRE2 default-hierarchy=3Dhybrid)<br>
</div>
<div>[ &nbsp; &nbsp;6.111635] systemd[1]: Detected architecture arm.<br>
</div>
<div>[ &nbsp; &nbsp;6.226586] systemd[1]: Set hostname to &lt;s2600wf&gt;.<=
br>
</div>
<div>[ &nbsp; &nbsp;7.013255] systemd[1]: File /lib/systemd/system/systemd-=
journald.service:14 configures an IP firewall (IPAddressDeny=3Dany), but th=
e local s<br>
</div>
<div>ystem does not support BPF/cgroup based firewalling.<br>
</div>
<div>[ &nbsp; &nbsp;7.030496] systemd[1]: Proceeding WITHOUT firewalling in=
 effect! (This warning is only shown for the first loaded unit using IP fir=
ewallin<br>
</div>
<div>g.)<br>
</div>
<div>[ &nbsp; &nbsp;7.427194] systemd[1]: /lib/systemd/system/dbus.socket:5=
: ListenStream=3D references a path below legacy directory /var/run/, updat=
ing /var/<br>
</div>
<div>run/dbus/system_bus_socket =E2=86?/run/dbus/system_bus_socket; please =
update the unit file accordingly.<br>
</div>
<div>[ &nbsp; &nbsp;8.767870] systemd[1]: /lib/systemd/system/phosphor-ipmi=
-net@.socket:3: Invalid interface name, ignoring: sys-subsystem-net-devices=
-%i.dev<br>
</div>
<div>ice<br>
</div>
<div>[ &nbsp; &nbsp;8.914086] systemd[1]: Listening on Journal Socket (/dev=
/log).<br>
</div>
<div>[ &nbsp; &nbsp;8.954329] systemd[1]: Created slice system-phosphor\x2d=
reset\x2dsensor\x2dstates.slice.<br>
</div>
<div>[ &nbsp; &nbsp;9.002092] systemd[1]: Created slice system-org.openbmc.=
control.Bmc.slice.<br>
</div>
<div>[ &nbsp; 10.968154] systemd-journald[102]: Received request to flush r=
untime journal from PID 1<br>
</div>
<div>[ &nbsp; 15.634717] 8021q: adding VLAN 0 to HW filter on device eth0<b=
r>
</div>
<div>[ &nbsp; 32.249877] ftgmac100 1e660000.ethernet eth0: NCSI: No channel=
 found to configure!<br>
</div>
<div>[ &nbsp; 33.289813] ftgmac100 1e660000.ethernet eth0: Wrong NCSI state=
 0x100 in workqueue<br>
</div>
<div>[ &nbsp; 68.089685] ------------[ cut here ]------------<br>
</div>
<div>[ &nbsp; 68.094385] WARNING: CPU: 0 PID: 273 at net/sched/sch_generic.=
c:442 dev_watchdog&#43;0x268/0x288<br>
</div>
<div>[ &nbsp; 68.102945] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue =
0 timed out<br>
</div>
<div>[ &nbsp; 68.109841] CPU: 0 PID: 273 Comm: rngd Not tainted 5.2.14-9f4f=
5ff #1<br>
</div>
<div>[ &nbsp; 68.116209] Hardware name: Generic DT based system<br>
</div>
<div>[ &nbsp; 68.121077] Backtrace:<br>
</div>
<div>[ &nbsp; 68.123596] [&lt;80107d2c&gt;] (dump_backtrace) from [&lt;8010=
7f60&gt;] (show_stack&#43;0x20/0x24)<br>
</div>
<div>[ &nbsp; 68.131272] &nbsp;r7:80a12d00 r6:00000000 r5:9c60be04 r4:00000=
009<br>
</div>
<div>[ &nbsp; 68.136974] [&lt;80107f40&gt;] (show_stack) from [&lt;8066ced0=
&gt;] (dump_stack&#43;0x20/0x28)<br>
</div>
<div>[ &nbsp; 68.144324] [&lt;8066ceb0&gt;] (dump_stack) from [&lt;80116308=
&gt;] (__warn.part.0&#43;0xb4/0xdc)<br>
</div>
<div>[ &nbsp; 68.151922] [&lt;80116254&gt;] (__warn.part.0) from [&lt;80116=
3a0&gt;] (warn_slowpath_fmt&#43;0x70/0x98)<br>
</div>
<div>[ &nbsp; 68.160109] &nbsp;r6:8057954c r5:000001ba r4:8083efb8<br>
</div>
<div>[ &nbsp; 68.164779] [&lt;80116334&gt;] (warn_slowpath_fmt) from [&lt;8=
057954c&gt;] (dev_watchdog&#43;0x268/0x288)<br>
</div>
<div>[ &nbsp; 68.173052] &nbsp;r3:9d61c000 r2:8083ef7c<br>
</div>
<div>[ &nbsp; 68.176647] &nbsp;r6:00000000 r5:9c0e9100 r4:9d61c22c<br>
</div>
<div>[ &nbsp; 68.181383] [&lt;805792e4&gt;] (dev_watchdog) from [&lt;801598=
b8&gt;] (call_timer_fn&#43;0x40/0x124)<br>
</div>
<div>[ &nbsp; 68.189144] &nbsp;r9:00000000 r8:ffffa568 r7:00000100 r6:80579=
2e4 r5:9d61c22c r4:9d61c22c<br>
</div>
<div>[ &nbsp; 68.196996] [&lt;80159878&gt;] (call_timer_fn) from [&lt;80159=
a38&gt;] (expire_timers&#43;0x9c/0xd4)<br>
</div>
<div>[ &nbsp; 68.204873] &nbsp;r8:ffffa568 r7:80a13a20 r6:9c60becc r5:9c60b=
ecc r4:9d61c22c<br>
</div>
<div>[ &nbsp; 68.211688] [&lt;8015999c&gt;] (expire_timers) from [&lt;80159=
b10&gt;] (run_timer_softirq&#43;0xa0/0x198)<br>
</div>
<div>[ &nbsp; 68.219968] &nbsp;r10:00000002 r9:00000100 r8:80a12d00 r7:80a1=
3a20 r6:80a13a20 r5:9c60becc<br>
</div>
<div>[ &nbsp; 68.227804] &nbsp;r4:9c60becc r3:ffffa569<br>
</div>
<div>[ &nbsp; 68.231494] [&lt;80159a70&gt;] (run_timer_softirq) from [&lt;8=
01022cc&gt;] (__do_softirq&#43;0xdc/0x314)<br>
</div>
<div>[ &nbsp; 68.239602] &nbsp;r8:00000000 r7:9c60a000 r6:80a60d34 r5:00000=
002 r4:00000001<br>
</div>
<div>[ &nbsp; 68.246421] [&lt;801021f0&gt;] (__do_softirq) from [&lt;8011a3=
3c&gt;] (irq_exit&#43;0xac/0xe4)<br>
</div>
<div>[ &nbsp; 68.253753] &nbsp;r10:00000001 r9:00000000 r8:00000000 r7:9d41=
3600 r6:00000001 r5:80a49370<br>
</div>
<div>[ &nbsp; 68.261671] &nbsp;r4:00000000<br>
</div>
<div>[ &nbsp; 68.264261] [&lt;8011a290&gt;] (irq_exit) from [&lt;8014be38&g=
t;] (__handle_domain_irq&#43;0x60/0xb4)<br>
</div>
<div>[ &nbsp; 68.272216] [&lt;8014bdd8&gt;] (__handle_domain_irq) from [&lt=
;801021e4&gt;] (avic_handle_irq&#43;0x68/0x70)<br>
</div>
<div>[ &nbsp; 68.280759] &nbsp;r9:00000000 r8:00c5387d r7:00c5387d r6:fffff=
fff r5:9c60bfb0 r4:9d402e40<br>
</div>
<div>[ &nbsp; 68.288530] [&lt;8010217c&gt;] (avic_handle_irq) from [&lt;801=
01e34&gt;] (__irq_usr&#43;0x54/0x80)<br>
</div>
<div>[ &nbsp; 68.296193] Exception stack(0x9c60bfb0 to 0x9c60bff8)<br>
</div>
<div>[ &nbsp; 68.301338] bfa0: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 00000004 0000001c 0002627b 00000000<br>
</div>
<div>[ &nbsp; 68.309529] bfc0: 00000000 00000000 00000000 00000000 60000000=
 00000000 00000001 76fc2d24<br>
</div>
<div>[ &nbsp; 68.317788] bfe0: fffffffc 76fc2c60 45c40bf0 45c40d30 80000010=
 ffffffff<br>
</div>
<div>[ &nbsp; 68.324490] &nbsp;r5:80000010 r4:45c40d30<br>
</div>
<span>[ &nbsp; 68.328076] ---[ end trace a76d209dec7a20b4 ]---</span>
<div>
<div id=3D"appendonsend" style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc=
-bounces&#43;fishbaoz=3Dhotmail.com@lists.ozlabs.org&gt; on behalf of Zheng=
 Bao &lt;fishbaoz@hotmail.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 10:47 AM<br>
<b>To:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> [AST2500]The eth0 interface can not work</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span>[ &nbsp; 15.634717] 8021q: adding VLAN 0 to HW filter on device eth0<=
br>
</span>
<div>[ &nbsp; 32.249877] ftgmac100 1e660000.ethernet eth0: NCSI: No channel=
 found to configure!<br>
</div>
<span>[ &nbsp; 33.289813] ftgmac100 1e660000.ethernet eth0: Wrong NCSI stat=
e 0x100 in workqueue</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
I tried to use the network on AST2500. Everything seems to be good and I ca=
n use ping and webui,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
until I rebuilt an image.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
The part of dmesg is above. I can not trace back to a working image. <span =
id=3D"x_&#55357;&#56897;">
:(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span id=3D"x_&#55357;&#56897;"><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span id=3D"x_&#55357;&#56897;">Is there any suggestion?</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span id=3D"x_&#55357;&#56897;"><br>
</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<span id=3D"x_&#55357;&#56897;">Zheng</span><br>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR04MB66690AB5ACEC2097E729B50CCD860MN2PR04MB6669namp_--
