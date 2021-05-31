Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4613955B0
	for <lists+openbmc@lfdr.de>; Mon, 31 May 2021 09:02:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtmSQ0jVCz2ymF
	for <lists+openbmc@lfdr.de>; Mon, 31 May 2021 17:02:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=O+dDQ+a1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.122;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=O+dDQ+a1; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310122.outbound.protection.outlook.com [40.107.131.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtmS34wF8z2yWN
 for <openbmc@lists.ozlabs.org>; Mon, 31 May 2021 17:01:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luKFn+ORlsaaLJ4FTx2jvoJtwZH9hneHgOgow42Pbjb+9q2q63OePd5YFe5c8FbJ4piTU4erCDRUvNg3eXcCMnMwdnlTHRpLFKY1nvvSAf73gdsk3gDIWH1w5m+zmhRm+6UklR+8A0O5NuRcUjLkPqn9wVcc9N4RGM2NffokzxNVk8GYW5s2lrABk0htsu3ymyrWoHmbtKqq5fx+a/wQeU2E81MZwWLPMR52Z1kvSx3HUa/X8WYdQ6f3AS/CGVcT5kqNm3vL8QYsfjGqlAUxM7llv3PCOcHVepONZi2CUy74FctqLvb/+vmw2PvQvHVXbey1RXRd+Z/n4WT4WQbQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+obJS3ZX3BLP9HYvSvEcyZ/hKlZCn2LlUCt5Zr0NcQ=;
 b=GAE8bkIeXZ0ad3tKmrN1b4br3ML99ZQ9AQmqs/p/Meb0TG4PDEf7z8yiMlghWDBFBbiZ2qw1p4R77AgGN9WWh6HKiS2Sr+VLuhbp3wqLv3NWMn4YFWx7vgOECLLojw5iMMBPqq6RdnD48ADylytakMPD/cOUzfdaikYtqC497ZePD45iiR191yLanYf2GZtL47931fpDKtqwSnmcUJ0gufQEfAyMf7GhdK+GzdQpGETYFP8SM72xk+lFabLF9kzmbNvU39nmElAkDjvc8ziZh7XyGp/6nXybfGAC9q/DR1QthY9QaJgSkGVKrga7DX106thxkhEys76Wv2Vx+BThRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+obJS3ZX3BLP9HYvSvEcyZ/hKlZCn2LlUCt5Zr0NcQ=;
 b=O+dDQ+a10NjUAbOQYY8WGh+KOqlPJO/4TAXuCT6GRRMHlw09gsgiQ+Wm8L9T/extPonAaN+i3IL9zHVf4K6Ra6vJPg0zLRFNGxutXPEqrQcU6qBZYxniT4G3RL0HpaZE/j2X83z7oeM5rKDfQQlGOc21+u2EhlB/i7bYnWp9PlE=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK2PR0401MB2034.apcprd04.prod.outlook.com (2603:1096:202:3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 07:01:46 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::58c5:e1bc:4f7:5fc0%6]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 07:01:46 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "sunnsr25@in.ibm.com"
 <sunnsr25@in.ibm.com>
Subject: RE: Implement PCIeType Property
Thread-Topic: Implement PCIeType Property
Thread-Index: AddSxrrWMZyaJu7rSDuh0zFsBYRnoAARg7kAALdNhPA=
Date: Mon, 31 May 2021 07:01:45 +0000
Message-ID: <HK0PR04MB32993E1B8E9D1B356112B7CFE43F9@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329955B4A773802B019E1477E4239@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <7703a5cf-a967-a256-71e4-be3f2d7fa411@linux.intel.com>
In-Reply-To: <7703a5cf-a967-a256-71e4-be3f2d7fa411@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c003ee0-664d-4dfb-7ac8-08d92401f43a
x-ms-traffictypediagnostic: HK2PR0401MB2034:
x-microsoft-antispam-prvs: <HK2PR0401MB2034A28C5B0E29EA4A2EA671E43F9@HK2PR0401MB2034.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7qgJxXYw1sJvDc4ueb/sn/2FV0YRAhhqh/TywDNVb5LeE7oxJueo0wQb6lTMSGWI0+1y8pCFO5Ukf+NrzbRQzrYE+DF1KBF0e9MAESoGN7gppyKtmJ231dEqOZE/2ji7coqlWClRN2vVKYXZ0/5l7EKoSTVclu1FHHMLqA00jrZUoS7G2Y+5yqYAe1O1eVfe74Q/0CJMY+6tN0r0z8W8yZmgnwCzzAniwh2eaKk3qLH5IFpQ8NpFcuOA1vuD8gFnxKLz0KzIExO+oPPeymY6NHUbsUjkztFl7gLBF+xxgQxhtSkj7NDgYv+6kd5tTgCUgBWxAaAdRLbenYkucTjNWWD+lYk527RSSjdR/ZCF54vbaeQEkaIEH/+yj31ckQ6t5jRmjXhFGksjRkvuwhQSPFWNq4sodMEv56fXGizlJeFpKodrcYG3PVi91HgmHNDmZ9AT9Q6h8j0JUYnDv23O2Cga0Z12i1qJdCsUrmz4C5EXhZ3TabGpcQjrktSPx4lCTnLIjNReRyR+fHzYZT9yDX/9Xaw2X5SuuHuJHzW8jrrw7sJeH938NsHRK+TeaRgCkr35OmU90IRdPGMvKGrf5D1B4S0i7TIexnyxiONFJCIc8uzOcnGKOYiWz6fvxWlJcnE71Vqkdj12MkQstgsXfX0nokrjbWT+tr3WMcY7tu+a90g1LOMmO6AXrrO+QVu16RIdUy+glZJIy5p1zkba/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(7116003)(966005)(5660300002)(83380400001)(9686003)(53546011)(8676002)(316002)(6506007)(7696005)(45080400002)(2906002)(478600001)(55016002)(26005)(110136005)(33656002)(8936002)(85182001)(86362001)(52536014)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(3480700007)(186003)(71200400001)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?emltZVJFNE9VanowREZCZXkwb0VDN2EvclNqMjg3Q1V6R0dRTEplakJXeEVrY0pR?=
 =?big5?B?NmpPZzRSejlqc2pOQjh3VkVJZk9ISE90UUFwb0d5bHlWUFhXdUt0NEJwdkRIOWVL?=
 =?big5?B?dG5CeU90WkRUN0tBT3pFRVE4emYrUFdWMHF4aTFONzZ2b3luWGZrYlJBSTgrOWMv?=
 =?big5?B?OHFlaHBzUmQ2Q3VjSkhwWEY0NjE5a2liTEQ0ZEFoeE5HTDZGbkxIdC9MRERsV2o4?=
 =?big5?B?a2p5SDN4V0ZLZnBibGNmNk9qVmx3RVJQWHN5L2tpS1ZKOWhQa1lzWG56R1Z1RTIz?=
 =?big5?B?bUpOT1Y4TnRqTTJvSkUrdVd4QjdhQmxVWXFTUi9PczhJM2pSVDhHeXV3YzFjazFU?=
 =?big5?B?ZHdobkRlOG9CUGtIcXpUM0RQLzhVVHVudkRETHNHSVZZWXZaMjNNc0tvaGNnVzNq?=
 =?big5?B?clNka0hIdDlsaHlxOFVkQUNoZXU2OWg5dEpHWTYyWEphdkdUSWs0eU4wNGhsTVhi?=
 =?big5?B?OHN1WWgyQkt2OHEwSWw3MjQyVXJockZPR2NJMFZqYW5sZUg5ZE52YlNLTUU3Q25D?=
 =?big5?B?MktsZVVXZWQ0aGZWeEpTd29IU2ZOTGNyKzlscFliVktyQitzWTVpa0tsb3JGS2Nj?=
 =?big5?B?VDZQSTBDcEg5bFZBUE9obkVpVGNsUHM0bkYrUHF0aERKcVVQeWNKWi9hM0tvWndv?=
 =?big5?B?d0hiUDNiQnNXRWpuckpLaElYZUtsSERGSVF4L0VtNUdoNU5wbTJaalZkN04yNDdF?=
 =?big5?B?Umg0RFk0VW1mWUFNSkNrenptbFZ5RzFpOEV3THBMMzZsNnJlblJRTTlzZDFoc1k1?=
 =?big5?B?OTRRZmwvaUhVTjQzT2cvSWI4NmhvT1k4bDdhdGYrR1dyc0RrY1ZNMi8rcVJ5OHRn?=
 =?big5?B?YWxIdno2anB3eDI1TzM0dWtNd0REVklvSUNoYmVjZzZ0TGEzOHBIOGQ1VFBZdysv?=
 =?big5?B?ank4Y1drWWtXK285dUpnTHVMT1FrbHFFdEFnbzZieGIwRGFDdFhQa1p5d3I1NS9E?=
 =?big5?B?UkIwWFNkVmlmWmo2dzhoWGpuQW4wblU1QTJHRnlTaFdqNW9pVis2YUgrc0RML0cx?=
 =?big5?B?TElsLytBSVdONzFSc3hJSmZ0cVdEbEJUNmdCWTViOHRGRHRpVWV5eGNwYjZ3bVpp?=
 =?big5?B?TmZqNjRTS1Y3M2owMVVsM3RZVjQ5Q2o3SzROdkdPNC9FRUZyRmI1cUlEVjV4aThj?=
 =?big5?B?RmpWSHVpbHlyVkorYjlocjY5N2NuV0h3d3UwWkhWcGkrWTB2WUQzcXJoZFZQM2NC?=
 =?big5?B?ejI1MXhyaE1yazdyaWdOeFl5WFJhT0s3azhZTVRhMStTbkJ2OTdvMXUzK056dmlm?=
 =?big5?B?UnFPVzlaVGZmdmM2bnBYWlNxTUQ0V2VCRGlETXRmOStFbTk2MzYzOTdoZ053M3RU?=
 =?big5?B?dWFtQ1hicUtWTi9UWlZyajZFQ2V4b0ltWWU2a3dvblZPeUNwby8rWVNQUUtITWtO?=
 =?big5?B?c2hYZ3N6Q0N4RVNUbmNwNFVLMzFjVXQwejJkV2QvcjZYZHVndzl1TWsvUUhXcFNl?=
 =?big5?B?U1FlcjYrVXdGWWVab0F5Q1RIMW5kZmtvQUZydlQ2QkRIRlhjVjJLK3VFSG1IZnJG?=
 =?big5?B?QS9Vam9YQmQ4aWkxNk5QNkhTWE4zN2c4NFVsaEdlODF5REUydjg1YUNwTmJTeVBB?=
 =?big5?B?MkNJUGt1MHlvdzBGeVVRcE1vOHVyYWU5a0VZeWFMTEc5MkZsSENHTitvVVNZb3pZ?=
 =?big5?Q?DlU9cuGGDLgj7B+Z7zvgfljxa9W9/vyljb17azk9orWDWwEV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c003ee0-664d-4dfb-7ac8-08d92401f43a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 07:01:45.9437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAn3X97eIR236f67i/+x8ALOvVU1A8gOte43OF5G9eChz08/uBZ+LGgXW7o5twu1+KOADdF9SDb7rJc2F9BCwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2034
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jDQo+IDxvcGVuYm1j
LWJvdW5jZXMrc3BlbmNlci5rdT1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVo
YWxmIE9mDQo+IEJpbGxzLCBKYXNvbiBNDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjcsIDIwMjEg
MTE6MjcgUE0NCj4gVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTog
SW1wbGVtZW50IFBDSWVUeXBlIFByb3BlcnR5DQo+IA0KPiANCj4gDQo+IE9uIDUvMjcvMjAyMSAx
MjowOSBBTSwgU3BlbmNlciBLdSAopWqlQLfsKSB3cm90ZToNCj4gPiBIaSBBbGwsDQo+ID4gICAg
V2Ugd291bGQgbGlrZSB0byBpbXBsZW1lbnQgUENJZUludGVyZmFjZSAiUENJZVR5cGUiIHByb3Bl
cnR5IG9uDQo+ID4gYm90aCBwZWNpLXBjaWUgYW5kIGJtY3dlYiwgdGhlbiBJIGZpbmQgdGhlIFBS
IHdoaWNoIGltcGxlbWVudA0KPiA+IGludmVudG9yeSBwcm9wZXJ0aWVzIGxpa2UgU3BhcmVQYXJ0
TnVtYmVyLCBNb2RlbCwgUGFydE51bWJlciwNCj4gPiBTZXJpYWxOdW1iZXIgZm9yIFBDSWUgZGV2
aWNlcyBpbiBibWN3ZWI6DQo+ID4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2Vycg0KPiA+DQo+IGl0Lm9wZW5ibWMtcHJv
amVjdC54eXolMkZjJTJGb3BlbmJtYyUyRmJtY3dlYiUyRiUyQiUyRjQwMDUxJmFtcDsNCj4gZGF0
YT0wDQo+ID4NCj4gNCU3QzAxJTdDU3BlbmNlci5LdSU0MHF1YW50YXR3LmNvbSU3Q2NiYzcxOWM1
MDU3MDQwZjA1NDAzMDhkOTIxMg0KPiA0MjcwMiUNCj4gPg0KPiA3QzE3OWIwMzI3MDdmYzQ5NzNh
YzczOGRlNzMxMzU2MWIyJTdDMSU3QzAlN0M2Mzc1NzcyNjE0NDYyNDc5NDkNCj4gJTdDVW5rbg0K
PiA+DQo+IG93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaA0KPiBhV3dpDQo+ID4NCj4gTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFt
cDtzZGF0YT1jcDF0R2ElMkZSN2ZwMnlLT0RhQjhIWDglMkJYUFMNCj4gbVZHakhqNFINCj4gPiBF
NlhBTnN0aWMlM0QmYW1wO3Jlc2VydmVkPTANCj4gPg0KPiA+IEkgdGhpbmsgd2UgbW9kaWZ5IHNp
bWlsYXIgcGFydCBvZiBibWN3ZWIsIGJ1dCBJIGFtIG5vdCBzdXJlIGRvZXMgaXQgd2lsbA0KPiBp
bXBsZW1lbnQgIlBDSWVUeXBlIiBwcm9wZXJ0eSBpbiB0aGUgZnV0dXJlLiBTbyBjb3VsZCB3ZSBp
bXBsZW1lbnQNCj4gIlBDSWVUeXBlIiBwcm9wZXJ0eSBmaXJzdCBzaW5jZSB0aGUgUFIgc3RhdHVz
IGlzIFdJUD8NCj4gPg0KPiA+IEFib3V0IHRoZSBpbXBsZW1lbnQgbWV0aG9kLCBmb3IgcGVjaS1w
Y2llIHBhcnQsIGZpcnN0IHdlIHVzZSBwZWNpDQo+ID4gY29tbWFuZCB0byBnZXQgdGhlIHBvaW50
ZXIgb2YgY2FwYWJpbGl0eSBpbiBQQ0kgY29uZmlndXJlIHNwYWNlLiBUaGVuIGdvDQo+IHRocm91
Z2ggY2FwYWJpbGl0eSBzdHJ1Y3R1cmUgdG8gZmluZCBjYXBhYmlsaXR5IElEIGluIDNyZCBjYXBh
YmlsaXR5IHN0cnVjdHVyZS4gSWYNCj4gdGhlIElEIGlzIFBDSSBFeHByZXNzLCB0aGVuIGdldCB0
aGUgbGluayBzcGVlZCBpbiBsaW5rIHN0YXR1cyByZWdpc3Rlci4gRmluYWxseSwgc2V0DQo+IHRo
ZSBQQ0llVHlwZSBwcm9wZXJ0eSB0byBELUJ1cyBhZnRlciB0cmFuc2xhdGluZyAodW5kZXINCj4g
L3h5ei9vcGVuYm1jX3Byb2plY3QvUENJZS88c3RyPikgLiA+IEFuZCBmb3IgYm1jd2ViIHBhcnQs
IHdlIHdpbGwgY3JlYXRlDQo+IFBDSWVJbnRlcmZhY2UgeyJQQ0llVHlwZSJ9IGxldmVsICh1bmRl
cg0KPiAvcmVkZmlzaC92MS9TeXN0ZW1zL3N5c3RlbS9QQ0llRGV2aWNlcy88c3RyPi8gKSBhbmQg
ZmlsbCB0aGUgaW5mbyBmcm9tIEQtYnVzLg0KPiA+DQo+ID4gT24gdGhlIG90aGVyIGhhbmQsIHdl
IGFsc28gaW50ZXJlc3RlZCBhYm91dCBob3cgdG8gZ2V0IFBhcnROdW1iZXIgYW5kDQo+IFNlcmlh
bE51bWJlciBpbmZvcm1hdGlvbj8gSSBhbHJlYWR5IHRyeSB0byBnZXQgZnJvbSBGUlUgb3ZlciBJ
MkMgYnV0IEkgY2Fubm90DQo+IG1hcHBpbmcgdGhlIGluZm8gYmV0d2VlbiBGUlUgYW5kIHBlY2kt
cGNpZSwgb3IgaXMgaXQgY2FuIGVhc2lseSBnZXQgYnkNCj4gcGVjaS1wY2llPyBBbnkgY29tbWVu
dHMgYW5kIHN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lIQ0KPiBwZWNpLXBjaWUgY3VycmVudGx5IGNh
biBvbmx5IGdldCBpbmZvcm1hdGlvbiB0aGF0IGlzIGF2YWlsYWJsZSBvdmVyIFBDSS4NCj4gICBJ
ZiB0aGVzZSBuZXcgZmllbGRzIGNvbWUgZnJvbSBzb21ld2hlcmUgb3RoZXIgdGhhbiBQQ0ksIGl0
IGNvdWxkIGJlDQo+IGRpZmZpY3VsdCB0byBhZGQgdGhlbS4NCg0KSGkgSmFzb24sDQpUaGFua3Mg
Zm9yIHlvdXIgc3VnZ2VzdGlvbnMhIFllcywgaXQgaXMgYWN0dWFsbHkgdGhlIHF1ZXN0aW9uIHdo
YXQgSSBtZWV0LiBTaW5jZSBpdCBpcyBoYXJkIHRvIGFkZCB0aGVtIHRvZ2V0aGVyLCBJIGFtIHRy
eSB0byBmaW5kIGlzIHRoZXJlIGEgd2F5IHRvIGdldCB0aG9zZSBkYXRhIG92ZXIgUENJLg0KDQo+
IA0KPiBJZiB0aGVzZSBuZXcgZmllbGRzIGFsbCBjb21lIGZyb20gdGhlIEZSVSwgdGhlbiB3ZSBz
aG91bGQgYWxyZWFkeSBoYXZlIHRoYXQNCj4gZGF0YSBpbiBvdGhlciBhcHBsaWNhdGlvbnMsIHNv
IHdlIHNob3VsZG4ndCBuZWVkIHRvIGdldCBpdCBpbiBhIFBDSSBhcHBsaWNhdGlvbi4NCg0KSSB0
aGluayB0aGlzIGlzIGJlY2F1c2UgcmVkZmlzaCBzY2hlbWEgZGVmaW5lZCB0aGUgcHJvcGVydHkg
YW5kIGl0IGlzIGNvbnZlbmllbmNlIGlmIHdlIGNhbiBnZXQgUENJIGluZm9ybWF0aW9uIHRocm91
Z2ggb25lIHJlZGZpc2ggVVJJLg0KQnV0IG9mIGNvdXJzZSBpdCBzaG91bGQgYmUgYSBmZWFzaWJs
ZSBtZXRob2QuDQoNCj4gDQo+IEl0IG1heSBiZSBnb29kIHRvIGRpc2N1c3MgdGhlIGRlc2lnbiBh
IGJpdCBmb3INCj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2Vycml0Lm9wDQo+IGVuYm1jLXByb2plY3QueHl6JTJGYyUy
Rm9wZW5ibWMlMkZibWN3ZWIlMkYlMkIlMkY0MDA1MSZhbXA7ZGF0YQ0KPiA9MDQlN0MwMSU3Q1Nw
ZW5jZXIuS3UlNDBxdWFudGF0dy5jb20lN0NjYmM3MTljNTA1NzA0MGYwNTQwMzA4ZDkyDQo+IDEy
NDI3MDIlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NTc3
MjYxDQo+IDQ0NjI0Nzk0OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3
TURBaUxDSlFJam9pVg0KPiAybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdD
MTAwMCZhbXA7c2RhdGE9Y3AxdEdhJTJGUg0KPiA3ZnAyeUtPRGFCOEhYOCUyQlhQU21WR2pIajRS
RTZYQU5zdGljJTNEJmFtcDtyZXNlcnZlZD0wLiAgRm9yDQo+IGV4YW1wbGUsIEkgdGhpbmsgRnJ1
RGV2aWNlIGFscmVhZHkgaGFzIHRoZSBGUlUgaW5mb3JtYXRpb24gZm9yIHRoZSBQQ0llDQo+IGRl
dmljZXMuICBEb2VzIHRoZSBQQ0kgYXBwbGljYXRpb24gbmVlZCB0byBjb21tdW5pY2F0ZSB3aXRo
IEZydURldmljZSBhbmQNCj4gZXhwb3NlIHRoZSBzYW1lIGluZm9ybWF0aW9uIGFnYWluIGluIHRo
ZSBQQ0llIGludmVudG9yeSBvbiBELUJ1cz8NCj4gT3IsIHNob3VsZCBibWN3ZWIgZGlyZWN0bHkg
bG9vayBmb3IgdGhlIEZydURldmljZSB0byBwb3B1bGF0ZSB0aGVzZSBuZXcNCj4gZmllbGRzPw0K
DQpZZXMsIEkgdGhpbmsgdGhhdCdzIHRoZSBnb29kIHBvaW50IHRvIGRpc2N1c3MgYWJvdXQgdGhl
IGRlc2lnbi4gSSB3aWxsIHB1dCBteSBjb21tZW50IHRvIHRoZSBQUi4NCkhpIFN1bm55LCBEbyB5
b3UgaGF2ZSBhbnkgb3BpbmlvbiBvbiB0aGlzIHRvcGljPw0KDQo+ID4NCj4gPiBQbGVhc2UgbGV0
IHVzIGtub3cgaWYgdGhlcmUncyBhbnkgaXNzdWUsIHRoYW5rIHlvdSENCj4gPg0KPiA+IFNpbmNl
cmVseSwNCj4gPiBTcGVuY2VyIEt1DQo+ID4NCg==
