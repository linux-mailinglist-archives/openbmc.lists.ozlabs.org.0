Return-Path: <openbmc+bounces-1238-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C8D3ABC7
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 15:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvt6P363Sz3bhq;
	Tue, 20 Jan 2026 01:25:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768832749;
	cv=pass; b=bvEA1MWccEL9ZPOz4+QOF8uXFYqxwvGOHDZDhteLH7Fhlk5h8JwCHwM3+ODeP69itT5VukwII0XVuFaMwbhhdCojqPlAcuQctJXtIPLENvb+lD7p3kPfWPC7ilspWgdzVp59BRaWVqAi9/ypHBhVJFrPWgvg2MHgxor9gzvmHBZe5KkcIKN8J8tMuSfK3WgdS9QRZPU6vUoVu3aW99v0X2eF9lsZNcVGHIsSQxoV4BsOcKJNdUnu+y6c0KjbvRYWoebTiyy2UefLN6coGvVpO6WRQ4kkJXZlZZoVYcUUkLIw7lOLA6fLbnLxkEVikQHyS+cIgZguYh2xToQHnknEBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768832749; c=relaxed/relaxed;
	bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l7j7Ho1lYfDC3O1WRDZ58m2tuqNiFMOpkL+0Xr9r7g+7asdQQ53+ceis58gBV56cHP8+yA6n8SoaQQfMOThPrUJt+V0z3Jpk/Aoq7DHNnjHixB9aw0Qw5rPrkcxHlOBZg1Wb1WlEMraes3nTJJRRhxe3Clra5Xv+N8Q+mLbDyDNOphWf6hQPiP7uV1UnugvfxkaWHCFGjtGM6GRGqFv15Vhg5iTl7OxQZRzqsUVm+urmCA6zdvwyPN8kZEarITMBIwPkLnhVsIKMvWJvwYtuG+exV2C6PGK0ZByWzY0pDBMTrykDzHMtdKhYNUVkS9RmB/Ejr67e0R/UXcgrMuJ6jQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hIsGEIz0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hIsGEIz0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvt6M38fxz3bf8;
	Tue, 20 Jan 2026 01:25:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkIfGy+BTFf6suzM9hv9dO0tkLsgVK9JIXCJXXslFArGruMvWs3QL1DUsTx+NEKvfmSObedcEqQGYjpN2+clpmFOWGfMyF0qwN0lc9TpvP8vJIgozTwXbSMnvTH6HoBaZ0MSTzVbwl2m36aB+xKm9AUcup36V2j9gjytuv3mwhRxD4OBocZgQpI8e3O32e86Zig9RfmKuOzFPTbtO+Sz0MSRjMajhDIIXJ1L73y2w38Sfbgc+bQ/ELFy0Oo0G9mKwNXLkkkCzqeEa7GenFlw7I/jO7LPiMK+mAJLxFfYRbPyUp8ctlwkXHtISMvsfU5Y2TqgNFy2+xLACTPPUeMYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=;
 b=a1FmDPuCCnEwHM8eE0rlWrte14AR2pbKoYlQHIvBU9VchrTX6xAqrDMqSrpbsUygWs9U20bn9A3N4K7D4OyxDr17FEsowcuTfXpuL4gqkNlh8ZJv6olYAo8zeq5/vu0oXELzWOh8EEmyRIis6BWRExSiBWogMJ4chc2mg/d8YhDhOmcdHxVD1IjfXh6lJXAFgCcJ2sX2WQwR7izXD1RJ57BKvj/4p0M1LdORLnOzZ1k1mmxeSAZZKMYXfAzKbY8h0jVCGil25BSNvvdLvcg84/Gjf60jDc1LBUHMpSQE4DrjZxu7ODOgwTvyuyRi2fvyuTccoBbCKS6zgXG+/sPWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gATY+seX5xwChAYcMLXK8PDVIdnWCiHwD3KGyej40S4=;
 b=hIsGEIz0PnoIubBSL5BF0pWR41PFrellwgtmLvt0His0B34wKeKBYbhEe+9KcOn1oXnllEDuy3eXEJ+GRfZtqc4fg65B0rv2MiBGUXcMbhWlG+wFLPc3Yk9gjr+LEThylLk3MP8VAxOJ+yVcMFbFoQVu1v77ADckENzXXt92+EWqKvrFGhd8Lso/VHzLbJKTxqWUG0V4FYO7yENCS1zUj3VethQTeeZuSabWTZQOlqs8tXCVyx05l1vNmnVyRhTA7FIbGx8SmNlB3/R7kYYrTIJG66qJleBKgj2s6RbDfP49in5gNGmLqvqHUlFE1EqD5v8hGVVssMQZ7kp6OZ+W1g==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SE1PPF59C9ED6A9.apcprd06.prod.outlook.com (2603:1096:108:1::418) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 14:25:23 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 14:25:23 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Mark Brown <broonie@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
CC: "clg@kaod.org" <clg@kaod.org>, "boris.brezillon@bootlin.com"
	<boris.brezillon@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Topic: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Index: AQHch7cbAQl19CEQ6kOCsI3Fk+BkmLVXCCqAgAJ50QCAAAz90A==
Date: Mon, 19 Jan 2026 14:25:23 +0000
Message-ID:
 <TYZPR06MB5203305392403192577AC26CB288A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-3-chin-ting_kuo@aspeedtech.com>
 <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
 <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
In-Reply-To: <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SE1PPF59C9ED6A9:EE_
x-ms-office365-filtering-correlation-id: b97436c2-143a-4513-4174-08de57669544
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?daAgXzUEZuZ0O70GgJCgotZF53Kf8DQPPlq2D9UagZaM8pjiCCvyVqqToq4d?=
 =?us-ascii?Q?4QKLIutzpJfFZSjvKt08J0bQNzaXopZqg1cxt8vkH/iv02/QANpMJTPz60kL?=
 =?us-ascii?Q?VISqhZlnr6KkLbmGJgCp7wRBMCUUO1a7fqmRomxDF169XsYGc+VlVIPxTbzR?=
 =?us-ascii?Q?u1p3Tp5vxYRE5JjFsiDipsdERPCv/0cBPlqSVgBXvM9snENwwmBbTrdjuRYB?=
 =?us-ascii?Q?av/6zC0dZYKdw+4QctgigUUhF+8Mw9Wn+2XrYIYRTtsoc7ncqfna6xSLCth3?=
 =?us-ascii?Q?MdFo85gsf9x0p/rMK4s/wlg+fiiXvwrX05i51tPNmU/Nf2f+MOsiel5tYZ8S?=
 =?us-ascii?Q?G75gKTyME1j+WOR5a8Ma1B8l26U7t4PHrFxtFz9Zs3kTxpfkiN0M1BGPEize?=
 =?us-ascii?Q?IHYyKSPXT4itfXNctXMEqelVhyYPOuiachbIOmpOklJ0evB0aetr/3/bywiC?=
 =?us-ascii?Q?W4tURRWftURMfOAK+yKWB9w0e1Ah5k8HNx8alv3c6tNk6UveSuqcGKaKXxtt?=
 =?us-ascii?Q?4xsA2jlHGha0XwTw4x9Evp9hjGT0anfMrNfnHng+Tn/7ZggZdSy7QSfadSOL?=
 =?us-ascii?Q?cOkb8TNOm8qQBHaU9Wk4k3aQxFp1FgswE9KvtPA+B+6TcspSdyxe4sa1tWnO?=
 =?us-ascii?Q?FxGnMNyW18y1gN4XrrUbm4QHGw+VerR64qYWTI6rex5eb93LNavKCx8lwokf?=
 =?us-ascii?Q?sLZ8jKlQx4NRhffZBhPmWRmrJKNmZfZliQxeK8fdvNSipzAvZ/Giwd+rf+bl?=
 =?us-ascii?Q?J5AipzAKN+qoxkrPXP+wX8YjYSjPhs91M2xmygZbzjZb4aO/Bsr5rKCDm7mG?=
 =?us-ascii?Q?8nJBwoLT52Wzar8fbpfWqV/kfUqBoLZKBVwKpp2SJjUnJJcIwu0+O4v9IOyh?=
 =?us-ascii?Q?t/uwjy6KbPJscyqTQOyRNK2GvP5a0RuFsEWZF/wcuAVs+bWB/YhdLkafilxF?=
 =?us-ascii?Q?rtzOY3+hpdD0tJx5dDoVjecgWxUBh2qtsE7swjxMdMuNpCS3lLM3zIGzHJXD?=
 =?us-ascii?Q?WyEaS5rsdCk+hYEPNTE+ljxh08GR3j8zGJnwwkpOcjBlrQEwXfsR1qP4SuZx?=
 =?us-ascii?Q?PYuCOoaAJk7MTH1n1sg/by11E40cwt9YlcenyHq6OPSH2S3Nvt8UFrA/T6mB?=
 =?us-ascii?Q?z08RtIx685xCaj9u8X40mxGR8zLFAZaSnUqK+u/gL4I0uUye1MQLMSkkDaDH?=
 =?us-ascii?Q?Zp6TvYcSKFeZhdUh2LERQeqbygF9qV5b3er2rXF+8JcGjO85y/lBP2QW6ASu?=
 =?us-ascii?Q?R6A7HaezJ60wvErV7CiuphQYv1TbF+kBZTQfPtaurISPSOiEcqLrV2jpRzqM?=
 =?us-ascii?Q?+ckE/H2rjE8KOjxVYAZsVe53zmjoMwe0xpWHEawxxCAt2TRi/JxVImqtXRmt?=
 =?us-ascii?Q?Bt9yfT/HZv2DyzW7hyaN0J4dV+/NFVPTlSDNqsolvbPtJozGc7uBtKlW8jWw?=
 =?us-ascii?Q?meu1p+1xYSmMEaWySxfzPg2bGrVgbsInGtloNSVFmSzH1pV51FwvhuHDYZm6?=
 =?us-ascii?Q?dXapMw7s+u6Pom1PqY9kH1JY9zGufHEcKkTUKbDKmvlYAyGxgWEJ2mXkgntU?=
 =?us-ascii?Q?udkoU1UFEKl++o8IvEXCadeNULPmMYqQ5g7/raWimSs5nMUxujsojj3Qga9G?=
 =?us-ascii?Q?H7R8c1g1Fsh+02yxpwiiT0U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TjKgIQiaAVRQQNMjY5tJ+fhR/Lx34HjHDuNID+WSlq5J/39Tq0JNpjkskCYn?=
 =?us-ascii?Q?mrxh5E5oHXFqkZoR39kk575P4l+QsELjYtQdIQ6eB8rj4LwzB7ltBoLHwcB9?=
 =?us-ascii?Q?8Nxd4zwzxf1la8z+9l3FDBZjsMPSUAvZXYJEshQ9m1H4PkPa5+CRmMaiEhkO?=
 =?us-ascii?Q?VNLNxkCj2wz8EhK+7Y5jkmbioRPFeyseUE8rrdB2Jv1KSua+7mnX9u9ihBCM?=
 =?us-ascii?Q?MnLF0k6KAw2uvKM6JLKYTErjKXG+KaUizmQDeFDWedzV3Sxk4XXnGYnPUR9m?=
 =?us-ascii?Q?1AjIyTq2yfafi6k6UE9dhN9ker2KaFZOj4RP2xpi11iIm4aX66eykR2lHF/u?=
 =?us-ascii?Q?4g4bYs5DZ+YUoXZOn6LhLaOqMGUinR5LURkVJW2T4ABHE512x3wsL4vz5rb5?=
 =?us-ascii?Q?MN24Za6NjzFyZVYKXvpgLtND94tlXnUD/sPPiMkYdOH996mEnimebsUHYQax?=
 =?us-ascii?Q?fPm4Yz+J21rCa+9fzSeo6zhC5XoyTuYKDBbYqqmwVKc0g8wGnxaszBmI/Fw4?=
 =?us-ascii?Q?a2yi339mxcNdpvbLC/zYicTvhYKnZJEUParDkogMiMHRHY3s1YjKTamgVILC?=
 =?us-ascii?Q?lSxEvKLCr4fuE22tjF9j1s9vp+mObJ10Gr0eMLrAhPHCnIZDn66rDbBGWPlv?=
 =?us-ascii?Q?3cJWB5X2fZeLGhYrWdeaFeCMfwkgTb83fepi+1hMJpU1jpEXxA7YAd7r+l1B?=
 =?us-ascii?Q?BXAiEREF6lnmIUG5xkrnzkDmjyh/ZltXnLXHm0FQ1LuvWKLl+5u5GQUHE4Df?=
 =?us-ascii?Q?7jbykpUOzI+UgFmvg7YtDnrHtlGJMpz+MoHIDu1Zvyh3sO21JhQ5dKkJoKxI?=
 =?us-ascii?Q?+0CUotl3Q1qUJSkQYHxSgDAsIACLD28OjzcGuzMBPKABVzEW5gm4HYOM1Fzl?=
 =?us-ascii?Q?EL2Or3Cnr/0ZXIBIEU5ZiYcGb9WXKcp3Bi47hOUWfX9kyU5V9z005Wd2aca5?=
 =?us-ascii?Q?t3Hw9gHgt/KBHIFbtJc+xFYgYnx3G5GRw+HzJJTaoFHM3namtWs2rxitk2yk?=
 =?us-ascii?Q?Y+TlY+pGM+zse7f9/7WzYbTsDDs9E5aC1Z3ZrLk4Z6Rd/adWzBqBsED19MKT?=
 =?us-ascii?Q?rSAM+llza6SiYx2w794bYd0VjVGARdRjKHdrbF4StF3eVNBaqtk7dbxnz58U?=
 =?us-ascii?Q?NrWC0MixkOVZ0WR2ZQsxPMMLKPr0FtR+ZlWtHF35xu7Ps3tWLecx4WwND388?=
 =?us-ascii?Q?t/nijtOXOIn/tcLWhnKpu0ywbI7A9E1HE5qPgfrPqK0HsdqVIO3we9tm90rZ?=
 =?us-ascii?Q?dWR3DXVweDhvKgSPTqyvCJNos47sIjR/jpD/fFUw2Hs1DZ83pPNwBaLkXew1?=
 =?us-ascii?Q?MPpIsKNCQw8o16oPtuSQqBpYICmjv/Re04ZbVfcH+PBJRYRaKoj7yO/H+T0q?=
 =?us-ascii?Q?sQO8sa/tN2HuCh/mmJO1WZAlpBZz4v4D0NoypO2S7IsWNpWp+uTv+qSvaJdW?=
 =?us-ascii?Q?25Y9FpaaC4TfCkOwf8tC6fskL7Ami4mo+tiMivPgim9tR4dWfA6o5R4b6tLE?=
 =?us-ascii?Q?uycaVcj8LNZt9QprJXe5AQM83+oR9GOhy01ny4nlDORY0ETUvjSajvd9ng1j?=
 =?us-ascii?Q?Ig9AGhYlO7pnAnHqBT2oH3zX8VhRk4xi+ZZYZdnWnWQsIFjP9+V/Mw9sly6R?=
 =?us-ascii?Q?IrfKrIwm1LJ6ioPyoHGXeTCs9Tn7arkBrgsL0MjJsjMtarH9vZmSAist2iAu?=
 =?us-ascii?Q?gG7kxwUcE3dzc6sGzyRGAIH0UxtOE2Ta0UGL/jCa+ufyfFG1tIItmVN8s1Xz?=
 =?us-ascii?Q?WvqgQr6AzCybvUDNn+rlOrpAwg9MHZM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97436c2-143a-4513-4174-08de57669544
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 14:25:23.5507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BMCWeh1VCEv7gsHbmttxr5PMZ9NRmriM8tLvzipEFATFi9u4pEP/EsepBBUt54litokT+QO84JF/gVxY9f7Kz882L0txWKhvhwpq5CEWSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF59C9ED6A9
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, January 19, 2026 9:37 PM
> Subject: Re: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devi=
ces
>=20
> On Sun, Jan 18, 2026 at 12:48:37AM +0100, Paul Menzel wrote:
> > Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> > > The ASPEED FMC/SPI controller may be shared by spi-mem devices and
> > > other SPI peripherals that do not use the spi-mem framework.
> > >
> > > The driver currently assumes spi-mem semantics for all devices,
> > > while the controller also supports direct user mode access commonly
> > > used by non-spi-mem devices. This mismatch can result in incorrect
> > > behavior when different types of devices share the same controller.
>=20
> Please delete unneeded context from mails when replying.  Doing this make=
s
> it much easier to find your reply in the message, helping ensure it won't=
 be
> missed by people scrolling through the irrelevant quoted material.

Okay, thanks for the reminder.


