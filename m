Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F34854878
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 12:35:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZRfFtOw1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZbjd6jv7z3cN9
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 22:35:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=ZRfFtOw1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::718; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20718.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZbj04qZ1z3c4V;
	Wed, 14 Feb 2024 22:34:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KquE7/PH8/NEMO0fq0qLKKXVdzDiSpjKGrREsqfvId2zRAN4oECZHX4LPgbsjTaZwuPSNm3goe/Ik8PThbQOztY0nUBqV5s9+U/shbq8zLBmLYBKhwkmwe8zJaYWgA2ISgdcf4Kb0YWzzfvub+VRwkA0HW61qOsslrRyAisVhm/6X0PiKiGAyAGW36NkIbtHNgHo+F52LIv1QKZK4VEiT5TH82lDG4bxvudh1bptWm2CRUItJhmI28H9s0pwi/6HFjPiKL8EVK3MsqwLAtm2RGOvcUIJYu+fT7lNlnudPDm13PdDFT0z4IzIg3x+vfhVxFIeBcS+G001gYiMoAbdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh3ehL2CSa/d+Usgdy+KzpsLASYDj1AU9cNaaH9QZB8=;
 b=lKlfSSIjyrmwmyJfAdhE6EVM1NvJq1vU8eg1pDQWRa45sNAnrGFXa7NMQadhLtHWDJ7ohgzq8SZ5ce2o0Cekt+mbseF4Gia2uWAQ9zu5PYQ4HNieEu5WlfvmNLoRtKl7wOurf4dq435sM+k5A1oCkuuv387HjMfWTPv402UVpEZwV5YsxShZz3kVrmnn1SAZkt3z2zeASe1AtnUXjvzneBysa9uDFieNv/V/qycyV5hakxBCKHmGp6L6OpnqWlr0P1/y+3KI/7jQVLazpc90kiD7boKBRL+3Z+DIuu1iSFFfoRDOfKFS9MPOALnLKCjklyHP8bfsHBa5t5U1u5KLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh3ehL2CSa/d+Usgdy+KzpsLASYDj1AU9cNaaH9QZB8=;
 b=ZRfFtOw1QSVp4FSw7acLtq0MeVwLO7Cxt9JTZ1iY6EF1xpTB4ipfpUw19h8QzDHXR+I8k6wKLhq4G3CDrmjxBRY9qEnNpkbeIOAHV7n0FHe8p4P7Xzn++ykIib/58YPu/TOCWB5Y7IRIzbZSAmnwBKNBwRvzYVUbiIJmX1P/mLhxqe3Jq/lMagrLRP/Ik5Nw+PdHazvMBFMzMQXrJw+3ktMphbGRDyFOKHFQVd6QI6Zzwb2Mh1nlJRkDhINcgaU+KgLlrAsnEI8bGxWZe9UeTwHLqfeNMLskG9aNTaUBC2+idX4qD+Tc0tFIYU2aQfM4dedhEc7w4tRKcNPyQ3qhYw==
Received: from KL1PR06MB6652.apcprd06.prod.outlook.com (2603:1096:820:f9::5)
 by KL1PR0601MB3908.apcprd06.prod.outlook.com (2603:1096:820:23::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 11:34:32 +0000
Received: from KL1PR06MB6652.apcprd06.prod.outlook.com
 ([fe80::cd2c:f551:eb64:44ae]) by KL1PR06MB6652.apcprd06.prod.outlook.com
 ([fe80::cd2c:f551:eb64:44ae%3]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 11:34:31 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Manojkiran Eda <manojkiran.eda@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Patrick Rudolph
	<patrick.rudolph@9elements.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject:  =?big5?B?pl7C0DogW1BBVENIXSBBZGQgZVNQSSBkZXZpY2UgZHJpdmVyIChmbGFzaCBjaGFu?=
 =?big5?Q?nel)?=
Thread-Topic: [PATCH] Add eSPI device driver (flash channel)
Thread-Index: AQHaXooDcj/dRKED5EijCru7OZnLmbEJqwso
Date: Wed, 14 Feb 2024 11:34:31 +0000
Message-ID:  <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
In-Reply-To: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6652:EE_|KL1PR0601MB3908:EE_
x-ms-office365-filtering-correlation-id: beaff497-081f-429c-5f39-08dc2d50e971
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CIoSgCN7ddFRhzJJGTx6hbnyyl0XRvy7379yyy5lOHRBRD5SblJVvKmuGljHzBZCVtq/ISw74j8Yes/sowc3MxSxql36fEFAvLVJQny2xYXOkoH/5h4DhHFMTvgxih3afxXePxI54EMEBDFrDgSRuUzcc/FGNivskOP9Q+qZB+vawhZOmboS72P/+vYrG9JADVV1OsPt6My4P95yoz7KWWRJYA7y/QdjySG/QVQjpL6yYmgFus0cb+rfDrRpb7lZxxZjmzhPK8GbAvxZwqc5ntfgMFeSgV6rS0Tv04ecuu8WVMyQWOX6dLJGPa/whOTUBqlg/3RIXp5KFqmwu2p3X6hvq02CgBNhiek7RxL6K+rOI+VJrltiZ3m1nIhJJOBZs4QEMBd5bLsQ8wlS/dYKNu2fsokZC1tDtOcsaSV1QHuc8rLIe53iFp25qqIvLqpDmotAbiG45uKJwHF0fFjgQgOfG5tIBTiVAwLpBHZS9FrgYTPqBdSeWakxpGQPW1Vnwpli5F/TclXYSTL1fqlXyS0wCRssgudok52RrezgeDMc5/OKkRoFipymDpXViweJtIafgj+lynrtnnMNzW6JFHPnwb+41mLpdbKgcc1S1mn5BimFw8wqYNi881anlhss
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6652.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(396003)(346002)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(86362001)(83380400001)(122000001)(33656002)(224303003)(38100700002)(55016003)(38070700009)(5660300002)(7416002)(2906002)(76116006)(64756008)(66556008)(66446008)(66946007)(66476007)(316002)(4326008)(8936002)(71200400001)(6636002)(110136005)(54906003)(478600001)(921011)(7696005)(966005)(6506007)(9686003)(41300700001)(52536014)(91956017)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?cHpiTmYxdThEMXZvbVU2QXhFNEFRNGxPZ0lkN2FENXJCUlpFN3hXeEZTUElaQ3U5?=
 =?big5?B?akE1djJVbFVqcWxGb2xTK1VTY1k5YnRrV2g4MCt6RU4reGxleVRrUXQvS3RweDls?=
 =?big5?B?cFNqbmcvYkEvZUlXbiswcmFsZWx5UVFwYm9IeVlPUHg4c3BxQWtxdFJNUzFrRjBM?=
 =?big5?B?VGR4SVpDTWdxVEN5YnZpUXBiNmtFYllhWlJ2anZoSlUwL0VDcklkM1MvQWkvS2Vo?=
 =?big5?B?UHNYZmtIbXkyK2M2Q1Z3OS9sSEZPZ2VtelI3NVJIT0EyeUgxU0JpV1VNL2k3RHIv?=
 =?big5?B?SmFqem1KalhidHBudFhONy9iWUNVMEFSMHFKbnRYOWVVaGNpc2lNaVdaUnJVYmtO?=
 =?big5?B?K3lmdVdhdFR0bW1Qc0Vyb2VUdmpEcUg3RVdncG04ZkVwWmF2V2ZwMXJBMVFnNTR5?=
 =?big5?B?YkZCUEVJZEhLSFB0WlIvejQ2UmFvOHNYbGVzTDl5V0lkOGM4V1VvVU14eGlWOWRH?=
 =?big5?B?YXNCZzFFTE8zNlBkMitqampYcGVuL3FjeDUzM2N1clVQSVNYU2VzK2VtRHdDS0Mz?=
 =?big5?B?K01NalhicUpvNFE2aFVVUVd4UUkxeDRHWmpMbGhSN0hmSW1yT0VWbFU1bS8xeklz?=
 =?big5?B?NlJxQ25IRXo5V3kwaVFsQmtkMlN6dzMzaEFtYndUc3FyTWVmTE81RnFaeFdvczRu?=
 =?big5?B?ZittOEdSeVNrQi9rdkZrSHUwSEdVak5oRDVpRE50OTgySWcxaG1QRUFaU25UNTFH?=
 =?big5?B?L3RkQU94dXB3Zk52VzhaNVRCMDNNRUxGbHF4WWVVeVduWXA0VHRvcUhiMTduamlu?=
 =?big5?B?NnZjbUdobENFT1VPYWhMNC9NNnVjZlM2dXNaNTY5R3U0Um9NMGwzUkp0WmE3ZE5E?=
 =?big5?B?ZTR6SlhBQlpWVWhhY2s1MnRWUTVWVGdBbEJ0ekg3YndHczlqL2xscGcvVlc2aVFD?=
 =?big5?B?bXJlVVlVU0x4YXpzcmxGdTlxOTlOalovZUk3VEoyMllFL3dic1RCczhaanppeXRQ?=
 =?big5?B?K3ZjQ2hGUzdLRTkxcHlmZndUeGM0V3E4bDFwR2RmQllTaUI2YjJvZzhFV21IWUxu?=
 =?big5?B?RUxaaXFZZW1abDFQckNpYTlyeC8zaGNBZHdYYlp0dUV6dVdidG1qTlRXc1RqMEtW?=
 =?big5?B?Q0wwdUtwSTNUNG5KT3JVc1NvZ2pENFprWndUZmJib2lzMmRVbDByWHdxYWpJYS9F?=
 =?big5?B?SmN0SDk2alMvaXZyelpFbFhWeTBDT3NDZkpYUmEzTWdSUHMzejYxSTg0QURGNzRX?=
 =?big5?B?RXVyZkl2MWFRL2o3RmVRb01zU2lGQ0pPY1hFQWhBVTVDYU1ueG43dGFFL0J5V3dr?=
 =?big5?B?eU85L2FHVVcvc0kySmVwRFJVWmZ5L0RzTVpLZUZhdk9BSCt4bXVabWhrclhCSGFH?=
 =?big5?B?WmZUYUtrVEdvSllWRjNMUTQzM0pQWEFRNkZVanFodzBpY2U1VjRWcUdoYUZDeHdn?=
 =?big5?B?TDVtL3JPWlNPYzVQOXMybk02amVOMzduODdtbDBHMW5IYUM3NHpjN1lSMDZ2U0Vl?=
 =?big5?B?VS8xaUZCOXZCMUNsM0lXL08wTFR5WlZDVzlxbGt3TVJueWFGVVlxeXhSSGlxZmlL?=
 =?big5?B?SXpyM3c0d2ducUpzclJ2RG0zWkd6SVFSMmYybUxhckdwcTBsbUFJZENWTkcyY2Y5?=
 =?big5?B?UmNnN0FyZTM1eWFNTzNwaExIK24wMEgrZEgzbWt3aVBROTNsK1VXS2FrMit5ZDJN?=
 =?big5?B?RGl1d0hmVStJeDRFbzhMNlZoeWVxUHhKWmsxenRjY0N2WkR4MzFIcHRqUVdrbDdT?=
 =?big5?B?eDRQV0VqUFhwKzBNRER2bFNvcUNDVVBkZTFpUlhuaW5BNVhlVGdCWlBzaTVnQWZo?=
 =?big5?B?NW9ybWwxLzY3Ri9Ha0M3b3RJSUthSzZmNzVPaS9EV0hXR2NIWm5CS09qbUZrc1F3?=
 =?big5?B?eHk4WXRHZmVsNGFxN0dhRHp6ejN2OG9jb0xiWnJVU1BhazNpOTk0d3JIUFloQVRs?=
 =?big5?B?Qnl5YnpJVWY1R00vOHJzWWc5QWprTzd5cHJDNlRGTEVJOUxlNDJ4QkZBS1dySUth?=
 =?big5?B?YmJyM2NlOWtlM2crQm84aVlOeEdaMWNJMUphNEZ0RWRYd0VUT1JXRUI0ek9OZkVo?=
 =?big5?Q?s4+CcbryVilJfr+S?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6652.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beaff497-081f-429c-5f39-08dc2d50e971
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 11:34:31.6720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vOx9CywN9ITil4Hy3wnKNe6C6YWSCk0LiFhkBx+snR2d5/sN6jW+JERumYQTv4c1UU25/e5HWH4fgG0gu2aUcy58JzkiVPizTxWhARMbRFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3908
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TW9zdCBvZiB0aGUgaW1wbGVtZW50YXRpb24gb3JpZ2luYXRlcyBmcm9tIEFzcGVlZC4KUGxlYXNl
IHByZXNlcnZlIHRoZSBBc3BlZWQgY29weXJpZ2h0IGJlZm9yZSBhZGRpbmcgdGhlIElCTSBvbmUu
CgpGb3IgcmVtb3ZpbmcgSU9DVEwgYW5kIGFkb3B0aW5nIE1URCBpbnRlcmZhY2UsIEkgdGhvdWdo
dCB3ZSBoYXZlIGFscmVhZHkgZGlzY3Vzc2VkIHRoaXMgaW4gcHVibGljIGFuZCBpbiBwcml2YXRl
IG1hbnkgdGltZXMuClRoZSBNVEQgaW50ZXJmYWNlIGFjdGluZyBhcyBhIG1hc3RlciB0byBjb250
cm9sIGZsYXNoIGNhbiBOT1Qgc2VydmUgU0FGUyAoYS5rLmEuIGVEQUYpLCB3aGljaCBpcyB0aGUg
bWFqb3IgdXNlIGNhc2Ugb2YgZVNQSSBmbGFzaCBjaGFubmVsIG9uIG51bWVyb3VzIEludGVsL0FN
RCBwbGF0Zm9ybXMuCgpJcyBTQUZTIG5vdCBuZWNlc3Nhcnkgb24geW91ciBwbGF0Zm9ybT8KSWYg
c28sIHBsZWFzZSBjb25zaWRlciB0byByZW5hbWUgdGhlIGRyaXZlciB0byBlc3BpLW1hZnMgdG8g
YmUgbW9yZSBzcGVjaWZpYy4gQXMgdGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IFNBRlMgYWN0
dWFsbHkuCgpJIGFtIG5vdCBzYXlpbmcgSU9DVEwgaXMgdGhlIGJlc3Qgc29sdXRpb24uCklmIHRo
ZXJlIGlzIGEgbW9yZSB1c2VyLWZpcmVuZGx5IGludGVyZmFjZSwgSSB3b3VsZCBiZSBnbGFkIHRv
IHJldmlzZSB0aGUgaW1wbGVtZW50YXRpb24gYXMgd2VsbC4KQnV0LCB0aGUgdHJ1dGggaXMgdGhh
dCBtb3N0IGV4aXN0aW5nIGtlcm5lbCBzdWJzeXN0ZW1zIGFjdCBpbiB0aGUgbWFzdGVyIHJvbGVz
LCB3aGljaCBtYWtlcyB0aGVtIGhhcmQgdG8gYmUgYXBwbGllZCBvbiBlU1BJIHNsYXZlLgpBbmQg
dGhpcyBpcyBhbHNvIHdlbGwgZXhwbGFpbmVkIGluIHRoZSBwcmV2aW91cyBtYWlsaW5nIHRocmVh
ZC4KCldlIGFwcHJlY2lhdGUgdGhhdCB5b3UgYXJlIHdpbGxpbmcgdG8gaGVscCBvbiB0aGUgb3Bl
biBzb3VyY2UgY29udHJpYnV0aW9uLiAKSG93ZXZlciwgcGxlYXNlIGNvLXdvcmsgd2l0aCBBc3Bl
ZWQgYmVmb3JlIHN1Ym1pdHRpbmcgZHJpdmVycyBvZiBBc3BlZWQgSFcuCk90aGVyd2lzZSwgYSBt
aXNsZWFkaW5nIGRyaXZlciBvbiB0aGUgY29tbXVuaXR5IGFyZSBnb2luZyB0byBicmluZyB0b25z
IG9mIGN1c3RvbWVyIGlzc3VlcyB0byBBc3BlZWQuCgpUaGFua3MsCkNoaWF3ZWkKCj4gU2VudCBi
eTogTWFub2praXJhbiBFZGEgPG1hbm9qa2lyYW4uZWRhQGdtYWlsLmNvbT4KPiAtLS0KPiBIZWxs
byBldmVyeW9uZSwKPiAKPiBJJ20gcHJlc2VudGluZyBhIHJldmlzZWQgdmVyc2lvbiBvZiB0aGUg
ZVNQSSBkZXZpY2UgZHJpdmVyIHBhdGNoIHNlcmllcyBmb3VuZCBhdCB0aGUgZm9sbG93aW5nIGxp
bms6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbmJtYy8yMDIyMDUxNjAwNTQxMi40
ODQ0LTEtY2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tLyAKPiAKPiBUaGlzIHVwZGF0ZSBhZGRy
ZXNzZXMgdGhlIGlzc3VlcyBpZGVudGlmaWVkIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuCj4g
Cj4gV2hpbGUgdGhlIHByZXZpb3VzIHBhdGNoIHNlcmllcyBhdHRlbXB0ZWQgdG8gaW5jb3Jwb3Jh
dGUgc3VwcG9ydCBmb3IgYWxsIGZvdXIgZGlmZmVyZW50IGNoYW5uZWxzIG9mIGVTUEksCj4gdGhp
cyBuZXcgc2VyaWVzIGZvY3VzZXMgb24gdXBzdHJlYW1pbmcgdGhlIGZsYXNoIGNoYW5uZWwgaW5p
dGlhbGx5LCBlbnN1cmluZyB0aGF0IGFsbCByZXZpZXcgY29tbWVudHMgYXJlCj4gZHVseSBhZGRy
ZXNzZWQsIGJlZm9yZSBwcm9ncmVzc2luZyBmdXJ0aGVyLgo+IAo+IFJlc3VsdHM6Cgo+IFN1Y2Nl
c3NmdWxseSBjb25kdWN0ZWQgYSBmbGFzaCB1cGRhdGUgdmlhIGVTUEkuCgo+IE5vdGU6Cgo+IFRo
aXMgbWFya3MgbXkgaW5hdWd1cmFsIGVuZGVhdm9yIGluIGNvbnRyaWJ1dGluZyBjb2RlIHRvIHRo
ZSBrZXJuZWwgc3Vic3lzdGVtLiBJIGtpbmRseSByZXF1ZXN0IHJldmlld2Vycwo+IHRvIGluY29y
cG9yYXRlIGFzIG1hbnkgZGV0YWlscyBhcyBwb3NzaWJsZSBpbiB0aGUgcmV2aWV3IGNvbW1lbnRz
Lg==
