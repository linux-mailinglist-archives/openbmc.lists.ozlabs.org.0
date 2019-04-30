Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F25EFFCE
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 20:42:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tr3d4ZlPzDqSn
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 04:42:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0023ab73f8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iCyaHqwC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DOE+lGGG"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tr2p2jHgzDqPG
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 04:41:21 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x3UIcgAb030563;
 Tue, 30 Apr 2019 11:41:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EvBiSTdLhkaXQ5WM0yucnmmMPvJL1Kb03T480HFw71I=;
 b=iCyaHqwCT37R2yCb7d07wShyWoziuRLriYuKbhCyDZydNvimBxd/fC64nmKw6ewZ1k0t
 QS5ue4Mc4QT1mdRUsST6/X6wUS5qjtBRSHCt48po+lAOQA0TM8HRUYbXwI7Y9JQ8ITdb
 ZduZIHPjlaLnDg/4NRX9sBbLGyBd+Y0u6ck= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2s6tqfg8vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 11:41:15 -0700
Received: from prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Apr 2019 11:41:14 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Apr 2019 11:41:14 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Apr 2019 11:41:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvBiSTdLhkaXQ5WM0yucnmmMPvJL1Kb03T480HFw71I=;
 b=DOE+lGGGn+NKDIEM2rxF+MJCymbwOp+xE1qVLxlOc956lUBzCw7qaj4h9M/gCub3fDsUF2QI6u83bOpM2QK6cifkWzy+sCfbpv5D1I5JfooIylA09Howre32onaD3wgre5i1ZHpNLISuzl31gugjtuOwoBBFIgBOZPZ28RYF9OI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1943.namprd15.prod.outlook.com (10.172.180.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 18:41:13 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 18:41:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Venture <venture@google.com>, James Feist
 <james.feist@linux.intel.com>
Subject: Re: Phosphor pid control
Thread-Topic: Phosphor pid control
Thread-Index: AQHU/4KY0BYzgrKEY0CYtw90dRuDdKZVBrOA//+Nf4A=
Date: Tue, 30 Apr 2019 18:41:13 +0000
Message-ID: <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
In-Reply-To: <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::c9a8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de34a8d3-840a-46c7-4d17-08d6cd9b6bf8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1943; 
x-ms-traffictypediagnostic: CY4PR15MB1943:
x-microsoft-antispam-prvs: <CY4PR15MB194374C52B81C205E2212836DD3A0@CY4PR15MB1943.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(376002)(396003)(189003)(199004)(46003)(4326008)(110136005)(81156014)(81166006)(66946007)(71200400001)(186003)(71190400001)(68736007)(8676002)(478600001)(76116006)(66476007)(8936002)(91956017)(64756008)(6116002)(316002)(66556008)(73956011)(6246003)(99286004)(83716004)(66446008)(36756003)(3480700005)(76176011)(82746002)(6486002)(6436002)(86362001)(102836004)(229853002)(446003)(97736004)(305945005)(25786009)(2906002)(14444005)(53546011)(2616005)(6506007)(476003)(7736002)(6512007)(14454004)(256004)(5660300002)(53936002)(11346002)(7116003)(33656002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1943;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SGZivsi7vgOU/xWA2XILKsht7beI6fhan+C7zH5kggOrHGefmSeqoPjmq10z+zhKXF/aYRGEfokD91UVjBrQJvYlC0vwQXFgYu/l1uusUIWO+np6WiPe4Q7xWqU8LPGcEBl+FZ8v+DCrbeofW3ncfhmokmMcl/tmg/Gsa52Bs56JJZu73BuOKD0Om4yHTtfBSmXF664Ggf3bzEYfhER7qJLMl0YsyjTx7EZmdySUCj4KO46bm3BnJ0b7BmsfxPlzPobJA24BBSupuc594Ky0GJJkUfNaJyZbTs1UicCjrUxWABnEynWsGmG6b+QqyVGJh6BjoR9fE79mGp1RqvcCQ/ryAZq7qTj8ggwKRot0/uTWGQz03XQtYkP6i2+k1n3SDEsjjkwsl56rM4BoPxNZegfrcHpJQAGg0sE/BYkp3bU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5549AFAFAC877C4084CA9F1F0C355824@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: de34a8d3-840a-46c7-4d17-08d6cd9b6bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 18:41:13.3502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1943
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

SSBjaGVja2VkIGluIGNvZGUgYW5kIGxvb2tzIGxpa2UgL3Vzci9zaGFyZS9zd2FtcGQvY29uZmln
Lmpzb24gZmlsZSBpcyBtaXNzaW5nLiBXaGVyZSBkbyB3ZSBnZXQgdGhpcyBmaWxlIGZyb20gb3Ig
d2hlcmUgaXMgZXhhbXBsZSBjb25maWcuanNvbiBmaWxlPw0KDQrvu79PbiA0LzMwLzE5LCAxMToz
MSBBTSwgIlBhdHJpY2sgVmVudHVyZSIgPHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCiAg
ICArSmFtZXMgRmVpc3QgdG8gcHJvdmlkZSBhc3Npc3RhbmNlLg0KICAgIA0KICAgIE9uIFR1ZSwg
QXByIDMwLCAyMDE5IGF0IDExOjMwIEFNIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29t
PiB3cm90ZToNCiAgICA+DQogICAgPiBJIGhhdmUgZW5hYmxlZCBwaG9zcGhvci1waWQtY29udHJv
bCBpbiBteSBpbWFnZSBhbmQgSSBzZWUgZm9sbG93aW5nIGxvZw0KICAgID4NCiAgICA+DQogICAg
Pg0KICAgID4gQXByIDEyIDIzOjIyOjQzIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBTdGFydGVkIFBo
b3NwaG9yLVBpZC1Db250cm9sIE1hcmdpbi1iYXNlZCBGYW4gQ29udHJvbCBEYWVtb24uDQogICAg
Pg0KICAgID4gQXByIDEyIDIzOjIyOjQ2IHRpb2dhcGFzcyBzd2FtcGRbMTA3Ml06IHRlcm1pbmF0
ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3N0ZDo6cnVudGltZV9lcnJv
cicNCiAgICA+DQogICAgPiBBcHIgMTIgMjM6MjI6NDYgdGlvZ2FwYXNzIHN3YW1wZFsxMDcyXTog
ICB3aGF0KCk6ICBPYmplY3RNYXBwZXIgQ2FsbCBGYWlsdXJlDQogICAgPg0KICAgID4gQXByIDEy
IDIzOjIzOjA0IHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBbWzA7MTszOW1bWzA7MTszMW1bWzA7MTsz
OW1waG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNlOiBNYWluIHByb2Nlc3MgZXhpdGVkLCBjb2Rl
PWtpbGxlZCwgc3RhdHVzPTYvQUJSVFtbMG0NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6MjM6MDQg
dGlvZ2FwYXNzIHN5c3RlbWRbMV06IFtbMDsxOzM5bVtbMDsxOzMxbVtbMDsxOzM5bXBob3NwaG9y
LXBpZC1jb250cm9sLnNlcnZpY2U6IEZhaWxlZCB3aXRoIHJlc3VsdCAnc2lnbmFsJy5bWzBtDQog
ICAgPg0KICAgID4gQXByIDEyIDIzOjIzOjEzIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBwaG9zcGhv
ci1waWQtY29udHJvbC5zZXJ2aWNlOiBTZXJ2aWNlIFJlc3RhcnRTZWM9NXMgZXhwaXJlZCwgc2No
ZWR1bGluZyByZXN0YXJ0Lg0KICAgID4NCiAgICA+IEFwciAxMiAyMzoyMzoxMyB0aW9nYXBhc3Mg
c3lzdGVtZFsxXTogcGhvc3Bob3ItcGlkLWNvbnRyb2wuc2VydmljZTogU2NoZWR1bGVkIHJlc3Rh
cnQgam9iLCByZXN0YXJ0IGNvdW50ZXIgaXMgYXQgMS4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6
MjM6MTYgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFN0b3BwZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wg
TWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERhZW1vbi4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6
MjM6MTYgdGlvZ2FwYXNzIHN5c3RlbWRbMV06IFN0YXJ0ZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wg
TWFyZ2luLWJhc2VkIEZhbiBDb250cm9sIERhZW1vbi4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6
MjM6MTcgdGlvZ2FwYXNzIHN3YW1wZFsxMTQ1XTogTm8gZmFuIHpvbmVzLCBhcHBsaWNhdGlvbiBw
YXVzaW5nIHVudGlsIHJlYm9vdA0KICAgID4NCiAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9nYXBh
c3Mgc3dhbXBkWzExNDVdOiBOZXcgY29uZmlndXJhdGlvbiBkZXRlY3RlZCwgcmVzdGFydGluZw0K
ICAgID4NCiAgICA+IEFwciAxMiAyMzoyMzoyNyB0aW9nYXBhc3Mgc3dhbXBkWzExNDVdOiAuDQog
ICAgPg0KICAgID4gQXByIDEyIDIzOjIzOjI3IHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBwaG9zcGhv
ci1waWQtY29udHJvbC5zZXJ2aWNlOiBTdWNjZWVkZWQuDQogICAgPg0KICAgID4gQXByIDEyIDIz
OjIzOjMyIHRpb2dhcGFzcyBzeXN0ZW1kWzFdOiBwaG9zcGhvci1waWQtY29udHJvbC5zZXJ2aWNl
OiBTZXJ2aWNlIFJlc3RhcnRTZWM9NXMgZXhwaXJlZCwgc2NoZWR1bGluZyByZXN0YXJ0Lg0KICAg
ID4NCiAgICA+IEFwciAxMiAyMzoyMzozMiB0aW9nYXBhc3Mgc3lzdGVtZFsxXTogcGhvc3Bob3It
cGlkLWNvbnRyb2wuc2VydmljZTogU2NoZWR1bGVkIHJlc3RhcnQgam9iLCByZXN0YXJ0IGNvdW50
ZXIgaXMgYXQgMi4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6MjM6MzMgdGlvZ2FwYXNzIHN5c3Rl
bWRbMV06IFN0b3BwZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250
cm9sIERhZW1vbi4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6MjM6MzMgdGlvZ2FwYXNzIHN5c3Rl
bWRbMV06IFN0YXJ0ZWQgUGhvc3Bob3ItUGlkLUNvbnRyb2wgTWFyZ2luLWJhc2VkIEZhbiBDb250
cm9sIERhZW1vbi4NCiAgICA+DQogICAgPiBBcHIgMTIgMjM6MjM6MzQgdGlvZ2FwYXNzIHN3YW1w
ZFsxMTgzXTogTm8gZmFuIHpvbmVzLCBhcHBsaWNhdGlvbiBwYXVzaW5nIHVudGlsIHJlYm9vdA0K
ICAgID4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBJIGhhdmUgY29uZmlndXJh
dGlvbiBkZWZpbmVkIHRocm91Z2ggZW50aXR5IG1hbmFnZXIuIFdoYXQgaXMgdGhlIGJlc3Qgd2F5
IHRvIGRlYnVnIHRoaXMgYW5kIG1vZGlmeSBjb25maWd1cmF0aW9ucy4NCiAgICA+DQogICAgPg0K
ICAgID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+DQogICAgPiAtVmlqYXkNCiAgICANCg0K
