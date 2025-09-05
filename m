Return-Path: <openbmc+bounces-597-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00FB44B52
	for <lists+openbmc@lfdr.de>; Fri,  5 Sep 2025 03:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHzbT3RJHz30MY;
	Fri,  5 Sep 2025 11:41:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757036501;
	cv=pass; b=XA4nDOClIgL1A6iR6MfrSUHVk2I6biOvJcKG4iX8wRVDnFoXAEM81HiRjpLCbFNaYvStJuHbdqZg82AGDHFq48fwAWgMxeUbIRH2U0GIM3cgjBPRHsytNmTwFQ/BuI770lzb5OoZtoYCOLz8L6Rx13H+ODxvmG2h08my0cSXjXiI+mdsyLI6yC7v9E+K0GlBnnWzr012miRDnbxq2+QDAs/b7DYzof9JAuKuSBbpc9U1egEFkfmaoWAEIxLXM0eKOIrINJqvj1/UZaN+MlmUIp9rEpz4scyxG6/Y2kwGDSG4rn7w7VE353tSR3PIUlSRgj5E0GeDpaxnG/cOnP+AyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757036501; c=relaxed/relaxed;
	bh=5qO1kRcHfW3GUuZMT7GD6MofdTG5ccKj8GCpFfhN9i0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RlFIT9LI+X6mwCV2ca1GhOHdNsPwmq7N06UyS0HK/rLGzwYRviHPPuhtuTsyyChQoWQf5zRHJqvcv1JtRrIEN9v21f0AMXjMmcQDd0zTwJWgOzUx725NekzMWg3Z6CtgaJv6AJWNYffaXCk1Pyb6EPRJSl2KuLPm+XXq6sGALBNAAhnRNPpXHJWvEDenv2xwYjYD2A1ih/UQJzuS3QBn1eUpPVHMbj0DiIS0Oj23DjOm3pyWLYsTmpRA/ef/IErgj8Ls51JEqDsyaVAjohVKTJbjuQ4g+MlEwLsTksiPRRIyDLVxcKbDGFgDtYGE/AJv0jL0/BpWHRHfj6x3zna8OA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VeG3D/IC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VeG3D/IC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHzbS3sSkz2yql;
	Fri,  5 Sep 2025 11:41:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Og3XgnfxNOlEW2kin+E3Bfvelahx1YIyc78zsPCGHLzsgrntEfVb6LfA/K46xY+HPLV1F5w+falT9l1puGaZxCzF67ELfjELXR8gqM9MlJ1JILvOyr+koBU7aNmqDP83ThO9RJpY2myCRd7fRr7q9vDhqHaFAiSNguaqmEp1zlZgihiBD0aLHaKWducsohS4aRsL7FyTgZLI31oVFoC/crxOxW/+9jdSqWKGNrsVzUpltG55/we2IuVhDyKVHhbdy+RHARrCWPEZIApv3Q0aewZtpZN4rhqKS7dzVCzdniSKBz0q6kHJkHVymhsaHtk+Zd8I60ZpdO1xY1A9lK+xRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qO1kRcHfW3GUuZMT7GD6MofdTG5ccKj8GCpFfhN9i0=;
 b=SAUNxfTFZEUzpIR82e97oFm2OMcWMV/HRTb6nlj7ibKRhKLa/DIJLEssbdYOEP4lToCUT80LvKID1b6KpxesAClnblaHzJukYYLJ6hwB9WoLkev7/AmYDKu+EAEllCainmNkBrgxyFNGWTgfA6r2jWtsvBWI6rIU61D54f8Isc8rVv8WgBxV5IBJ0pe0ab3dvqv42Oa5hUe97DZ7rvkeiIrmXqvYd7ygxFdgBXwJiTPsm3NsG5j0WNfsZkKL/SLWdX8x9+xqgEK9mBDlpon+7VLZoD8Rwwmc1kskS4NAXSTdJrsD9E0nodvDGe4pcvgAcXu7KeIUBZcU400gL+iZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qO1kRcHfW3GUuZMT7GD6MofdTG5ccKj8GCpFfhN9i0=;
 b=VeG3D/ICsQReLFm6zXy7VJuN6qRaXOR8GNcRJDwhFUeRxUuczoCsPcHfYL2hEAI9fpFpEUk0HfZfTffzLJS9eo8+jWTWLYQp7qfPYZP0v4ZVlIhmxm3Fo6ddZaiK0tSXh6wpF7mERFr+wnBqYg+4WewAWmjmrU+tXWCyaebjnvzgG9sUerv0Ta3UOUMn2y3y1xnCh8I+J50uLdHXpFzkvwnsub1RioiogL2+6l1otq+W0gS5dZnsQ/BcJJUI0Huc4u4BK80TiL+vFZxrES8nyS9mf6sVWUK8SQMWtZ/WQRX4r3GG6atJbLx0EVPWtV4mLhxMzmIYo+fcnP3x9blhAg==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB7210.apcprd06.prod.outlook.com (2603:1096:990:8d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 01:41:13 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 01:41:13 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: [PATCH v3 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Topic: [PATCH v3 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHcGwWaph4aFqMwQkOoce6H5iMHG7SCE6UAgAGyyVA=
Date: Fri, 5 Sep 2025 01:41:13 +0000
Message-ID:
 <SEYPR06MB5134E916ABFBF7FBB8744F189D03A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250901055922.1553550-10-jacky_chou@aspeedtech.com>
 <20250903224820.GA1234878@bhelgaas>
In-Reply-To: <20250903224820.GA1234878@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB7210:EE_
x-ms-office365-filtering-correlation-id: 8cf39087-8218-4162-c769-08ddec1d4c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3G4OGqqYJEpS1hcn72gZG0s0BkbQfL9SC8qEvdYhKlTtcJP5BZ2JVn7uYzj8?=
 =?us-ascii?Q?CugYCIGdPbfOh4Jrwj5USe5/k4GeeW753w2IxAk+ACZPn6BYU+6Kc0OYioM6?=
 =?us-ascii?Q?jq31ygDjljv2iJM2muhsKFKB1OH4iseG6lwgbUT3JI42b1xDZ6hTwN/l32a6?=
 =?us-ascii?Q?7D1P86pw1jrMegRmkVK7vncDqGyKBrQKDI2trnlB1wBMopNrzP7e2ptc22Vs?=
 =?us-ascii?Q?42xJ9C8/6BQTeenR+YzKAkvhG2OXFd3f7UvclYAtaFS63fDHFVzu5IWrOqvU?=
 =?us-ascii?Q?TQkIrUH2L40cp/DwPRyO0uQAhHYjvm55MZ/3/okHuAZe1Av5fDaamrcxk1WV?=
 =?us-ascii?Q?NqOr3Lrqz3955sY1LEsSC0M14G3N+bfJGYqi/bUsXtdmyTNLWzazeZhBAsr7?=
 =?us-ascii?Q?TRUtymq8/D+h4zRxFym6p39u/N/RlFnrjJb1s4+lWjfbDEtH/C1LSrglgckH?=
 =?us-ascii?Q?PoenvvYlMQv6Jt0pItyo5OUIiPHLML7cDKjIGTIDJtiinGPd5+Nbo77gktef?=
 =?us-ascii?Q?Pw/N3Ee+nS+m+r7YbSPJBOIgV1s7qfBrBV9eNYMc1Ktcor771qxAX19YzFdU?=
 =?us-ascii?Q?/y9KUFTLPaPVZfUATBwVBuWJCF9U2dU+J/6xEvxcgbtc83kMXkStpIgyIO3/?=
 =?us-ascii?Q?dFD1Iddk6RNhpVKAMBXqM5MHQvLhDYjMQ79LhGPe5CCjTQSVfvhPvUwYhUix?=
 =?us-ascii?Q?OmUqERhsKImqbvhtyxfQCGt80hKn97+xU+VjWmQRiwbZjABnyNk0i5D64M6t?=
 =?us-ascii?Q?NHg2f0VU5uS8g794u/A0NLJgvPmUNkhJ4s12FIheQYcEaJcICyoJ2uWSZXrL?=
 =?us-ascii?Q?I0lXy6E+bWBwWjqh2FrZGRYzV7fp6MfLPCGvg7lDP81tEGozCOGCY/Faom5n?=
 =?us-ascii?Q?ebEqBSePKdpskqGrkVF8rRovmvYNGmD/G+EI1wzpnK6CJ51IH3BVchM7piMz?=
 =?us-ascii?Q?L/XS0pyLSParw7i6VO0nRjPUolfF6N/WU+5F+oetzwrf40xOM659gWb1bNuQ?=
 =?us-ascii?Q?cFr8gZyngigTz/jNf14OpOWCC6ztKnXlWFYsgfquoCxBaOO9Pait9lGunmrt?=
 =?us-ascii?Q?rGkvZbEbUrJpY+BKTp3lPaHMaCl0sOxVe/dVs8B1ESUBMWyNaDSkLmhk+70B?=
 =?us-ascii?Q?MlNJHoUFt0M6uzwe7wbOMjIGQmqfRX/61DXCuRWUAum6QgMCHfhb0N8kALrq?=
 =?us-ascii?Q?XuFOv4xiAeyxgvPK9DoRpjjbB1PKDKEB4XN9wW2YkhFLiqg4w+eJJuDmIzZ5?=
 =?us-ascii?Q?yicLePE7w2OwdpwsZSeiQCtrB4Ucqs0dRv3PVeQ6oGAQOtLUUCzMFLUMFo+b?=
 =?us-ascii?Q?nTT5/F7yp332nWHDt8qeeYuPY/BtK3BFn43TnCWkNtRkAmhEU8WTAI/G4/kL?=
 =?us-ascii?Q?bP+ZAlbDcVuMpL2n+zmS5O1mEatqioWCFgbkI793pYGX2x1bDdO25Erd4/W+?=
 =?us-ascii?Q?FiotyckX41Nf61CoolqPWhlCxf4vtcouZvWhDVC4pqVf3rLv9L3D2w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0koKuglpQa2zik8kfT/uPeJdYiIjJRC1AnlwZWK45JZUJ/akcsv2LnTmt/Vu?=
 =?us-ascii?Q?md1O3a+tRR34l02H6+RamlAY0qJT2eDQP6hn4CofymY/n8s8aKuPexjX7rwb?=
 =?us-ascii?Q?tCrNLbcPSDp2olCcHbY1DeZqcGcdR4zGFHjO0MNgwZHMb7auOXcIZyLEYtN6?=
 =?us-ascii?Q?VhIpr5cFQ/LAHK9vdRHwzogrDAiQOmTNKVtkjO2XWwLKkxBgAkKSnU1/chYk?=
 =?us-ascii?Q?dnOOTHT5G5MtG0GMO9cDxFOhKHn6OPu62+pF10TA1swTUBHuCSeMT+uP7/Y+?=
 =?us-ascii?Q?HKFiJE8Pn14/97LBjnDUMJklptETqYuj5OFZgq943uTZfbKZTjIQtq7D3VPz?=
 =?us-ascii?Q?TGvu4BwAIVZDy0v/fvmrTqEVOE+CSP+qWhlgV5UAHoAhNbvlgr7s9dfGMEk9?=
 =?us-ascii?Q?/aG3hmWAiKu4WQq55eN9jELMlve65xvf6eiBAkMe5FWh/msOiwIN+t/LK/iq?=
 =?us-ascii?Q?2TDjv0DK/p7ZchBBgHFG3qKYxd/tzkhfTKG3pkOJM6qgYLV+49pfIVHf2fpH?=
 =?us-ascii?Q?+iE/cDCCYN7WrmfP75HD3P30c0P8HFGI8DOHAPnZOdveFiNetgJ+tCx12h7r?=
 =?us-ascii?Q?fhLWEMJ8+IrdhAUEOr3KkjYBL51ROeAtpMYaz2fJENyDKQcu4cmmCa4ab55B?=
 =?us-ascii?Q?Tt9w4OTpYwNHXyP/L/zZtyvUuFsXuUKZRfOfn5j04R+AbbPpkD2LGATQf1AM?=
 =?us-ascii?Q?wweyI05ZSy7C1yGcOXBEVtCnbmoVs1chwCnF6NPlHE5MFga2dYsxdFbryPE/?=
 =?us-ascii?Q?m+K7Jj33KE8357Lezd3FtS6Eo0IQt9G6aM3QerqdbYiruqqnPk/PcMBORGwK?=
 =?us-ascii?Q?aJBjU8perIzWh1XciCp0JKxCeNEbxVxWoR7+EjnNOlmoUVKXS+zGbMUZMLBG?=
 =?us-ascii?Q?g5/q+A6ML88uHZo1UFoW6B7EjZsydLBFlyZGhu+F5dJY3V1Ze09Ydkro13yf?=
 =?us-ascii?Q?60C0GDSUhZudvYGhp8FhitgM5AR9mIM7VucOwiGr54VTQXbEBAbTF9O/7jpd?=
 =?us-ascii?Q?ShBcVwTsvmXqqq+LxhWUkWdaVB5Jmp1x0+zxq8ZmF/7idK6tRHkbNIu3YSEG?=
 =?us-ascii?Q?sUfxTDHULJOMvpVgk0MfZIeNtucH0eNkxbpPPZ09WnO4HyR7oOHzLbzmsiun?=
 =?us-ascii?Q?dM0h6VQUorfm/wfZ/VfIOIgFYAwxgNrPE5UQ8MiuzLlbvjgUgVLwQe0khD7m?=
 =?us-ascii?Q?rfxD87IUi3QMKTn4WVOfMGfIoRCMe5BYTcAKeIeU76x4kedJb9WCm4t1+mmh?=
 =?us-ascii?Q?6UEDFs6ZimADLgdYxzCO1y21B78TtVPjjJHmqMGbtxZB7ylSvrH0zteXV7vS?=
 =?us-ascii?Q?pZdPaPlTGFr/CjuTMTz+LN4ekUp8Alecu6s6qFAUN1EFI3Xw7h0+BDl8Tj1C?=
 =?us-ascii?Q?azrGgqu1an6/CQX4Ug5+foxzxMpNlAiyVBEffZPVI+OT1zA36Huyk5gYQH/b?=
 =?us-ascii?Q?N3fTooCnmG2Sh5Pw8xScAOtecSApu73ZUthcFuJx8S79j93YcbRgsdYZNqwg?=
 =?us-ascii?Q?JIvE6ZAn+rOxgZo+NM70kVq2jBZFM453PdtBvs/DhOgxl3wBSzZiUHBQPUBr?=
 =?us-ascii?Q?4g837rSTjVbW2QVJ35LA2wb91cugabynPKdZ1n/H?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf39087-8218-4162-c769-08ddec1d4c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 01:41:13.5733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cHLPrvtqhSanP7jm81q7jyhmS2J07epe0PUr/k6L2LeOefoLm5b03GROVSPLKm4r9QdvJ8XWZut1KaB5MqAVUKOaY6cyJd9iJgajQBGjDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7210
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

Thank you for your reply.

> > +/* TLP configuration type 0 and type 1 */
> > +#define CRG0_READ_FMTTYPE
> \
> > +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
> > +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
> > +				       PCIE_TLP_TYPE_CFG0_RD))
> > +#define CRG0_WRITE_FMTTYPE
> \
> > +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
> > +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
> > +				       PCIE_TLP_TYPE_CFG0_WR))
> > +#define CRG1_READ_FMTTYPE
> \
> > +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
> > +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
> > +				       PCIE_TLP_TYPE_CFG1_RD))
> > +#define CRG1_WRITE_FMTTYPE
> \
> > +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
> > +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
> > +				       PCIE_TLP_TYPE_CFG1_WR))
> > +#define CRG_PAYLOAD_SIZE		0x01 /* 1 DWORD */
>=20
> What does "CRG" in the above mean?  If it means the same as "CFG", i.e., =
an
> abbreviation for "configuration", can you use "CFG" instead?
> It it's to match an internal spec, go ahead and keep "CRG".
>=20

It is "configuration". I will change "CRG" to "CFG" in next version.

> > + * struct aspeed_pcie_rc_platform - Platform information
> > + * @setup: initialization function
> > + * @reg_intx_en: INTx enable register offset
> > + * @reg_intx_sts: INTx status register offset
> > + * @reg_msi_en: MSI enable register offset
> > + * @reg_msi_sts: MSI enable register offset
> > + * @msi_address: HW fixed MSI address  */ struct
> > +aspeed_pcie_rc_platform {
> > +	int (*setup)(struct platform_device *pdev);
> > +	int reg_intx_en;
> > +	int reg_intx_sts;
> > +	int reg_msi_en;
> > +	int reg_msi_sts;
> > +	int msi_address;
>=20
> I think this should be u32 to match struct msi_msg.address_lo.
>=20

Agreed.

> > +static irqreturn_t aspeed_pcie_intr_handler(int irq, void *dev_id) {
> > +	struct aspeed_pcie *pcie =3D dev_id;
> > +	const struct aspeed_pcie_rc_platform *platform =3D pcie->platform;
> > +	unsigned long status;
> > +	unsigned long intx;
> > +	u32 bit;
> > +	int i;
> > +
> > +	intx =3D FIELD_GET(PCIE_INTX_STS,
> > +			 readl(pcie->reg + platform->reg_intx_sts));
> > +	for_each_set_bit(bit, &intx, PCI_NUM_INTX)
> > +		generic_handle_domain_irq(pcie->intx_domain, bit);
> > +
> > +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > +		for (i =3D 0; i < 2; i++) {
> > +			int msi_sts_reg =3D platform->reg_msi_sts + (i * 4);
> > +
> > +			status =3D readl(pcie->reg + msi_sts_reg);
> > +			writel(status, pcie->reg + msi_sts_reg);
> > +
> > +			/*
> > +			 * AST2700 A1 workaround:
> > +			 * The MSI status needs to clear one more time.
> > +			 */
> > +			if (of_device_is_compatible(pcie->dev->of_node,
> > +						    "aspeed,ast2700-pcie"))
>=20
> It looks pretty expensive to look this up for every interrupt.  It's cons=
tant for
> the life of the driver, so you only need to do it once at probe time.
>=20

Calling of_device_is_compatible() in the interrupt path is unnecessary.
In next version, I will add a variable in private at probe and=20
have the ISR check the variable instead.

> > +				writel(status, pcie->reg + msi_sts_reg);
> > +
> > +			for_each_set_bit(bit, &status, 32) {
> > +				bit +=3D (i * 32);
> > +				generic_handle_domain_irq(pcie->msi_domain,
> > +							  bit);
> > +			}
> > +		}
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
>=20
> > +static int aspeed_msi_set_affinity(struct irq_data *irq_data,
> > +				   const struct cpumask *mask, bool force) {
> > +	return -EINVAL;
> > +}
>=20
> From comparing with other drivers, I doubt this is needed.
>=20

Agreed.
It seems unnecessary. I will remove in next version.

> > +
> > +static struct irq_chip aspeed_msi_bottom_irq_chip =3D {
> > +	.name =3D "ASPEED MSI",
> > +	.irq_compose_msi_msg =3D aspeed_msi_compose_msi_msg,
>=20
> I would prefer a name that matches irq_chip.irq_compose_msi_msg, e.g.,
> "aspeed_irq_compose_msi_msg()".
>=20

Agreed.

> > +static int aspeed_pcie_msi_init(struct aspeed_pcie *pcie) {
> > +	int ret =3D 0;
> > +
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_en);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_en + 0x04);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts);
> > +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts + 0x04);
> > +
> > +	struct irq_domain_info info =3D {
> > +		.fwnode		=3D dev_fwnode(pcie->dev),
> > +		.ops		=3D &aspeed_msi_domain_ops,
> > +		.host_data	=3D pcie,
> > +		.size		=3D MAX_MSI_HOST_IRQS,
> > +	};
> > +
> > +	pcie->msi_domain =3D msi_create_parent_irq_domain(&info,
> > +							&aspeed_msi_parent_ops);
> > +	if (!pcie->msi_domain)
> > +		return dev_err_probe(pcie->dev, -ENOMEM,
> > +				     "failed to create MSI domain\n");
> > +
> > +	return ret;
>=20
> Useless "ret".  Remove it and just "return 0;"
>=20

Agreed.

> > +static int aspeed_ast2600_setup(struct platform_device *pdev) {
> > +	struct aspeed_pcie *pcie =3D platform_get_drvdata(pdev);
> > +	struct device *dev =3D pcie->dev;
> > +
> > +	if (pcie->host_bus_num !=3D 0x80)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				     "The host bus must be 0x80\n");
>=20
> Why not check this at the point you read it from the devicetree?
>=20

Sorry.
Do you mean this check put in aspeed_pcie_parse_dt()?

> > +	pcie->ahbc =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> > +						     "aspeed,ahbc");
> > +	if (IS_ERR(pcie->ahbc))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> > +				     "failed to map ahbc base\n");
>=20
> Same here.  Looks like a devicetree validation check.
>=20

And this also puts to aspeed_pcie_parse_dt()?

> > +static int aspeed_pcie_parse_port(struct aspeed_pcie *pcie,
> > +				  struct device_node *node,
> > +				  int slot)
> > +{
> > +	struct aspeed_pcie_port *port;
> > +	struct device *dev =3D pcie->dev;
> > +	int ret;
> > +
> > +	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> > +	if (!port)
> > +		return -ENOMEM;
> > +
> > +	port->clk =3D devm_get_clk_from_child(dev, node, NULL);
> > +	if (IS_ERR(port->clk))
> > +		return dev_err_probe(dev, PTR_ERR(port->clk),
> > +				     "failed to get pcie%d clock\n", slot);
> > +
> > +	port->phy =3D devm_of_phy_get(dev, node, NULL);
> > +	if (IS_ERR(port->phy))
> > +		return dev_err_probe(dev, PTR_ERR(port->phy),
> > +				     "failed to get phy pcie%d\n",
> > +				     port->slot);
>=20
> port->slot hasn't been set yet.
>=20

Agreed.
I will change it to "slot" in next version.

> > +	port->perst =3D of_reset_control_get_exclusive(node, "perst");
> > +	if (IS_ERR(port->perst))
> > +		return dev_err_probe(dev, PTR_ERR(port->perst),
> > +				     "failed to get pcie%d reset control\n",
> > +				     slot);
> > +	ret =3D devm_add_action_or_reset(dev, aspeed_pcie_reset_release,
> > +				       port->perst);
> > +	if (ret)
> > +		return ret;
> > +	reset_control_assert(port->perst);
> > +
> > +	port->slot =3D slot;
> > +	port->pcie =3D pcie;
> > +
> > +	INIT_LIST_HEAD(&port->list);
> > +	list_add_tail(&port->list, &pcie->ports);
> > +
> > +	return 0;
> > +}
>=20
> > +static int aspeed_pcie_probe(struct platform_device *pdev) {
> > +	struct device *dev =3D &pdev->dev;
> > +	struct pci_host_bridge *host;
> > +	struct aspeed_pcie *pcie;
> > +	struct device_node *node =3D dev->of_node;
> > +	const struct aspeed_pcie_rc_platform *md;
> > +	u32 bus_range[2];
> > +	int irq, ret;
> > +
> > +	md =3D of_device_get_match_data(dev);
> > +	if (!md)
> > +		return -ENODEV;
> > +
> > +	host =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> > +	if (!host)
> > +		return -ENOMEM;
> > +
> > +	pcie =3D pci_host_bridge_priv(host);
> > +	pcie->dev =3D dev;
> > +	pcie->tx_tag =3D 0;
> > +	platform_set_drvdata(pdev, pcie);
> > +
> > +	pcie->platform =3D md;
> > +	pcie->host =3D host;
> > +	INIT_LIST_HEAD(&pcie->ports);
> > +
> > +	ret =3D of_property_read_u32_array(node, "bus-range", bus_range,
> > +					 ARRAY_SIZE(bus_range));
>=20
> No other drivers do this; why do you need it?
>=20

I need to get the number of root bus.
At 2700 configuration command, it needs to use the next number of root bus
to send the header type of cfg command of TLP.

static int aspeed_ast2700_child_config(struct pci_bus *bus, unsigned int de=
vfn,
				       int where, int size, u32 *val,
				       bool write)
{

.....

	if (write)
		cfg_val |=3D (bus->number =3D=3D (pcie->host_bus_num + 1)) ?
				   CFG0_WRITE_FMTTYPE :
				   CFG1_WRITE_FMTTYPE;
	else
		cfg_val |=3D (bus->number =3D=3D (pcie->host_bus_num + 1)) ?
				   CFG0_READ_FMTTYPE :
				   CFG1_READ_FMTTYPE;
	writel(cfg_val, pcie->reg + H2X_CFGE_TLP_1ST);

....

> > +	if (ret) {
> > +		dev_warn(dev, "failed to get bus range, assuming bus is 0\n");
> > +		pcie->host_bus_num =3D 0;
> > +	}
> > +	pcie->host_bus_num =3D bus_range[0];
> > +
> > +	pcie->reg =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(pcie->reg))
> > +		return PTR_ERR(pcie->reg);
> > +
> > +	pcie->domain =3D of_get_pci_domain_nr(node);
>=20
> Almost no drivers use this; why do you need it?
>=20

It is just used for message, must not be requirement.
I will remove it in next version.

> > +	pcie->h2xrst =3D devm_reset_control_get_exclusive(dev, "h2x");
> > +	if (IS_ERR(pcie->h2xrst))
> > +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst),
> > +				     "failed to get h2x reset\n");
> > +
> > +	ret =3D devm_mutex_init(dev, &pcie->lock);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to init mutex\n");
> > +
> > +	ret =3D pcie->platform->setup(pdev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to setup PCIe RC\n");
> > +
> > +	ret =3D aspeed_pcie_parse_dt(pcie);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D aspeed_pcie_init_ports(pcie);
> > +	if (ret)
> > +		return ret;
> > +
> > +	host->sysdata =3D pcie;
> > +
> > +	ret =3D aspeed_pcie_init_irq_domain(pcie);
> > +	if (ret)
> > +		return ret;
> > +
> > +	irq =3D platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret =3D devm_add_action_or_reset(dev, aspeed_pcie_irq_domain_free,
> pcie);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_request_irq(dev, irq, aspeed_pcie_intr_handler,
> IRQF_SHARED,
> > +			       dev_name(dev), pcie);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D pci_host_probe(host);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
>=20
> This is the same as:
>=20
>   return pci_host_probe(hoste);
>=20

Agreed.

> > +}
> > +
> > +const struct aspeed_pcie_rc_platform pcie_rc_ast2600 =3D {
> > +	.setup =3D aspeed_ast2600_setup,
> > +	.reg_intx_en =3D 0xc4,
> > +	.reg_intx_sts =3D 0xc8,
> > +	.reg_msi_en =3D 0xe0,
> > +	.reg_msi_sts =3D 0xe8,
> > +	.msi_address =3D 0x1e77005c,
>=20
> Where does this .msi_address come from?  Does this depend on an address
> map that could vary based on the platform?  Should it come from devicetre=
e?
>=20

The .msi_address is a SoC-fixed MSI doorbell target address used by the RC
to capture MSI writes. The memory write of MSI will not be mapped to RAM.
I think it should be keep in the SoC match data rather than Devicetree.

> > +};
> > +
> > +const struct aspeed_pcie_rc_platform pcie_rc_ast2700 =3D {
> > +	.setup =3D aspeed_ast2700_setup,
> > +	.reg_intx_en =3D 0x40,
> > +	.reg_intx_sts =3D 0x48,
> > +	.reg_msi_en =3D 0x50,
> > +	.reg_msi_sts =3D 0x58,
> > +	.msi_address =3D 0x000000f0,
> > +};

Thanks,
Jacky

