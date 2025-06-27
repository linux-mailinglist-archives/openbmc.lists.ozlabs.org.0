Return-Path: <openbmc+bounces-298-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E10AAEC3DA
	for <lists+openbmc@lfdr.de>; Sat, 28 Jun 2025 03:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTZrV3L4xz2ym2;
	Sat, 28 Jun 2025 11:40:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751018582;
	cv=pass; b=FDEHain0lweWwYWIijqzdlZfAhTu+k9j3+AgbkEmB5o9Ntk7vfnKTab08MGprXK9cz2YuUGgfRPosq0ygHF5z9zTN+BCJhtYW4Eh6V6HxXQQcUwcDHctKEFGSaCSyy8rdFG3ynBVv/GdtYu/Hba03tcWwD/rzB97QWS14gIqLucfoyig6s6QnroIYAAQYFvzWFRq+uLMS73YCmeB7I2oEIOFNmVEyioSiyttgBH1GC432ClDWKZhUskMhY1Z/0Fjbbeec46t2Pe42oY23UwKJT+rdLDanIrUv/BnkSczldK3l+15mbxQ6XvlcGnvvc5N531JgWm1b2JSOt2ThBl55Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751018582; c=relaxed/relaxed;
	bh=OpPjYePwJ+hWkNOkooaP11lAd0Iy6i4O+PzjjJgYpEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nT4M1rzNHzUEciigkIBsZPW1SNDgxf024kydgXEjE4IQu2XzOEhlV5NryblGiLqjOsxT9BPjNrTn08Uq9rTTFttzbsJF+j+LQ25AmJcuQBo7oPlxNo0fxEQHPeaYCFnl+KGCo5oojBFSb6v71eK9R7Hcby+G4zR7FT+D5K9jC114A2ZJaACBkTdW1Y1UM+HQnh8fRX9hmbzixKMIbvz7QR29nNdIVfVAXRL7WDy7m46jgS8QOY9vKPqvy+66fIKRQAasOWl6OgZzUFV41sw+FtiKRLnKkvxwaAup0WjlE4GkJ2uWKGy2pERDctEtW/mDA4gY36T9JtO60vKBKcdlnA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=C7TqAzvz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=C7TqAzvz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTB293mWQz2xsW;
	Fri, 27 Jun 2025 20:02:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6lWp4J9wSMgXChbhciE2hHp2X3ofIGyiVtLvZAIaP+puv3AqTafLLQQIsrlQOjvudPi863W1SSb7sxtFoRq8+pZCDtzCnW2ox3PVZi6ciuuaoybMfR57aV0R5Sq1ZoK+Zkv7+H7HfLPvlWk731eHYCkInHXdEtck1wSaoMUn6kTpq3UkE1jSbQNlftWHpVxCpCHB8ce2htw3FNJhLBEH+hImSbfzXkBlGJBn7etmAUG+h3vNw2EZMKwycEx/2JVdCtw9AoS4mGGLxm65lt/hSmYJz78A/Fc0G1piB5OJ5MyVogeglO4IdXeimn89rpunw5v7S9iAURQEvvuvYu0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpPjYePwJ+hWkNOkooaP11lAd0Iy6i4O+PzjjJgYpEU=;
 b=CBIG1tr5Ry9zAKeECDCKoygU+gMg0btD1yRQLO/A0dmjNBYwb6X4gtjXSRgLJBYzBHvJO+c1/sEsa0AwAS0mofFPOTnRKK9ZjhTfvJBA7Bbvbdyo9qHlc5X23iHFcwQvnmS/df/+kb5EPzSaT0sZioQk085EC4mjQKM4cVWceg6Ou6akUkVKrWW/PuDTjIaDnyOkvN19M5gt8+Fg1ICXhbqYcNbJ4Kfo/aAwiQe5TqCNSo9KYkXwiOMxQZcCQKPxyNymk7KdxJcwfXe9umV903mlyF19Me40wjIlwtLWcezPehK19hOR25ao5GlzN92sNEJYy43N6GVLuAbtIsJRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpPjYePwJ+hWkNOkooaP11lAd0Iy6i4O+PzjjJgYpEU=;
 b=C7TqAzvzpPS55cldO0uY4Q5GlHvaadhZjesUNnIOiBLpt5u1u4vXrLHI4NEWuH0bfr4DOMoUzr9FqXkNdu0qWLk3jzd1LHN+1FcwGUBDmW9e3jm/J9FnnqAi62XjCp1QO9JZmMANIjg9PZCFqSWFkK1tbq1uhwXuBWHXlZBQE88wq18I1A0iizU4c6+5R4JMQTh39c4PQxVeeA8+KDGERUhw1+fyoXiZ8CRANXyaG1o2bwd5Ibf4ltniuNizfgLgFHGeW/EK33P03lGg1Om2lPDEaBZnTxWS+U37yIptSlEDMKSYevuteba/MXhiVfRipxhKAPBvHTqzE9RReQ9Zqg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR06MB6760.apcprd06.prod.outlook.com (2603:1096:820:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 10:02:34 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 10:02:34 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>, "anhphan@google.com"
	<anhphan@google.com>, "wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Topic: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Index: AQHb50qa7xgMdI1rPkyV9YYqvYQXFQ==
Date: Fri, 27 Jun 2025 10:02:34 +0000
Message-ID:
 <SEYPR06MB51341AA9C2CED2D55FFADA629D45A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References:
 <SEYPR06MB51346BC9292066243CB845699D7BA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20250625221653.GA1590146@bhelgaas>
In-Reply-To: <20250625221653.GA1590146@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR06MB6760:EE_
x-ms-office365-filtering-correlation-id: 42d998f9-5c6d-41ce-0714-08ddb561bce8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jmsTiMnmYwUMptzbQHeNRnggSzH2vytMwNsrurL+1vv4sEps825uX9ZFoCrM?=
 =?us-ascii?Q?/YQPlIZLqyBijits1Bp3iMppLOa1c0doKEftJpbWvbH2fgTQfKKFTL5NH7kJ?=
 =?us-ascii?Q?AaugtAbLB21yxQS2j8aj/pAUdzN3fOUCOGWm+Y7mivVU8T77pJQpPpWDuHXF?=
 =?us-ascii?Q?HUydcdrao9cN9T4xerx4IEc/BjXm3/fSRvE9y3fNWA9ir2GfiS3yMX8MsJvn?=
 =?us-ascii?Q?/AUu0WD0uhhpTZnM4d4siDG0RwJfaqY+UGTCEacprsrnDNw012o8Eb4f27yE?=
 =?us-ascii?Q?thEJzcWy1NgSRFmUYt/keCHdgU7u39x0yxzir9D4F0mRq674EL69pFdrKJPc?=
 =?us-ascii?Q?X/exZI7UvMA9ZvPfpaSMO/YzA3q9Tc38ks9U0JimMy8QCqADrAJuj+PGDOO4?=
 =?us-ascii?Q?lJi73ANEGlgnYRW+hy5Z0TxNRl9gGiMs6oVUq6vwVEFlAU1F5zkysZMDUEnc?=
 =?us-ascii?Q?X127OW6P0NB1FGBnRCIHme0sATb1lIKR1asj1HhQIkoNG+C34AUTi6/WzwFN?=
 =?us-ascii?Q?xntEPa+9gcTVXoN/JGNE1OFIcM5+iu4IVvKHWxL2AqcJVT53ugaDS6x7nQO5?=
 =?us-ascii?Q?s1aIDQWkZ3fdoLeuzClsz46MCHpRb4RamnboproMHBw8Z1phFTwpyJrZTvKk?=
 =?us-ascii?Q?kc2BM6cUarn+jGzUMzshhhhLPZvDJCOGGhgFB0SJP0obYxCMlLUReJwi/Vt0?=
 =?us-ascii?Q?N9dkxyYfBH1MHE0ZmoebPQr32yTc6E7no7WC54kuqWlrbeS3QrLDjsqkn9Fw?=
 =?us-ascii?Q?r/q++gjOBdYeMbjyqfAO7Wev21WiDJ22kTyWBvvEniG7BtlSasvI1c4qZqi1?=
 =?us-ascii?Q?3TYEaRkarpJ02sTjNG9T+ymdCFuIqsXNI4B0ODaxu02qkxE1HXT4ozXtLmPL?=
 =?us-ascii?Q?FrHuVGBiZKHwUx6PXKuMr0GUU3S6Zf0vw3QdX8jbfodjiFMDjdehoRObJdXo?=
 =?us-ascii?Q?14f+CsGQndgASU7cftzTaS/ylYKe1IxE1Q8SH6B57rE2YqrPv6S/WVhmCPK7?=
 =?us-ascii?Q?7svjEz2+0xY1FjI01x9+/+qnnoq3EfHIjAQsdNaDTlufGae2ObHTct9ZNPBA?=
 =?us-ascii?Q?9f549WGlCqrJSwd5sIDmj0Nw3cM5mDnHBJZvf3I6GqRIgIvnwRR7h6ZHx9Ru?=
 =?us-ascii?Q?HJHfikPEAOpkP+sOkObs48l2ouGvKDj7vMb4LgF1KHCv3BPhkNoeUH70p/E5?=
 =?us-ascii?Q?ixLuaFf2RNurjBfLRDSAEXzKLpQBglL2yfo/aZTUGdsLnkRkulC857yuQjh3?=
 =?us-ascii?Q?dKXfp/f+9som52GGrTqGSxghGu7+aTM8ygkdX7uu7vE8z9OqaVSSBlepf0Us?=
 =?us-ascii?Q?S7jtyOa6rDUgGCpIAshr73xCIW8T+Pdvr28rGr+POFJDGOhLqbZjjZOMTNSu?=
 =?us-ascii?Q?OtZO8elC87vX0djAKEgi3fct6nuDCvsHpo0hfBf0ULJanYoZr573H8rjchdH?=
 =?us-ascii?Q?qaj58NvWTR4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2Gk8xEBORt+Rgh7ZqUtXa5M4SyZYYAq5Tzs5Fs1W2KZUtUF5iyGH6Hy3/WJt?=
 =?us-ascii?Q?QiEWPJ1y7fXZVjekd2Vh/TIRQmO8i9lvULPcLPWcsAobMZDg7i4qgJi/953O?=
 =?us-ascii?Q?2kb2izxUOpdaA69jB7sjrA6an+Kv4qr8PUpPWhrht6Q5uBJIw2YTMB1xeQE1?=
 =?us-ascii?Q?Chz30FiZjX0+3biUiaZUyzdtKf3FwoHrg2jE8b56oMkDRT0x4tVhcnBtdUQc?=
 =?us-ascii?Q?oqTBggTs/ozd92MpzzoRTpQku0q+gJx5VAbGw92ObRllZi+DcKpy7R7/eLaG?=
 =?us-ascii?Q?LaT9V7nsHSkFVgUpSsoOgSIW6SXjQ2etrj9bqnfqKm04JyjZEPhyR8mlhdSf?=
 =?us-ascii?Q?q2Kq+F3jT+nPVtFl9oD+qbBQMdvTpUyidmIuFDhH7OAe+Yv4oe8aJlbbKWtX?=
 =?us-ascii?Q?EoZISo3/dcjl9Q+MacRu+XXjUa19dUgIZrlG0zpEJlZgQNASVVZPFPiIiuz3?=
 =?us-ascii?Q?JKUPxU4ExpfbkFdkqPsmNTGYv81pledfObFVWybHNoSZvwRE883dCvTLT4nj?=
 =?us-ascii?Q?4pmQG2TVNi6/sMSiHtfUFHrUo4LcUQuv7Sg6XBRVPTFZ3wTdRuxgG06PRapF?=
 =?us-ascii?Q?myIJQc9dVTOydjSDvBvIjKIHSyr9bemCQa9M9i3H0BUv20w2ofgtqpOCzgGR?=
 =?us-ascii?Q?HgtSlXAFjg9wFXESlA+p0baQzmvI9WXHSRlEA9aI/SIjEYSnA4juwOP0YyAs?=
 =?us-ascii?Q?Y+CJA9tdSK+3QmN5YXPjyrJjQlvAOOG/VkVNm6ncEQqS2oITIs+J2wOtft0O?=
 =?us-ascii?Q?d+tZr0p5pOGxYTs/lO18HkZ0h7MpZDWP+ieGwFjJxs1lWZWUCy4XkkrPlhz8?=
 =?us-ascii?Q?ldULxTtxy5X6hus0P3wKg+uAnwopyZVUUysbsOKbkfH2DWXh+mmM5MG2HBRP?=
 =?us-ascii?Q?CDrZDVT5neAEcpv6/Z6pEGLtShOcjc4hbJQ1/gu9rM3LRnuUzD8sbA6RG7nB?=
 =?us-ascii?Q?rSpcVPJw/kBionpm1zzkTJ8mt3EI/0uHJQis6br266+IN0lsnpl3LLukHY5l?=
 =?us-ascii?Q?qX/k4eOgYHXf+PDxG130tUlNFtlg//li7RCiV9Vpp+5PvTcxWB0Scy7FVg1l?=
 =?us-ascii?Q?LIPMRJQnbPnyJ3/jF0nUqm6rYP6iIRmHM4ug8OULDFn+jtwX67rpY931OfBR?=
 =?us-ascii?Q?y8txvEYZMf1I6xoxqvfoCmS0vR8bKUk/RQa7oO5P6lTghJpvBFv1KGhg0mlS?=
 =?us-ascii?Q?GE1kHAzO1S5mvHI3AUXVSnrZVg9z1II0D6O/+giPV3SkENX9NqSgWtarx7m5?=
 =?us-ascii?Q?LH2YKEg++tv1+9En+LpCpNSfX+ercMfahB0lyWJBNdPhWzWwVPKCghriPIAu?=
 =?us-ascii?Q?DeVl9z6kgW8aUbdMp/85p9fDO8zPPxNlLl8cTVFUx2PkoSUoaNojgFjeiUDk?=
 =?us-ascii?Q?dXFdKK/vZWzXKW1giHrvA8xsEzj1Vq0PKo5T/KZA9IjcZV02GRYVbK8HtxHa?=
 =?us-ascii?Q?HQJNF7pKz6YmXhWZ/61UCZ17vkhcQ5Xb+M4kVv3bPGP966PySxjHUlX22MLw?=
 =?us-ascii?Q?kiWvvYkBpvrtRwwYT2cQKgEckAvlOlNtH0tqQMgD9MtM360LvoNrlqibV9Ed?=
 =?us-ascii?Q?aKi7MHI10IDtsTjEqwEKUXmnWf0/8q9x1xGLd2E8?=
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
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d998f9-5c6d-41ce-0714-08ddb561bce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 10:02:34.1795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEAeO01K2igXp6JPh4vkeCpEwW5zDfomtTFV5FyaUO/7YyzXdJ1IPU1MWW/g8qMPNfEsbURP+72AcH4Q2rKBLeCC8bci2nM0OLQMB5hXI+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6760
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > > Yes.  But this driver may be used in the future for other RCs that
> > > include more than one Root Port, and it would be good if that didn't
> > > require structural changes to the DT.  Also, there are RCs from
> > > other vendors that include more than one Root Port, and I'd like all
> > > the DTs and drivers to have similar structure.
> >
> > Thanks.
> > Is the "pciec" node in arch/arm/boot/dts/marvell/armada-385.dtsi
> > what you said?  Or could you provide some examples for us to modify
> > our pcie rc node?
>=20
> Here are some examples of DT bindings and corresponding driver code:
>=20
> * drivers/pci/controller/dwc/pcie-kirin.c
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml?id=3Dv6.16-rc1#=
n108
>=20
>     kirin_pcie_parse_port():
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/
> pci/controller/dwc/pcie-kirin.c?id=3Dv6.16-rc1#n399
>=20
> * drivers/pci/controller/pci-mvebu.c
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/pci/marvell,kirkwood-pcie.yaml?id=3Dv6.16-rc1=
#n12
> 5
>=20
>     mvebu_pcie_parse_port():
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/
> pci/controller/pci-mvebu.c?id=3Dv6.16-rc1#n1252
>=20
> * drivers/pci/controller/pcie-mt7621.c
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=3Dv6.16-rc1#=
n11
> 1
>=20
>     mt7621_pcie_parse_port():
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/
> pci/controller/pcie-mt7621.c.c?id=3Dv6.16-rc1#n198
>=20
> * drivers/pci/controller/pcie-mediatek.c
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocume
> ntation/devicetree/bindings/pci/mediatek-pcie.txt?id=3Dv6.16-rc1#n85
>=20
>     mtk_pcie_parse_port():
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/
> pci/controller/pcie-mediatek.c.c?id=3Dv6.16-rc1#n909

Thank you for your information.
I will try to refactor our driver in next version.

Thanks,
Jacky


