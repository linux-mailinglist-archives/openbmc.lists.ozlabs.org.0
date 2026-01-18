Return-Path: <openbmc+bounces-1225-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B1D39B22
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvTxL4DCkz2y7c;
	Mon, 19 Jan 2026 10:16:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4440:2::72d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768730342;
	cv=pass; b=HeSzMj+omf3uZXlBNSYXGbtbYYwY8g4OBQfTteFWMeikH6KE/o3LyHV2z1oq+62d3qTl3k+NB5q/GQ0WI8PCdPT4XMIygfmcrW0ZoQ0o8mj9/P6uN8/QNBjdnBgxtgrb+kwOAfQw0h63jc2pIzwf2lvZAQe4xxcVX8Y+XAPRYBFtQJp9s9zXp3OfT0VFCzIGWrTzn5yZRba+HRLUNoW6P6Lu0uEGw+mkkPi3uStaauMce18iuMyAbbqYsEuze/Vp55LQltbfD3JOwGz0M/KjBqMweGmjgs7aQVrbVw0Ceax4bCpK3gkDdnknMDWxKJ0wSyCAgvqOdeD2SktgynKk1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768730342; c=relaxed/relaxed;
	bh=rVb92VQFlnUCXX3scVQH7xkK4TP0exoUnm8bkkiMK+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ijmludQvieBT9A8LBO2wfXioiz03olHUMjWhBnRLzzfMkWlqvsWVGJPHUAKK9IxQDFuUqfkOw3NePZVR2EKhARJZ8vEnbdEMEiWPVhf2bV/lm3upxypQZQPDIP/AX+jS2b+r4pWYlcejivwTNf4/ltNW+wgO8j0ylmTn7ltAu56gXWIg7REW7eGaMCV8BAcvnTrWDl2gVNEh9cGPzVzCnSxZXTICiKJ+nHxhfipKJ/ad9W+V7BLwEydDxTNZwYuksTqW7QLfw3Rs3AAC/1QCV9mmo0sZYZgi7de/s07+UZ/XCaTugXEUsSDEITcKHl6bE8TSxaNz3+GAvCc7I3ItnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4440:2::72d; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=hal.feng@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4440:2::72d; helo=chn02-bjs-obe.outbound.protection.partner.outlook.cn; envelope-from=hal.feng@starfivetech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2090 seconds by postgrey-1.37 at boromir; Sun, 18 Jan 2026 20:59:01 AEDT
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2072d.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4440:2::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dv8F10Zl7z2xJ5;
	Sun, 18 Jan 2026 20:58:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UERXgyI+UaIyy3JDSI818uIqe3WND+egRmHgAGoK86Orx7NWW7dcwRX3/UBVBPHt4rbX3U2N3jGcAK8Xid5X1L9LW0GR90iYLactwcxD9G36jN75AIN5vz/OtfdWBKM+ZkUORlQea/+22vsDjJD2usFB6Rc66rCjtUZutPYdgwVhJglwKzzBuRnTBHmT5vhBZQUWA0Q7n1diUYieOkM4qn8qnvq5Xpo1oBvamRLVYK0vAhhdiR6Cf6jpBqgykOIIyuYTHRA148d7jeDS/KhqK2yxFajjuP+CL6pswxIx5/lI+GGZsdDaJVCIFLGD1w0qMzcL8aMqb4zqaGe4rdYk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVb92VQFlnUCXX3scVQH7xkK4TP0exoUnm8bkkiMK+g=;
 b=lDB3SXdhhJvmqzXHQOP/WdJ+pdW23uCU+fxtcBWEAi4wmmGf19/GGs4mWulHa/XO+bTlJnou6KWbWUCV+H4+RFl2FCraglLgq8p6UevdK+/+0R1v4pzqBtNQhKh1PqEbGniW/Sa3VTtWdzU3dLHdKM6KZ85gnadcYcMe4A0FT4x7+44r7bnMcaNYsd3zYp05WIxi2LCD11rI9iNb3HxVU92+zoiWMe08+GiNW3XVxU5D708UYxx4hYWaVSJ8112Nm/sV1RwOzSGBxSVcdUqcC4b3/HXqZuXvpHfGepTLVMBXDy4IxjZ31l5ED0uLkYbG24FQ1oc8HMOnVB0L/w2tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1180.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.20; Sun, 18 Jan
 2026 09:23:39 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%5]) with mapi id 15.20.9456.017; Sun, 18 Jan 2026
 09:23:39 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Emil Renner Berthing <kernel@esmil.dk>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Basavaraj
 Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>, "UNGLinuxDriver@microchip.com"
	<UNGLinuxDriver@microchip.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sophgo@lists.linux.dev"
	<sophgo@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>
Subject: RE: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Thread-Topic: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
Thread-Index: AQHchWq5KmaCZ1Z2K0SftDbpzO5vrbVXrE/A
Date: Sun, 18 Jan 2026 09:23:39 +0000
Message-ID:
 <ZQ2PR01MB1307257B9A1982C04E5FAD91E68B2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References:
 <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
In-Reply-To:
 <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1180:EE_
x-ms-office365-filtering-correlation-id: fd1671ca-22ab-4215-e687-08de56734405
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020;
x-microsoft-antispam-message-info:
 e4o3UnJvqJe9erY/pdX1X5PeTXW9OqjUEZuHCRev/8htwkdpV2ErE9crW9i5GDNte50D6prMXq/NtcK7G8gUQSj4XjGUKjAR7fbmhin/+bBEnjd5dmfW/zvDcHkf/h/khmh434wq+J6Od23m0zJvpGZpblyMkTFgqX+zdKZaRvRDgVAT2NJbZejmpe5Wu6Uvy0tvASDFCBPEOoU99ZkMYIgBMcdYsBGzlHUDYP0dU6VelZq8eCA5xWsr1Rbv8gLFuWI5oZEtQ3LRAGHcIKjEXtt1/9psxAdUcthNgYNNQMQc1ZxNs2nf25oZYOTsljNKW0BhD5gabrDs5LbTpBco0AZzzXtUrp91NROzUxcAsetrczT9xIUp7+i8+3vH0crk1NY2L5h9eX4HoZ4bYb4n40Mu87OAv2HgIdUHYvjNkCueVKKH8ExNiSKtx+231+dU4Ubt/ZNIVW3RtveQPUYptFwX8LxNJGoyVq38iBaa+rYCJvdTWpgO8A748RSQOed5RwnEljrVBglkDvkg/NYjnZw93VqOAapFoaziF0Jz73khK1J/WNhkOLG0Iqui6oP29hosYJY9ACoPys3PeIwTjaf2KoPslpOJIxQ7p8GQ/tU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2RWNmc5NEp0d1U3V3hPMThMVVlLRHNvUG1OOGFqaUtmV1dFNkF5d2FvNjJq?=
 =?utf-8?B?M0lqOFRMUThCeGdUOVJvY01KYmY0Q0FTbVVFOWdRZ2w3OEtsSHRXaXlOcmMv?=
 =?utf-8?B?cjlaMkZyamJ0cEZoRjI4cjRwZW1QRUlQRFhTaEptUWFaR2ZjSWlxd2tETW5z?=
 =?utf-8?B?WlFoaHREN25WUnU1TlUwRmNlZVNoUzl0aDZXZmNsV05KV0VRT0lMYWUxRnNC?=
 =?utf-8?B?YVk3QVRlcHdwY0QxMFMwWXFnTVhOaXdtV2V6OUdwV08xK3lCdFUwT0U2Y24x?=
 =?utf-8?B?a0VlQWNwV2F6OVRmZGdnQmRZWE1meXVQSDNTTHRiRTBPM1BCOEN3QVIzYmlO?=
 =?utf-8?B?OGNkTk1KVGlLYUFub0pwSDFpWFZuYnZvcjlKc24xQVh5M3hPSDZOSjYybTlC?=
 =?utf-8?B?Z2U2NmJ4a2V6UWI0RVJMTkFVS0Y3V09XUXdvMVMwdFFDRy8wYmFlZVY4OFhj?=
 =?utf-8?B?M2F0eDBBVWZabW9HaTh0NzRDVnR2Y29FdEFoRjRLRFUvTE94RGdyMS9JaDJj?=
 =?utf-8?B?Q3FuYUFCa3h1ckh6T1BFSWpMa29BYzh5SEk3RjJndU5ucjZrRS9KQ0h4TjZQ?=
 =?utf-8?B?MHBDQXFsN1dYQ2VSVHBaYVV0WG04cDFhSUhWUXk3L3pyWFNReUltOFN1bGxs?=
 =?utf-8?B?SHlDSmJ2bzJObUJETXl1bk1jejdWdEN0dVB4dkFOcGhOdzdGZjhvK09weW5X?=
 =?utf-8?B?Rk9ncXZUQ0k5TTJkUVFsZjBRWWtCOElrMmJGVGZaUjFRbElnT2Z4Nm5odmpa?=
 =?utf-8?B?aHhFd3Y3QUYzV0FzRFhkalBKcHNPK25XdHdMbHJ4NWtoUSs1dDVVNnRveEcv?=
 =?utf-8?B?WStZWjhjd3p6VkpEejcvb3k5V1ZPcS8yWFFGcnNCSjNvR0gybnAyb0dUVVBL?=
 =?utf-8?B?SWxwL3VuclFzVWErK2VQckl3b0pZb2xBV28zclpQdjFZMU1MTWRidU1DMEM2?=
 =?utf-8?B?cGRDT1JXY3FRUndMYWlhZEZmV21BV29MNm92TStYREQ0K0ZuU1Evc3h3ZG1H?=
 =?utf-8?B?Q2xOLzl4bGdUUnNNcGQrcmd1UWJ2NmpQZlczbDJuZEFYUmQ3SXoycjRObU9Q?=
 =?utf-8?B?OU1TSUdraWhWMTRsY29IeldLdDhpSXpQbmx4UjdwNDdEYVNCNGh0WTdvS3Q0?=
 =?utf-8?B?OU9EU29PVWFGcnA5elVrcm5pbUNzUUpHTXFYYjc2YnNTejhIQisxZkVjTUVk?=
 =?utf-8?B?UTIrem9LYlJWYUd2c2JSeGZna0Z0SG1oM0dpYmxNb0c0V0dORHM4emljVWVC?=
 =?utf-8?B?RXdUQkxxRkhnSGxSUzd6bHVKTi9aQnJWSVl2KzNnWHZZeElFWmJQc2ZSeE96?=
 =?utf-8?B?dnNWbVo1TzZYRDVpbUVKS0d6YitPSkx5d1pCOVlVV0NXekMvdkF0cUdzcUVG?=
 =?utf-8?B?UkJEUU1URXJEVzNEMDRhZ3hkYjlCdk8wcTBCVVpXekc4bnkrekFjdXNsT1hi?=
 =?utf-8?B?d3QxelQrMEdGRk42ZldPZlRUZWtBYTF6NjdnZStQcnh3NDVqVVkzUXVkd0Rn?=
 =?utf-8?B?bjVPUklUOHBXdXRSZTdOYTZodEZ4cjdCTCtPNmJ2aWVGYWxqYW9jdDNDWlRO?=
 =?utf-8?B?dEVkMVpxQm5HRXF2OGtsdmpMRnViZUQ4UnloZExrQlBLUmtVUDhKTlVhTTBr?=
 =?utf-8?B?NTRKZGU0TFpXYTIxdTJzTW5oa1o5ZVNVVlJ0bS95QVhwbVJVRjU3cHpmNVNp?=
 =?utf-8?B?ODRMa0VURVQ5c3V6MUpodU84MGNDRmVRTHBkR3cxUEVhY2F5VjlaSWcwYk1o?=
 =?utf-8?B?eHJtRXdkcEd0cWo5U1owVGY4SWVaODl1T1VkY3huZkhvQkQ4cXFPbWtFQjZW?=
 =?utf-8?B?ZVJubC9venl2bm5Qc3lFTDI5QlFUdC9tcy9LblpudnFGSjRxNXFiaXBLYkls?=
 =?utf-8?B?UFFkajZXUmgwQWpsM3RJQkF0RUN5anpWdkdYUlRTMCsxZFRCd2s1alE0aE82?=
 =?utf-8?B?bjI5Zi9RQkhtZFpFYkk3OTk5clAvbnJnWmpPTGUvLzI3ZTIybU9PVjgyNzJ1?=
 =?utf-8?B?dWlPS2IvRDkwOVRYVEJqTHFFNXlmb1VZS1dCRVJyVCt6blJGb0s3OTNyT0o0?=
 =?utf-8?B?dTkxcnNieXhJVFUvMXlQdk5VdWt4WUxDUlJGUHVxbWVHM01ZVVBIbHhqZXZq?=
 =?utf-8?Q?TGN9qNv3epBdYVB8yfHVotHpV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1671ca-22ab-4215-e687-08de56734405
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2026 09:23:39.5572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7qAZ2dkN+fiUBxvxj+SFcywzErcuf7jt0q4HwjxRaVKaZY1Jtim69+ImvlESvMVfc9PFLUkQ/H+u5rz56Y5rkJr/+gkagwZm3fk7WqHAiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1180
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBPbiAxNC4wMS4yNiAyMzozMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gUmVtb3Zl
IHVudXNlZCBpbmNsdWRlczogbm8gY2xvY2tzLCBtdXRleGVzIGFuZCByZXNldHMuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tp
QG9zcy5xdWFsY29tbS5jb20+DQoNClJldmlld2VkLWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3Rh
cmZpdmV0ZWNoLmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KSGFsDQoNCj4gLS0tDQo+ICBkcml2ZXJz
L3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMTAtc3lzLmMgfCAzIC0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamg3MTEwLXN5cy5jDQo+IGIv
ZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamg3MTEwLXN5cy5jDQo+
IGluZGV4IDliNjcwNjNhMGIwYi4uNDRmODRlNGMyOWJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3BpbmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMTAtc3lzLmMNCj4gKysrIGIv
ZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlL3BpbmN0cmwtc3RhcmZpdmUtamg3MTEwLXN5cy5jDQo+
IEBAIC03LDE0ICs3LDExIEBADQo+ICAgKi8NCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvYml0cy5o
Pg0KPiAtI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJp
dmVyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2Rf
ZGV2aWNldGFibGUuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gLSNpbmNsdWRl
IDxsaW51eC9tdXRleC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiAtI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2su
aD4NCj4gDQo+ICAjaW5jbHVkZSA8bGludXgvcGluY3RybC9waW5jdHJsLmg+DQo+IA0KPiAtLQ0K
PiAyLjUxLjANCg0K

