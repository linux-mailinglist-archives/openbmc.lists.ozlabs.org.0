Return-Path: <openbmc+bounces-890-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EAC5ADC4
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 01:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6zJf0jFRz2yv7;
	Fri, 14 Nov 2025 11:57:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763081873;
	cv=pass; b=E6g765YcZGZdX+4FMeexu6oGlXZOTxeViZBj6m6zOwDP0FZ+hfY4dH3WDw5W7hBywm3QqLNmjf+MLh/amNSYzT8A/3gWkTX3I0H0qkX35swkRqbsPAgQkr11HXHx3feZG7dQ4cl3DgBKgi31huym7fEDnG/oLnsaUR/j7X80sIZ9g+rJnNrbg64thG4TW+US/YPev6Xr0OrK4ukjhQvuKkRUOTma0jqWxodiZMXTycdKy+oINITl+a3HBLbiAXOwKuhFxTHD0aXYkfB3NLPVDWGsHHx7H6PRTuLT8npQCSx735wAUrgla2PDW4GqgegzDyHeSQIQ5I6dD0C17XS2pg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763081873; c=relaxed/relaxed;
	bh=XB1E5jSDLtRO1xlxGGz6kmW4ReovcQDIGSxPxx8GKZU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CJN24LPW7jJVw7CF2UVdMnYvqvkCyU8QjLyt7LIQUcCItcpUMaOCdajCL5JVv857Utx386YygAAaAqxLUyMArgnEYmCgKHLZrrefesFwpgnoM1dziOe1cR9sWwQfJD+2H67+VTyv9jqx86L9FPhBWuZO8pMnHB2zagCxfOg/A0bhgPJdo6cSyNWSy3ua5weOZLFvI+IgNMHOfAVB6l99B0iPI8w8X+GEM1Q5tE91l30jFBv74cLDCO3sv7HOrqqscZM8QblTHq1xVCE3hNFdvoLAogOmA58lqnykD9L2K6p/JB4d38ZBuhYAhTNfHLqCRUkJWrR5EFcwLZwWfg5tRw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=L7fn8iDG; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=L7fn8iDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6zJc4PhYz2yjx;
	Fri, 14 Nov 2025 11:57:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNieUa/sGhcIROqKdxEywcbqyHobMy+kLGuPlTp/VYLUu/4ozh+FKKFSQz+CQLTXGMB2Wrig117XOdCn8q+lnTKXlWNV6A8dTER7rwmz8PM8jPXFSitYiVPZ+KCIbkDFFRATq3JRFqNGw/z/U/I6KA5qaoXa7FFequRwW7OrzNsp/30DFK+wtRStg7jBtmD5Kiv9KpgExHRY0GxAdMatACJVRllBV+GHMSznSQqss231xhGxrdCy/z3OqXGIGtjFM2OMkr8FPiv+lu1L0VwVWw1zCBakXf79gxlvSuQS6HbrEtjW69nBsKT/sOUP145wRCVcQLH2+fhr5ml1yyDALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XB1E5jSDLtRO1xlxGGz6kmW4ReovcQDIGSxPxx8GKZU=;
 b=pIADS1f52NKv9Ly3EXlFmlojL+buqrlzX/wTUqg/+2QPdnGAAwDQeYTRnLeAg/giTGaSIUfgVtmu4HtKytGA5TY0DDRCHot5RwQsXayPQwqXDvbPEWCnyRcPBp07HMr1rvskxcm/T0ZLWo7vYK0akTmuCXAQz+ro+3JWryavzulACHM148RiP8b/VIc4dhwHEB8EJj7pdNQ6Y508u8zXQXHg5fvAr0P5X/3xO0H7pag1VQbMWTMt60vRDIsNLvOFP38+sgkeYqRsb7uupgCpYDP1XnArFqCYnzUFul/k/DB6yoD9N5qULQ4gIi+MxXf173qzj1ITXn2gZBG2HojgMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XB1E5jSDLtRO1xlxGGz6kmW4ReovcQDIGSxPxx8GKZU=;
 b=L7fn8iDG4OS60Y6BFWUEf4DtJOsJdsDaSPAbyOFQ/JwjqfyJSY4libWnJk1qkw6c9CK48vXyVngFJIM6mFOyfJUpZ0UkQRDE4F8UV1tZkMzjmUnG4QnJbyeHip0YmUYUUXTA8jdgT3/yY1iy/63CdmUeeMB2heNxIsCKHFknQmRjwgIdaapn9o7birhI4US9qgz7sWPn5zKCI01G+mt/q3vc78GWw7J2bAuyhCCj8GrtzVPAuztCucahc10sad7E1PY7WhXRl7Tm1LX3htpZKtzZFKryufZTPAb5XwXER1PXbdkS1mFGuEl3ahXFUjTlQjBJHfUlkIWM2Jr8mbzyyw==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TY0PR06MB5402.apcprd06.prod.outlook.com (2603:1096:400:217::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 00:57:24 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:57:23 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Conor Dooley <conor@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "clg@kaod.org" <clg@kaod.org>,
	"clg@redhat.com" <clg@redhat.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC
 support
Thread-Topic: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700
 SoC support
Thread-Index: AQHcVHsCAB7l5otGZECo6+KptV6p7bTxAJuAgABZLSA=
Date: Fri, 14 Nov 2025 00:57:23 +0000
Message-ID:
 <TYZPR06MB52031D72CBC176D38A71EB12B2CAA@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
 <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
 <20251113-reroute-backlit-b2e1d1b6dc04@spud>
In-Reply-To: <20251113-reroute-backlit-b2e1d1b6dc04@spud>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TY0PR06MB5402:EE_
x-ms-office365-filtering-correlation-id: 489a379b-f243-4fe2-b71b-08de2318c5ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4I5y8HVlwKTJu/lUJksCntnWwCNDKN84k8vIuTbPNGij1IWomuqhEmpybYMo?=
 =?us-ascii?Q?NhgH1DMkZ4GPfvcXK48ttBNkee9Rt79oow91t/Kuz+Kyz99hTFajmMlN5CTQ?=
 =?us-ascii?Q?AREUlVkTpg7yu/lE31+CRURo8sjjNPYA40327/bjaQh+7hccVSYGrHHYuH3t?=
 =?us-ascii?Q?YdoygsU5TmVWja1HsJlZukqQOWv8Mu/tpMPMIDBgXiClaHKsCemfe60AxyAC?=
 =?us-ascii?Q?DFddDuo7QBRGjxrtCZgvVRva/iQnwTGAwD21cqYXbKZCiGsLB3hi/N4ITMdK?=
 =?us-ascii?Q?nxFygaGVgONm0vVHuLxz9Dpgk2fkgM1JAfSP+GO+pDFwrACbk4H1rYecw7mM?=
 =?us-ascii?Q?62rqvlE1Zb+nfDG0e6K9KU9VRK3c253xik1MFu9qd6wZUDUe5GTS/nHEOVq9?=
 =?us-ascii?Q?bGa7gcvcU2CVcISOaWdvq88GhASRG4+U0LWQLGA032G/6jEjU+lpNXnxvn5s?=
 =?us-ascii?Q?0ndLY4UK1Bblv/J4AVFIXGsUTN+oG9f5U9aMUEKXaF6JR+1XRMY2VTh2qsgT?=
 =?us-ascii?Q?P6C2LIleldT8CKM4HQ7Omy3cVBk5anNAJPS+83GjmZ8TcNs9NiUVLMMarBSH?=
 =?us-ascii?Q?SUwP1SoDJqqNhfcwoR68QmyChfBZE2MYIObWNdxWyNhgLnwNVQbdTK3iMoWP?=
 =?us-ascii?Q?CpXHZFcuBL0CSUX9ya5lmQbxHXwmRT22W+X5Ti5qt2DE4gvMyA9naw6IqNya?=
 =?us-ascii?Q?4YrH1UsfaHSn8+EHRQOQr8wMMbTdgyKRpKEQSllEahk1Bm3Mk03aWq5t5M6H?=
 =?us-ascii?Q?JdHW0ds2jfQGP2EblkKPiO+JTU/N6K+HnGIsxB3CZb31rcki7AZ7ayQnxSoj?=
 =?us-ascii?Q?O32M5gGrnBQR+WVI1ForOaR5otS/RhH6uH7G0DdjMOmkxL8rYl7xAtShmJBV?=
 =?us-ascii?Q?FVKDYbOUa6sjgoFSRbSHGFsCKaGsTVyjVsAFDU5ut5/7uDHYnZDB5J7qZXic?=
 =?us-ascii?Q?vkdHxz3cHbyMrhLLkxtKz+apgdH5Ed9LzKGTWPj3bIY98fluZdAQI0OJvjlN?=
 =?us-ascii?Q?Jfvbr5L+lf/HZ6ZppwQpG6cAL5b/S0s3qRUY4gGebzj0YH/P6j12fHPj2UfZ?=
 =?us-ascii?Q?2myLuajpC8wjYLZznoJn+DVPvw+lOIh+K4GYfYgtXbI4T1MNz3QchxsAcAbG?=
 =?us-ascii?Q?ayUdhGzprgPA8QtQMs5UiTq4EwlWsGIK8iAuWaxfpTBfw2M3wVSAU1EC9T/8?=
 =?us-ascii?Q?V3XiJOVbP8D54vKFpy4TZqwdJkAFbMdz/SZ9rsFrtgBq6XjZAtg27/lQJ4SY?=
 =?us-ascii?Q?xqVZfPnQkgbT+x9ZpcHYiBN0RaE675coK2vKapoJg9Myr4MZfzqVme2IxO7a?=
 =?us-ascii?Q?wsMNKy2AM+ZJ23Ohnk/Gwyg8NhFgUPM95Xu8TUvBXQhefLtG9BVANQEDBH3n?=
 =?us-ascii?Q?Jg+eFYVARYGJPSEnlejy1PTzi4jqiDHFJZzTDEbgSO33w3LDGFWKgK+MfgW1?=
 =?us-ascii?Q?9Q0jxgELLIs1RpuAN2QS59YjA5rJBz+wT3iSIzYZXKePz9O8zPbCoQG4AXYd?=
 =?us-ascii?Q?A4IrGoj+hjzyLsOsg8lBsSPymu6cI1is8vCd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JC5oc48J+EILfvZT1SiMlfZwIB9t4zOVw9UymbXjTIOE+j6dD0WTUFMj/CIX?=
 =?us-ascii?Q?am1Bzz4p95xt45NdoOwyr28dL028wPby2qV6Za64Iyw9YoeLWq4Pel3Q7DbB?=
 =?us-ascii?Q?zIEUb0Iz6GvR6EqDeI/rLWC+IJbQ9pLZjTSJU4Y+4FLiz0JO5spPf7uIiK1K?=
 =?us-ascii?Q?h1+qjt0+dURKAgWxpWgUOva9lEyIb/DeC9W2ZXD2gvTpZ+blj/0uO3yVGffU?=
 =?us-ascii?Q?jsmiod6HzG9Vggw51qF5bz6nwv7pLbEKtW12PwEowpwsgW1DgF2hUbwWL5iH?=
 =?us-ascii?Q?lp3vGsoPUCu82A0QXhLVUVYyt0r+SDcP3cbv51JSvDoUAp/jFBlkOTcc5KCv?=
 =?us-ascii?Q?HyDqI0+A2LEmpqv47E+U+p87a8bRG7iD11vDs5oBOHwbaSVR8Hbi4vV1hxDt?=
 =?us-ascii?Q?fxeI8AqjKqfH7rtAUmnonNUmb+Yw12ivFulytoMb5P/z9dGUAY69LcMYvwTN?=
 =?us-ascii?Q?z5f0XMZthc/VqaBls8UsjxmhNiqBp3PuC3nNwDOVAYBQLT22a8SqmXeryy6S?=
 =?us-ascii?Q?ejro3CgrrPEyNRyu6ETBMr12ejkUrPfvjpjsF0OhivctFDm3Er6iiFUjrUtn?=
 =?us-ascii?Q?6EbKOwN9NxnCCf9r8NYqYIcf1Ig4++jh/4Ii/bT5iyO40c81H4HcxPISVURY?=
 =?us-ascii?Q?SUX6tqiJfzPPUVfAg2tSFS6eXZ5MwwjYdLJSohHBl/kEnX4OkDZk2UGO1lNq?=
 =?us-ascii?Q?k61/ONXbrKpJJakrLnhhK67OtpzCNnsNDlQJUbpIZL/6nZTtvi17ExAOPkaQ?=
 =?us-ascii?Q?V6jOWH/VoJjQoaY7ZHqY9q3mlBJH4wWw89zkxpfZZxMpIie3D4A4y7Z6cFWN?=
 =?us-ascii?Q?t5s7OI1vNDiXaEiD9YkJBcyaRuFM1BOmagYiUyxRoD0ngzQn2PZ6aNvHC9el?=
 =?us-ascii?Q?f+5Jot1a6OOstguJmNsXqz1USGOlvi8c1Jj3u1EjKnjKf42I148/C8RFeloX?=
 =?us-ascii?Q?AEfDb06FHmRi6T84iWVuyfW6UnKak29EbzRdN8+OLX+D0Gu8hSf/Bw1Liv+I?=
 =?us-ascii?Q?e+N817ac68eS+fYfEf9yDm/DBOtfjss0fsTA7vuVBN86IH5rkGXkTKXdZhuy?=
 =?us-ascii?Q?DBfyba9QrDQGfDCXUydKdG0n6CWKBPxABm3agc74h7QX2CmNttFzbmMcocP3?=
 =?us-ascii?Q?QGPFY+BhKPTXliq/wlEJ8A8iMXqIZtwnQvwB9AwMqSJu8HRllQ7ftPvmiZXO?=
 =?us-ascii?Q?+ZQjJuuFSBoyx8IJ8Zhvc3Nse1j/kxzUJwnGYpc2hjgSCxio3FWTDK3xMAQQ?=
 =?us-ascii?Q?LCHdw3Bu9zx8uhsD6CdI/4DBPrQaJMWHvCaiUaVFKNxoI3iggbK69ti6gm8x?=
 =?us-ascii?Q?b8B4TAXGiOQiiBKg8Z+R6OWlt46N4FqvnPdcGUSQ7db2pWbxBaBd6GqHRabm?=
 =?us-ascii?Q?RSOmPGOBWWM59mzAaLwSedyePhmfPfXwCu31SzYvThiPgxPi4k59FJ3t3IbD?=
 =?us-ascii?Q?ZSbCjgPRACxRjfegAkuUgwqb/HZPKOtvP6ETtwWqu3DvTwGEoFbhKJkkUzVb?=
 =?us-ascii?Q?M/NaQ6N3mbamfK6nB1sJ4mWYpqg9We8n9BYFmcw3Isbnbvf39anHk8baW/gs?=
 =?us-ascii?Q?3Hl9pkmbZbqNgznbLxJTPZUtZxBowr9L2FXGK7zUyI+96o2NJ1rT58QVBQWz?=
 =?us-ascii?Q?/A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 489a379b-f243-4fe2-b71b-08de2318c5ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 00:57:23.5682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d8tSFpCwgQuJc7E6UWVlBeEeZMd7HreS1xqvHOYl37VrammQgnANCXhgKP7MXDoNFuKAa9425ASTAskmGQl2Pg5l+s09ykoYGwYg1hGUdGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5402
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Conor,

Thanks for the review.

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, November 14, 2025 3:36 AM
> Subject: Re: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST270=
0
> SoC support
>=20
> On Thu, Nov 13, 2025 at 04:53:29PM +0800, Chin-Ting Kuo wrote:
> > Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI binding=
s.
>=20
> Please add information here as to why these devices are not compatible wi=
th
> the ast2600 ones. With that info,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: changes-requested
>=20

Okay, some differences between AST2600 and AST2700 will be described in the=
 next patch version.

> >
> > Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> > ---
> >  Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4
> > +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > index 57d932af4506..80e542624cc6 100644
> > --- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > @@ -12,7 +12,7 @@ maintainers:
> >
> >  description: |
> >    This binding describes the Aspeed Static Memory Controllers (FMC
> > and
> > -  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> > +  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
> >
> >  allOf:
> >    - $ref: spi-controller.yaml#
> > @@ -20,6 +20,8 @@ allOf:
> >  properties:
> >    compatible:
> >      enum:
> > +      - aspeed,ast2700-fmc
> > +      - aspeed,ast2700-spi
> >        - aspeed,ast2600-fmc
> >        - aspeed,ast2600-spi
> >        - aspeed,ast2500-fmc
> > --
> > 2.34.1
> >

