Return-Path: <openbmc+bounces-268-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC0AE26F6
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:06:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHky67VDz30VR;
	Sat, 21 Jun 2025 12:06:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750415045;
	cv=pass; b=jJoWyBVPr9+uIXvP+lNd/p2p2HWesULXbph7NBqefaVCmQhtf18Bl/plALKlvDEJo7gZw5PvQaXg//OGddU0Oxgrp70INxjVz/12KW0ixaRfej24PI9FA/Tu9X0ou7hcj0jafQ0N+CGacRQRGJY3PfeTx2o5tS9HtkgqqT35zVnbAI2kw0vDbih8eyFA0CGPPfgNbzHthhEJ2/V4Waw9BRvXz7EhxOEIgZ9snR1WrYXOg85jrylw41yuheJ19ptFuRC8FATgHq0JHnhi4D+VIg4MfmIqzVCtHaxxt1xobcEqIvQjqEW/FHNEodLQ80KIuVJwzuNory94V54MyaFglA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750415045; c=relaxed/relaxed;
	bh=2421UXHoKKeVPREDXCWm5x2jIaMA4XjRj2zL07QMC+U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hzspD57n5Tp3TueTMcgwq9PwxO7lyFU2knFuJH0YkZ9v/h01yGtRcx+Ptt4u3qJxE6toWXh/UkPin8hTRnmrhzlDNnU/QEIWHehyHRJRJuSNRm1WZAE5Xvb+l5g7GAqQQeg1hMnjaui1FrB7aKmDvKytinFeP+vKhoN17vHTWDtQY46JaqnOFJHNno1fVsVqT+xdlgBxwOQX6eKSL6OK7rmsOycBrud7xHKUNUeybE4+TauPm86yWtj7bpOESx8BZRDzKFjhElTN03N+vNftfY1+F5jL8zAohe2bttbVtittv3DZzt9Izrk0hHywgDTwBlp28OlJmg1AXL7EO5fBkw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNtqV17hXz2yYJ;
	Fri, 20 Jun 2025 20:23:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbsHdx4b3rbp8rY+oGKBFbbRnbq8LAn5X3oxvm9LguNffwM8Tu58qDQ5+L21+ScUD4V0kXtuAdw3Sid1Vce2tXg9yK8eIpOQx37nAFFIGlJjnS2Oc1w6F6KZnXSSoagRc6y891XeWlCJeg5qJFqqnRf+cmvW8XpUjY//HlioFqVL23v8N/jHTyfAEj8UAT6e6EJ1cdUUVSk3ksAEMQNgwOA1X6EpAfHTaQ1/y0XV8LzIUoCHVvaYXViINxIvSxmkRi9m111JORzeNTGm5iNq8B98HhWjnJjyNBRaE6JpEnu+loEeb3HCktsQ6QPo+K5rTQOzuw27OJmwknzhtZDZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2421UXHoKKeVPREDXCWm5x2jIaMA4XjRj2zL07QMC+U=;
 b=U1BB1CAEq6DoPMs3zeyyq8KJjaLWXiNarOjcNDOfvOJog+vzdJar9lTp071vMqnli7QdzYQSAtctRHdTXYz5Xzi9oVKbRJP/+g330s2zjFjOq8MrYtOEkL163f3siL3Juvh/lpYj31kUWD8X1LNoyru9jIUAVSTQr1cR2rAoG9ix/U4XWd6DBggfwwyLEsAbf/E+QvfpEbPVelEijvfgNyROTVwSPemWIQN/r+QwRC5OAea2YyCURS16VHSUG9qMafJAPN3LTvuwCOp73djFopBDEGrUt0o71xgqc9NfiYeXwRnrizHHXkQfQYHtvBldBX1L2G444LAkQ5G0rPwAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2421UXHoKKeVPREDXCWm5x2jIaMA4XjRj2zL07QMC+U=;
 b=cTwGo3kMxXWwjXUw11nouMZ+pl2sASBJwCMWbRXvMZFDWUsYn6QeGjgBB6o/4SYQ8pPswfw+tR7wHgYbtpKb2UY9ZqSXRIzQbZa7KSZ00c6NJA+TEe+pYWm94zKVzt+wwOFvp4EuHFR1w/in8iIglhYSWTWqpUoCOcPF98kTbGWxSFMF61x39fP+n2hxgOfIffaGUCwfp1AwfkrFNasjx5P4MD/3YmaIiBDngj/RMw97JTaKqurPk6BS5XiMuHJ1r3L+eP7zB+jGYEYm2gG96swuVJN5ID7pr1WAWPDyy7S8kuD9WVgWRpPCvYDYlzDA1kduhH2vf2mQj93sjCR18A==
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com (2603:1096:101:1db::9)
 by SI6PR06MB7113.apcprd06.prod.outlook.com (2603:1096:4:247::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 10:23:05 +0000
Received: from SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659]) by SEYPR06MB7072.apcprd06.prod.outlook.com
 ([fe80::427f:4d26:e479:7659%4]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 10:23:04 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Thread-Topic: [PATCH 7/8] mmc: sdhci-of-aspeed: Remove timing phase
Thread-Index: AQHb3/yk8lgT4h+z1EKWpQv7CmYpOrQLoncw
Date: Fri, 20 Jun 2025 10:23:04 +0000
Message-ID:
 <SEYPR06MB7072FC07B4EFC03BB25B537F957CA@SEYPR06MB7072.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-8-cool_lee@aspeedtech.com>
 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
In-Reply-To:
 <9c85755a8aff6e6f8a5548f0b5e758dce7d6353e.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB7072:EE_|SI6PR06MB7113:EE_
x-ms-office365-filtering-correlation-id: 496c4ad9-ab7d-4b03-f828-08ddafe47185
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bwzJt0zcaS83/pKxJGUGP5ipZczGpAFYGQKlWPJiXt6YQ8bunp38H8vunN8r?=
 =?us-ascii?Q?VSKtO4m1WYOXrCfiA1yRFFjEDIIHCEaFjZsBEjrlR91TnJRewnnL2f+5Q9j/?=
 =?us-ascii?Q?JlG7VClcu3aPILitYXs0ds8/secRdaOyvLbuHSSGVQrJCrYzWz6DV70V8mAF?=
 =?us-ascii?Q?C/E1jb+ftu7hLFiXAktPJmYj9kq52LmYk2pOIO1kCR2hXhJLVeKpVMkj0E28?=
 =?us-ascii?Q?AK7hP5gmbncQYltnBSifTuOeFQ8smNrSbwy161T/IAxQ9ANgxiB2rnaTK19r?=
 =?us-ascii?Q?xBYqmlLdJRkBAEeSperBo+8Lls5jIfv3GpMyqbaoMzsZozFFPCp1HceBGyP7?=
 =?us-ascii?Q?VUsNnuzZQwI53ghDhOYR7cLntR/1JijlOybXnoI2hLASxFm4RpjlZzfG3ZE9?=
 =?us-ascii?Q?lAr1rnODjfvKwCZemNU8G322dPcvmFyGI9l3jMpzYj9c+8KJewi/wAygMFbp?=
 =?us-ascii?Q?gGpTqfh/pAeVtQ4rH/lOuovt6Fr0kCIqj5ujCTn0NzPhV6IljGyHYAXIGqCS?=
 =?us-ascii?Q?USDTlI9u9s3FPTWklisNl/afNz7l7CKFyY7Vy+Dqb5ryloKNcu4LGa0vhhel?=
 =?us-ascii?Q?wVPOd6saz+r4MzASygOOYTP/lRJunAecrQOo2phYyXYiZO4+SaIW1gX1NiM2?=
 =?us-ascii?Q?R/n4PDOafDb30rMurOPlrRuEKdjnaSbypMAUtyjdDDgytS4x7nGrrfSjQ2ml?=
 =?us-ascii?Q?b5LhP7Kt6mW4c2//OIlgZ/EcjPkceJIH+1BIh5Gg8QRWnGpQEHOBsZU/B8ok?=
 =?us-ascii?Q?nFiyy4RstTRCK5lol0sWsnM/vt23gOiaTK7Tkz8wfRHFtJrkzt9SYK01UdKz?=
 =?us-ascii?Q?5Raqf6RhiYoHg2GNEuKp0I6VV+NQzrcw9Ljr3CZAyZkw2qA8gwb/1LDNZ2VO?=
 =?us-ascii?Q?UF8B3EO94CT8T8YOqNriu0cMjfh+nrOhq8ne2rO0CZo1nzOkVcvKaWHatk5V?=
 =?us-ascii?Q?n5CIFReQ854RDhz03A1B8SHvL74FHho3Fws5A25W0jbq63KonNtWGnnofwPh?=
 =?us-ascii?Q?s7pD0bxVIa+OrJOXbFsSm96oGsD/l/fNue+Wbt1/6Z/OodU39sOnrxr1IPF4?=
 =?us-ascii?Q?no0N5Bz3RZFqYU9pbchTMbKCP4CUjHE7FNnbM6f2ThYBEQX1qhmIfL+/iiYo?=
 =?us-ascii?Q?z9jAFOBCxuGC4E6u3DZl0Pb1lm0YD36WaT9evXYUDdFji3zw+fby/gGsyMw3?=
 =?us-ascii?Q?ULnZpSQU2Pf0FIVuoPx3YcLJ5nUOR+FfRNnnSJxLghOwbK8ISeRlYDa4UZoM?=
 =?us-ascii?Q?kg5yBpigLIlUcjQdZAjOembzzgujhPb+W0POcddfqshfCKDvTSbB6+JSgMhc?=
 =?us-ascii?Q?b3f6dt2V3HAJIGCai5LEJMpc9652UmPbPoTRnPySqNd7sjFb1uJIac+6uk1X?=
 =?us-ascii?Q?bVaDsw7qCUVWJyr+MKdShXS7wrwO6GESAxhr0Z04lD0nhcZQpmA/EU1R8aSZ?=
 =?us-ascii?Q?L3+Jf7vp2aA7IjDsgzDnri2tjur3LaHsgMPvD/hBv+3EVcasf6kFxvPkR3Mn?=
 =?us-ascii?Q?l3Pr3ToJdrQyTKI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB7072.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FSCQRkjyRvUncPN2WNU+1eqKIZLiQcuxqtqHkRo1TeBXz3Lwg842wZU4u9mR?=
 =?us-ascii?Q?XhLn8fExB8hwkpInjQWlEvMnBGGFCjlzxPmkkYYdxrgGmJZ5ggjFrfmwz8xg?=
 =?us-ascii?Q?8ALXl8ZSnoA8FbxqWZT6M9HvYPSf9YYKkwXLqvX0nPUlOogR9PiZkfsM9yWG?=
 =?us-ascii?Q?stUC0lLb+9w5df9Sw+kiEuuLE2PN8uVchkFvrpwv5Gma/3rTwNR4MJgrCl9L?=
 =?us-ascii?Q?FmBzBL3kmkvUCpTZTJjkTVyiWbC2ImAbtTKBjM0dxpKJpJMnArQT0Lq1QfTj?=
 =?us-ascii?Q?A1CnL/5T49NR0MHAcYRpSPZgI4II0I6aJdajf7/kX6hUy21rslXw+yn5gHYL?=
 =?us-ascii?Q?SiOFnt2v21rJK/flDsp52IKUtU0ppidDsDXmGc69Qfd7xWK0uVyq8XwpnBap?=
 =?us-ascii?Q?Qi+6+sfRGkaAZlE9BcxzdjjyQwXeXHIUm9fflxhT5QRROn3sPS1efIr3CsLa?=
 =?us-ascii?Q?h4M3NKBSkv1jEFLbSv4LI/fVIs/P10utSGCS7RbnTROJim4dcFQI//D09wbP?=
 =?us-ascii?Q?C6BxxchmeKtaCWezlUtx9Ci3XHK5bu5vSJjJVDTPT3fDtGhgTCWiVu4asbsw?=
 =?us-ascii?Q?ZJImLe/6FuervIbCgWRYb4277OMmZNs0apaLGmJLWo6uupy2AVSZWqkKwQ5o?=
 =?us-ascii?Q?6o/BG6HdVRmA8XHJD1HNX/yJhxULucDH8R7wrRrDXxBERbbxpPTiyBpki8nE?=
 =?us-ascii?Q?AZN6DExyqsxYcwxKdZ6v/cROo0475WPqJ23CoBDiISlqNqGfX3kZpqGSLeoD?=
 =?us-ascii?Q?KRNza0tbUjCiJ+92K8MOENoOqb/+p39CenLZLCi28lAc5cP1yh4sVAhDBcD0?=
 =?us-ascii?Q?7jJRrtdN2ufLyGv7BCZay1b3Bku5EvYhimjPRoXU8B2WPCnQkgA5YEt/kmMh?=
 =?us-ascii?Q?I2IiCIiVATbAsG9KliNfxtsRJgLRg7CI8CHn8pBFtITS+S1n8txS2v1ZJSAc?=
 =?us-ascii?Q?E4fs4ilwzFIFWdPJJo6pjR/vc6d2V56aslHd05BRzkElwcg/70eUk/SiPUZz?=
 =?us-ascii?Q?+6qSsX3GrpgutuZoHP+t5a0V2INnedk2BQGe3Wt6xstwJY1C2lgFzZZimUoe?=
 =?us-ascii?Q?1CnAdnXBO3swgIBu3Ep4FjIOFRuJIw+6E6gnSqqUCuiUg1oml/KTGAIQSWtM?=
 =?us-ascii?Q?gcDV5DV93dBR2vq/dOL7IAOP1ZdxJgsgkCoJCBnRN3yyBI8453/+zIfUyPgx?=
 =?us-ascii?Q?VMqwA2QYMw+Arzl7wm+yoeiQKtbgpEATJNPVCnyToUwof5bIoJFLtaT/diGE?=
 =?us-ascii?Q?IyIL1z0dbfkyK2ssWS0+D1muiRSxZ4GdfSPcuPlX64nQBSKzVNt9zlec+8bA?=
 =?us-ascii?Q?Yx51hULbGV6buXw0cQcCMisuw8Mbq7SKniuL20C4PcNG7c1Ua7HEy1DXrd3N?=
 =?us-ascii?Q?+Z7SP9NqCYSISLUfjLGQg+Z/GNPthhFFlTWu8UMmbl1zkxKoXYAdLslNQL0j?=
 =?us-ascii?Q?r7hYxeeVwqK6ROQpvTo9GfNq3MqznFMf5TU9SvgMlgn1v5leNuckbE6+0xCr?=
 =?us-ascii?Q?j2GW0c6c1vPC3SYNzEmUDUYoqbTQongMZrgLS15XXixRH9VL1ABk/O+EmJpy?=
 =?us-ascii?Q?bKJYFwwiB4A33vkadxrUghJ4/mUfihTFdGpuXYXi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB7072.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496c4ad9-ab7d-4b03-f828-08ddafe47185
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 10:23:04.8468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4A0RiYGZPZLvofAhuCp2KPARtV4UQPTuD2tsG5FyL199AM037LLNf0X+s1kX2pkSUV7wmDRFm4HXttHIo6QDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR06MB7113
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> > The timing phase is no more needed since the auto tuning is applied.
> >
>=20
> I feel this is unwise: we're now ignoring constraints set in the devicetr=
ee.
> Auto-tuning is fine, but I think that should be a feature that new platfo=
rms can
> exploit by default. Older platforms that do specify the phase values via =
the
> devicetree can be converted at the leisure of their maintainers (by remov=
ing
> the phase properties).
>=20
> Support needs to remain in the driver until there are no (aspeed-based)
> devicetrees specifying the phases.
The timing phase only works on AST2600 or newer platform which has added a =
delay cell in the RTL.
The older platform AST2500, AST2400 doesn't support the timing phase.
It supposed no effect on older platform.=20
The old manner that a static timing value customized from devicetree is inc=
onvenient because customer needs to check waveform associated with each del=
ay taps. Once the emmc parts changed, a fixed timing value may not work. Th=
at's why auto tune here instead of a static value.

>=20
> Andrew

