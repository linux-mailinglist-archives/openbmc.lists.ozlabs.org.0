Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D89945E474
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 03:28:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0dvx3BXtz3bN8
	for <lists+openbmc@lfdr.de>; Fri, 26 Nov 2021 13:28:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Q84K+BiZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Q84K+BiZ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0dvH6mNZz2yNW;
 Fri, 26 Nov 2021 13:27:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SE4uOUp5lnZYi4k9u41Jp/MvWwdQF4/9RlVpwaVpSOgBJofGdytKid1RHyw9vVdIOSREW58u5SmVKw0cK6lhZ8dLAVCglnMaDdygnofKJV1GBeoOgyeitTqOA5QrYiQdVWvBKLWC+nozy+qTZWV2cVPbIwVg+itaDE4HXurDowi6yJmECqYqI/Uj1HvNRLJG8biBc/MJt8orrl/4f/62K5Ug4fLCSNl06SInxFiG495HRyHjiefZ10yuELKCv2CHccgpp2VkePO4FiQghFHzRV6zs5ciK587uW4StX6T/SY0Eh2k8R/iPtKbRJEDx0Kt/loshztRiWvblDG3jYRzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nroeTuJ3oT878ADYqs1MyZTB89FhW4yGCFtzJ/u/oDc=;
 b=V0RH/SARDYLRFMSoKdXhUtEiiMgrInJxkzgS3bZJUxSshV3kLMiGdXZl5rXkaPhtn0D//bpTv7bdGqdJEK9uwMTOD3zfgd71i34G/3lsGQEop3xWOLF0Vg0gPjFydGvz6MMFmaGOUOwU16et4X7ayQMyT35OFscKkAKFzksB0sPn2J2FTxLRfS7tiYcLjTkhlOJV12yF40xeuM/24nLORhGGvfKhPCgdjgN0AnhhpZ69mkT1YL+fTl27yanC9+W+Pr6v5++HMjLmA/IBHB64erGGdEkGyxskG7fkSKdMNi9x32lgBkAXaCKjesSdnbE1d/pn/QwFtngDpW6QOT65ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nroeTuJ3oT878ADYqs1MyZTB89FhW4yGCFtzJ/u/oDc=;
 b=Q84K+BiZW4Ye988q7wIkg7nMNchYnGXk7O9Xvn4M+7Hg4mI3Mm7BYOeOuuXraJJFoD4NtdLz6uiX9WtwojQmS0iF8JbEQvgkh+PDDyJrV/3VYGi6J540m5FZfMLuNVzPulxILccHr1aHIDNPYsjcq//+s432yJBsnpCs06MlRzNQ28dV5ZByiFaNMs39jjTQuvsvkrUjDc11OzievAam0YrQbCuRuMImoV4Ll4fJgVCynxLILBdGGM7BuyQH/9ygyAE/bT4NoyVH90o5LK/4Mh1H8NgBnoRjjC1UU9vRhzx6gEBiB5T26e1RVZb0xojKIiChkjLKTnXQ1sOo9Z/nvQ==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by HK0PR06MB2545.apcprd06.prod.outlook.com (2603:1096:203:6a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 26 Nov
 2021 02:27:29 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::399b:41fb:d745:beb0%5]) with mapi id 15.20.4734.022; Fri, 26 Nov 2021
 02:27:29 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH 01/10] clk: aspeed: ast2600: Porting sdhci clock source
Thread-Topic: [PATCH 01/10] clk: aspeed: ast2600: Porting sdhci clock source
Thread-Index: AQHXyjAm2Joa/cUtbEObI5DULpTJPKwVRIog
Date: Fri, 26 Nov 2021 02:27:28 +0000
Message-ID: <HK0PR06MB2786FC6CB0CFEAED52ACD793B2639@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <20210922103116.30652-1-chin-ting_kuo@aspeedtech.com>
 <20210922103116.30652-2-chin-ting_kuo@aspeedtech.com>
 <24f55e7d-2f2d-2181-2265-7365d648be8f@molgen.mpg.de>
In-Reply-To: <24f55e7d-2f2d-2181-2265-7365d648be8f@molgen.mpg.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a864f4f1-12b0-412d-2dd1-08d9b0844b18
x-ms-traffictypediagnostic: HK0PR06MB2545:
x-microsoft-antispam-prvs: <HK0PR06MB2545D8E1588544FEB7A3BAEDB2639@HK0PR06MB2545.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q051qu7rx2ZNbj1MH7pQ1/9Ml7qmNggA4eg0BA2EBNbdkD9xfOq2Pl/jnZBU4dDIO8b/7wyW1kPzIG/ZkipyVhFnEpaN8d+wBHOlGt6qHlZKCFrzK+GmmIpDjctki7H5zv8Z5+vw45c5CSjRGdfgst4iUWuuukKbYn6n4QuZtfeRS4BG8sHLLJAEsuZNqR1KKgh4st57Nz1uAJPhT6KR3QOmoLTyoupRV7sLaBzOKqa3iE8PVRbPxyHer2TKA2uI1BHwh3ZZTNXJsF/4nIbkH6oOICurmhOQBGH226Sh1gHXqrE8BJakmBH037NAD/ZHwdz+lRQMOnLhx/0ElLcfMvKZ6U7JA0BWrxXRc0FlvYhryr0cQXArbCgCGWB4VE0DgmRHnlE72CHMs3erF7nHTwLxtTSPAIIG4w1lFLTw4W8BUN9DokzuxyTBbiYhrvjlokBdsItmBR1KFEb6agn8bYJV6HyUq7i7SiR2YeJPEDZk+39kSv3MDpMxuBhzJHZPfG0KOp/mUm1nL/p36TTAxl6Fiajh1m3S5Yf6tbherBTCi6JkofHPQV+tKGQJ8vmH1THf1kbVD349Een4Z5bvifimW6f0sdrbP3+AFZO+HydY0PzTeQ0oUSiTEFOXXYBSDTEskT0OGmFGnR/oXbsuAP3t22BQruEtSwIVuTgD6z+97bxJMIeMmzNRGYshYj67D2DDd6QJvw1kFKEyuHFmhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39850400004)(376002)(366004)(66946007)(8676002)(76116006)(71200400001)(38070700005)(8936002)(122000001)(66556008)(316002)(53546011)(66476007)(64756008)(66446008)(7696005)(6506007)(26005)(2906002)(83380400001)(6916009)(38100700002)(508600001)(52536014)(7416002)(33656002)(55016003)(86362001)(9686003)(107886003)(4326008)(54906003)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnhORis5QmR5S3JlaFlBRTJCQjF5a01EWGhteWRDcisrTFJuUXRXeDdWc1JN?=
 =?utf-8?B?OUtJSExSdkQzN250cmxIT3kyaHczMWY2S25PaDZWazV0dGZWY0JYTXUvV3ZV?=
 =?utf-8?B?bVUvRTlRRVRlMStFaGF3dXZNNFlWTDlzNnArd0plNUVTQjNlam1UTUlxaE1N?=
 =?utf-8?B?SWc1RkRBTjA3Wi9EUzZ1Tm9PMDNiMzNoOG9BVHFzazRkUU9xMDlTR1BqaFRr?=
 =?utf-8?B?Uktab2tBRUxhS0hoUXlTV3VoUnljRE1mWC9iUG1ITnozTW8rMXNxZys3ckI4?=
 =?utf-8?B?Zm9tcUJpdVNxL2pBWGpiSHBWc0RBYVRpd1VPSGFtRU1kUU1KNkpqZnNkS3Rv?=
 =?utf-8?B?dGVORlNUSENBeCtrSGgvM0tVRHd5YmVkY01XcTNSSUFldkpFWUd3aExtb3Vt?=
 =?utf-8?B?MXpLM2diWHFwTUsvdldNa1lzV3dyNzBRdEtmUVE4K2hSOThFdUNVYUZNeUhw?=
 =?utf-8?B?a0NicDVtdXZLa1NGYjY2ZWljNksrdFo0NWpEZ2QrSFU0MDkvMVRPTm42b2NP?=
 =?utf-8?B?NnFZRDdac21BREUxdEJzdGFWbmRob1VJdTNKWjFDWTRkQmxoUmxwMHMxMDZD?=
 =?utf-8?B?RzNEbllGTng4U2JxYTlCQ2UrSXRqdGxsanJIMG55UkZ6L1k2TVB5MWovTzVF?=
 =?utf-8?B?RWovWnV3ejVMQmVFbG14eVdrRmVrMWFWWWlRZy9QcUk4NkNBTkZidTZCbWI5?=
 =?utf-8?B?ckN1MGVRUVFFNEd2S0Y4YjVnNnp6VHhzYlpFMW9ybUFrTGR1VkpRenNrbkd1?=
 =?utf-8?B?dkdtNTBUTlNBdzZRa0lQaWVZdHZZRHFtZ3UxRWcxTXNzYmdxTjlzUTlHWkhq?=
 =?utf-8?B?ODJIR2VBM2pldFEvWFJxdVJsM0tlU24wZ0Z2U1VmRmt4YnVqWWNmYXpjMmNP?=
 =?utf-8?B?U2hXRmdqNWc4ZjhOZ3JtTkl0ZVBaK2tIaUhyRDFhOG80MzNwZTAzUlozWUFh?=
 =?utf-8?B?WUFwT2MwUmZsNmxMVVl3S2VoZEk4M0QvWGV3TERGeDZZSmJTNVBsRTE3Ri9u?=
 =?utf-8?B?NHcvOWdRSmVWMzRlQWplZUx3bmpKMnBibmthejRCc2ZiYjBmeTR3eE5aZnNZ?=
 =?utf-8?B?aEY4ZStHWkxaQ1kvd3RuNnZXMzdVVWVSWXM3L3k0WE9hWE9rSFBIYkFxMlNz?=
 =?utf-8?B?ZHpXNWROL3dPZFY0NTU5QjNKTkpON2lkSGRPZi9LL1o1VWZxWitFYVdacWhP?=
 =?utf-8?B?VG9SYW9kU0VLOTJ6blhlejBtZGVQMndUdXIyOU95SmdFOVFsL0wxZWJpSzMr?=
 =?utf-8?B?VFFHT1VFSEk3dGlBd2tBN1dKeUszNTNBaCt1TE1CTXlQQzBwYlBRQlZBdXJi?=
 =?utf-8?B?ZFM1R1dyZlNrWmtHVVBzMzI1S1BYcDV4T0dVSlJodmk0cnovdStQWWR6WUNp?=
 =?utf-8?B?TnpRWWpzcFo5Qm51SEp0ZXdYM1FiMEIwRFphL3YxTlhWQ1RCblRSSWJJMWJj?=
 =?utf-8?B?NU93OUxSekUyVExuSlIwOTlLdnVtSUQ5NVhwSFM2YjA4b3F4VjFPZmpPYzhP?=
 =?utf-8?B?cFpoREhwL1ptMGR1Q0xVVEdNdW1kQlNpRlR6R0l2UzZCS1o4d3MyZ21MQnAy?=
 =?utf-8?B?cmJzSjc1VTFrbS92S3RqRHloLzZYczRQaXRPZElCK1JBbUhjN1ljY0M4enlt?=
 =?utf-8?B?UFZKUjhTYjZuZ2RXQUdmTzJlUGowQ3JqMDZ1RUo1ZkNNR1hCNGZqT25neEly?=
 =?utf-8?B?RHhzY3FzOGZyWDdsalhSeGFHMkhMSm5VMGhabWt1MTdrVDFGUTg0QWMwcEZG?=
 =?utf-8?B?K05IRW1aUmoyMWE5TlN3VTJFdkVqS2tRYi9TK1BuZzZ3Sy9PcG42WXkySHV2?=
 =?utf-8?B?a0dOK3l2eDJJdGlhV2Z0SXRGeFRRRkZHb2tBakZLTm9TVSs3dURkMVpaSjVx?=
 =?utf-8?B?dCtOQ3RzMkwyR3A1YkpsdUhFRTJZU1ZHV3dwZ3g4dThNYi8rNlhPd2ZFdDhN?=
 =?utf-8?B?Q1UwOVlmTmhWU0lOaFpJVXFvdDZhcVptMEdtTHJZSVlvOU1Obm85UEx4ZmhG?=
 =?utf-8?B?bytOVFB1WkIraTBzZk5yQjJ1cnByUjJLdStBQWdYZ2s1K1hlaVRFS3ovc1Q4?=
 =?utf-8?B?UDVwWGJ0YjVKR24xSkZrZWhWdUdrUzdXUGY0L2JvUmcwbmZnMVRKTGs5SFFS?=
 =?utf-8?B?L0MzcHZva2pnVERpd2FJSy9ERXgvamlja3dZUVQwRFR0aWw5bFlZMkJlTGdz?=
 =?utf-8?B?R25XSmRjRWRpTnlTbjhhV3hUU04zTHpvUnV4Y216Q0djSTlSTWxka0FWQXlI?=
 =?utf-8?B?VnRySEluVnV3N1luMU1BdVFOSElRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a864f4f1-12b0-412d-2dd1-08d9b0844b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 02:27:28.9564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9bb2x3JR/m+faSDc1Dvhi8+Fj+p+pHzH91VROyAqMY/KtgMrRGQnNyisQ9nkyo55UvIZhFQSC4nXWutQXNrwM+gB3qm5RE9B46cRxmzb6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2545
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
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 BMC-SW <BMC-SW@aspeedtech.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF1bCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1l
bnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI2
LCAyMDIxIDI6MTAgUE0NCj4gVG86IENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVk
dGVjaC5jb20+DQo+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IGpvZWxAam1zLmlkLmF1OyBtdHVy
cXVldHRlQGJheWxpYnJlLmNvbTsNCj4gc2JveWRAa2VybmVsLm9yZzsgYWRyaWFuLmh1bnRlckBp
bnRlbC5jb207IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOw0KPiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc7IGxpbnV4LW1tY0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmc7IGFu
ZHJld0Bhai5pZC5hdTsNCj4gQk1DLVNXIDxCTUMtU1dAYXNwZWVkdGVjaC5jb20+OyBTdGV2ZW4g
TGVlDQo+IDxzdGV2ZW5fbGVlQGFzcGVlZHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDAxLzEwXSBjbGs6IGFzcGVlZDogYXN0MjYwMDogUG9ydGluZyBzZGhjaSBjbG9jayBzb3VyY2UN
Cj4gDQo+IERlYXIgQ2hpbi1UaW5nLA0KPiANCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRj
aC4gU29tZSBzbWFsbCB0aGluZ3MuDQo+IA0KPiBQbGVhc2UgdXNlIGltcGVyYXRpdmUgbW9vZCBp
biB0aGUgY29tbWl0IG1lc3NhZ2VzIHN1bW1hcnkgWzFdOg0KPiANCj4gY2xrOiBhc3BlZWQ6IGFz
dDI2MDA6IFBvcnQgU0RIQ0kgY2xvY2sgc291cmNlDQoNCk9rYXkuDQoNCj4gT24gMjIuMDkuMjEg
MTI6MzEsIENoaW4tVGluZyBLdW8gd3JvdGU6DQo+ID4gLSBUaGVyZSBhcmUgdHdvIGNsb2NrIHNv
dXJjZXMgdXNlZCB0byBnZW5lcmF0ZQ0KPiA+ICAgIFNEL1NESU8gY2xvY2ssIEFQTEwgY2xvY2sg
YW5kIEhDTEsgKDIwME1IeikuDQo+ID4gICAgVXNlciBjYW4gc2VsZWN0IHdoaWNoIGNsb2NrIHNv
dXJjZSBzaG91bGQgYmUgdXNlZA0KPiA+ICAgIGJ5IGNvbmZpZ3VyaW5nIFNDVTMxMFs4XS4NCj4g
PiAtIFRoZSBTRC9TRElPIGNsb2NrIGRpdmlkZXIgc2VsZWN0aW9uIHRhYmxlIFNDVTMxMFszMDoy
OF0NCj4gPiAgICBpcyBkaWZmZXJlbnQgYmV0d2VlbiBBU1QyNjAwLUExIGFuZCBBU1QyNjAwLUEy
L0EzLg0KPiA+ICAgIEZvciBBU1QyNjAwLUExLCAyMDBNSHogU0QvU0RJTyBjbG9jayBjYW5ub3Qg
YmUNCj4gPiAgICBnb3R0ZW4gYnkgdGhlIGRpdmlkZXJzIGluIFNDVTMxMFszMDoyOF0gaWYgQVBM
TA0KPiA+ICAgIGlzIG5vdCB0aGUgbXVsdGlwbGUgb2YgMjAwTUh6IGFuZCBIQ0xLIGlzIDIwME1I
ei4NCj4gPiAgICBGb3IgQVNUMjYwMC1BMi9BMywgYSBuZXcgZGl2aWRlciwgIjEiLCBpcyBhZGRl
ZCBhbmQNCj4gPiAgICAyMDBNSHogU0QvU0RJTyBjbG9jayBjYW4gYmUgb2J0YWluZWQgYnkgYWRv
cHRpbmcgSENMSw0KPiA+ICAgIGFzIGNsb2NrIHNvdXJjZSBhbmQgc2V0dGluZyBTQ1UzMTBbMzA6
MjhdIHRvIDNiJzExMS4NCj4gDQo+IFBsZWFzZSByZWZlcmVuY2UgdGhlIGRhdGFzaGVldCBuYW1l
IGFuZCB2ZXJzaW9uLCBhbmQgcGxlYXNlIHJlZmxvdyB0aGUNCj4gY29tbWl0IG1lc3NhZ2UgZm9y
IDc1IGNoYXJhY3RlcnMgcGVyIGxpbmUuDQo+IA0KDQpPa2F5LCBpdCB3aWxsIGJlIHVwZGF0ZWQg
aW4gdGhlIG5leHQgcGF0Y2ggdmVyc2lvbi4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGlu
ZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2Nsay9jbGstYXN0MjYwMC5jIHwgNjkNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9jbGstYXN0MjYw
MC5jIGIvZHJpdmVycy9jbGsvY2xrLWFzdDI2MDAuYw0KPiA+IGluZGV4IGJjM2JlNWYzZWFlMS4u
YTY3NzhjMTgyNzRhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL2Nsay1hc3QyNjAwLmMN
Cj4gPiArKysgYi9kcml2ZXJzL2Nsay9jbGstYXN0MjYwMC5jDQo+ID4gQEAgLTE2OCw2ICsxNjgs
MzAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlIGFzdDI2MDBfZGl2X3RhYmxl
W10NCj4gPSB7DQo+ID4gICAJeyAwIH0NCj4gPiAgIH07DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBjbGtfZGl2X3RhYmxlIGFzdDI2MDBfc2RfZGl2X2ExX3RhYmxlW10gPSB7DQo+ID4g
Kwl7IDB4MCwgMiB9LA0KPiA+ICsJeyAweDEsIDQgfSwNCj4gPiArCXsgMHgyLCA2IH0sDQo+ID4g
Kwl7IDB4MywgOCB9LA0KPiA+ICsJeyAweDQsIDEwIH0sDQo+ID4gKwl7IDB4NSwgMTIgfSwNCj4g
PiArCXsgMHg2LCAxNCB9LA0KPiA+ICsJeyAweDcsIDE2IH0sDQo+ID4gKwl7IDAgfQ0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlIGFzdDI2MDBf
c2RfZGl2X2EyX3RhYmxlW10gPSB7DQo+ID4gKwl7IDB4MCwgMiB9LA0KPiA+ICsJeyAweDEsIDQg
fSwNCj4gPiArCXsgMHgyLCA2IH0sDQo+ID4gKwl7IDB4MywgOCB9LA0KPiA+ICsJeyAweDQsIDEw
IH0sDQo+ID4gKwl7IDB4NSwgMTIgfSwNCj4gPiArCXsgMHg2LCAxNCB9LA0KPiA+ICsJeyAweDcs
IDEgfSwNCj4gPiArCXsgMCB9DQo+ID4gK307DQo+ID4gKw0KPiA+ICAgLyogRm9yIGhwbGwvZHBs
bC9lcGxsL21wbGwgKi8NCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgY2xrX2h3ICphc3QyNjAwX2NhbGNf
cGxsKGNvbnN0IGNoYXIgKm5hbWUsIHUzMiB2YWwpDQo+ID4gICB7DQo+ID4gQEAgLTQyNCw2ICs0
NDgsMTEgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmNvbnN0DQo+IGVtbWNfZXh0Y2xrX3BhcmVudF9u
YW1lc1tdID0gew0KPiA+ICAgCSJtcGxsIiwNCj4gPiAgIH07DQo+ID4NCj4gPiArc3RhdGljIGNv
bnN0IGNoYXIgKmNvbnN0IHNkX2V4dGNsa19wYXJlbnRfbmFtZXNbXSA9IHsNCj4gPiArCSJoY2xr
IiwNCj4gPiArCSJhcGxsIiwNCj4gPiArfTsNCj4gPiArDQo+ID4gICBzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHZjbGtfcGFyZW50X25hbWVzW10gPSB7DQo+ID4gICAJImRwbGwiLA0KPiA+ICAg
CSJkMXBsbCIsDQo+ID4gQEAgLTUyMywxOCArNTUyLDQyIEBAIHN0YXRpYyBpbnQgYXNwZWVkX2c2
X2Nsa19wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgCQlyZXR1
cm4gUFRSX0VSUihodyk7DQo+ID4gICAJYXNwZWVkX2c2X2Nsa19kYXRhLT5od3NbQVNQRUVEX0NM
S19FTU1DXSA9IGh3Ow0KPiA+DQo+ID4gLQkvKiBTRC9TRElPIGNsb2NrIGRpdmlkZXIgYW5kIGdh
dGUgKi8NCj4gPiAtCWh3ID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUoZGV2LCAic2RfZXh0Y2xrX2dh
dGUiLCAiaHBsbCIsIDAsDQo+ID4gLQkJCXNjdV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxF
Q1RJT040LCAzMSwgMCwNCj4gPiAtCQkJJmFzcGVlZF9nNl9jbGtfbG9jayk7DQo+ID4gKwljbGtf
aHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZShOVUxMLCAiaGNsayIsIE5VTEwsIDAsIDIwMDAwMDAwMCk7
DQo+ID4gKw0KPiA+ICsJcmVnbWFwX3JlYWQobWFwLCAweDMxMCwgJnZhbCk7DQo+ID4gKwlodyA9
IGNsa19od19yZWdpc3Rlcl9tdXgoZGV2LCAic2RfZXh0Y2xrX211eCIsDQo+ID4gKwkJCQkgc2Rf
ZXh0Y2xrX3BhcmVudF9uYW1lcywNCj4gPiArCQkJCSBBUlJBWV9TSVpFKHNkX2V4dGNsa19wYXJl
bnRfbmFtZXMpLCAwLA0KPiA+ICsJCQkJIHNjdV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxF
Q1RJT040LCA4LCAxLA0KPiA+ICsJCQkJIDAsICZhc3BlZWRfZzZfY2xrX2xvY2spOw0KPiA+ICAg
CWlmIChJU19FUlIoaHcpKQ0KPiA+ICAgCQlyZXR1cm4gUFRSX0VSUihodyk7DQo+ID4gLQlodyA9
IGNsa19od19yZWdpc3Rlcl9kaXZpZGVyX3RhYmxlKGRldiwgInNkX2V4dGNsayIsICJzZF9leHRj
bGtfZ2F0ZSIsDQo+ID4gLQkJCTAsIHNjdV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJ
T040LCAyOCwgMywgMCwNCj4gPiAtCQkJYXN0MjYwMF9kaXZfdGFibGUsDQo+ID4gLQkJCSZhc3Bl
ZWRfZzZfY2xrX2xvY2spOw0KPiA+ICsNCj4gPiArCWh3ID0gY2xrX2h3X3JlZ2lzdGVyX2dhdGUo
ZGV2LCAic2RfZXh0Y2xrX2dhdGUiLCAic2RfZXh0Y2xrX211eCIsDQo+ID4gKwkJCQkgIDAsIHNj
dV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJT040LA0KPiA+ICsJCQkJICAzMSwgMCwg
JmFzcGVlZF9nNl9jbGtfbG9jayk7DQo+ID4gICAJaWYgKElTX0VSUihodykpDQo+ID4gICAJCXJl
dHVybiBQVFJfRVJSKGh3KTsNCj4gPiArDQo+ID4gKwlyZWdtYXBfcmVhZChtYXAsIDB4MTQsICZ2
YWwpOw0KPiA+ICsJLyogQVNUMjYwMC1BMi9BMyBjbG9jayBkaXZpc29yIGlzIGRpZmZlcmVudCBm
cm9tIEFTVDI2MDAtQTEgKi8NCj4gPiArCWlmICgoKHZhbCAmIEdFTk1BU0soMjMsIDE2KSkgPj4g
MTYpID49IDIpIHsNCj4gPiArCQkvKiBBU1QyNjAwLUEyL0EzICovDQo+ID4gKwkJaHcgPSBjbGtf
aHdfcmVnaXN0ZXJfZGl2aWRlcl90YWJsZShkZXYsICJzZF9leHRjbGsiLA0KPiAic2RfZXh0Y2xr
X2dhdGUiLA0KPiA+ICsJCQkJCTAsIHNjdV9nNl9iYXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJ
T040LCAyOCwgMywNCj4gMCwNCj4gPiArCQkJCQlhc3QyNjAwX3NkX2Rpdl9hMl90YWJsZSwNCj4g
PiArCQkJCQkmYXNwZWVkX2c2X2Nsa19sb2NrKTsNCj4gPiArCQlpZiAoSVNfRVJSKGh3KSkNCj4g
PiArCQkJcmV0dXJuIFBUUl9FUlIoaHcpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQkvKiBBU1Qy
NjAwLUExICovDQo+ID4gKwkJaHcgPSBjbGtfaHdfcmVnaXN0ZXJfZGl2aWRlcl90YWJsZShkZXYs
ICJzZF9leHRjbGsiLA0KPiAic2RfZXh0Y2xrX2dhdGUiLA0KPiA+ICsJCQkJCTAsIHNjdV9nNl9i
YXNlICsgQVNQRUVEX0c2X0NMS19TRUxFQ1RJT040LCAyOCwgMywNCj4gMCwNCj4gPiArCQkJCQlh
c3QyNjAwX3NkX2Rpdl9hMV90YWJsZSwNCj4gPiArCQkJCQkmYXNwZWVkX2c2X2Nsa19sb2NrKTsN
Cj4gPiArCQlpZiAoSVNfRVJSKGh3KSkNCj4gPiArCQkJcmV0dXJuIFBUUl9FUlIoaHcpOw0KPiA+
ICsJfQ0KPiA+ICAgCWFzcGVlZF9nNl9jbGtfZGF0YS0+aHdzW0FTUEVFRF9DTEtfU0RJT10gPSBo
dzsNCj4gPg0KPiA+ICAgCS8qIE1BQzEvMiBSTUlJIDUwTUh6IFJDTEsgKi8NCj4gPg0KPiANCj4g
RG9lcyBMaW51eCBhbHJlYWR5IGxvZywgaWYgQTEgb3IgQTIvQTMgaXMgZGV0ZWN0ZWQ/DQo+IA0K
DQpObywgYnV0IEpvZWwgcHJvdmlkZWQgYSByZWxhdGVkIHBhdGNoIGZvciBTb0MgdmVyc2lvbiBp
biBjbGstYXN0MjYwMC5jLg0KDQo+IFNob3VsZCBhIGRlYnVnIG1lc3NhZ2UgYmUgYWRkZWQsIHdo
YXQgY2xvY2sgZGl2aXNvciBpcyB1c2VkPw0KPiANCg0KT2theSwgdGhlIGRlYnVnIG1lc3NhZ2Ug
Zm9yIGNsb2NrIGRpdmlzb3Igd2lsbCBiZSBhZGRlZCBpbiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9u
Lg0KDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBQYXVsDQoNCg0KQmVzdCBXaXNoZXMsDQpD
aGluLVRpbmcNCg==
