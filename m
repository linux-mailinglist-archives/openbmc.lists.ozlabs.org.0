Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF6D8C4965
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 00:02:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EvuxSiWs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdYP96v04z3cTw
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2024 08:02:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EvuxSiWs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::601; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=peng.fan@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdJ7p1lVYz2ykn;
	Mon, 13 May 2024 22:04:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Im9xCPpGKmNgMWjoDXHvNd6hwq76i7OYHeVyszkCi9ab4/5auX9RS3QjqL5PSaGD35tk3PMC8n8qL427hBKEKtwYlUm4JAi5qS1tYde0tViEQBJMI6fgivmGGQFluvU7DE/wc5tbSW26l0fu4lXt/XMJM9B1fl1D95fYxpDHNrRT6HJftgipoyYTy/OllWfsmLKpyX95RqPVb0PBKsO15NUKbjh4Vn1Y8R3hTcD4riKV6y/FUjp3OCeEXaTrpRpdLDgpVTbWbq0OJLcZa2kmkvEr16vmgO88L7jGAFUCMlYMFVHRHSXAxIQ5QJ6qqNDyUqxuCkMXas8HGTBG/8Th8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RrsS8X5uDYKAEgi0oE3j8C1UhJ82nSyednDlsNftaA=;
 b=NI0Hm4SZ/a3SIrogikxHlC7ph+mRWaiSgSbkc8lsnR8qS5/2tFdUjid/h6ziPHEDBaTx0RK9F6J3OqXuBafyjuiNyLumQy0IlRnnjvdUMWQ/e/TEviKwxygh9NUhfH1JV3osk1P8MhCJzxLHcr3yiinbyQZG4CHX67vYMbSZ3l2PREKaCtK56LoEXmseaEfnfFGfEBihH3ybnwD7uF30+F8e+eVAO7BaNtWdqdSue1+5thDJrQOhHDXxxT/HbHTAM854cz43HNz3NFUGFYBgnlkiqCssCvkqkS+6ZcclS1skmVwGffczAsiLDcVXGGYjgjVD651Hn9dou2f17fZX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RrsS8X5uDYKAEgi0oE3j8C1UhJ82nSyednDlsNftaA=;
 b=EvuxSiWs2qnUzjp1vlsKJzXWfSCDc3FBwXiVBnz2uT4pn/YQVznoCuRe1m+bghwWCzu8Oh889aRwX6V6+QUv9GMvD7Ior4ml91K0/jrTIYQIpAg3IzdCjSlQlHLhlIBt1azfIt79YHQ8N4pkaZUvz/YwzZYkTst1zM/k6E+4CQ8=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU4PR04MB10433.eurprd04.prod.outlook.com (2603:10a6:10:55f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Mon, 13 May
 2024 12:04:10 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 12:04:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
Subject: RE: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put()
 cleanups
Thread-Topic: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put()
 cleanups
Thread-Index: AQHaniT3lIdYaKTlc0+a75n1zcgHjrGVHZuAgAAAhSA=
Date: Mon, 13 May 2024 12:04:09 +0000
Message-ID:  <DU0PR04MB9417D41C697C28B9F6B3BC2188E22@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
In-Reply-To:  <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DU4PR04MB10433:EE_
x-ms-office365-filtering-correlation-id: 931bd66e-acc5-4879-0161-08dc7344cbf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|1800799015|366007|7416005|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?NEtBOUNiU0t2elRTOFFUYklIclM3TU55ZzlXdzZGK09SMU94MFRxUDlNTktR?=
 =?utf-8?B?SFJCaE84amwrckNTV1drU20wTTNoNU96dmZvUDZUMEV3SXZnTHVzSnJVQnM4?=
 =?utf-8?B?ZkhmQWpyYUY3MWUzeUVtcThBZktIZld2NkhDdzVmakk0WXZaTlNPYU40dU9S?=
 =?utf-8?B?UlpycXdnZ3g3STlXRUlnb2hWZTR0QlV4YzJuZERyWHlyOEh4UThYbkJBb2ZY?=
 =?utf-8?B?c3FLYjNQdEJQTXo5ejhCc2ZiWWo0N0NxQWViOU9qdkF5SkVEY3pOa28yVWw1?=
 =?utf-8?B?M0ZHN0ZNZlI5Q1o3Q2s0YUV0eFQ3RktmTG5xMXhLZXpCendjZVI5VG9IU0px?=
 =?utf-8?B?bTIrRXo5V1NEQnFEQncwczdaYU8vN0JVN0w5elp1anlOVnNHNHNrNTVZd0ZK?=
 =?utf-8?B?QVR1YTlHY1RpQ3lpUVVPUXdHa3oxRGlzY2Zud1FYWFZKWEhvUkk4TlpmOXNM?=
 =?utf-8?B?c3pZaHUwVm4yNExQRkQ3a0t4MWs0MDZrR1FDRnZ0TWhZMVplcS9mc3JBODM4?=
 =?utf-8?B?WXB5Z0NsYkJaRXJNcjZtbzVQWFZjK2srV21rU1Vsamg1MGtCUUFLL2N6RnZO?=
 =?utf-8?B?d0tSa1Jja0xmQzRzTXJZMTYvQzRnN1hhZC9nSUJKcmVYWEFQZDdxcDVGNk56?=
 =?utf-8?B?dWFXVFNsN01GLzRuMG1nN2RtSW5Cam9SSWkxdDVSRVd5T005UjRMTEdtTnNo?=
 =?utf-8?B?SXRWb3NicXZSVWxubmhmN2wwYTdZUzBlcHNFQ1hkS053eThzN1BVUTlRWTBv?=
 =?utf-8?B?ZVc2d3ZlVTlRbUw3ZWg0SU9HWFJodFlXblc1cFd6ZVpRb0VZOG53K0Z1SDJh?=
 =?utf-8?B?amZabUZmMktwT1NBYll5Uzh4U3c5bmh2Q1dmUlZDeFc5UnFLTHF0TkFzL3ky?=
 =?utf-8?B?YjlmSExYN2ordkpiQkl1NitYYnBlL2krSHpvWFg2b3Yza0Z3K1ZxMFVmK0Nk?=
 =?utf-8?B?ZzNjdDN4dE9aZzZreE1IZVc5b0xrQjlFSWkraWhXTnNMK1krNUtPWk5aRTVm?=
 =?utf-8?B?TEFPUDVYYnhaRG5SNkNJMjE2bnZ3blQwWWtNZTNRaUMwMW5LOUhwZ0RSTUNC?=
 =?utf-8?B?d1ZvMmNjaHFDMllNUmR2TFVoWXV2Tmdjc1ZIakdRMlQ3dDZOU1lCK2d1N0x2?=
 =?utf-8?B?VGRZaGNnZlNxVGkvSmk5T1lDMU1pV3RQbE5Dc245NXRzc3A4QitIb0piZjNl?=
 =?utf-8?B?Q2RFcGJGVXJFZ051WEFTMDRpOFF2eFZvMnZvWXUrWElSTzVaVHc4UmdSaWdF?=
 =?utf-8?B?cWorRERRRENqVXZUcTh2ZkVoemxWTFNOUDNNZzUxdFlPTlk5dFN4elFkR2E0?=
 =?utf-8?B?bjhHc1VlRjNiWHAxLzlEMzBlTTdha1oxQUtDU2dSTTFMT0RHTEVPOTVVUDUv?=
 =?utf-8?B?YldGVkwvdzlaNVVWMGRzQVI5U1RnU3NVaVdwV2xFcTJjYitqbXdOMnUzZzdI?=
 =?utf-8?B?VFRGLzVkWGxTRnlrRXg4emlhZkJXWEZ1NXg1MHIzemZRaVpZTk96ajd2T2Jq?=
 =?utf-8?B?SUZGYlp5cXZkWDBTM2lwaW1DMytJT1FXZDIxWEw3MHN2eURjZ05WbWpSWTl6?=
 =?utf-8?B?V3Y3VHlvQk5YUUdhaHYySENvQkQ5WXJ0WTRRa0dPTjhYWlJnSGh6WUZ4WTFa?=
 =?utf-8?B?dm5BZ2dmQUtLcVFuMGNaVjE0empKTE9IRFM3VmQ4NWYvQVg1UEZOeFhPT3dJ?=
 =?utf-8?B?R0ZTeFpjMVgxTzlIU0tpSndmZURqaWNLc3ZHUXgxZ1h5RGk0SlRHL2QvbmUr?=
 =?utf-8?B?aWFkeklqQUJwTG54MW1QVHZta2ZNd1FyQ0hQemZnWmdxK29QVHl1N3BYTmJm?=
 =?utf-8?B?RityQ1I2cE1hd3l3a0U5dz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Uzg3UDhocXdZdlN2aE9FRFQvV0VjcmwrUFl2KzhKMUhWcUlGYkxrcTVzT0RQ?=
 =?utf-8?B?ZU1qRTRvRnhKNk5NRTdwZWdHTU05SU9zemUyWW5zdmlIVURNRlpYZnJFQmFG?=
 =?utf-8?B?MmRscEZBL3R1c1NmdEJrM1ZucTVpbHNEV1FveVBSNHIvV2lJc3hLZnlyMDRL?=
 =?utf-8?B?d1ZuZnRNSm5LejdSZ2N1Qks1eUg3UlNFejJTVXg0NE9XQ3hXbzQvT3ZRcm5x?=
 =?utf-8?B?aEVWb2dqOXBCcFBiMklOM0Vkd3BYSHBvZ2FOKzk0V0IrcTFCdnRkbHlxMWYy?=
 =?utf-8?B?Q1NuYm15US9jbDg5bExTV0x6Qkg5aHpBMUJ3OVR1eVJ4cXBSeDc5VFZHMTJY?=
 =?utf-8?B?WTFXRmgzN1BQSUkwWGpSVEVKRXY4WTlSV2tKQU1oZjFHUEN0Z3ZtVE5TMG9z?=
 =?utf-8?B?ZUoyYWNpSFpNQk5vOWM0cUxJSXNLMTg2SDdaUVNUV3JLRXhjNmVRT3VPS0g1?=
 =?utf-8?B?NXdKaU5PTHdWQXIzb1VtbEhaOWNIVm9uVUkrWS84VWZ4WjVJOE5yRU5nSkJa?=
 =?utf-8?B?blJtQWI3d2xxdVNReW9CMU9jbUIxeUR5MnVESXhGY2syV3BUUTZtWC9xdnMx?=
 =?utf-8?B?Q2JVVDQvNTQ4eFE4UHA4R2NUUXMvQUxwQkxVMnpJVS9TbDREWGxCK05jVklU?=
 =?utf-8?B?YklWZkVPWmpwVm9wa1FGekRxQmhidlNSVmY3aUZKWnRwMHVsZ3NYN08vK2xW?=
 =?utf-8?B?RmtBbVJvRXovaWM5Uk5jbVl5TndYOCs4a2dGb0JvbVRXQ1NYUUpwTWFsT3E3?=
 =?utf-8?B?WkJPbTRVWEMxV0RBOUI0YmlGU21UT1luSVl1bmsyVG42MGRZa2VoZjRObGRV?=
 =?utf-8?B?Tjg3R3FTNy9kYWZPS0pHTStLZ1psWW9aekdKVnEwV2dybCtRYjBXb0ZuVkdH?=
 =?utf-8?B?d2d1MytsazhvZUdwN3B0dlUvVStqWjh2QUdGRktZbVcwZ1JYWUxnb0VUMGxr?=
 =?utf-8?B?R3JiVisvM2lqa1RVL0E2NlRWelJ3OWZOOSthSklEZk1ZSUZSeFVjSU8zSkFh?=
 =?utf-8?B?THRsTzcybVBza2VEUVZuWmVXdUlHR21KYjM5bVJ4NTlVOHp3dTdhMHp1Q1V3?=
 =?utf-8?B?dEswZkFjd0VuMkc3Z3I5M0lVdFc3L0J6c25xSnI1WTM5QmpyWnNxM2JyZCsz?=
 =?utf-8?B?VU04VGRrZWs3a09rajNMT1MwajdjcEV2UGNnZ2pXUzhieWhNeWJtc01CY3Ax?=
 =?utf-8?B?QW12WnhzaDlrOHk3NEtRbk4raEh2dEVwczZUNkg3RUgxY016bG1UVm1uRkd2?=
 =?utf-8?B?VFlZWDV3c0xnSVJhU3hWeSs2V0lhTVkzcmFqaGNHVld3ZzZJNStoMWs4NTVM?=
 =?utf-8?B?dnZjTi9JcVo5eTBXMGVETXd4aFMzWFlmN0NYOCtVa2RsWUZzSmZLR2J3TkJT?=
 =?utf-8?B?WVdrTDZwQVUxdDJ1MGoxQnV6MU5HU1Q5V2JPSE9jQm80dmtHSkVHRzlPbm0x?=
 =?utf-8?B?SkhDdDRhRjF0bUZFSk52TU5qTjJOL2VsVVQxVUFTb0doSmZyb1VFaTljYW5P?=
 =?utf-8?B?TnZCc21KV1dKeFNhd29JSC8zREJoNTlrdlVRVmVGbkdHRmMxdU1JeWVHOUwr?=
 =?utf-8?B?RDVqYlhKcHdleXFvRzh3eDcrVHh5MXhoZGlNZE5rbFZRT3djM3l6YjFBMXhu?=
 =?utf-8?B?RUNYbmkySGpobFNYMUhjcmlORjZLcWIySFlhZGNsUzZ2b3UrZlZkVCtkNEFM?=
 =?utf-8?B?Z2lKNWtmbFZnMlJJbjlDbWdONW9KZjVQYlBQVm5HMFJZRTdVZlltRUNTL2tw?=
 =?utf-8?B?STFyNjBPYzc2NG9ESzhMMmRqSFZzZlRBajhlYnZvZDczS3orR3BaZTk1RjA1?=
 =?utf-8?B?RnJRSXdkUG43NndSZmJvdjRKQjhjeGk0RFhlZVI3SXZrMUIvaGN0QTJ2dm0x?=
 =?utf-8?B?Vlp6OTZoTFdGSWllL21uMXNobzBIQUpOV2VrQVU3VkhsSjhjVlBzRUdSUFRp?=
 =?utf-8?B?eDNTam5EZis4dkpPR0NvRGR5VVZxOGJwaWlvaDRCYzJjWjVzakZFRkQ1NjZI?=
 =?utf-8?B?ZEVibkNWRG5VaE54TWI0N3kyM212ZU5pbGdqMEVIZG9IazdhcUpIclFxYzhw?=
 =?utf-8?B?SEF5VXA5My9wcURERlh4Mjl2ZlRSNndaU0xjWSs3U3lUM0g4YzdtY0dBWTNW?=
 =?utf-8?Q?uMis=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931bd66e-acc5-4879-0161-08dc7344cbf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 12:04:09.5805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3sR0JiiydVK2WRlLg2gmogtZnh2XiPkUq6DAUdkq04mpRQTtu6HrEgcttDIRqfuU0x56KpMBlcH436y47bXDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10433
X-Mailman-Approved-At: Tue, 14 May 2024 08:01:11 +1000
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Emil Renner Berthing <kernel@esmil.dk>, Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hal Feng <hal.feng@starfivetech.com>, Fabio Estevam <festevam@gmail.com>, "Ghennadi Procopciuc \(OSS\)" <ghennadi.procopciuc@oss.nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>, Heiko Stuebner <heiko@sntech.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Chunyan Zhang <zhang.lyra@gmail.com>, "openbmc@lists.ozlabs.org" <open
 bmc@lists.ozlabs.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Jacky Bai <ping.bai@nxp.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Chester Lin <chester62515@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "soc@kernel.org" <soc@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Aisheng Dong <ai
 sheng.dong@nxp.com>, Matthias Brugger <mbrugger@suse.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Sean Wang <sean.wang@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Jianlong Huang <jianlong.huang@starfivetech.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA3LzIwXSBwaW5jdHJsOiByZW5lc2FzOiBVc2Ugc2Nv
cGUgYmFzZWQNCj4gb2Zfbm9kZV9wdXQoKSBjbGVhbnVwcw0KPiANCj4gSGkgUGVuZywNCj4gDQo+
IE9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMzoxNOKAr1BNIFBlbmcgRmFuIChPU1MpIDxwZW5nLmZh
bkBvc3MubnhwLmNvbT4NCj4gd3JvdGU6DQo+ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54
cC5jb20+DQo+ID4NCj4gPiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRv
IHNpbXBsaWZ5IGNvZGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5m
YW5AbnhwLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+IFJldmlld2Vk
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiBBY2tl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+
ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yem4xLmMNCj4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6bjEuYw0KPiANCj4gWW91IG1pc3Nl
ZCBvbmUgdHJpdmlhbCBjb252ZXJzaW9uLCBwcmVzdW1hYmx5IGJlY2F1c2Ugbm8gZXJyb3IgaGFu
ZGxpbmcgYW5kDQo+IHRodXMgbm8gb2Zfbm9kZV9wdXQoKSBpcyBpbnZvbHZlZD8NCg0KWW91IGFy
ZSByaWdodC4NCg0KPiANCj4gQEAgLTczNywxMyArNzM3LDEyIEBAIHN0YXRpYyBpbnQgcnpuMV9w
aW5jdHJsX3BhcnNlX2dyb3VwcyhzdHJ1Y3QNCj4gZGV2aWNlX25vZGUgKm5wLA0KPiANCj4gIHN0
YXRpYyBpbnQgcnpuMV9waW5jdHJsX2NvdW50X2Z1bmN0aW9uX2dyb3VwcyhzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wKSAgew0KPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7DQo+ICAg
ICAgICAgaW50IGNvdW50ID0gMDsNCj4gDQo+ICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X2NvdW50
X3UzMl9lbGVtcyhucCwgUlpOMV9QSU5TX1BST1ApID4gMCkNCj4gICAgICAgICAgICAgICAgIGNv
dW50Kys7DQo+IA0KPiAtICAgICAgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7
DQo+ICsgICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIGNoaWxkKSB7DQo+
ICAgICAgICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfY291bnRfdTMyX2VsZW1zKGNoaWxkLCBS
Wk4xX1BJTlNfUFJPUCkgPiAwKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICBjb3VudCsrOw0K
PiAgICAgICAgIH0NCj4gDQo+IElmIHlvdSBwcmVmZXIgbm90IHRvIGluY2x1ZGUgdGhpcywgSSB3
aWxsIHNlbmQgYSBzbWFsbCBwYXRjaCBteXNlbGYgbGF0ZXIuDQoNCkkgd291bGQgbm90IGFkZCBp
dC4NCklmIG5vIG1ham9yIGNvbW1lbnRzIGluIHRoaXMgcGF0Y2hzZXQsIEkgd2lsbCBub3QgZG8g
YSB2My4gU28sIHBsZWFzZSBkbyB0aGF0DQp3aXRoIHlvdXIgZm9sbG93IHVwIHBhdGNoLg0KDQpU
aGFua3MsDQpQZW5nLg0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0K
