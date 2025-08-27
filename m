Return-Path: <openbmc+bounces-514-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E30B376DA
	for <lists+openbmc@lfdr.de>; Wed, 27 Aug 2025 03:23:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBRcC58pbz2xcG;
	Wed, 27 Aug 2025 11:23:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756257787;
	cv=pass; b=fVBQjf9yRmY7ILqBKwsSAxSmq+KBhQAKYd/IQDt3i6H7PI0OsmnwGdXYMWY/C1m8QHGHhEf1prU5/xmmUk7HkqoA51m8/Lba+mpeXDt8+WwUh4zIVrNp7VAqtAWm2BeqFkrjT1BZnuTbvY+s8JNqLfXev3Vc18qwVe8SqZ4/fdUH4QKXL9bbmUZ05eSq5uC6IWyDgiWAr123DGRXR8yzx9LEKTeiycsChDtHFdjesTyt1G6TpLI9mX8sYsObxTerMH+vY/zMfNMKT/NjbqS8XKcw0Z1fUUJpuAgMIXVcBFCT8plU8kVes28DJ3ipv3kxtuNL2T4jxW52t9vAAiYJRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756257787; c=relaxed/relaxed;
	bh=SYF3ghQFwfRDuHiZg+nKEcvCy+TrJQJAEedDokrfp9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FqzL8swqZBXdTdmA8F9OWySSr3IJWiKIg8O7Xheaq0rBYWbgdxXzIn624fCRrRA+bPkCUC+OAVi6iVmuY82e0Iyt93EPrwfPKcvMYYgZXSSPuTebnj4Yj4+LqQes86aABaTenpHeMpYpRiLS6q2VAZwUAI1xgLdq23Udde6CPekKVZISbgdtV0Q0LmgbjbN91DIfp8mFjPJC/68529dekB48fgIB6b1HBKf4cTRTliZBaNq71JkYYojOZU2NxIgdle++gX53TeTSlB+I8gln/WVKzLWrgK1wR25gtqgSJAvuloyETRKx+1P4UxxDKK6l/xt9wnpzP/f/vGuo5z8YQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dE7pT2M0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=dE7pT2M0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBRc96Jyrz2xc8;
	Wed, 27 Aug 2025 11:23:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae1/vOBZ5L9mVjSpbkewm4wbL4kKLKPAU9vN+MocI9qpIqECBRbYnMVFczC4zEPZybjHCMohyx1hh/PaqjZFvn0hWjJi8wBilsKp0LO+8MMcidfutFEL6jgTEzIQRWDqzFF89tT0ec/yx1UjI2S6ybIpS+oyuXfuBSVej3tUk7DrgN6PyotQEPe/MkvU4MTo3tOcLV6GLzhCsTOuDPpa4weU3kZv0dOiny53VJZLWQYyxROGrEWJTPWCP7Ach5vfqT3MjYU6Q7eMNiSozwkAJnNrt17jT3fRDLBzOUjfBR8LZtZKv2PmcX3ygIw9h4hIDvPqO+8RhoZk9pbqYIXp4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYF3ghQFwfRDuHiZg+nKEcvCy+TrJQJAEedDokrfp9g=;
 b=dt6wImzeoQyuM1ZMzeTPDq4T7PBPLMYAz3/QC09Rm0fE/jXwDKAtMCZKE8lcUSIKhAY4R88ZZtcXIEzQt0F5oz2KoPYzfOexjDXelD+Kx/yL6sqpCUUbX+tmy9INCQx96uyj4aUGEQUuHCx+Y3y0hVlZ7AxN9hEUMXQXmgS3loGhlTOV2TzKBsipPAPfwXSih2/YnS7fB4L/d+s2toBQV4A2Tn3wYi+SYUfl0MzEZcmRwrGSTFVD3GIvCI/ioumEtGz3TYgZxr2GPkcBrD1VNyG5g2eGWjTtrSPdqDIrW8xj8QXhdfsZxzcCDPhjcrbCjfUiPipR6R74J8wSZbEgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYF3ghQFwfRDuHiZg+nKEcvCy+TrJQJAEedDokrfp9g=;
 b=dE7pT2M0l3wuApSCY7iUbdj3xl1u5idBEOPzufS5HZFNo+uyjmktVsWumryYi9ao6Rp19CwB/zraeDO3jSDLTUHbCcJ9eqxT8wpjmc0fDjZ0A3Uln9brW4EvZd1QhvUF3zNUrRs532rIV3ahaZPxidba0gg7+EckEdrOyMKObQgX24IEHPYjSHGa3Sr3zh24ZLJrG6CgRV8L8mOUxT+DYYMB2CcGHUgfBDS+NpzCxv12VkCdrAAfmmtH3xtv8XeYgC1Reg+yxmSZ1e9N8aCdYuloBTevx55erkqsqNm3XMpjyJNzQp7dU6NeTs4XuTbMQUlPSWN8hnlGcrLCtKJsRw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KUZPR06MB7988.apcprd06.prod.outlook.com (2603:1096:d10:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 01:22:41 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 01:22:41 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Subject: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Thread-Topic: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Thread-Index: AQHb9TqlDxkoR0jv8kmBHlDJRq4OoLQzU3qAgEKjMzA=
Date: Wed, 27 Aug 2025 01:22:41 +0000
Message-ID:
 <SEYPR06MB5134C908801B3F1DB51FB7BE9D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
 <20250715154145.GA2461632@bhelgaas>
In-Reply-To: <20250715154145.GA2461632@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KUZPR06MB7988:EE_
x-ms-office365-filtering-correlation-id: 74c2daae-557d-4103-62c5-08dde5083794
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wSrxZEtcQerJxT08nYuY4E2RS4uZdnBDROS/Bl4nwCPeGIdCiPf4CI9Y/ggC?=
 =?us-ascii?Q?PUKYo6AEdgDnilcsEmsPL5Jldd/8EDrU+hU+XLA2tM1eVXDOBsjFAqfOdwss?=
 =?us-ascii?Q?IrhA/vKhba/ka9K4Sb0BBaXVk9A251g9iwTu0t0IAVPzdleQYSvQqwGS4YfD?=
 =?us-ascii?Q?XcKgg3thaugX2dvuGzMWvqgt+unrs0exLEzSwyHVr+DzHNkOc7M9B6rqwjUn?=
 =?us-ascii?Q?Uv2GJ7QA+2pDPID/QjfisMFyap/LMYI42Hofs9bxMuvc6Zbdcn7iT0rW0Ihw?=
 =?us-ascii?Q?ZqrhHQnU+XYyBeszNPi5SqOHqbYg+exVWvt5cDgdqFlnNjQgkDiMxqz4lOgw?=
 =?us-ascii?Q?+gi//rbY83RjixtZnbCfDbW4um1GSspN/uGe+Da8dQPbOqzSV4cKobOyzUh0?=
 =?us-ascii?Q?AxiQJneRpBDsXNj4ZK61HlFEjCDR3GqrwxWT2fXvdQjfb5xE36IGdhuiWzqc?=
 =?us-ascii?Q?Z6NWS2oYtpgu4dx/8488MiC1FV0B9anJvT0qKgR9c4wpkTt1TMA4TqMUKZw7?=
 =?us-ascii?Q?dwyb0GYz8OnNKUIJeCWRxddji8tzr47yD0YgRxngbP1HqrOwFbt17bkaKl3K?=
 =?us-ascii?Q?jxYp4iliuUYtrbx4VqRlshLmskpYomMjQyDtVNdCc7H2DF5qjz/z9fZ4sLQM?=
 =?us-ascii?Q?D35M8dhdy80NwB+Bwt1aA5yVYnTdEGiJqqsnT1SLT7QGvzUzT/Y3JCLygCAJ?=
 =?us-ascii?Q?fKBXKvleqZwBPownt+eZ+szf7ljKNT+J8TWEnXRagEEudjlCKsRw/JqoSPOm?=
 =?us-ascii?Q?uIALZqhsRUmBa1j2wVq3S18hkDuWmWUeC142XRUKZG9s1JCnM0HbkE6mOxLe?=
 =?us-ascii?Q?ngL9kmxjkpTxjRoI+DOsH445aWKYOgQUEqbKfnN4OWMX7wdlUMQbVz0Bo4kX?=
 =?us-ascii?Q?nxxPs2XnS6B6zY3fu+2yGy3Aa2u5ciCF3bpk3puIGFhPJN++Upxj64dALctx?=
 =?us-ascii?Q?kXMXxJaD+iwhVOz/V0QdoE5dDKxZDX3DBzA9OOptNvC4rHsOnjHtLBP7bwSz?=
 =?us-ascii?Q?PMBED3lClm1N8ko0A4zdQfoFQcBvUUK+5h2eIaTMlj8I5SsMHzmxZDFz4HzJ?=
 =?us-ascii?Q?JwFX7GZhJzZZMDx1X9YC8jih1jIFTOzzB3z+cIQGBCco7DoNVgFvIsnJ5IXM?=
 =?us-ascii?Q?SaN6BaZNQ5xN9J6MzVS5zBk4TtNoaizCZY2Hq/t6J2EVvYFMSRPh420VKiQO?=
 =?us-ascii?Q?F4kFgairNKKoiCgsD8ardXdiT+u/Re0yF0Oy9WCxKdOq6AgbEpv2iQXK7R2d?=
 =?us-ascii?Q?g+9uuVMktw7HRgKmSgyzej0Kp9E8JRmG+pEzA3iCUrqcFmTGtQyKiW2T7faK?=
 =?us-ascii?Q?FL6AExcimor1JZCz/08tArhB1OrRJg2EuO2WwBpIWcDD36nJMH6RNTYO4LvG?=
 =?us-ascii?Q?FLHC48B5MTMp7tENKiBsJvDWuZQavHXcOcqD+yYDTGO1Dy7aAMJ7Hk//qzeR?=
 =?us-ascii?Q?+Frob1118IpzxFaTEiRsCabZSTWB1347z7uhyllJk/FfWIN+OtFp8Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fuBHjCpOVVbFvyWJCP16C+vvVi4c7550E7dFu5YTxJT+ZZWPULf6T3vj8HNv?=
 =?us-ascii?Q?pmVQ6nf4VYIniVwOJ/Nwak1dF86YMNatLgyRyWEMy11K/KrMHMaMD4xtQBai?=
 =?us-ascii?Q?T0H033XOP0ooQSTqkFCANTPDHP5gubdrMO7f+DiKRwNrfSyHGYJD7e4s6A9V?=
 =?us-ascii?Q?zgQqksEh2vUulgi7D1+glkfvr4gdGFNRURWQxiUNFI8FxHgSgHhVo6Ay8aiy?=
 =?us-ascii?Q?LRIaHv8gZYJGfPInEbU9mtPvrzSSDH4Aw9kAFRj3m4hskbeZ6/L8fKzeL+p4?=
 =?us-ascii?Q?EcUG25XqpPy9gCV8DONRgPMTZI0zd7hDZn+QU4eYsp+mXZ2CWBaAiQvPnnkZ?=
 =?us-ascii?Q?ogd6poObfehJ3+VTjIpswA79ghTDFnJ2hGh1GOw6Lq/ChE2Lk+7pnYWAZK3N?=
 =?us-ascii?Q?bE5fsv2csjWOufRJ1TDhpaRiL5fE1Y+iR24mx3Aya4YeKtY+GePvy/i9p6wM?=
 =?us-ascii?Q?F4VKdPnQcf3OVhJ4qCaQRgqKrWz0wLAFSJVAzHCIM6rLudzY/QlAJLqx9DWV?=
 =?us-ascii?Q?BWjvgsMAvTAtW4EX0mxbPCUnsYzn5XzsvSDlAA3vW1t/CWtliKIl31v8PHvd?=
 =?us-ascii?Q?4K7j9VKMU5YaUUKbvZdkBfKWpmfEmAH233r/awKuyDS2gssxyN+zPGkwa0Pt?=
 =?us-ascii?Q?sisPDMQyQwMtMbndWGTh7caUC+rHESpsyl/R8UXIVUWVfi6l0ri5lTW8v1uK?=
 =?us-ascii?Q?2Cl+ncKrmzw2OHkH2dzrzYXUun19Gm85JaxqRsklmyLBxlAuBYIkJfIFTr49?=
 =?us-ascii?Q?Xj+vLY8DYK+rWJLJMPx3o7AQHyeifh94QkIYyf68aBBYgDjDt+Xy2wKepoKJ?=
 =?us-ascii?Q?K2X+CGleGrehMUK9akzZCbUMF6hHOfNexu23x0UFuCmpa+LN6B/2yFLLuDpc?=
 =?us-ascii?Q?2cjiI2YqRmFnI9GToNLxFawKeLBqwyL76iIuLD+PRbEGn6rZRfJYN4+j4+kA?=
 =?us-ascii?Q?5V7hRA+eghVzJ8ILN/bPaC71ImFxq8rS2VitnThFl0wwzRO4XVqSpuAl1YQI?=
 =?us-ascii?Q?9xCyDx0XxWsHRkJE3EaIX+oxhTYTNHWydBOl/KumofWFWMBqVcqWPQLrO4lJ?=
 =?us-ascii?Q?3Ijqz4w6t9p2Y60foB8SriJWM4KCQZHiu4dxLFYY/YEBsATbx7QQq0okOIkf?=
 =?us-ascii?Q?incsnidKBCVJUFpZ9Y7kggvqiHx4uqIwD4ubTdcCUTxezthrqmGZePOOUMaR?=
 =?us-ascii?Q?UjVpjZpB/BAVzPidMaSs5jRt6Ij5aZTxpJuqBFJ/xFPJJ6bKF6925qb4w8Rk?=
 =?us-ascii?Q?EfqoWGHg+pObIPKPjPwJwRPXMsRTzDQSgXq6OYEThW15LFYpi4p6EB9l7v61?=
 =?us-ascii?Q?4QWj8tbgmBH3QqluyVEwrTcx0f9wFlrUhsCUT8e0ImIUvUxxH0zO2LwIeQ4l?=
 =?us-ascii?Q?AW56cNHUc9ARX0ZV2/8RAxrkUsS8a05cOgNXL1yRwyuuomSWukDfkug0YjL3?=
 =?us-ascii?Q?ijXnxoFF0PUTl33JQhJ+b0Or2+cQeNsw6IH0CqhfRvqbZi0wCccHsChb5q6k?=
 =?us-ascii?Q?BoZXKXffGJV+lIG4Kddqg0+6y6aQENEQrFX60byBwAZLsDSn56Yw/jqq6ZyN?=
 =?us-ascii?Q?SIn+QbDMS1kVJnYUJs+aySi4L3CK9ita6jK5fXpx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c2daae-557d-4103-62c5-08dde5083794
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 01:22:41.0840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6LT+HwLvv0Ee6Y5lF8KEQnIb7yoQUB65MSRLACsF8fbZjsxaLuE8mQBUXndON9WHEaGYf78Cg9LdyCBtDiFbaeldd5vDxdkG6Yyl1M0jBv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB7988
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

Thank you for your reply.

> >  include/uapi/linux/pci_regs.h | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
>=20
> I don't think these definitions are relevant to uapi users, so they could=
 go in
> drivers/pci/pci.h, similar to the existing PCIE_MSG_* definitions.

Agreed.
I will move them to drivers/pci/pci.h and rename them in next version.

>=20
> Please follow the style of PCIE_MSG_*, including the brief spec citations=
 and
> /* */ comments.
>=20
> Not sure we need *all* of these; it looks like you only use:
>=20
>   PCI_TLP_TYPE_CFG0_RD
>   PCI_TLP_TYPE_CFG0_WR
>   PCI_TLP_TYPE_CFG1_RD
>   PCI_TLP_TYPE_CFG1_WR
>   PCI_TLP_FMT_3DW_NO_DATA
>   PCI_TLP_FMT_3DW_DATA
>

Yes, I just use these in our PCIe RC driver.
I will delete the others that are not used in next version.

> > diff --git a/include/uapi/linux/pci_regs.h
> > b/include/uapi/linux/pci_regs.h index a3a3e942dedf..700b915e00f5
> > 100644
> > --- a/include/uapi/linux/pci_regs.h
> > +++ b/include/uapi/linux/pci_regs.h
> > @@ -1230,4 +1230,36 @@
> >  #define PCI_DVSEC_CXL_PORT_CTL				0x0c
> >  #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
> >
> > +/* Fmt[2:0] encoding for TLP Header */
> > +#define PCI_TLP_FMT_3DW_NO_DATA		0x0  // 3DW header, no data
> > +#define PCI_TLP_FMT_4DW_NO_DATA		0x1  // 4DW header, no data
> > +#define PCI_TLP_FMT_3DW_DATA		0x2  // 3DW header, with data
> > +#define PCI_TLP_FMT_4DW_DATA		0x3  // 4DW header, with data
> > +#define PCI_TLP_FMT_PREFIX		0x4  // Prefix header
> > +
> > +/* Type[4:0] encoding for TLP Header */
> > +#define PCI_TLP_TYPE_MEM_RD		0x00 // Memory Read Request
> > +#define PCI_TLP_TYPE_MEM_RDLK		0x01 // Memory Read Lock
> Request
> > +#define PCI_TLP_TYPE_MEM_WR		0x00 // Memory Write Request
> (Fmt must be with data)
> > +#define PCI_TLP_TYPE_IO_RD		0x02 // IO Read Request
> > +#define PCI_TLP_TYPE_IO_WR		0x02 // IO Write Request (Fmt must be
> with data)
> > +#define PCI_TLP_TYPE_CFG0_RD		0x04 // Config Type 0 Read
> Request
> > +#define PCI_TLP_TYPE_CFG0_WR		0x04 // Config Type 0 Write
> Request (Fmt must be with data)
> > +#define PCI_TLP_TYPE_CFG1_RD		0x05 // Config Type 1 Read
> Request
> > +#define PCI_TLP_TYPE_CFG1_WR		0x05 // Config Type 1 Write
> Request (Fmt must be with data)
> > +#define PCI_TLP_TYPE_MSG		0x10 // Message Request (see routing
> field)
> > +#define PCI_TLP_TYPE_MSGD		0x11 // Message Request with Data
> (see routing field)
> > +#define PCI_TLP_TYPE_CPL		0x0A // Completion without Data
> > +#define PCI_TLP_TYPE_CPLD		0x0A // Completion with Data (Fmt
> must be with data)
> > +#define PCI_TLP_TYPE_CPLLCK		0x0B // Completion Locked
> > +#define PCI_TLP_TYPE_CPLDLCK		0x0B // Completion with Data
> Locked (Fmt must be with data)
> > +#define PCI_TLP_TYPE_FETCH_ADD		0x0C // Fetch and Add AtomicOp
> Request
> > +#define PCI_TLP_TYPE_SWAP		0x0D // Unconditional Swap AtomicOp
> Request
> > +#define PCI_TLP_TYPE_CMP_SWAP		0x0E // Compare and Swap
> AtomicOp Request
> > +#define PCI_TLP_TYPE_LOCAL_PREFIX	0x00 // Local TLP Prefix (Fmt =3D
> 0x4)
> > +#define PCI_TLP_TYPE_E2E_PREFIX		0x10 // End-to-End TLP Prefix (Fmt
> =3D 0x4)
> > +
> > +/* Macro to combine Fmt and Type into the 8-bit field */
> > +#define PCIE_TLP_FMT_TYPE(fmt, type)   (((fmt) << 5) | ((type) & 0x1F)=
)
>=20
> This looks like it might be controller-specific and could go in pcie-aspe=
ed.c.

Agreed.

Thanks,
Jacky


