Return-Path: <openbmc+bounces-1306-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIvQIJjKfmlkeQIAu9opvQ
	(envelope-from <openbmc+bounces-1306-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 01 Feb 2026 04:38:00 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7DC4D7E
	for <lists+openbmc@lfdr.de>; Sun, 01 Feb 2026 04:37:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3b6q2xBJz2yDk;
	Sun, 01 Feb 2026 14:37:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769917075;
	cv=pass; b=PSaMUNrAvl7mmZjCiGSC5qpEaGJZtfTHOL6RycNb86Ihz/v8+9AkjkOsosHzk34hKn3IeSRpxOYZbZc5BV+xloNnBSJtLE8JxPDFsHcFZtHBXKK1kllxXPluheu3em0wJjXhT1tdk4ROSKMAerVfPRfWuTNjpPjGHnOmWKj6N5n0Lgqd+yGL1CgQPdOiTkOmxMrf0pgsFLwoyKNoibpxtQu5ZRYFruoT4FmjKP0DEd0L+ZCPx0DkjFv8MLKmoFxcswHKf5Rnbj0+TapGOEHnCaQBDt1xGvYPuSxrx9Iy+QAsWnSti/FR5QgVoOUfJ8WzQOrOMM7TvLGm1LgX4bVmJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769917075; c=relaxed/relaxed;
	bh=7L4+Z3W2Q2m1ozqgpH0VxwCytt7TbZyGG47jusWU7+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PBVnKTsRTC80D8Hab5ac8NVKvRwkaxtGnLIj2+eJP5oj7jLf+Y6ZJJ8Deoj9z3X2u/Uo4U8/R3zAtGJaTCUETRKUpvp9hyc76EfUXYDE6V+slQ8l08P5AJVWLKlW1mnKJl63gSTg5hiFb34cg/oNAsroSr9/ve0JDZ5lLamTnv1EsF/qsDrlHG7wTcFNaWy3RdgxcAi1NFde43IQyY01mmpPWrIzrqGfmQbJBitZChgE1ZmNUNUz21CLSftGoiJgl36f8bZtDqJUkR+gQBXBenc+oPKOljD4bb60XD+GnaRdHylwpuZLm7VtUxK/9AHx60nnDLfbCt4oT89bJrEsyQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=etVbd6DE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=etVbd6DE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3b6m632kz2xgX;
	Sun, 01 Feb 2026 14:37:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBrGHfGeTiJSK10rwapW4LfAJxRPTO14gfY1+NxWctcs0zVsiyUPETuSoD8bLXjA08qEFe16PUDrpjWK72HlUj5o+KdiLSLvD+/ST1bP4rZzclHyeFZAT3dpFSBldiA3z8KaG9k8XESfD3ZqbnVUCBb77UyzroFnBsjLDO3MhN6toE9MztwgLxU5tIPQhQIrlT2CjUHl0My9L36HDXY+ExfJLsjgKGavluG7Td5mj79qRtnPegNqUI+zIocD2yAmaDlKqFCaJf1uppxaoMxHxGs4JykHeO53XZinFmpkzAQvZPsI4UL6RphRuBDpoZcJosSw2R1RLMmJtbVoCMQOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L4+Z3W2Q2m1ozqgpH0VxwCytt7TbZyGG47jusWU7+8=;
 b=m1WMeRprbMzBMIOngqxujaO+7oPHGVTo5XVvLeYMZUaN0I7Ffs3Zmgg/gSiyCzQxPVDgoXYGd+ROOOK9DQT71hk0pTIygp7Ru/MG/j7zU3E5WlF0X3SYI+WlfSjBSLxoA+M+aO9YCkC39U1gS7jpT8NYktfkjc4KiJJUysntPLrrgJ7+MZMjikdtdF2YCNWMQjjerFcYZ4/9pWwgX+oWbcCijOQMtKrlR4zanXhEtSZeHLqnoTGNYjqbUOZtL0NEIHdD8a2Cows7nr0okA3SAvthrbpWhCwVukAQ5uGdolNJxfJ1zeXpt0vdNtMf9ozvbRkot50Oz1GL+1s9LjBkvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L4+Z3W2Q2m1ozqgpH0VxwCytt7TbZyGG47jusWU7+8=;
 b=etVbd6DETv8lkaWmvPiaFnU+0ipd238qq2RymW7lISwP4AbXQz1SrAv1Ga7vmSs/IEJ7GXx9vEQXxK/3RlldEyFjnLSPRxJwKku75Gr7CvcogOJ2+WXjtKn0yTSvHflBhpexgkE+m3eVdmQcu34ctxLrTilxLpXbRF6pYx6vmL68VLilutgOWUkYVY0HZ1t+0gGfdjRcogn8IlE6UqYk1zl+qLywXkuoBFz916XcFHrgoLjs5JSmBlU4aBrvLNRoTjdqWaseRJ1aFm8KZYdcnBRrgcTpEGrBc3Rf4mHax/dN/uWClHeim3dFscP5zrMCK4gIKjPPowRvVf5E5UHCUQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TYSPR06MB6363.apcprd06.prod.outlook.com (2603:1096:400:417::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sun, 1 Feb
 2026 03:37:26 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9564.013; Sun, 1 Feb 2026
 03:37:26 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Jeremy Kerr <jk@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Topic: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Thread-Index: AQHcWCxbbHqO8nwNMEO6CZ0FnrkxPrVmMd8AgAGRYjCAAXPHgIAEcLPQ
Date: Sun, 1 Feb 2026 03:37:26 +0000
Message-ID:
 <TY2PPF5CB9A1BE6FDA2E38B8A4C3540C522F29DA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
 <20251118014034.820988-4-ryan_chen@aspeedtech.com>
 <6b99a6ea267fd0f75d4c366293fe6887cc038b7e.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE6E6353CEB66FFD0E498C1F29EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <aXsQ2xgao5PPqnk6@smile.fi.intel.com>
In-Reply-To: <aXsQ2xgao5PPqnk6@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TYSPR06MB6363:EE_
x-ms-office365-filtering-correlation-id: 92229acf-1715-47fd-38d3-08de6143382b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bt9A1w8Di96WPACAAO41b3uANdMtfCpDZRgC98ztNexSA4qIuaISHogRJhhc?=
 =?us-ascii?Q?DdfWc5GQS9pNexTJB7VUk6TDsBuNm3z705o000xg74mL4DKCKcmtWgMs5udq?=
 =?us-ascii?Q?wyU2fe7KjMx0yP+O+MfX/opFw4njpxdUMn/o7E/2Pf3d43Npbp04HtOwuSCS?=
 =?us-ascii?Q?OiK8Xww4l7o4WCYmAXBZAhBY8xRKyPZq25DO6M5euiE7gdqCQu61AnjhQOIg?=
 =?us-ascii?Q?NhU9bBtzVw+bUcrgBtpP1T7zWydQV/3N61c740i7h3oehIOXXZ7KfxFG9r+D?=
 =?us-ascii?Q?t7eWKoe71HsAuoA7FQM3GHTIIirrIwGwT27RVFT4opRA5FxMb06A+g3N3QU8?=
 =?us-ascii?Q?ppIYRA8BofI0jM3LoOW+hnleL1Y0sG9LqJMvbrA1ggH7FNz+RAiqPGUi72uF?=
 =?us-ascii?Q?L8fSNDDmWTajRic/nLVa7nhd/BQlGURoWF/vlzrtnG311rQEcRDBgX4wuEoa?=
 =?us-ascii?Q?MjNimoiNAjYOyKs8AXse+HuMZ7TRmW1NGigwOf53lPuEXImtgs6g1+RtMXQJ?=
 =?us-ascii?Q?0lUR6Bpp2+SPBpfD3wxqsJ79F7YapkUaYYvAITpQ6S6GdTHpm1DM7QDO3qZP?=
 =?us-ascii?Q?iaM6rIRHTPjQ7jVtB+KvsergcmDXvEhJ1sPKdoiGGVmujRu3tc0sEqowANKx?=
 =?us-ascii?Q?pPk2NY/TOsSpIF+SaRNEV68y/LEwzYyqO9vRM/0A988K04mhgEl1RNGz6LPm?=
 =?us-ascii?Q?LMcnWcLG5sj5g7LU2WGfO+7mYYhzkSAjdzwPIF3sGhb40EZN0v9aox350d/i?=
 =?us-ascii?Q?b0nA9f4LxjQixHioDeu/GTuNnpMgIJiMoFf+edX09UIvnT1nUTF93tI5Q/Rr?=
 =?us-ascii?Q?cUeEX9jO3KEReY+kBxH3rygYLpAswYDgERFePY/HnihEe6YxAVAfHSPYdNIi?=
 =?us-ascii?Q?eRFCYlWmthguYoY5TDZsQ9cxxhkD13eIh4/PCySXpXk9Cp7idelfZpK5tM75?=
 =?us-ascii?Q?zkRnVCK3SqyO48AcoIIImyncQblmYUtqQFHQvqVe0m2Z5ROwPP2j4Lih0IU6?=
 =?us-ascii?Q?bY8vsDtnfNbnQcN9AGiuEdftnUwIo755mTPmYl7IVXwfBtletre/FYq4u5Cp?=
 =?us-ascii?Q?uo/hSt3MUMNDoJ4d9Grn8UQ4ETffVRxKc0SB+JyHktIEsY8sm3I9u0KmajZP?=
 =?us-ascii?Q?oi4R4DhuKzLorALyTAjgAVxflwu7xfUM8RFZbdeydZs6WRo2nDnx2rkRGXqC?=
 =?us-ascii?Q?FA1sShzdfo5X4GsyuQJTKmDP1PjyswCDOPftURuRw/JUtcntOpu58qpF83TG?=
 =?us-ascii?Q?fdGzdWq22EPL8/AvQMfXgDkAGGAfVYFYctlbA1qZnrVpL40CgJeGbHqdmTSR?=
 =?us-ascii?Q?Ztns087AGyt56M+M/syZ2OkKZtt3X+VQESPMlBIZidirCZls0oE02T9H7Tkc?=
 =?us-ascii?Q?lNBSlTxuoxgR5aGCa+r4OsOsez7pL6XEYARD5bsZQa+b9I2eurDs2vZiUcIQ?=
 =?us-ascii?Q?EoQAVCt64aJQJ2P4JFOkbCD8r9tNzdhPEtD7W/IZEDJ/VJJtlM6zdcQgzZ2C?=
 =?us-ascii?Q?JsBHdGzApIEh2OqT7sIBPdsWm5E9p5p7MRer2lmsAiCLnyfJ6qyuzI+jEUgN?=
 =?us-ascii?Q?MemjyN0w112Zio/hIjaiMZP4Y2Yqx9geyxR/aO0B2BW5lX0Tbw/cSz0cSWzw?=
 =?us-ascii?Q?C0hw3QWEO/Fp67dOmPtGfG0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fmz9YtOJw/QceQnok3V81D3jIJ1megYXuqdgpz0WCywAw7Y/nQoCsbZq8f9J?=
 =?us-ascii?Q?2oEWd5l9AX4mA4tuD44AaZdkQX+tYYt4hQ43Zb84TZj4pw4D+VycLRvpWeQv?=
 =?us-ascii?Q?07BnuVEdNude5MKzed8Jsx8EUzt9Oy8MlOj8UoquCvKh7uLAa88h+5rUQyzH?=
 =?us-ascii?Q?GxJC6HsTlXfm7YxBNhgXrtAB6sw29Cpdt5Ly4beJm9jiSVaB9YabT7rf0x8P?=
 =?us-ascii?Q?rpz2eiNLWFy3RfnddXCcO2KMmXFyE5JNGLkrQXl4ZW0+c3hak5ez2kSFu7Rz?=
 =?us-ascii?Q?ff115jB1J+LQwA3m8S+7FbZIaHnnJxOBxznCr1/dY5rQqvvf7pyXMLBX2Io6?=
 =?us-ascii?Q?hvw036N1hF6G5813VQntfDc0LDmmz1hnJqjk+/aBOulHQfX/yzvYX115sm/I?=
 =?us-ascii?Q?IyJzwK8Pl6tnllyPMyhBPcSuyrWm2DYn5n3UV6ZNzyg/PnORO3Kt5WDZba90?=
 =?us-ascii?Q?oUGQFRz0msh6waRGARwsj3IHurp9y1/PqWuByKH2pTKAs2RgU6j5RD+lFklm?=
 =?us-ascii?Q?cj36gynn5I//wxakC7Qd/ZHqXpfjpsbIGhsz5PJp+LK3nAGouDUxGuBqasfw?=
 =?us-ascii?Q?ZjpNh0biAfq2rgfpXNK2kxZFMR/40o3TRqq8LUj82inD88GhAnZoZ0e48JLD?=
 =?us-ascii?Q?IqyO0HU/OdEmLIV+80pikXjo5Jw4PxRnilQVhAYeSJz6A6PhSPIfhd5uPxz6?=
 =?us-ascii?Q?/PhU+GkJQGj5xEl1n1Zt2SVt8Z4RizDddZbwKnt1YrMJ0gafkdycRAAGjGpT?=
 =?us-ascii?Q?qJ41TZcgZP42BRmGMQM60vq7Y3Df6gwaoobDO5SDIPiBvTpM5+DmsG4M39+6?=
 =?us-ascii?Q?241yVy9ore+QHtfset6hFk9JOAe98LTvS2R3wKiPDP3nZDXpcK7fK/uO4ycF?=
 =?us-ascii?Q?CXdAqBVcdOZAQVzTFxunoWEpZoSiCFd0IsDuWPVP41keWEpbQ7GC8z/0CuV+?=
 =?us-ascii?Q?mwdRKqEF5VUKTBGfLtpYdqYFeWHuSRuz4CbPVRAf/Ugb4aQ3oQDzmG3kDoyA?=
 =?us-ascii?Q?zQnCmlWIOudj9uSCuMiLzux8F6RxlwxIWI0/crdgfE6SgQ7ykbPx4e/d6OGC?=
 =?us-ascii?Q?eRDy3GN3IsqCFZIqx0A5J11AipCeHfIIKqmJAupH9lgjiSxYSViVsrbba6Bn?=
 =?us-ascii?Q?27kwabkzscOax/7e7YjbJ+FI59oGxgy7mfz5V4FcmpgKOk2QaZYOLB6T5yb5?=
 =?us-ascii?Q?5CQ9RjcCorZpUzAF60tpL6ONqjg4MGWt7/NkX6uuBlx+I1eqq4zYPkCRfUsg?=
 =?us-ascii?Q?42woKQ1HiaBoTTlUDMh87HWDBhYeYW4rBwjxxB9oppNxRLQAteZFnzPjOvAu?=
 =?us-ascii?Q?kDlwrZz75qoSaSA72myUGqDBecywZDELbCKi5YzxRLb+WyrtbkE+t5Y9U6tc?=
 =?us-ascii?Q?MFAg/tVTp3sSwp6rquB0TTLtN8hAmc+t5jkH7OvhW4QEZ+doLwnPWxKfmQUF?=
 =?us-ascii?Q?Xco24tmooSa1VsiwIAwesfONwZYLQlVivv8kV4mTv+w1Q3iUckMeero17vu3?=
 =?us-ascii?Q?DNjeDLJ2jMLXRX5V65LkotrW9MpX3LLViikqtBrFMRgYbvVCZPllYbYbKhTH?=
 =?us-ascii?Q?16pAwT1x7ak2bBBxEdKcFczNDK85nyb5qTaj9rSmkgxsXumVpks4+bDGxKWH?=
 =?us-ascii?Q?+ojNbgsYw6nf7Bv2zCg9eg3zVWzW+tjsQ4hu7bMwf3hMtoUwXCtKhQUS+2H9?=
 =?us-ascii?Q?nC7nO9ocWBRzxs8pYulgbeC1kkxcf8jEcVLRsoaqGd5uSqLkSW4tPKST6tN0?=
 =?us-ascii?Q?tK7ABDuWcQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92229acf-1715-47fd-38d3-08de6143382b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2026 03:37:26.5926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /CsvIHo4nlYhusNnvlMu9DlUvVGwd5MPPSgMmeEo5/YmJcE+Ppb20rjpc7LoSTWjiQQ/ssCSG3233Wvc36dXcCEUG8TgAiROalDswbTLR7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6363
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[aspeedtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aspeedtech.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1306-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[aspeedtech.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com:mid,aspeedtech.com:dkim]
X-Rspamd-Queue-Id: 6AF7DC4D7E
X-Rspamd-Action: no action

> Subject: Re: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
> register layout
>=20
> On Thu, Jan 29, 2026 at 02:08:00AM +0000, Ryan Chen wrote:
>=20
> ...
>=20
> > Will add in i2c-aspeed.c aspeed_i2c_probe_bus
> >
> > 	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2600-i2c-bus=
")
> &&
>=20
> Just device_is_compatible(...) instead of OF-centric APIs.
Thanks, will update in next.

>=20
> > 	    device_property_present(&pdev->dev, "aspeed,global-regs"))
> > 		return -ENODEV;
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20


