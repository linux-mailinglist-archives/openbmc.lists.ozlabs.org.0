Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA463F96CA
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 11:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwvQx1r3Vz2yw9
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 19:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=o+WrVWAM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.134;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=o+WrVWAM; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300134.outbound.protection.outlook.com [40.107.130.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwvQC4gC2z2yPc;
 Fri, 27 Aug 2021 19:22:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ry7LhI9S+zUbszThSr8XLLd+Q92FBOpelygK8OlFltlyjKU4AHwmT3BeEA/IO3kDB37hxba1ZBu2T6q1sFkHQqYET6SQRQf/bajaze8KzCvj7sEpkqPjW7t94TlodCB74Yi1PtxNTanClW41xdtjfupcaODEIgmn3n6MaYyoGFD6B/GIzotVkLgw/JF8dJzgL6rxI/rAd1LPeZzK0N+E7ghLzMrJ2Uk/wZXBR8w6Yyov+h5bIhIMpGsg8Te1V1j52J5702zgb1UwJZcAWo2JEsAWOHZSRqzk2OgV2uIZD3dbCHa5MwRJzXnwLl0KU9Jyx3GfWcWmzqBOS57jXlVyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH3S7LybM2AjVNtMe0A8PBKpWi8Vhv0S1++R4s8Rhwg=;
 b=S4aF9rDrsImGdslciczG0kcyPPViGYmu/GX4wff0sf8HXK1ohNt5tsS5Zs25BRSPTNGXCZtX+rLgUKgRqq6oGXTnAwwE8nQaFkh2spugwEYzkAJzsyxLAD7oVyWlIEna0tB5On6hUjLzGC95t2sZC0QCs/Vdop3VftFsLARVGFej7kRMfjgt4BR3ITDeoz78EpQISWZXg0AfVBfScLDF9zjWOVq+f4p2YLKXnLvSGlNrpB2OZWS8jst8hjssggSUr856KSRgd35q98cne8NV9BB+Uz0F0YtNYzFVGZ0dWVWO39BzTZO37OMB33k1IMeDmiFBNPT+rODifu7r9Y0j0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH3S7LybM2AjVNtMe0A8PBKpWi8Vhv0S1++R4s8Rhwg=;
 b=o+WrVWAMOGDz0g6u02PmmzACKd2XVXnLX6zBLjWV74EgvcJeFsDjKVToRcuMYpO4pwbLscZ8OEXvY8DUlEWVZeAK6k6z5sci8JLd4BCAygRbgRx0G7DhBZuw3ZbaLRsYsIegWrjuWM3xj7pYadKEjhnL18A47TSCZYXrScQNLLKC58s0AzY7LCqlBE5jGmFsUQryzIVSdrETW2tPc77MGZ9MbreRprcLyvQVYf+jDsmYXPY9swz2koEWzHi5aOY9o/qF6Y/0irrZneXGxU4ZJbaTYkDkhnM/3fX+FoRvvL9JuPOwyC945udfy/qYpiW7kDF9618nC77EAZQ7m9M0mQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3458.apcprd06.prod.outlook.com (2603:1096:202:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 08:49:16 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 08:49:16 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXmkI+4Lhg3IxgrEO2OY2fsCr5kauGcBUAgABIZaCAACFtAIAAIuCA
Date: Fri, 27 Aug 2021 08:49:16 +0000
Message-ID: <HK0PR06MB3779B6CD28A84D3DC651211191C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <202108270732.OvBQ4K3D-lkp@intel.com>
 <HK0PR06MB377927BDCA9CC79B598251B291C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8Xf1g2fp5X3ELBUyjzP6Fmvt1XWLU_UgCKdZaDVjdyKryQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf1g2fp5X3ELBUyjzP6Fmvt1XWLU_UgCKdZaDVjdyKryQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f78bdb-f028-4943-f5a6-08d969378d67
x-ms-traffictypediagnostic: HK2PR06MB3458:
x-microsoft-antispam-prvs: <HK2PR06MB34589D8F591F4B00BB24462691C89@HK2PR06MB3458.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qtFHvyRrm2kEu9berQZhbY097jhv1G8ZrR06niou+T6L6Zh39QPNI0QiIA+fhisTTpDT1FxLXkVVJMQvYkOp49ds0ui2ZEfD0E7uStnTlnqriBs0vXRcwzRE5LRIXZyw6gDr5ZARWEuoBQRDcckRc1/anMdAnosHGIGU5WwjsYY8xBt5t7R53xCZzy7f7j9YqRcHHi4Ynn/2BZ2R8cCn/yJ/uTZIJ1kvYUYI7zJtuV8el/JHXR1A06a9TpRF710+xoxK10T7RsROpviklt2hox/HEmRiThjlJW5VY8K6w+vNHEIzCr7/Bg7LAOvUTvBW1I00pArcjhiwMuxTTvDV4YMHH5h8Z4uSsozKXu1S1jMlHBYfLRiRBSLVhAUUuS7bomjUrWketLgWyq9xryLWLsW7wGKof1/Uw5SbjTrRNoSLVgvKmY3wbjrKCnqodkOTeH8m8y/QaY6A7k84iD4Y7aOCluUTV00wl4yVU+XQNLXRgocAdAkYACAhVA8iXUVNi7xP51Lpvxjg40uFg2LRb2vob70OFc0UNM3Eobq69FFSXZKylSiI8nCXlbiOaJTPuYNOEWdVEHDaoPMNmlnv3882Ms28gZC6iw3rk63SaXHOv6din04sA8x0xgybzciiEDo7EAE+W6dd/oFQw3bdV8Pmr55PeAPg9laI/SPPfHq34PTkB9bxXBKcTCb8t3q84dKzNheCjIqHocQTbhReBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39840400004)(54906003)(76116006)(64756008)(66556008)(66476007)(9686003)(2906002)(316002)(86362001)(66946007)(66446008)(7416002)(38070700005)(5660300002)(6916009)(52536014)(71200400001)(4326008)(26005)(8936002)(33656002)(122000001)(4744005)(8676002)(7696005)(6506007)(186003)(38100700002)(478600001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERDaVFUMTJaR3hmUWlMZkJaQzYwV3RsUWdzaE5zS0prWEJubHR5eHUxNlU2?=
 =?utf-8?B?S0dIcVN3aGVnSEkxcVQ4RkpFUjNEU2RBcEY3dUR6OU1Ic1dUTCtrb3I2eDRM?=
 =?utf-8?B?SjlBaTl4ZUNLczBKczU0Q2p3d3pxcGtaQUl3bld5NDVveEVQaXoxUitvZHhN?=
 =?utf-8?B?NmludTVDUGNTZ1pRV01oc0RXZDhoZUh0bEFxbC95UTRHM0pISjRLRFJnemo1?=
 =?utf-8?B?VllHUVJUMlpZL0Zkai90MjR2YjRzSFk5bEpPWnRhWWQ0NWw1eWpYWktzU2Rl?=
 =?utf-8?B?NDNndjAvcjFLSitWb1JJaElpUHdtejluQlFGcUIweFF0MjBocXJvdmJaTjBk?=
 =?utf-8?B?QWx3VmZtZGhWTktlY1BUY0IzM1lGU0dzOWNkZXlnUnpEcWkvQi92TnByUkln?=
 =?utf-8?B?MlFsRDhTZnZZYkpDeENiN2RUQU1nZFA3QmxmK0hGWlYxNysxc3h1cmtNK0sx?=
 =?utf-8?B?S25acE1pTGo1SElmTExwelpVdnZvblZjQnViazJ1TFFRZnhLcXI0Nzk4eWhh?=
 =?utf-8?B?clJGMDdtU2N6Zm80RW16dHVpL1JGbEkrSGdwSnZHSitOWCtWSDYrTkNtWCtR?=
 =?utf-8?B?aVBaejQ5eHArM2xxRnJrSGIyelZWTmRyOEpNQng3NkxIQmlVMWVpMjZUbkk4?=
 =?utf-8?B?S3JxcDZ4MGRnTFJFemNqblVwT3dUclVqMVlqZldmRnJKUk56VkxLSFVqTDg4?=
 =?utf-8?B?enBDMGtlQWNRakhSRG9yVmtwNnB4VHh5M0NUQ2s3NitiWTBmZCt3MVhtWWxv?=
 =?utf-8?B?bkdoL0IwZkY1dm84ZWttVnpIL280RlJBWmVjdVUvdDFSd2tqcXMvbWVJdldY?=
 =?utf-8?B?OWJqZ0I4V1JDd0M0UkVCV05HZDYrWHVxZzExR1plVlNFY1pWUlFGSXR4Q3F1?=
 =?utf-8?B?Vk5lWVBLbEtsUTNrc3VuQ1BWbVVWTU1LN2Z5ZEUvNUE3WjZLUjdPV0ozQlc5?=
 =?utf-8?B?cHUvb0Y4YUd4TVQ2RE5lcW9KVWJJMVJTVEI0b1hER05NSjRyMjJ5VkJzd291?=
 =?utf-8?B?SEsvbldFZk9TSzJKT1VYMjJuQzh5cWtkZVVPVHBodnk4aWk2MGQzbWltWFEw?=
 =?utf-8?B?RUgwa0NHbzZDVE9LQ3dQb1VkTUdxMmEwaFE4MGNzMlF4ZWtIT0pETUIvUEVu?=
 =?utf-8?B?WHlZYVhteWVaRG5IYU80eXVrNXAxcWFUZjJ3bStCTjZDY3AxWWVIWkFRSmRP?=
 =?utf-8?B?R2dmb1k0cEgyWWRaMXFPS0JnajVOZVd5bTlLblV2eHFZcm4yWmxxTUx3VGxM?=
 =?utf-8?B?VTg0aDVPV2lucklWWFdFTERSSWR3SmVQNlV5YWd0Z1FBaVFNVFR6UlE0VGtI?=
 =?utf-8?B?UHloZi96ZzJRTGtTQVNiME1mR05DSlp0WU1hYXd1dW5mc1o3TkMxckc4TzRp?=
 =?utf-8?B?bUhDTGxLKzFwYTVzKzg0WTNBalM0aTVudUg2eHVuVTJIdXh2UDQ4a2tDYWFX?=
 =?utf-8?B?MEJkd1dRcFFOVDMvUlFjdC9mRERYUGpZZWV2TWVUSldjdlA4THJBa1N6QW5r?=
 =?utf-8?B?U01xOHB5R1UycjBSbEFMUjliRTUxQTRyOVVocjV3dXc5cE1TVXluUU9PU0Ey?=
 =?utf-8?B?S1RwL0tVZ3ExVlFueGNUelpURG9FWE5nQ3l6bjJGYnd4THhRYXVCQnRrMyti?=
 =?utf-8?B?RXk0cEN4UlpsMEs2YXdWaytPZ05IYTQ5ejNEQ2lzQUJadXZna2tLMDM4SFpw?=
 =?utf-8?B?WlV6cDhKUTRIOUozeklWOHRtZXJwcnhmbWw4TjlSVG1LQmZKSktaM244MVlq?=
 =?utf-8?Q?XRO59P/vlmAZJt70XxFKgIY9s7O+SixHGtmN9Ka?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f78bdb-f028-4943-f5a6-08d969378d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 08:49:16.4675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Vw+evIYvjSp101Rsys6yrxUwHUISURpPV5lAZu7txitaSVvB1jRBDScgOIy+Z4a7iDCVissZWpexkKqO+uWvPpWvtJWyxRoo14FH+th8oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3458
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBGcmlkYXksIEF1
Z3VzdCAyNywgMjAyMSAxOjQ5IFBNDQo+IA0KPiBPbiBGcmksIDI3IEF1ZyAyMDIxIGF0IDAzOjUy
LCBDaGlhV2VpIFdhbmcNCj4gPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+
ID4NCj4gPiBBc3BlZWQgNXRoIGFuZCA2dGggZ2VuZXJhdGlvbiBTb0NzIGFyZSBiYXNlZCBvbiB0
aGUgQVJNIDMyLWJpdHMNCj4gYXJjaGl0ZWN0dXJlLg0KPiA+IFNob3VsZCB3ZSBmb2xsb3cgdGhl
IHJlcG9ydCB0byBtYWtlIHRoZSBkcml2ZXIgNjQtYml0cyBjb21wYXRpYmxlPw0KPiA+IE9yIHJl
dmlzZSB0aGUgZHJpdmVyIHRvIHVzZSBtb3JlIHNwZWNpZmljIGRhdGEgdHlwZXM/DQo+IA0KPiBZ
ZXMsIGluIGdlbmVyYWwgaXQncyBleHBlY3RlZCB5b3VyIGRyaXZlciB3aWxsIGNvbXBpbGUgY2xl
YW5seSBmb3IgNjQtYml0DQo+IGFyY2hpdGVjdHVyZXMuIFRoaXMgaGVscHMgd2l0aCB0ZXN0aW5n
IGFuZCBzdGF0aWMgYW5hbHlzaXMsIHdoZXJlIENJIGJ1aWxkcyBhbGwgdGhlDQo+IGRyaXZlcnMg
Zm9yIHg4Ni4NCg0KVW5kZXJzdG9vZC4gV2lsbCBmaXggdGhlIGRhdGEgdHlwZSBpc3N1ZSBpbiB0
aGUgbmV4dCBzdWJtaXNzaW9uLg0KVGhhbmtzLg0KDQpDaGlhd2VpDQo=
