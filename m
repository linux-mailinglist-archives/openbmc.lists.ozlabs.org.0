Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87414C022
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 19:47:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486bFg21VtzDqMp
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 05:47:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.132;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=HfME4c9i; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2132.outbound.protection.outlook.com [40.107.93.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486bDz0P1WzDqLj
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 05:46:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDE/HCJb6daTkpGGurHGhDPp833ZC7lqg26xNwa4RcEzwwWh1o6995bqeFa9ooxUEUoo0iuyvtDs2PVAhIvoEr6cgunsI2cW0cuTKRiomSnBqvoGB/6XIwb1QtWB7ggunxTSo+h1as5OK4WtmmPmmACPM3X+SfxjJ+cL9xNKRmGNG6mljUvv953YtFA6pjg++8qpWbEztLjCX6A83SgjrGSvDzhPFOmTAccyDTa2zLwcgq5Lo0LQw9aev0TNPxTkL5VgQ7xrYRV5KPAs2n5lyZVWEZI0B8H/m56uhP/P9dhCj12fw6uhlZbfVAOBWY4AzH+ZfcTvGXEioy3A6Ct49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARcHnAOU9Hw0qQEme5XccbDz81mw36CuHTnqGcbwKvo=;
 b=gZ9bOGwAkPRPytrQ2LLhDzaykKw9Pi8f3fxoKrmx1c7WicMnxRpV1Ycmjel04sEGEKMuMrhA2YsSbvQMsILV7AusC4Gjf1sWR1Du1xBxzLTAxchTbj/y1oRWN6Eoc+1Ck0L8PYF+qAspDyydztC0G6fzas+ycFIBC/vacsPAoTYG7UxtTpeXK8xJmcUFe5CSy+Jnf2cmdYxSqPZfxjbOTkX6ChPLjEaCzwwxVPRYnczjefCkD4i0jESicIZlfbiTizAGZMbuwDbMjz1o/h+m6xiVTWTE2SH+boucpAGNnJ4D/rylm92p8SuSfAEbs1xPNHggXWpwIaBZwxs0uC8c8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARcHnAOU9Hw0qQEme5XccbDz81mw36CuHTnqGcbwKvo=;
 b=HfME4c9i1546lKMUPbFv5QAAJeZu6v8iPjoFKSXZGeF8Jwk9G2dUlVQAqZUN+Gmri25pbX83C8YzRyQ1qxzTeErBLxkPGBw1ePR8nOYsmxtw5tKkbHDzZ13Ee5PWOVuYDt1b/i2ZrlBU463etzctldBvM+kMNhFLS1AlDWcBIJg=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (20.180.12.7) by
 CH2PR21MB1414.namprd21.prod.outlook.com (20.180.10.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.3; Tue, 28 Jan 2020 18:46:35 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::5d20:66f5:823d:4b3d]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::5d20:66f5:823d:4b3d%3]) with mapi id 15.20.2707.003; Tue, 28 Jan 2020
 18:46:35 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, "kunyi@google.com" <kunyi@google.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Subject: RE: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Topic: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Index: AdXKQcbfGBfhoAISS+WO4z/Ia3YwmQLyUmVA
Date: Tue, 28 Jan 2020 18:46:35 +0000
Message-ID: <CH2PR21MB151058EC4BE0F0D7175F14CCC80A0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <CH2PR21MB1510415F901CDB5B566834A4C8350@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB1510415F901CDB5B566834A4C8350@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-Mentions: piotr.matuszczak@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-28T18:46:31.7687604Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c8e805fe-f1f0-455e-a826-3bf3fd9d769c;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:a:854d:910f:dde6:90ff]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5208a2c-4d87-4991-5462-08d7a42266a6
x-ms-traffictypediagnostic: CH2PR21MB1414:|CH2PR21MB1414:
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <CH2PR21MB1414E89A3809FD6B42653E68C80A0@CH2PR21MB1414.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(4326008)(52536014)(71200400001)(86362001)(66946007)(55016002)(66446008)(64756008)(7696005)(66476007)(66556008)(76116006)(9686003)(7416002)(8990500004)(53546011)(186003)(81166006)(6506007)(478600001)(81156014)(8676002)(2906002)(54906003)(5660300002)(966005)(316002)(10290500003)(8936002)(33656002)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR21MB1414;
 H:CH2PR21MB1510.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qV61gIXRtx2rHiT1LGJ9mr/q/osRvIDBjWYjqC1FkGcvCPwlZiJ5yIABusg0uqJhFr1x2gA4Lt67IWKYbC0ExuxQ27XvcqvmsiRZb7RwczNSPJ3TGWeiiEfeZGvsQS+iCBzIoYqeurOMnFkbXC+9c7z0/QL4UG1yZe2R6r7GsDUZCPD48kiydx/tH4TGIb8m0/xQzwcIyN4vI9NWW5A3Hbu33Iboe/gCGl6iiXWGsC1z3i/cx7kDA4tb+KjxVptnKnk46WV9dlqnLby8pLSoWrq0k3TCtS9kBtQxzTztqi6c1S1kU9kH9GsAhNtVmxxw7vK1QZeHAZt92StgsGF43bSohP0O7elFu8jeQ7ylHzT6pFFIunNhS3jwmAitvC/cs1RIYUaeae1TajwZC3q9xBy7aWTyfdXuvuIIUOPBx34zzb5QGZ9Q+OvWWde9EGQZW90VEZFM7JMG2NnHylqP41qu+FWQm6jWQElO7hMuSncKWyFLQOwLQBuZZD6u7Vl0Sz5t1OUGlcRuD42LeojYYQ==
x-ms-exchange-antispam-messagedata: MUWFnk4Qx+plt5le5VlcwRWynBmGFJCQvSSK5gwRcKf0nKM+yxAGGJRjCkOc7an4vTnM+jp2eulKUiVM/NVAfdi66X0dcXm1lbuxYCMYvHPGlh+VdPifAIzRVTuu2txVuE+dVw+oc8TUikIvPkThdRjYOusFP6kpdpf3b+t0ryNfxVngQ5OOGFLMP80nUI1tdgPL5gSS5ZO/z/aIqFY+1g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5208a2c-4d87-4991-5462-08d7a42266a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 18:46:35.1536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfavKh1Y8/g4CejegQ2j0uD8u92xE1mesT14PriyGdFmSeoOTdz3KsDJEQ6Uqa6O1XsNg6yzqP1fmcM2Toh/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1414
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
Cc: "Ren, Zhikui" <zhikui.ren@intel.com>,
 Jeff Booher-Kaeding <Jeff.Booher-Kaeding@arm.com>,
 Brad Chou <bradc@hyvedesignsolutions.com>, Tom Sand <trsand@us.ibm.com>,
 Michael Lim <youhour@us.ibm.com>, Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Reed B Frandsen <rfrandse@us.ibm.com>, Dong Wei <Dong.Wei@arm.com>,
 Camvan T Nguyen <ctnguyen@us.ibm.com>,
 Matt Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>,
 "Joshua_Giles@Dell.com" <Joshua_Giles@Dell.com>,
 Saqib Khan <khansa@us.ibm.com>, "rhanley@google.com" <rhanley@google.com>,
 Martin Haukali <martinh@graphcore.ai>,
 =?utf-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 Joe P Mulholland <jpmulhol@us.ibm.com>, Luke Chen <luke_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBoYXZlIGEgY29uZmxpY3QgdG9kYXkgYW5kIGNhbm5vdCBtYWtlIHRvIG1lZXRpbmcuIFBsZWFz
ZSBmZWVsIGZyZWUgdG8gbWVldCBhbmQgaGF2ZSB0aGUgZGlzY3Vzc2lvbiBhbGl2ZS4gDQoNClBp
b3RyLCBJIGhhdmUgcmV2aWV3ZWQgeW91ciBzcGVjIGFuZCBsb29rcyBnb29kIHRvIG1lLCBQbGVh
c2Ugc3VibWl0IGZvciBjb21tdW5pdHkgcmV2aWV3LiANCg0KDQpOZWVyYWoNCg0KDQotLS0tLU9y
aWdpbmFsIEFwcG9pbnRtZW50LS0tLS0NCkZyb206IE5lZXJhaiBMYWRrYW5pIA0KU2VudDogTW9u
ZGF5LCBKYW51YXJ5IDEzLCAyMDIwIDEwOjQ5IEFNDQpUbzogTmVlcmFqIExhZGthbmk7IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZzsgTWF0dXN6Y3phaywgUGlvdHI7IGt1bnlpQGdvb2dsZS5jb207
IFBhdWwuVmFuY2lsQGRlbGwuY29tDQpDYzogTWFydGluIEhhdWthbGk7IFJlbiwgWmhpa3VpOyBK
b2UgUCBNdWxob2xsYW5kOyBNaWNoYWVsIExpbTsgcmhhbmxleUBnb29nbGUuY29tOyBDYW12YW4g
VCBOZ3V5ZW47IENocmlzIEF1c3RlbjsgSnVzdGluIFRoYWxlcjsgSmVmZiBCb29oZXItS2FlZGlu
ZzsgSm9zaHVhX0dpbGVzQERlbGwuY29tOyBSZWVkIEIgRnJhbmRzZW47IE1hdHQgQ2hlbi9XWUhR
L1dpd3lubjsgTHVrZSBDaGVuOyBCcmFkIENob3U7IERvbmcgV2VpOyBCdWRkeSBIdWFuZyAo6buD
5aSp6bS7KTsgVG9tIFNhbmQ7IFNhcWliIEtoYW4NClN1YmplY3Q6IE9wZW5CTUMgUGxhdGZvcm0g
dGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZyBXb3JrIEdyb3VwDQpXaGVuOiBUdWVzZGF5
LCBKYW51YXJ5IDI4LCAyMDIwIDEyOjMwIFBNLTE6MDAgUE0gKFVUQy0wODowMCkgUGFjaWZpYyBU
aW1lIChVUyAmIENhbmFkYSkuDQpXaGVyZTogTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmcNCg0KTmV3
IHNlcmllcyBmb3IgMjAyMC4NCg0KV2Ugd2lsbCBjb250aW51ZSB0YWxraW5nIGFib3V0IHByb2dy
ZXNzIGFuZCBhZGRpdGlvbiB0byBjdXJyZW50IHRlbGVtZXRyeSBkZXNpZ24uDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXyANCmh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9sL21lZXR1cC1qb2lu
LzE5JTNhbWVldGluZ19NakZqWlRFNVpqTXRNelV4TnkwMFptUTVMV0UxTURJdFlXTTJNVFJoWlRF
eU9EaGwlNDB0aHJlYWQudjIvMD9jb250ZXh0PSU3YiUyMlRpZCUyMiUzYSUyMjcyZjk4OGJmLTg2
ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyUyMiUyYyUyMk9pZCUyMiUzYSUyMjFjMjljMmY3LWQz
ODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSUyMiU3ZCANCnRlbDorMSUyMDMyMy04NDktNDg3NCws
NzEwMDMxNDMzIyAgwqAgVW5pdGVkIFN0YXRlcywgTG9zIEFuZ2VsZXMgKFRvbGwpIA0KdGVsOig4
NjYpJTIwNjc5LTk5OTUsLDcxMDAzMTQzMyMgIMKgIChUb2xsLWZyZWUpIA0KQ29uZmVyZW5jZSBJ
RDogNzEwIDAzMSA0MzMjIA0KaHR0cHM6Ly9kaWFsaW4udGVhbXMubWljcm9zb2Z0LmNvbS84NTUx
ZjRjMS1iZWEzLTQ0MWEtODczOC02OWFhNTE3YTkxYzU/aWQ9NzEwMDMxNDMzIHwgaHR0cHM6Ly9t
eXNldHRpbmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNpbmcgfCBodHRwczovL2FrYS5tcy9Kb2lu
VGVhbXNNZWV0aW5nIHwgaHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL21lZXRpbmdPcHRpb25z
Lz9vcmdhbml6ZXJJZD0xYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUmdGVuYW50
SWQ9NzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JnRocmVhZElkPTE5X21lZXRp
bmdfTWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsQHRocmVh
ZC52MiZtZXNzYWdlSWQ9MCZsYW5ndWFnZT1lbi1VUyANCkpvaW4gd2l0aCBhIHZpZGVvIGNvbmZl
cmVuY2luZyBkZXZpY2UgDQptYWlsdG86ODEzODc4ODk2QHQucGxjbS52YyBWVEMgQ29uZmVyZW5j
ZSBJRDogMDE0ODk2NDc1NyANCmh0dHBzOi8vZGlhbGluLnBsY20udmMvdGVhbXMvP2tleT04MTM4
Nzg4OTYmY29uZj0wMTQ4OTY0NzU3IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gDQoNCg==
