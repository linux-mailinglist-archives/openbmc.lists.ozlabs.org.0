Return-Path: <openbmc+bounces-830-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2FC1850E
	for <lists+openbmc@lfdr.de>; Wed, 29 Oct 2025 06:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxGPm2VFcz3bmk;
	Wed, 29 Oct 2025 16:43:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761716620;
	cv=pass; b=DHK5oLCVjR5AjI52nx4DihHT2Bx6yGnTFnjryNTEVIT4uOIiAdKKmNYDfpQPtr75Loz4qxfQvMj89O19L4G6kzfzqPDlugsWVTvTVQu1JeVDcSzOcK8NePddydCnl/+/hO0dN/iHauADz/+ASKvMkMj87o5afYTt8nyJX2rNoWEUJShkT8+67qiijrpu18JVFoYae6R6P4rMCEmIRWYuZbG/Pj0RP3CXh5iQ2T9lpAtlRBtlgTar/e8Z2EwehmOQ+bLMMUiVfDYi/ArtRkNqYHCtNPQt4BM9+xWH9zN3gj0gDbMvJtFwFZrfCQ0BNaoH8MywImzXnJT1uMOeEE3pUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761716620; c=relaxed/relaxed;
	bh=ynwy00dR/tsKfVhRmey69t5AYaR9MoKn+r8JSOb5jhg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yw/Oj8ggecDihje7nQCIUAoGLUjn0REQCubrYEokjmMddYkczxN0lzOy8w1BjZhLofeImAcX5d8BAar6BSaLK8sW8H3Tu5wABNq0NZtl88I2bblYSTX5rSDcvCQB9dkT9FHObjgHxNadMHuHfyfw1Nysesz80xQqzpuDwlKXsDugzPxr16qghUilNOiwrzEBytAqyojtOvkeVeocfdkHNRtjCPM3+ZG+iTcrtc7pGX7YWG2Hm6NOgsZNC6SXaJCK+OghLKD3PuwjgmmepEzYHbCJx9lAlI2yqDizPvv+B9XBIQUnv8QibL4AKmfTLrzqqgTI0PNbcd0hhhJ5yYoMSQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NtvJaptQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NtvJaptQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxGPk5nTrz2yG3;
	Wed, 29 Oct 2025 16:43:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BC2Nvdp0VdFecHVOI2SPeGSCiGinhQRIItAYe7BsBC1d+/x1oPTHJcGF3L65np4NA5oCOkvRyzf9BNlpaqycU1Rvb3Kux3YASyuDmcmhejIHr7xPi5YWjDFsVSdQuIQHEGaTWclqLJMOubN3rrYEZAZ9nP06BD77NSO1AWFYRhO3WjiOb6l3tNFJQ/FV/W+pEY18IRxBMBCTDLleHO223r9ntU1D51AuEWHUuRUnIxQL86SDByQZuKeVThQ0IeMSxdz17l5VqpiSIzUjhaKyERjU8RJlNpAtplApg3Q2L1kTRuSVmKI6Dnov3U3XDNy+rtW4lIJcZ5ttMnjEaTn0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynwy00dR/tsKfVhRmey69t5AYaR9MoKn+r8JSOb5jhg=;
 b=aR7SWAeC2esso5XqRiI4naCjBzzHKIPtcZsj+VTPsKiRUuevLlMWTUPoPeZZIUiaXGYH0LeuBajMX0xjQqE4qDVHfQLVSVv/AzrO8haIqrfCb8KtF1S0K20yGevgRlZxra3Jcc3dr0IstGEFKSvmPBtZ8WTttP97Eb7lFnIuHW+6nB1exG3jEwfVZetP55AejW9znghezXJGrJrSq3k3aVmAA/JEoXVl2C+bPOw/NczRcdGhRogFkPTWD+44t27YN0/Uy0Hpb/3iU3SOoltvtzrWGIQuMfVqe7nkVcMglMhDPR2WT+WDlGjniAq9JPM6gw/Rp3ENox7jNzOeaBWzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynwy00dR/tsKfVhRmey69t5AYaR9MoKn+r8JSOb5jhg=;
 b=NtvJaptQw4dNmEMrqtwFnhgToSTZaETwufEtfln8fCKIo27QoQXa/NHhGzP59QJ2YfcABxS9zDwOHSktCIV+kqk79vL3uuvxI43E7WXFLQWCBMP0APxSqcspzsTLCC8sAiXVRC4dXSgOg1M8eSdY5bqECxFr1zrIZXzTuVjv8XnTwLvAlInQk1kCq1cqXbmrgNsB+hJZHUKMoqpbuqA10xzGMZJrfLkuL0eE46YGoI32USW8GhSBuZYUnyYcqeIrxelSxR2kjUqRtrjaU9qC3PadXVBL1ew9tqValrmECx+87KcFZFq+PYngZUlulPphPpQj3pD/eqOPADqR5lrhQw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by PUZPR06MB5537.apcprd06.prod.outlook.com (2603:1096:301:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 05:43:08 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 05:43:08 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org"
	<kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v4 2/9] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Topic: [PATCH v4 2/9] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHcRyhADj69zSmEtEeIJduMtT9i4LTXlEcAgAEKe+A=
Date: Wed, 29 Oct 2025 05:43:08 +0000
Message-ID:
 <SEYPR06MB5134A2E62C79EE4008D2A3979DFAA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251027095825.181161-3-jacky_chou@aspeedtech.com>
 <20251028134644.GA1506590@bhelgaas>
In-Reply-To: <20251028134644.GA1506590@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|PUZPR06MB5537:EE_
x-ms-office365-filtering-correlation-id: e1f961f0-20d5-4214-67e5-08de16ae0a3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?piXnuStdWKRM1Jw/PNG14VE4J49l7asCtZosyXN4euXN41l9L0QLtizAZClJ?=
 =?us-ascii?Q?El9J24C2HaGkQBT00SPN2Tf+pZ2vvv4ARofqf4gfuNIxfag29mGwm6FLZgUf?=
 =?us-ascii?Q?fTP4HtdiQffgaaZRIczg+MjVYDH9Kl7CgGGFORSMlMJAl9kK7tcaZM0+SDUj?=
 =?us-ascii?Q?iqOElClVUsHuUbs2n42AUC2JbxAqNLLuosMxXlzo4aSw472WTUGwXRSVtmLZ?=
 =?us-ascii?Q?1AMKE/Q2lcQWyq9888Uh1Mpv1E4J2t9eY5t9iHl9GeBW6pjguo5fezEuAh9h?=
 =?us-ascii?Q?sYdoKIjTw0U2mJttLXsgg1WnA21gKje7O0JGk/nhEy2U7uNY35Gn/TlwBWj+?=
 =?us-ascii?Q?lnInffa+GuHsSyDjmnmNC+ClnIdUE/Dk/5y/LdzygluU2uSK/QjR0OfHdhiJ?=
 =?us-ascii?Q?vxsmS0vfgABrp1VwIWMMZpqlax0DlCnylAX7Nrxo43UnqvIBqUKfgH4y+BFp?=
 =?us-ascii?Q?VLMF3nFzf5JQH2TR2Y4rU5Hn9h/ImQloBaNLua8LAQitzYVPPUgUMlMdQRqz?=
 =?us-ascii?Q?4gcONhd4FFLuHNcVBO1LBkdzthSgysseUx7LpAQ3hPjepnr9cMxgk8icSBZq?=
 =?us-ascii?Q?yyCIEULjgj130lepc9OAlimQNceHP4bn0QpeDbHjhAFJEUvL4zc99dgsUl7w?=
 =?us-ascii?Q?7VxDb7rZxWPBmNv7+v0EHVsVqwhbQxSw+MBNZ7+WD1jXS29eZk+Ic0/+2YkA?=
 =?us-ascii?Q?PRWKh/2FS6AuezdLSUUzabbFWpb5wJxbLrpug0EyzFMyyzbOvS5TiWBkQ8o/?=
 =?us-ascii?Q?KnxrS7A6y3E+ze/sQc+wJ0rrV3Ddn8hNHpZP9TtsCe4H+94wZ3gEGwnn95mI?=
 =?us-ascii?Q?2QBuFcBRO44ykux8mH9YbDUS/opT3UhXZ7GjeTJGQAG195RXDUPbNcKSsd3j?=
 =?us-ascii?Q?vIN/a2fYU4aQPpXWwLB/nhd5gC3UtmpJHmt4vFArXgdiVHGa8HAld+uAMWtl?=
 =?us-ascii?Q?r2+aef3nii3wI2vVS6UH2IsYyLCMM8GmkULv/ng/tH71bQ4ewbciQPZ4l8xO?=
 =?us-ascii?Q?qsaSbrZhIWiyl5fBG2MTOXgGOpPoBL+NgYrr179ke2WHOvh/AhSdGaUqPQvq?=
 =?us-ascii?Q?5h4y2ZLlfA3IaBJYWLcxrqBHOr9/kZpvl2Jlu6UNA11RKoiVz2+3TNU2L4Qo?=
 =?us-ascii?Q?ETLZu3KNtfSL6s3OabZ+kcnOLsGRotytYciw08LkchFGpBePWGE/u0WFyLEY?=
 =?us-ascii?Q?vSR2Wsl+rYZ0aI+x9um4Y7XX2Fwpp/+eipMFckq1tCG0zlfC7heOSxrSxesp?=
 =?us-ascii?Q?UU7eSMaIN7Dqv5Pi+YnWN8pxEtzrn9WhALqZHmkCwCfkG7ckE9OFqZE7Rwkh?=
 =?us-ascii?Q?c/ed6cfSvWRF938imMhenn2zx37bJ+yRvk4mFO+pxo4FETVU0zfZdmCxpsN+?=
 =?us-ascii?Q?fyR06KacBZ+xKXBNwNbFpV94gGbi/C2etLjgM0oDzYcSu09xhXabSZxW5Bge?=
 =?us-ascii?Q?aWE8+e4NFQUGQdk3h0XO6j/WmBAVMN1BkIkFGtsP6T3YkeiRD+Ate4TA1V53?=
 =?us-ascii?Q?21HwruAefb5UHxIQO2gDUUdoSkqPU6YSJM9s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N/lImsa1pqvHnQ8nC4tcnfqhpYrHS4paUr4mh/wXQSPbP02Vu8nxoPIgxVuX?=
 =?us-ascii?Q?nSfQWte8Ms2JRbYURjkhOBdeGXrqig9m1pHvXKC6xriEANiJRJr7Oabt5Ehp?=
 =?us-ascii?Q?zPMVg72p3yiqAQPiwMFK7Bhzxt/lmXSI+TPN32HaIJuKzO7yVsWhyb86t9ti?=
 =?us-ascii?Q?dwur7aup6jGNFH+slN7FOujsPAXL4OLyC2jhDsYbts3P9FMyy0J+nksM9UJa?=
 =?us-ascii?Q?YMBmSw1EfzTWixtvpKgLn3+6mm+cTPSuuphjhQhQYzo9PEYFKXbDbrKH4hxG?=
 =?us-ascii?Q?lZJnbZPlLhvaY5zXodVg0lVUnGXCpeVMMSt0yJE9VX2jqD8p2bqO5J6vKO7C?=
 =?us-ascii?Q?1AxECp7bj2Uq+OdVPkkrizqqzhic4cQNn+UxAzbrM7cqj7YZLgx0nCEhSnIU?=
 =?us-ascii?Q?h/BnQe9teQtGgN/0FeTsKS/KfFabKtZCidFbNRYTPSxDhxgDrpNurwnEllEQ?=
 =?us-ascii?Q?nJflsZc+VBkrekECJi/WlWRXI/qDCEzm0F8O3klpXkI4SHC3O5kjCiF2Rm0U?=
 =?us-ascii?Q?z/XOx/bFYhANWMEwa5TeqiqnORSwcct3doh520Mq9oVx3VYg5WAIN4RQ3iCC?=
 =?us-ascii?Q?fw9f/MG6qC8dy1f/gDDGTs5oFWJQcIKdZlvknLRLNagiDvY2XLnoLUtVHEMP?=
 =?us-ascii?Q?x+eub/Nwum1/Q+vFYao1ePea5OvwkHfKhdgJTnJDy9VAF1WpKUl2athCIDH1?=
 =?us-ascii?Q?qK/i3FtJMFDrtiIzyQknBWr6hrPOvPJ3NEDHVmPl544u2BHadpVKKwiQ+qdg?=
 =?us-ascii?Q?v6AXuxW+kjje2mGMDXzxqtumqmSN6yfBONEhKSX/kDAK3hvabiPELim8Aa1d?=
 =?us-ascii?Q?Zxsz2iAn0I8JYeE/dlslhWOyKyBX0DhBitJY9xcxeotEeKKn3zNU+GtlUtGk?=
 =?us-ascii?Q?F/Q2TZJnf+b02/HVo1EaPWuhllX/FScq6M0yNuGIswzz72oRWNFy8RWYFEbH?=
 =?us-ascii?Q?qd8DhU5z70WTAhKnMBJLtYDxOWL0HcxTWgWBa97Dou46b9imjcB1RlhJ/W4X?=
 =?us-ascii?Q?WJ5nEHGDXgMDfwITz4FQFwrMSW55xN/r6hjD+yu6fm2byERxhsc5tawL1+tJ?=
 =?us-ascii?Q?ob/FUEEQNEpgEBYq0wGt7cru3p/scGZFhiK2euYSoKcH67colUBH8zj5YD7H?=
 =?us-ascii?Q?BXDIycR8RGIobSYNFz0t1IMq4/7ulLndeLljvHwcynMUqyJw0FqEzWTt2iqY?=
 =?us-ascii?Q?0BJ1w7+NeMzz+XC1/2O2vrynmG9qdECOA1VHSW9Lu4RdT9x9qZv2H2LWUXtS?=
 =?us-ascii?Q?RmOCKRw373vQonRlj9UiUumI++QrBpvXvG+EJCfeWA2eUWKMkz9QVTzZvf0y?=
 =?us-ascii?Q?4mfSKgQR6m8XRwAUao7wCUyrG91X2HXbMnF9qonv3aGsdZt3WW1bNI28DUIr?=
 =?us-ascii?Q?WXbjOiL4NHh3pch4toG2AjrasXMlwkEp5TgkFCUtoJ6XdkTcWs3y45zuDxOC?=
 =?us-ascii?Q?+N1QQq0vE54YcPNYHYaC3p4bhIcirQN72/8FMhiOUdrf9M9/ZV4bFKhyWIBB?=
 =?us-ascii?Q?zSWaShDMr7C2IH62iZtARpeLzOgL8gqSJPqfIuuLp4sX332tJ1rn2a69wmvF?=
 =?us-ascii?Q?ExlQOOReWCdMFy6VReXPxLwqjYFOy1wo7i8ksGKK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f961f0-20d5-4214-67e5-08de16ae0a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 05:43:08.3440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EqfczJVOqO7zlHLmbuzA0s0NFa8GTQZCEaeWkP+27nmEdG2hGSTxiUhXSXo9iKoRXT2zOEZSx1T09CG2xKWHEfIZiM1hIL29fS/k/NIirw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5537
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thank you for your reply.

> > +  The ASPEED PCIe Root Complex controller provides PCI Express Root
> > +Complex
> > +  functionality for ASPEED SoCs, such as the AST2600 and AST2700.
> > +  This controller enables connectivity to PCIe endpoint devices,
> > +supporting
> > +  memory and I/O windows, MSI and legacy interrupts, and integration
> > +with
> > +  the SoC's clock, reset, and pinctrl subsystems. On AST2600, the
> > +PCIe Root
> > +  Port device number is always 8.
>=20
> s/legacy/INTx/
>=20

Agreed.

> > +properties:
> > +  compatible:
> > +    enum:
> > +      - aspeed,ast2600-pcie
> > +      - aspeed,ast2700-pcie
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ranges:
> > +    minItems: 2
> > +    maxItems: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: IntX and MSI interrupt
>=20
> s/IntX/INTx/
>=20

Agreed.

> > +    pcie0: pcie@1e770000 {
> > +      compatible =3D "aspeed,ast2600-pcie";
> > +      device_type =3D "pci";
> > +      reg =3D <0x1e770000 0x100>;
> > +      #address-cells =3D <3>;
> > +      #size-cells =3D <2>;
> > +      interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> > +      bus-range =3D <0x00 0xff>;
> > +
> > +      ranges =3D <0x01000000 0x0 0x00018000 0x00018000 0x0
> 0x00008000
> > +                0x02000000 0x0 0x60000000 0x60000000 0x0
> 0x20000000>;
> > +
> > +      resets =3D <&syscon ASPEED_RESET_H2X>;
> > +      reset-names =3D "h2x";
> > +      pinctrl-0 =3D <&pinctrl_pcierc1_default>;
> > +      pinctrl-names =3D "default";
> > +
> > +      #interrupt-cells =3D <1>;
> > +      msi-controller;
> > +
> > +      aspeed,ahbc =3D <&ahbc>;
> > +
> > +      interrupt-map-mask =3D <0 0 0 7>;
> > +      interrupt-map =3D <0 0 0 1 &pcie_intc0 0>,
> > +                      <0 0 0 2 &pcie_intc0 1>,
> > +                      <0 0 0 3 &pcie_intc0 2>,
> > +                      <0 0 0 4 &pcie_intc0 3>;
> > +      legacy-interrupt-controller {
> > +        interrupt-controller;
> > +        #address-cells =3D <0>;
> > +        #interrupt-cells =3D <1>;
> > +      };
>=20
> IIUC, Rob says there's no need for a separate interrupt-controller stanza=
 and it
> can be directly in the host bridge [1].
>=20
> I think that does make interrupt-map a little more verbose because the pa=
rent
> unit address will use the host bridge #address-cells (3) instead of the i=
nterrupt
> controller #address-cells (0), e.g., this from [2]:
>=20
>   pcie@10e40000 {
>       compatible =3D "renesas,r9a08g045-pcie";
>       #address-cells =3D <3>;
>       #interrupt-cells =3D <1>;
>       interrupt-map =3D <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
>                       <0 0 0 2 &pcie 0 0 0 1>, /* INTB */
>                       <0 0 0 3 &pcie 0 0 0 2>, /* INTC */
>                       <0 0 0 4 &pcie 0 0 0 3>; /* INTD */
>=20
> [1]
> https://lore.kernel.org/linux-pci/20250509204905.GA4080349-robh@kernel.or
> g/
> [2]
> https://lore.kernel.org/linux-pci/20251007133657.390523-2-claudiu.beznea.=
uj
> @bp.renesas.com/

Thank you for your information.
I will modify this part in next version.

Thanks,
Jacky


