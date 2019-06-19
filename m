Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16E4B181
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 07:42:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TDNf0vKqzDqlW
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 15:42:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.72.105; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="bTr7cQ7+"; dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720105.outbound.protection.outlook.com [40.107.72.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TDMy4ZNPzDqjM
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 15:41:32 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=AA1fM4toLlXKe6BTySXYa+oZZTThbbZ4tvXH4T0SlH+n7kyZ9uZD/2nHpV04HbqjLakJMp8MUSbPkOoFq6UHU0ZPece3cqLAiDhIiLfyTICBW5wptYQwS26hveUzY8wac6ixpyIhroZ7J3qF6T/egO7i7k5vFxzK3hlb1uqFsrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkdEOpRtXiQ28FSx72AnYYkiE+w9/ngHwebIp13el30=;
 b=nhBGMQoWqyhgP9iCehegJ8HMrUB2jYRFOXuEFfQyyz1+FlbrmIaXqTk2ARH0rO5IXyPOS5B10qnUzgwp767YkbHDGPitMmW6LE5wJUPdiJUDx0f7f2gtFd83MYZRLKD9LnLRWcVDZDCxbvEJbJZCXveACqgbeq57MFOV5XaoBoo=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkdEOpRtXiQ28FSx72AnYYkiE+w9/ngHwebIp13el30=;
 b=bTr7cQ7+uKPFiokJH5TZ1wgNZQRU+K9Ij2QItgTJEVNQGwgfHwng/v3cq0py4MR41NO6tb9hz8YEv4hXH6Y3RW4Tpgiz4G4KOkyCBBW3F1T2rLZhsMcw0pD+vHu8rkmfBD0jv6Bzmx/GGyJfRi1gdvbml6S0w9gdgOoRIyacfY0=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB0994.namprd21.prod.outlook.com
 (2603:10b6:207:36::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.2; Wed, 19 Jun
 2019 05:41:27 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.2008.007; Wed, 19 Jun 2019
 05:41:27 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Neeraj Ladkani <neladk@microsoft.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Platform telemetry and health monitoring
Thread-Topic: Platform telemetry and health monitoring
Thread-Index: AdUPSgV2V2O36/zKToW4XlARusyEFAAbGfeAAA/WT4AAnwBPgAImtRSAACQhJ4ABJWtDgAAUBnMAABk4WFABPtM0gAAIuucAABZ06AA=
Date: Wed, 19 Jun 2019 05:41:26 +0000
Message-ID: <BL0PR2101MB093231A9C83BC1477B5DD323C8E50@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
 <CAGMNF6W+W1VPnqa3J1Y_wqc=BcnkBCi4-h9rG4tjUUrCk3zR8g@mail.gmail.com>
 <CALXe31mBvxQTaUkuFJsMozBYLiVTur18pMsTUfHY2t02Xp34wg@mail.gmail.com>
 <CAGMNF6XSD2U-qAe5ibotCkYW-U21vV+tL5-rJwvjPUvWwHA1hw@mail.gmail.com>
 <20190605124935.ywwwoj26fk46e6qu@thinkpad.dyn.fuzziesquirrel.com>
 <ab42831d-e2a9-c13d-9061-fd39b807ace2@yadro.com>
 <CAGMNF6UpQ9WpHhZa8_NxRvraYG2mz=YgVjf+jYySigLXBzQTog@mail.gmail.com>
 <BL0PR2101MB0932ECD784D96485087196F4C8EC0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <cf878393-615b-c87a-7e15-de9d1fce2375@linux.vnet.ibm.com>
 <BL0PR2101MB0932DE1118B5BD98447A0EC2C8EA0@BL0PR2101MB0932.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB0932DE1118B5BD98447A0EC2C8EA0@BL0PR2101MB0932.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-18T20:59:12.8600754Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=acf560de-9a6c-44f9-b192-52c1f7fd151d;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34c5421e-a01e-4c3f-5fe1-08d6f478c5ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB0994; 
x-ms-traffictypediagnostic: BL0PR2101MB0994:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BL0PR2101MB099457F750CEFC116286B0D0C8E50@BL0PR2101MB0994.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(136003)(346002)(376002)(199004)(189003)(14454004)(53546011)(229853002)(5660300002)(76116006)(6506007)(316002)(25786009)(76176011)(7696005)(52396003)(478600001)(71200400001)(186003)(110136005)(10090500001)(256004)(8936002)(7736002)(66946007)(73956011)(71190400001)(966005)(66446008)(305945005)(14444005)(6436002)(66556008)(66476007)(64756008)(22452003)(1511001)(2906002)(8990500004)(9686003)(81156014)(81166006)(74316002)(33656002)(8676002)(446003)(476003)(11346002)(3846002)(66066001)(52536014)(68736007)(10290500003)(26005)(99286004)(53936002)(6246003)(6306002)(55016002)(6116002)(102836004)(86362001)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0994;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AYgZOGrJBGDv58TMEGVyY5Rcup0ch95Tc4NdATd2++uj0W0NUrOI5I5fwaI8C7TFKjpRJmVxlo6NqCEVxl0U8QTmBbYI9OQjhR4boRc1p9XQqM9ft004TbXde624T05KMpvGLLKLlAjSRbqxkr129zGf3c0qIh2hBWfoxY93/MeJgir4L8v6S1KqCDxBPPy6MS6JEfltX7URG1tUJj//cJbGNEUzIpRkp6qX+wKNRBt1SoXUNmutWaWkov1a6z99n6k54oXn7EPnnDxIz/WmAvnCRhBCdP43UR2Cbm8N9KdWXwvUOUa8rVWStNJnvy7wkkXEVyNSDMIoz1Btg7UHD3Vx+vgAB4r+huVm4YW4tbJsZlE+xbqh+CHcZaZeCLLYwvjZluLMjBzbJAzkl9H4LtN+aQ2ficskLAty2piJzg0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c5421e-a01e-4c3f-5fe1-08d6f478c5ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 05:41:26.8543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0994
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

SW4gbGFzdCBtZWV0aW5nLCB3ZSBkaXNjdXNzZWQgdGhhdCB0ZWxlbWV0cnkgZGF0YSBjYW4gYmUg
Y29sbGVjdGVkIHVzaW5nIOKAnHRvb2xz4oCdIGFuZCBleHBvcnRlZCB1c2luZyBiaW5hcnkg4oCc
YmxvYnPigJ0sIA0KDQpTaG91bGQgd2UgZGVmaW5lIGEgc3RhbmRhcmQgZGF0YSBmb3JtYXQgc28g
dGhhdCBpbmZvcm1hdGlvbiBjYW4gYmUgcGFyc2VkIHRocm91Z2ggc3RhbmRhcmQgbWVjaGFuaXNt
IGFuZCBoZWxwIHRha2luZyBzcGVjaWZpYyBhY3Rpb25zLiAgDQoNCkhvc3QgQ1BVDQpNZW1vcnkN
Ck5ldHdvcmsgQWRhcHRlciANCkdQVXMvSVBVcw0KQk1Dcw0KDQoNClRoYW5rcw0KTmVlcmFqDQoN
CkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytuZWxhZGs9bWljcm9zb2Z0LmNvbUBsaXN0
cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgTmVlcmFqIExhZGthbmkNClNlbnQ6IFR1ZXNkYXks
IEp1bmUgMTgsIDIwMTkgMTo1OSBQTQ0KVG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJFOiBQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0
aCBtb25pdG9yaW5nDQoNCjEuIEhvdyBkbyBkZWZpbmUgd2hhdCBkYXRhIHRvIGJlIGNvbGxlY3Rl
ZCBhbmQgaG93ID8gwqBXZSBuZWVkIGEgd2F5IHRvIGxldCBCTUMga25vdyANCmEuIFdoYXQgZGF0
YSB0byByZWFkID8gDQpiLiBXaGVuIHRvIHJlYWQgPw0KYy4gSG93IHRvIHJlYWQgPyANCg0KMi4g
RG9lcyByZWRmaXNoIHN1cHBvcnQgwqBwdWxsaW5nIHRlbGVtZXRyeSBmcm9tIHN5c3RlbT8gDQoN
Ck5lZXJhag0KDQoNCk9uIDYvMTIvMTkgMTE6NTggQU0sIE5lZXJhaiBMYWRrYW5pIHdyb3RlOg0K
VGhhbmtzIEt1biBmb3Igc3VtbWFyaXppbmcgbm90ZXMuIA0KwqANCkZvciBkZXRhaWxlZCBub3Rl
czogaHR0cHM6Ly9uYW0wNi5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZvcGVuYm1jJTJGd2lraSUyRlBsYXRm
b3JtLXRlbGVtZXRyeS1hbmQtaGVhbHRoLW1vbml0b3JpbmctV29yay1Hcm91cCZkYXRhPTAyJTdD
MDElN0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDMjI1ZDQ3YzIzNWQzNDA5MTk5NzkwOGQ2ZjQy
ZmU5NmQlN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0MwJTdDNjM2OTY0
ODgzOTU1OTQzMjgzJnNkYXRhPVFUUFVwNWxYZmdWcjB4ZGtVS3p4RGlpRGc1Z2ppa2tMTDlLZDBJ
TSUyQm91YyUzRCZyZXNlcnZlZD0wDQrCoA0KTmVlcmFqDQrCoA0KRnJvbTogb3BlbmJtYyBtYWls
dG86b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1taWNyb3NvZnQuY29tQGxpc3RzLm96bGFicy5vcmcg
T24gQmVoYWxmIE9mIEt1biBZaQ0KU2VudDogVHVlc2RheSwgSnVuZSAxMSwgMjAxOSAxMToyNCBB
TQ0KVG86IEFsZXhhbmRlciBBbWVsa2luIG1haWx0bzphLmFtZWxraW5AeWFkcm8uY29tDQpDYzog
T3BlbkJNQyBNYWlsbGlzdCBtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0
OiBSZTogUGxhdGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZw0KwqANCk5lZXJh
aiBtZW50aW9uZWQgaGUgd2lsbCBzZW5kIG91dCB0aGUgbWVldGluZyBtaW51dGVzLiBIZSB3aWxs
IGFsc28gbG9vayBpbnRvIHNldHRpbmcgdXAgYSB3aWtpIHBhZ2UgaG9sZGluZyB0aGUgY29udGVu
dHMgYXMgd2VsbCBhcyBtaW51dGVzLg0KwqANCkEgZmV3IHF1aWNrIG5vdGVzIGZyb20gdG9wIG9m
IG15IGhlYWQgZnJvbSB0aGUga2ljay1vZmYgbWVldGluZzoNCi0gZGlkIGEgcm91bmQgdGFibGUs
IGFsbCB0aGUgb3JncyBoYXZlIHNpbWlsYXIgcmVxdWlyZW1lbnRzDQotIG5lZWQgdG8gbG9vayBp
bnRvIGhvdyBleGlzdGluZyBpbmZyYSBmaXQgaW50byB0aGUgbmVlZHMgYW5kIHdoYXQgZmFsbHMg
c2hvcnQNCi0gd2lsbCBoYXZlIHdvcmtzdHJlYW1zIGZvcjoNCsKgIMKgIC0gd2hhdCB0byBjb2xs
ZWN0DQrCoCDCoCAtIGhvdyB0byBjb2xsZWN0DQrCoCDCoCAtIGhvdyB0byBzdG9yZQ0KwqAgwqAg
LSBob3cgdG8gZXhwb3J0DQotIGNvbGxlY3RkIHNvdW5kcyBpbnRlcmVzdGluZyBhbmQgcHJvbWlz
aW5nIGZvciBjb2xsZWN0aW5nIG1ldHJpY3MNCi0gSVBNSSBTRUxzIGhhdmUgbGltaXRhdGlvbnMg
YXMgYW4gZXZlbnQgcmVwb3J0aW5nIG1lY2hhbmlzbSwgcG9zc2libHkgbmVlZCB0byBoYXZlIGEg
bmV3IGV2ZW50c8Kgb3IgZXJyb3IgbG9nIHJlcG9ydGluZyBtZWNoYW5pc20gdG8gYWdncmVnYXRl
IGZhdWx0IGxvZ3MgZnJvbSBkaWZmZXJlbnQgY29tcG9uZW50cw0KLSB3aWxsIG5lZWQgdG8gbG9v
ayBpbnRvIFJlZGlzaCBhbmQgZXhwYW5kIHRoZSBzcGVjcyBhcyBuZWNlc3NhcnkgdG8gZml0IG91
ciBuZWVkcw0KwqANCk9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDI6MDIgQU0gQWxleGFuZGVyIEFt
ZWxraW4gPG1haWx0bzphLmFtZWxraW5AeWFkcm8uY29tPiB3cm90ZToNCkkgc2Vjb25kIHRoZSBp
ZGVhIG9mIHJldXNpbmcgY29sbGVjdGQuIEl0J3MgcHJldHR5IHN0YW5kYXJkIGFuZCBwb3B1bGFy
Lg0KDQpXaXRoIGJlc3QgcmVnYXJkcywNCkFsZXhhbmRlciBBbWVsa2luLA0KTGVhZGluZyBCTUMg
U29mdHdhcmUgRW5naW5lZXIsIFlBRFJPDQpodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ5YWRyby5jb20mZGF0YT0wMiU3QzAx
JTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3QzIyNWQ0N2MyMzVkMzQwOTE5OTc5MDhkNmY0MmZl
OTZkJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNjk2NDg4
Mzk1NTk1MzI3NiZzZGF0YT04SXhMYlIxVUI1NGtGWWpybVJ0Yk5FU1JaZDhtNWpsbGc1eDRkWGF0
ZUlzJTNEJnJlc2VydmVkPTANCg0KMDUuMDYuMjAxOSAxNTo0OSwgQnJhZCBCaXNob3Agd3JvdGU6
DQo+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDEyOjM1OjA1UE0gLTA3MDAsIEt1biBZaSB3cm90
ZToNCj4+IEZZSTogU3Jpbml2YXMsIE5lZXJhaiwgYW5kIEkgYXJlIGZpbmFsaXppbmcgYSB0aW1l
IHNsb3QgZm9yIHRoZSBraWNrIG9mZg0KPj4gbWVldGluZy4gV2UgYXJlIHRoaW5raW5nIGFib3V0
IGEgYmktd2Vla2x5IGRpc2N1c3Npb24uDQo+Pg0KPj4gQWxzbywgSSdtIGRyYWZ0aW5nIGEgdmVy
c2lvbiBvZiBCTUMgbWV0cmljcyBjb2xsZWN0aW9uIGRhZW1vbi4gVGhlIGZpcnN0DQo+PiBkcmFm
dCBpcyB1cCBvbiBodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZnZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5eiUyRmMlMkZvcGVu
Ym1jJTJGZG9jcyUyRiUyQiUyRjIyMjU3JmRhdGE9MDIlN0MwMSU3Q25lbGFkayU0MG1pY3Jvc29m
dC5jb20lN0MyMjVkNDdjMjM1ZDM0MDkxOTk3OTA4ZDZmNDJmZTk2ZCU3QzcyZjk4OGJmODZmMTQx
YWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2MzY5NjQ4ODM5NTU5NTMyNzYmc2RhdGE9Y2xz
c0RlJTJCeXZCSjRMQ3F0ZmRPODlNY1AxMXBoU2VFSGJCWFN2elRHdHBzJTNEJnJlc2VydmVkPTAs
DQo+PiB3aGljaCB3ZSBwcm9iYWJseSB3aWxsIGdvIG92ZXIgZHVyaW5nIHRoZSBtZWV0aW5nLg0K
Pg0KPiBJIGp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGUgY29sbGVjdGQgcHJvamVjdDrCoCBo
dHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZjb2xsZWN0ZC5vcmclMkYmZGF0YT0wMiU3QzAxJTdDbmVsYWRrJTQwbWljcm9zb2Z0
LmNvbSU3QzIyNWQ0N2MyMzVkMzQwOTE5OTc5MDhkNmY0MmZlOTZkJTdDNzJmOTg4YmY4NmYxNDFh
ZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNjk2NDg4Mzk1NTk2MzI3MSZzZGF0YT1mWGdo
YiUyQkZyMjVNOHp6R2llc21kOUsySmpmTVA4cE55WWpYVEJ3aTN5aXclM0QmcmVzZXJ2ZWQ9MA0K
Pg0KPiBJJ20gbm90IHN1cmUgaWYgaXQgaXMgc3VpdGFibGUgb3Igbm90IGJ1dCBpdCBzZWVtcyBs
aWtlIGEgcHJldHR5IGNsb3NlIG1hdGNoIHRvIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gYW5k
IGl0IHdvdWxkIGJlIGEgbG90IG9mIGNvZGUgeW91IGRvbid0IGhhdmUgdG8gd3JpdGUuDQo+DQo+
IEp1c3Qgc29tZXRoaW5nIHRvIGNvbnNpZGVyLg0KPg0KPiB0aHggLSBicmFkDQoNCg0KwqANCi0t
IA0KUmVnYXJkcywNCkt1bg0K
