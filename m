Return-Path: <openbmc+bounces-180-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0583AD6443
	for <lists+openbmc@lfdr.de>; Thu, 12 Jun 2025 02:04:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHjP6217Vz3bpS;
	Thu, 12 Jun 2025 10:01:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2406:e500:4420:2::709" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749630556;
	cv=pass; b=ivkV0fr6iE4b8aKVF+JsQL5HMJ2nQygt4UNq8r9E81wjhZlXCiggNWmtydFdd5NyYq+2yaJkgk2cdnQIS0efnV31CPlMUUUMGhU6eJZ3rmDpU2Q5ajA8zByVAOWM+uHUPB/gCtu+xWUaBx8Tgi4INaKNFblOY9QFwFXx83o69+IDak6FdiHCXvsUG+7umizrtEBhS7MYorz2WvFupgqJvRXROUSn6ixp+ugAFgm+ygVK8ItNm7odgRnkZufVqg+76Zbvkp7njpF/L3H24344TdlerDp920928mZbecO7AW2dYDWoJf4e4esRTKoMweHAtMRmulmE0yd80AOwbTIuhw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749630556; c=relaxed/relaxed;
	bh=FTKpDYpGsK3lbDagPVf7Yx7Rcr3T6Eo8k+Zi9vqiQG0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YIKuRXv9tdX5L7ld71Kr/judQy1o9baOIL3zSO6ZFbCnqu3aZwDh8I8MfSGcxktYyMSr0gQrTsiPy/XJfOi9enDaLPHVk12tH3Ti4/eanGrrgbGMYhgRCr9Yjh1zKYisk3HguRDqioNrdgw9F/YeYwLYHtlas32d97I6IkLbtYe7fVfpbplmh2YsHztuJnjcZXpOsf1+kBLYXdLfX0ndXrA/NuZT6vlgxu/jpxF9eaV9++CaXYnpERWu7l4XbAVF4e3oGt9dpbdN/s5j/Dc7zjxhD6Wkcqk6O3NhcR/593rsOsvM9BDoZ+2A4q2ltK+QY9oPk1Z7KQ3DBks7rzExTg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass (client-ip=2406:e500:4420:2::709; helo=chn02-sh0-obe.outbound.protection.partner.outlook.cn; envelope-from=hal.feng@starfivetech.com; receiver=lists.ozlabs.org) smtp.mailfrom=starfivetech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=starfivetech.com (client-ip=2406:e500:4420:2::709; helo=chn02-sh0-obe.outbound.protection.partner.outlook.cn; envelope-from=hal.feng@starfivetech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2187 seconds by postgrey-1.37 at boromir; Wed, 11 Jun 2025 18:29:15 AEST
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on20709.outbound.protection.partner.outlook.cn [IPv6:2406:e500:4420:2::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHJjR4dxPz2xbX;
	Wed, 11 Jun 2025 18:29:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYAMovKxu8zR8PumZ52GrMkFPsb6fnczPrY2ztRezkUevqxyNrrGJjgXNq5eIUxBjUhpVdqIs5w3mMxm17bDF3k7Jdy9JRM90qWcc0tyRmrT6o9VKvKmpn6R8XA8BefRvxJAfSGHejfkGsbRyCPsiGoFDId346xF/Eb3pphDP9OyWQhkBt6cqeZholxuxS0vaHHSLq4Kun506yd197ZpHx7dSojrHXA3JVLAH/ewlPFKO3lMbh4snOOu7N1LKi/shy5Vxp98QPdFTOtZulN+q7gDJ2wITBUTqmnzcsZx9FwXQY3so9JXVhrU/AL9HEM9Z2zRzPyUCYRUMauMUQCj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTKpDYpGsK3lbDagPVf7Yx7Rcr3T6Eo8k+Zi9vqiQG0=;
 b=im+NBteedQnQi1hOuZVHeXWo4A807NaVex2NcpN3eXuc9+fnJemNBUCNsyaa8jwbWw+OAQlspVm5/Qzs30GuCN0Hb7IpnGvGmjb7SuYW23/LAky65Mo8tlsbn1LaThoAtfnJi3L2lKqGquo/PFhJaDQ2V0ZqTPV0F6C+TM78JqFoz/Qy/7nzjm5VmgdrOczUVpiJ1L/V3WXcTwPHLT8q7FFbt+xqNlCPq39AMKME3Z4j3dU68okgKNawHSSv/AmV9HjgZ7GwOOmFT3qvwRfZcDFGk4IDGnMnlgcaIngDhCn16/2l2L0csSn0OYpiFRjkm5mfIt8+kSuG2FO1WECyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::5) by NT0PR01MB1135.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.43; Wed, 11 Jun
 2025 07:49:00 +0000
Received: from ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 ([fe80::3651:ecde:eeff:e364]) by ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 ([fe80::3651:ecde:eeff:e364%3]) with mapi id 15.20.8792.042; Wed, 11 Jun 2025
 07:49:00 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
	=?utf-8?B?Sm9uYXRoYW4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Damien Le
 Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
	<michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam
	<mani@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-arm-kernel@axis.com"
	<linux-arm-kernel@axis.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
Thread-Topic: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
Thread-Index: AQHb2pgQVbcG7PNgJEGvLmECbqcfNbP9lBfQ
Date: Wed, 11 Jun 2025 07:49:00 +0000
Message-ID:
 <ZQ4SPRMB00018B4570A6C7FC24EBFB85E6752@ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4SPRMB0001:EE_|NT0PR01MB1135:EE_
x-ms-office365-filtering-correlation-id: a1c42e17-8e41-4cca-8c21-08dda8bc6d96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 3kvtqbtf/Oxid2MMCXR3wRUn08BKaBEeMF8iTN8aO6JohyMlBFuY8p1AV7Tl+cAQlGpjGbHoZMBOKJh5i2pvNrifD5VA7VgWd6lq4rjExaOgonsx9IZzw8wbkKBPSi8f/mPSDefnnyi+NuImMfwFk3cqroeczSDEsBspl/uN4kBdL1jJrs4owRjcEU+TzjkU9moN9oaiw4rBq41xLejS8c09GBxXyylh5Wo+74pmdX51BU5pv53/0VIBXr3/dcb03C3qgfxczxl/SDKtmCDyfc6YGphUTn8R7c+JQXJxHMWZpoqXqg0CkqvfDRBf83+va2MFx5ln4Ti1mzFJejJO9fKzpAK3eyxuJjjmj9xCpdyQGrfdDX3xRVUFZBpk7KF5NUv8dhxusWh4uQCOb3CWKHhsNj3HHuFIncXEF7qBRxJMNGPpig7+BX5N3+UVxOQ8QofBc9bqgZJlFfD96EdqJ74k3sd1WcNwrMQOSYqRoQaAx4b0dYCtEJxRyhfUHA7hdMfjiSYnIyP4SaR5sqUg36Q3/IWYi0KM/LVG9wIknaBXYkn1NjLTu6IsZdNUx2A6otakXDDZ2dnHMqfTJrFvG/oQWDkk17Q0FRzx+znbZz8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXBQcUVlMmZoV2owTEJsZ1N5enVhbWp4R3N6TFdzMERWQmJqenJhaDd2YkhB?=
 =?utf-8?B?VnZBYVNwR0xpVzcwYWVHRjgzTDFQY0E1ZDNVbEdrZGdVaDRFV2NMcVBTK2Ru?=
 =?utf-8?B?dWN6SkMrVk8yRk1jdi9ONDhScXRnbWdPYld0VFg3YkJ0eHJLbjluWDA1aWxi?=
 =?utf-8?B?VVQzRXBFYmxBeFczRmpDb2JlN2h2VHdLVmZ1QWhPZVRwTGFTY0F3T2lKdTc5?=
 =?utf-8?B?YXdtdHdVNXFkN2pXWFIxUWlrenFXVVBDOWtLNGpPSGNma3MxNzRSblFDZk5W?=
 =?utf-8?B?b0pqUGhOZy9uRURzU3psZGRIell3aFBXMmtCdlZXZ2ZURGZjVmlTazR2ZElI?=
 =?utf-8?B?RjFSY1ZrTXlFVEpLSmxWZ3F2Zi9kMndkSWx5TnBUUVl3akxENkZQT2VGbCtC?=
 =?utf-8?B?bW9WZG14QnVZa0g4VTVSOWtlblVVa1hmcGozNGRmazJNbnk2TmltbEtWb0pn?=
 =?utf-8?B?b1lBcE5KSFNwNmExTUxQcE9Ha1B4T0VIdm9RNURNdTZhYmFFekp5SDNWUXI4?=
 =?utf-8?B?Y3ZnUytURDlFQ3k0TzV1M1NIcVpwRWZseTBhVTdIK1hZY3Zvc0I1bUdWSGcy?=
 =?utf-8?B?aEJsczI1OFFyelY4VnVmc3J4TlF6eTNDeUlMQ1Q1MEllRUVxS3AzWVRRcFE1?=
 =?utf-8?B?N0JRVVd6aXpzQm1pS2dHblZ1UGhZL0JYNGUzWmZub255MUdOd3h3SlFpRmc2?=
 =?utf-8?B?aWtwUkZheUZFbnBpMUtqRVV0NUhrU2pqODVPaGRxVHZEWmxpdVRvZ3A1U2pH?=
 =?utf-8?B?Z2hHUUEyYTFRWUV3aHlLZTZsbGFOYVlIeTEvZ3VOdmlOdFVGNTNERHBLQ2JB?=
 =?utf-8?B?dmZXOTQxc0JkZjdxOWpuUFhVRFl3WDRleWM1bTFmdjV6Rlo4bGo1R2o4MXo4?=
 =?utf-8?B?OC8wVVNvK3UzQmZYZFM1U3RoSTNEaUt0OHVCTUljYmRPeFVWNUs3cUxrRm4x?=
 =?utf-8?B?QmM1aGNqNDY3V2lyMmdnS3d1T0ZSb0ZFSmQxb1haaW9kY2R4aUpnMTZjYlhO?=
 =?utf-8?B?aFlGRzhoczlVOHVwUm5uaUtHZGxwRi9uUzVaMU5kV2t4bnRnYXpNa3YvWFFI?=
 =?utf-8?B?disxd2ZEY1dEUnhHWS90YXlpZXFMUnFFSm55QTJ5NDJzV2pkczMzdWlsNlRz?=
 =?utf-8?B?MlBiRGJtN1cxRXE3T1BSZlZUaG84WWpocmJGT2pkYmxOWUhTVXJwTkQvZnpn?=
 =?utf-8?B?UXhzWEtXNlNmOVBubjZLaDFxNjJNQVlpV0Z5blkzOHB2R0pLRXhhNU9HNGND?=
 =?utf-8?B?azdwQk1FVzFBS0F2M0l2V2pSbFl1RjJLU2xqS0xJNEc3ZWZrOFZmdlExTFFQ?=
 =?utf-8?B?NEVLRmkwV0dsYmQ0V0JXUmwzOFpraVRPRUV1MDgrZmIxd1ZRRDlaSHIwSHhH?=
 =?utf-8?B?M21MNzNpRDhXeTZQMXJKWTRVMmxmYkliYU44U3J5dCsxeWZVeFU2RUJXUGpo?=
 =?utf-8?B?dGk5akhYMUpCUWUvQXYrd3VLMEhROGZ0dHd1R2g2MitNNjVScFVUNHR4RzYv?=
 =?utf-8?B?Umt4djRNai95TVE1R3hVbWZmZHZWL0pkcDVyL0Q1MEFRL3hGWnlsQTY3a1hF?=
 =?utf-8?B?NUJRQXBWMS9vM2NMRmZ1SmY3L2hXVE1ZdnhkRVVvZFMvcG9QSkpqYzVIeGJE?=
 =?utf-8?B?QThPOVhkT2NpckJqUkM3ZnpiNWREZ0ZtSGtDZzJNWWFxVnE5VU1DVHhpOWNW?=
 =?utf-8?B?bWNSNVRlTUhOY0N3cXluY0tWd1hlQTErb250TXBrb0ZEbXNRRGJQa2g2OUIz?=
 =?utf-8?B?OWpNRGVnNU44aEZHeWtUeHpPdU9zejEzc1V1TnFpVFp2OGdURUhVSlg2NktU?=
 =?utf-8?B?eWNPcW5RekEvZG11QzZPb2R3TStFYmhCZ2d5SC9jWnNMSHNJOVQvSjExUmlm?=
 =?utf-8?B?b29PZG02dWYxd3dwQ2J0ak1mdG95MkN1bnZrdyt2RUVhWXcyUkEzVUEyU3Zy?=
 =?utf-8?B?ci9qd0dPcUYvME5leCtzeUdUOGVEcTA0NDV2eHB3SHdsNC9seUxpVUV4N1Fp?=
 =?utf-8?B?Q3JBOHlzSkJma1BGbkhmcjlMb2hRQlliRzlQdW5KUUJ5VzZQQnlxUTYyUjFa?=
 =?utf-8?B?bjY3aG5pS1d5eUozYnc2bFI1YzVEblREaEkzcnR3Ym8xaGw3eTVPN1ZnalVT?=
 =?utf-8?B?WmRFbjZQUm43K0Yrb09Fd1N5VTVaWnV4cUFtSnJIRForS25iUlBFenBLc0l4?=
 =?utf-8?B?R0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c42e17-8e41-4cca-8c21-08dda8bc6d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 07:49:00.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yk/eSAAKlMEL6D8tj50NlZFC2wJQ5YzVFAidD7WbDURu7KJqDL6rknmBDccrQ56RtyvP651FAGii23jofqT+9eU4y2ZPaV/z/gn8jMVxpXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1135
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBPbiAxMS4wNi4yNSAxNDoxNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gQWx3YXlz
IGRlc2NlbnQgdG8gZHJpdmVycy9waW5jdHJsL3N0YXJmaXZlLyBiZWNhdXNlIGxpbWl0aW5nIGl0
IHdpdGgNCj4gU09DX1NUQVJGSVZFIGlzIHJlZHVuZGFudCBzaW5jZSBpdHMgTWFrZWZpbGUgZG9l
c24ndCBidWlsZCBhbnl0aGluZyBpZiBubw0KPiBTdGFyZml2ZS1zcGVjaWZpYyBwaW4gY29udHJv
bCBLY29uZmlnIG9wdGlvbnMgYXJlIGVuYWJsZWQuICBUaGlzIGFsbG93cyBjb21waWxlDQo+IHRl
c3Rpbmcgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aXRoIGFsbHllc2NvbmZpZy4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+DQoNCkFja2VkLWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNo
LmNvbT4NCg0KQmVzdCByZWdhcmRzLA0KSGFsDQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwv
TWFrZWZpbGUgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgYi9k
cml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUgaW5kZXgNCj4gNjVkYWM4ZTM4Nzk4NWFjN2Y4NjVkMTMz
MjVlYjkwM2Y2NDY0NWEyYS4uZGU4MGYzZWU1MmM0MGYzYTgxN2YyDQo+IDI5YTc1MTkwOWM1OTAx
NjE1OTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9NYWtlZmlsZQ0KPiArKysgYi9k
cml2ZXJzL3BpbmN0cmwvTWFrZWZpbGUNCj4gQEAgLTgzLDcgKzgzLDcgQEAgb2JqLXkJCQkJKz0g
c29waGdvLw0KPiAgb2JqLXkJCQkJKz0gc3BhY2VtaXQvDQo+ICBvYmotJChDT05GSUdfUElOQ1RS
TF9TUEVBUikJKz0gc3BlYXIvDQo+ICBvYmoteQkJCQkrPSBzcHJkLw0KPiAtb2JqLSQoQ09ORklH
X1NPQ19TVEFSRklWRSkJKz0gc3RhcmZpdmUvDQo+ICtvYmoteQkJCQkrPSBzdGFyZml2ZS8NCj4g
IG9iai0kKENPTkZJR19QSU5DVFJMX1NUTTMyKQkrPSBzdG0zMi8NCj4gIG9iai15CQkJCSs9IHN1
bnBsdXMvDQo+ICBvYmotJChDT05GSUdfUElOQ1RSTF9TVU5YSSkJKz0gc3VueGkvDQo+IA0KPiAt
LQ0KPiAyLjQ1LjINCg0K

