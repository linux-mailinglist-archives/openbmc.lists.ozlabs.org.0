Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ABE4B5FC
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 12:13:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TLPN10x3zDqmq
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 20:13:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.129; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="j0CESyGu"; dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60129.outbound.protection.outlook.com [40.107.6.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TLNZ3cBmzDqDp
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 20:12:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector2-Ircona-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1D/zhVtUhUQ7GjH9fY/+1nzj2Av0iekK1TlI+JZYNg=;
 b=j0CESyGuhTDdZ5Mq0c1RkiCkOyvEyiS1LX9xh+ZueFywEdDXBLGrHVppG2rc9JHqmn21Zfnhgieo7EQ+4e6f5QIW7AZwRRgYJvxfq0M/Xvt3ifdYPufwBhgIoXJpuz1XN7uS2UtmG2PElqwwP0M40N7wGNuhl8hwP3n2v9cq8po=
Received: from DB6PR0402MB2759.eurprd04.prod.outlook.com (10.172.252.19) by
 DB6PR0402MB2775.eurprd04.prod.outlook.com (10.172.247.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 10:12:21 +0000
Received: from DB6PR0402MB2759.eurprd04.prod.outlook.com
 ([fe80::1cbd:18f:7d83:f838]) by DB6PR0402MB2759.eurprd04.prod.outlook.com
 ([fe80::1cbd:18f:7d83:f838%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 10:12:21 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: Neeraj Ladkani <neladk@microsoft.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Platform telemetry and health monitoring
Thread-Topic: Platform telemetry and health monitoring
Thread-Index: AdUPSgV2V2O36/zKToW4XlARusyEFAAbGfeAAA/WT4AAnwBPgAImtRSAACQhJ4ABJWtDgAAUBnMAABk4WFABPtM0gAAIuucAABZ06AAACY8M0A==
Date: Wed, 19 Jun 2019 10:12:21 +0000
Message-ID: <DB6PR0402MB2759AD0935CDC16E28CBA6D8C9E50@DB6PR0402MB2759.eurprd04.prod.outlook.com>
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
 <BL0PR2101MB093231A9C83BC1477B5DD323C8E50@BL0PR2101MB0932.namprd21.prod.outlook.com>
In-Reply-To: <BL0PR2101MB093231A9C83BC1477B5DD323C8E50@BL0PR2101MB0932.namprd21.prod.outlook.com>
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
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [87.198.164.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 264bc7b2-dc27-42f5-d2ab-08d6f49e9e70
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2775; 
x-ms-traffictypediagnostic: DB6PR0402MB2775:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <DB6PR0402MB277529BD068E3C04B6166695C9E50@DB6PR0402MB2775.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(39830400003)(366004)(396003)(376002)(13464003)(189003)(199004)(53754006)(86362001)(64756008)(9686003)(81166006)(53546011)(6306002)(7696005)(6506007)(5660300002)(76176011)(45080400002)(486006)(8936002)(68736007)(966005)(81156014)(14454004)(53936002)(3846002)(6246003)(316002)(110136005)(1511001)(2906002)(6116002)(229853002)(8676002)(26005)(66476007)(7736002)(476003)(66066001)(73956011)(66446008)(71190400001)(66556008)(74316002)(71200400001)(52536014)(446003)(102836004)(305945005)(186003)(55016002)(508600001)(25786009)(11346002)(66946007)(76116006)(6436002)(99286004)(256004)(14444005)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0402MB2775;
 H:DB6PR0402MB2759.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YYzymjL4jJzUkqm61sBphwlCgPcGJ5F1HJNxKB2EHlIjqTc9dVftG3BY/NesB8nQnfji27uumFvv7NcKDMFVMg2yY42Zl6PEy7CR5PqH48G1abJCqXGYVmY7ml9uw/k+eyBuJbGwByr9t8n7tEA5ct3Fz6ovoabDvgvwtVvkwEr/BoB3KdCQwhAyRPJr2cb+PdwZ0xakLtrvU0O8+GzlQO3kWDREVEpNSINAFGz48LnAKkxsfrbIzC6dQxCaOPoVQnyNH57zbRLbgOLHmDinDeqmuO5mazDyKwAuXjFf6B1Z1uqKXg+mloRvJgEJr4jWZYWsvbGdb69/UKM3Pfaq5ZVTFLaGYp1oBSIjNTLoTvrWY3q+9QzrAlaCxpv4iQT8tB3VOK3rG+T6vTk/8vlSKkLZEoUDhRVCISqCCEnrJBA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264bc7b2-dc27-42f5-d2ab-08d6f49e9e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 10:12:21.8847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sboylan@ircona.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2775
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

SGkgYWxsLCANCg0KSSd2ZSBiZWVuIHVuYWJsZSB0byBhdHRlbmQgdGhlIG1lZXRpbmdzLCBidXQg
aW4gdGhlIGJhY2tncm91bmQgSSd2ZSBiZWVuIHdvcmtpbmcgb24gYSB0ZWxlbWV0cnkgcGFja2Fn
ZSBmb3IgY29sbGVjdGluZyBzZW5zb3IgZGF0YSBqdXN0IGluIG15IG93biB0aW1lIGFzIGEgc2lk
ZSBwcm9qZWN0LiANCg0KSSd2ZSBiZWVuIHVzaW5nIGEgZGFlbW9uIHRoYXQgcnVucyBhbmQgZXZl
cnkgNSBzZWNvbmRzIHdpbGwgZ28gb3V0IG9uIHRoZSBkYnVzIHRvIHJlcXVlc3QgdGhlIHZhbHVl
IHByb3BlcnR5IG9mIGVhY2ggdGVtcGVyYXR1cmUgc2Vuc29ycyBpbiB0aGUgc3lzdGVtLiBUaGUg
Zm9ybWF0IEkgc3RvcmUgdGhlbSBpbiBpcyANCg0KVW5peCBUaW1lIFN0YW1wIC0gU2Vuc29yIE5h
bWUgLSBSZXR1cm5lZCBWYWx1ZQ0KDQpUaGlzIGNvdWxkIGJlIGV4dGVuZGVkIHRvIGNvdmVyIGFs
bCBzZW5zb3IgdHlwZXMsIGZhbiwgdm9sdGFnZSwgZXRjLiANCg0KUmVnYXJkcywNClN0ZXBoZW4g
Qm95bGFuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVu
Ym1jLWJvdW5jZXMrc2JveWxhbj1pcmNvbmEuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFs
ZiBPZiBOZWVyYWogTGFka2FuaQ0KU2VudDogMTkgSnVuZSAyMDE5IDA2OjQxDQpUbzogTmVlcmFq
IExhZGthbmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUkU6IFBsYXRmb3JtIHRlbGVtZXRyeSBhbmQg
aGVhbHRoIG1vbml0b3JpbmcNCg0KSW4gbGFzdCBtZWV0aW5nLCB3ZSBkaXNjdXNzZWQgdGhhdCB0
ZWxlbWV0cnkgZGF0YSBjYW4gYmUgY29sbGVjdGVkIHVzaW5nIOKAnHRvb2xz4oCdIGFuZCBleHBv
cnRlZCB1c2luZyBiaW5hcnkg4oCcYmxvYnPigJ0sIA0KDQpTaG91bGQgd2UgZGVmaW5lIGEgc3Rh
bmRhcmQgZGF0YSBmb3JtYXQgc28gdGhhdCBpbmZvcm1hdGlvbiBjYW4gYmUgcGFyc2VkIHRocm91
Z2ggc3RhbmRhcmQgbWVjaGFuaXNtIGFuZCBoZWxwIHRha2luZyBzcGVjaWZpYyBhY3Rpb25zLiAg
DQoNCkhvc3QgQ1BVDQpNZW1vcnkNCk5ldHdvcmsgQWRhcHRlciANCkdQVXMvSVBVcw0KQk1Dcw0K
DQoNClRoYW5rcw0KTmVlcmFqDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytuZWxh
ZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgTmVlcmFqIExh
ZGthbmkNClNlbnQ6IFR1ZXNkYXksIEp1bmUgMTgsIDIwMTkgMTo1OSBQTQ0KVG86IE9wZW5CTUMg
TWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJFOiBQbGF0Zm9y
bSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBtb25pdG9yaW5nDQoNCjEuIEhvdyBkbyBkZWZpbmUgd2hh
dCBkYXRhIHRvIGJlIGNvbGxlY3RlZCBhbmQgaG93ID8gwqBXZSBuZWVkIGEgd2F5IHRvIGxldCBC
TUMga25vdyANCmEuIFdoYXQgZGF0YSB0byByZWFkID8gDQpiLiBXaGVuIHRvIHJlYWQgPw0KYy4g
SG93IHRvIHJlYWQgPyANCg0KMi4gRG9lcyByZWRmaXNoIHN1cHBvcnQgwqBwdWxsaW5nIHRlbGVt
ZXRyeSBmcm9tIHN5c3RlbT8gDQoNCk5lZXJhag0KDQoNCk9uIDYvMTIvMTkgMTE6NTggQU0sIE5l
ZXJhaiBMYWRrYW5pIHdyb3RlOg0KVGhhbmtzIEt1biBmb3Igc3VtbWFyaXppbmcgbm90ZXMuIA0K
wqANCkZvciBkZXRhaWxlZCBub3RlczogaHR0cHM6Ly9uYW0wNi5zYWZlbGlua3MucHJvdGVjdGlv
bi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZv
cGVuYm1jJTJGd2lraSUyRlBsYXRmb3JtLXRlbGVtZXRyeS1hbmQtaGVhbHRoLW1vbml0b3Jpbmct
V29yay1Hcm91cCZkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDMjI1ZDQ3
YzIzNWQzNDA5MTk5NzkwOGQ2ZjQyZmU5NmQlN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJkN2NkMDEx
ZGI0NyU3QzElN0MwJTdDNjM2OTY0ODgzOTU1OTQzMjgzJnNkYXRhPVFUUFVwNWxYZmdWcjB4ZGtV
S3p4RGlpRGc1Z2ppa2tMTDlLZDBJTSUyQm91YyUzRCZyZXNlcnZlZD0wDQrCoA0KTmVlcmFqDQrC
oA0KRnJvbTogb3BlbmJtYyBtYWlsdG86b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1taWNyb3NvZnQu
Y29tQGxpc3RzLm96bGFicy5vcmcgT24gQmVoYWxmIE9mIEt1biBZaQ0KU2VudDogVHVlc2RheSwg
SnVuZSAxMSwgMjAxOSAxMToyNCBBTQ0KVG86IEFsZXhhbmRlciBBbWVsa2luIG1haWx0bzphLmFt
ZWxraW5AeWFkcm8uY29tDQpDYzogT3BlbkJNQyBNYWlsbGlzdCBtYWlsdG86b3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogUGxhdGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGgg
bW9uaXRvcmluZw0KwqANCk5lZXJhaiBtZW50aW9uZWQgaGUgd2lsbCBzZW5kIG91dCB0aGUgbWVl
dGluZyBtaW51dGVzLiBIZSB3aWxsIGFsc28gbG9vayBpbnRvIHNldHRpbmcgdXAgYSB3aWtpIHBh
Z2UgaG9sZGluZyB0aGUgY29udGVudHMgYXMgd2VsbCBhcyBtaW51dGVzLg0KwqANCkEgZmV3IHF1
aWNrIG5vdGVzIGZyb20gdG9wIG9mIG15IGhlYWQgZnJvbSB0aGUga2ljay1vZmYgbWVldGluZzoN
Ci0gZGlkIGEgcm91bmQgdGFibGUsIGFsbCB0aGUgb3JncyBoYXZlIHNpbWlsYXIgcmVxdWlyZW1l
bnRzDQotIG5lZWQgdG8gbG9vayBpbnRvIGhvdyBleGlzdGluZyBpbmZyYSBmaXQgaW50byB0aGUg
bmVlZHMgYW5kIHdoYXQgZmFsbHMgc2hvcnQNCi0gd2lsbCBoYXZlIHdvcmtzdHJlYW1zIGZvcjoN
CsKgIMKgIC0gd2hhdCB0byBjb2xsZWN0DQrCoCDCoCAtIGhvdyB0byBjb2xsZWN0DQrCoCDCoCAt
IGhvdyB0byBzdG9yZQ0KwqAgwqAgLSBob3cgdG8gZXhwb3J0DQotIGNvbGxlY3RkIHNvdW5kcyBp
bnRlcmVzdGluZyBhbmQgcHJvbWlzaW5nIGZvciBjb2xsZWN0aW5nIG1ldHJpY3MNCi0gSVBNSSBT
RUxzIGhhdmUgbGltaXRhdGlvbnMgYXMgYW4gZXZlbnQgcmVwb3J0aW5nIG1lY2hhbmlzbSwgcG9z
c2libHkgbmVlZCB0byBoYXZlIGEgbmV3IGV2ZW50c8Kgb3IgZXJyb3IgbG9nIHJlcG9ydGluZyBt
ZWNoYW5pc20gdG8gYWdncmVnYXRlIGZhdWx0IGxvZ3MgZnJvbSBkaWZmZXJlbnQgY29tcG9uZW50
cw0KLSB3aWxsIG5lZWQgdG8gbG9vayBpbnRvIFJlZGlzaCBhbmQgZXhwYW5kIHRoZSBzcGVjcyBh
cyBuZWNlc3NhcnkgdG8gZml0IG91ciBuZWVkcw0KwqANCk9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0
IDI6MDIgQU0gQWxleGFuZGVyIEFtZWxraW4gPG1haWx0bzphLmFtZWxraW5AeWFkcm8uY29tPiB3
cm90ZToNCkkgc2Vjb25kIHRoZSBpZGVhIG9mIHJldXNpbmcgY29sbGVjdGQuIEl0J3MgcHJldHR5
IHN0YW5kYXJkIGFuZCBwb3B1bGFyLg0KDQpXaXRoIGJlc3QgcmVnYXJkcywNCkFsZXhhbmRlciBB
bWVsa2luLA0KTGVhZGluZyBCTUMgU29mdHdhcmUgRW5naW5lZXIsIFlBRFJPDQpodHRwczovL25h
bTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZ5
YWRyby5jb20mZGF0YT0wMiU3QzAxJTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3QzIyNWQ0N2My
MzVkMzQwOTE5OTc5MDhkNmY0MmZlOTZkJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRi
NDclN0MxJTdDMCU3QzYzNjk2NDg4Mzk1NTk1MzI3NiZzZGF0YT04SXhMYlIxVUI1NGtGWWpybVJ0
Yk5FU1JaZDhtNWpsbGc1eDRkWGF0ZUlzJTNEJnJlc2VydmVkPTANCg0KMDUuMDYuMjAxOSAxNTo0
OSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDEyOjM1OjA1
UE0gLTA3MDAsIEt1biBZaSB3cm90ZToNCj4+IEZZSTogU3Jpbml2YXMsIE5lZXJhaiwgYW5kIEkg
YXJlIGZpbmFsaXppbmcgYSB0aW1lIHNsb3QgZm9yIHRoZSBraWNrIG9mZg0KPj4gbWVldGluZy4g
V2UgYXJlIHRoaW5raW5nIGFib3V0IGEgYmktd2Vla2x5IGRpc2N1c3Npb24uDQo+Pg0KPj4gQWxz
bywgSSdtIGRyYWZ0aW5nIGEgdmVyc2lvbiBvZiBCTUMgbWV0cmljcyBjb2xsZWN0aW9uIGRhZW1v
bi4gVGhlIGZpcnN0DQo+PiBkcmFmdCBpcyB1cCBvbiBodHRwczovL25hbTA2LnNhZmVsaW5rcy5w
cm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5eiUyRmMlMkZvcGVuYm1jJTJGZG9jcyUyRiUyQiUyRjIyMjU3JmRhdGE9MDIlN0Mw
MSU3Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0MyMjVkNDdjMjM1ZDM0MDkxOTk3OTA4ZDZmNDJm
ZTk2ZCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2MzY5NjQ4
ODM5NTU5NTMyNzYmc2RhdGE9Y2xzc0RlJTJCeXZCSjRMQ3F0ZmRPODlNY1AxMXBoU2VFSGJCWFN2
elRHdHBzJTNEJnJlc2VydmVkPTAsDQo+PiB3aGljaCB3ZSBwcm9iYWJseSB3aWxsIGdvIG92ZXIg
ZHVyaW5nIHRoZSBtZWV0aW5nLg0KPg0KPiBJIGp1c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGUg
Y29sbGVjdGQgcHJvamVjdDrCoCBodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91
dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZjb2xsZWN0ZC5vcmclMkYmZGF0YT0wMiU3QzAx
JTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3QzIyNWQ0N2MyMzVkMzQwOTE5OTc5MDhkNmY0MmZl
OTZkJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNjk2NDg4
Mzk1NTk2MzI3MSZzZGF0YT1mWGdoYiUyQkZyMjVNOHp6R2llc21kOUsySmpmTVA4cE55WWpYVEJ3
aTN5aXclM0QmcmVzZXJ2ZWQ9MA0KPg0KPiBJJ20gbm90IHN1cmUgaWYgaXQgaXMgc3VpdGFibGUg
b3Igbm90IGJ1dCBpdCBzZWVtcyBsaWtlIGEgcHJldHR5IGNsb3NlIG1hdGNoIHRvIHdoYXQgeW91
IGFyZSB0cnlpbmcgdG8gZG8gYW5kIGl0IHdvdWxkIGJlIGEgbG90IG9mIGNvZGUgeW91IGRvbid0
IGhhdmUgdG8gd3JpdGUuDQo+DQo+IEp1c3Qgc29tZXRoaW5nIHRvIGNvbnNpZGVyLg0KPg0KPiB0
aHggLSBicmFkDQoNCg0KwqANCi0tIA0KUmVnYXJkcywNCkt1bg0K
