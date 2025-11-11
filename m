Return-Path: <openbmc+bounces-864-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9EC4B33C
	for <lists+openbmc@lfdr.de>; Tue, 11 Nov 2025 03:24:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d59My58nCz2ySq;
	Tue, 11 Nov 2025 13:24:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762827870;
	cv=pass; b=XLbAGb0JT6UkTkRRufG4ega3bPdvqsj9dnuuHXlSEdwmRiBt53S5zyqTCQKfj11+9HrQ3kTpCC/XVdvpQeMf/UlVrtCJelD8Ti7t1Xjn/EyoJv2WFwirnXfhBjy0bTziQZ3+7/q+89X+Sm/swMhOTPEGhPyqkTrIxhkfSQalVEH8ak2vfl1BfRgL8mrESOwMarJ/p3JCPHMbMVR7IhIchCKnHb9/qCxCSfS4BqROUjojtsaqrvGZ9FMB5GFss+zH9qOK8vYlWWw1ONWDPVp9/Zrmt1xmAFd5r9rBtQEHjeChlV9Zi1PedCLkyKf4a0oFpstp1wIrXLiLr9r2wQa9uw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762827870; c=relaxed/relaxed;
	bh=DWM2os22LUr8ZhDKf2g2SFoPx1FREyLA+mCLN34Nhew=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lOH42V6CQM71YyyQq6+w4Ur+zGAbB+nCyuWvEFPV36NxgvGJbttzLVHXJ25IPU0E566WzSmJ3c113cu7LHy32o5MAtS5oQDSdJdXuF2p/wsETw9+sH+1YAHmJFCeXuXvYg1o5RmEbTVgDg5giUxsbR24f2g1m1Fo29Hx6KFvK68g1+YI0jORlnEJm8Hn+JLTwGu/hadrPpkHni4WqPolyK0Ru4LphyNRbQAUNErvqRiHkZpva+fqV1PygNWS3sGU7TS/cjdR8J/yTiXlwBo44F5PlKhSFyYQqrjvCJ2PWy1FMSyKfUiPK3qCPS/bqD/X0x9drFZJV/I4x3KCJnKHqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ijmaS/GS; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ijmaS/GS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d59Mw5Fprz2yGM;
	Tue, 11 Nov 2025 13:24:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSmYCI2X1+bH3CkQdRMEJYmMIbwkIm0NUAAkmi5Ep9cV0ztkON5IYQAugW6J2CWao3Jv5HqWBO0iBiVtdFhL3hjz6Eqgbyzupho9kilpGGD/15vet3rQ9esv6rGSulQeYfkw0vXUPfQCmC170Q1izKTjEK1hNMx2SpQXy3q5a0gioQNnpWGduMsHD9K1/rkbrkWPG3G4kfPpTNVnx/S/mDo56dtQ9QaS99DVIb+FoqaTjIrs7pECKStaFfHlLczuKcKRUu2Zt1TkuBBNSpz+blSRG7VgOOvZ9j/Y08/zGKCy+Jl8lz4GAEZkAseLSQRPZ904GQcSu4V1PzfQUta/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWM2os22LUr8ZhDKf2g2SFoPx1FREyLA+mCLN34Nhew=;
 b=qDW8TqOQ8S5tGx9QKxx9HKrpeEdToo5+klrDCC/0BZ44SGj8tSnbhAiD1TJX/4apmh/rkEHJj4M6pVLOJR4MME6XnHUoexhV+ZXJfonIAo1hhdqtafVxfEgNEl0QT14KH9YlJtHew8y6bNGqltI26uqoCFzQ8SKGvjjly1fi5d0WklpjGj6m+32tE86MnJGny4nGSXkN0FPLaSpHfzsCGNYMWl4tqNEOITQUPQFGPAC8xEQvOhyTCksIAEncpFKvoxUba/SNcXn5UTq1eZ8P0H1bTzgOwup4cYvcT0DcA4zqDHwstWoEDzgm3coQM7bZUaJd2pb1gsM9IabUW7XRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWM2os22LUr8ZhDKf2g2SFoPx1FREyLA+mCLN34Nhew=;
 b=ijmaS/GSM+PYgfurlfBo95qlhhECv2pyJIHuScw3Os7Qr1k764NPxumXRJIgofKAjVpDmGkU2j7NNXCSD/W7cPXhaiP/PeptuhTWsaGE13GstF9IpiV9m+7q08uH/EFroKkfdnrGRwsnOFszJawDLGoHTAutQj6JRPx/7SqzNF4paL9NSELurV9vL9b2J19iqhsV6J2IcXMHIaYKn3QSlpXTh8h5oqW6GUWtZ/IkUtskLcL0aWEKjp5ZQkpzA6LWDOK3AD3l2UL7ojBoQK0T7lVmGmfHuSD/WFYW2IqrUJ6PHZM5HJm8tOfhorYjQze6KeyTBpe/oOV4W7o5S6a1KA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by TYSPR06MB6765.apcprd06.prod.outlook.com (2603:1096:400:476::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 02:24:02 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 02:24:02 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "lee@kernel.org"
	<lee@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
Thread-Topic: [PATCH v2 3/4] pinctrl: aspeed: Add AST2700 pinmux support
Thread-Index: AQHcHYd18lbI5El9VE2aAexfEXfel7SjdDmAgBMm8Co=
Date: Tue, 11 Nov 2025 02:24:02 +0000
Message-ID:
 <OSQPR06MB72523B6701362F75B01B47588BE0A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
	 <20250904103401.88287-4-billy_tsai@aspeedtech.com>
 <005c9928cde01c8a3bf4840692eddf13f2c08282.camel@codeconstruct.com.au>
In-Reply-To:
 <005c9928cde01c8a3bf4840692eddf13f2c08282.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|TYSPR06MB6765:EE_
x-ms-office365-filtering-correlation-id: 388946a2-faa0-4056-1da8-08de20c9613b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?FT1mn2Do13LvE+edvb2CoN+/1NlfaWmvQrxZX75Mktl7vktfI4nJLpm5?=
 =?Windows-1252?Q?akF/Q+tessDGkdmwIm3RakjEFSNFTldSTNtNHZdZee4MjOkC3+QmsFUB?=
 =?Windows-1252?Q?QHI/DJIQL8EsC17+7xP5iFIe/zZYcT25tDaZm27wjLdKUnB8Oezua41D?=
 =?Windows-1252?Q?nJcjv0XEbZEKBcLSn4luYicF0shV9wYgBJlbqFrsGSeF44z8NBxAmsPi?=
 =?Windows-1252?Q?wDFTCg/xYtJwxhzdK0aZtB+tXDFR29aE4DXvsJMDamjcT9e0qTEiskVD?=
 =?Windows-1252?Q?9CWI1fpU62P5f61MnXV9fc7lnEZv8RTUpTSeya3HAa36wsl/I1G+jf8f?=
 =?Windows-1252?Q?h0CIKOys5HGuLR0hkS0t9wrWjvIgBVRz7WrUQFtBrKSy7xBCtnhiANwZ?=
 =?Windows-1252?Q?ZLbCw9rcE4m7IUEvSVfr95SXfjKobvizvBeLqyVU9kdzs1PxP1ERVO6a?=
 =?Windows-1252?Q?QK4gZUE7u3j4sH3BH4aVA4544zPcVnh2HMASGUkwNtg2EqKmnbLIzmC2?=
 =?Windows-1252?Q?/q+AoZyx4NnGRfgiaZZdPmnzxqQ7zo492s0GPYZE6N+OiQL9HX1vnTI/?=
 =?Windows-1252?Q?n6dTzNJYg+eA34vYNnZs2bUMNBl8aX9kAjrrMuK/iM5lXquG9s+o1m4n?=
 =?Windows-1252?Q?LxrePjJfFBCPOPTB4pizKfzm0Q7zrUhb2vFZWX2ZPS5K4Q9hhyMowPya?=
 =?Windows-1252?Q?zO8OXt/0Sqafw/0gr68wvCnj/06XixCfhdYNr+mwku9vrcFxYAenA+HW?=
 =?Windows-1252?Q?aaVxndTscF4bO7Iw9IkYE9qSgch7neKMIivjCYXIi99okarL9xul3nip?=
 =?Windows-1252?Q?1Clc91sbfzAcTQzmcI4/I4sGFrcj/pjtKB/u5elj3/1AsOF0JWKYLzjR?=
 =?Windows-1252?Q?zrA6P9xtEpNdhvIBI88/OMwCJvYhFBlUL/EcmgBL660mp9WqwZ33Vp7R?=
 =?Windows-1252?Q?7i0DbKD/krzckMJ4pCcfKD+IMLF6EUJfumN9EtifWAGUlzBS6VnP/vVH?=
 =?Windows-1252?Q?kxkoWXjEcyV79QbM39eD+IirtmAzvkfco8D4ZQkclBti5RjVPVGaEMKG?=
 =?Windows-1252?Q?g+HFJcI9BFeQUwRiknuCyQKT9s2VtDzuFWGbqJPaZ6KyRfzCDcKpU71S?=
 =?Windows-1252?Q?qlrto99g1gcRMgQZCAb2xVpopY06/LBQPenCnlqtBO1QUWawHcXdP6A0?=
 =?Windows-1252?Q?R1v/eovS4RhVSQ10Cp5AhnJytGc7vV1nGTasNLa2Yv0Hcv0jObgKsfXW?=
 =?Windows-1252?Q?nYy2EV+pWWwJyltPfOrLWs8aWz1wrbZoD29AvlWVQXs9oaYNIraJ9pti?=
 =?Windows-1252?Q?H16/t58XwefC3pdU8llI8rYddXBj2nTsNUsT6gvzNXzwkNlCHBA3KtKF?=
 =?Windows-1252?Q?Y6dg2LYwgBUw2QsoS/KLTBN6gkJiH++S+3cM36qdHtmZTOwgH6HydQpx?=
 =?Windows-1252?Q?w1LJDmrM99u/D/ahcdZAETfnMBs7xW8nRBFBulCp5nEMLGYMduC6u4AQ?=
 =?Windows-1252?Q?5OfV0HaCBeTIV9PlFf0QX0MqvZy4SGzULEkkK6kZ/qDyb9kMhwTp+6Sy?=
 =?Windows-1252?Q?wFJEuUe9LrfWBaXNRUr02lu0cngvAnw1E8j0s+5YvbzyZ0md50hFWVRb?=
 =?Windows-1252?Q?uCQWFq8PxLm295CYxSCM2ZIo750sOcZjU3KulB8MAzmtBw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?pp50qPgCBOYs013PkMvpkS3DI7cZ7afIoCw7pKArYPJz/WaSSAWmLCcs?=
 =?Windows-1252?Q?MT6SeTEvmCFDIJ41tp/ur2QSK+U1Ac5gmZ816YJ64KVRkG/VzB+VeuHH?=
 =?Windows-1252?Q?84gnD+A/HRaMNakP6pewLIL2lQIRucx35lPp9TMJXXcrU8fyyuP6C1kA?=
 =?Windows-1252?Q?99++IcvfamGaD43+Lk+eU05Uo8TsyegycyhWvEPVshbw3GfjzGmPAeon?=
 =?Windows-1252?Q?8xlUhRO8tb13tSfvN9fjth9Rwn7T21dNZZiN8DY528UNkoXrOPEKIaEN?=
 =?Windows-1252?Q?Izg2C/hoDkuXL1Yf++Ij5R2jMC7wGMvVXahjnqLmrj6nb3lbpBrk+wlY?=
 =?Windows-1252?Q?kDp3M8uBV2nwY6XYaWgifyzSJv5a4ZL2G7DNn9B3YOMsNJvWUR19ZgLO?=
 =?Windows-1252?Q?kNu1GQCulb+DLNEuCAVDjGUiJGHCQn35zclKwr77rptoikqLp9YmbiNh?=
 =?Windows-1252?Q?NIDaYSuGNS1wHBU2wBgHgy+7KpBINskeiAhjo8o3mA3+UqWNRdLgpJGs?=
 =?Windows-1252?Q?+Sa8KiRMdgU1ud7tECUmcT/YmGe2APOvBRxJrZRUyJ7QcMEoECc+AdcQ?=
 =?Windows-1252?Q?h+LvC2auBMY3CigVBsgLIVlezT0YG/vsfWZ3ky1xlkxifY02GDQltCXM?=
 =?Windows-1252?Q?h82Lufn5jhITlJrb+nd7ZKI8pN88zr9puPQEOtlrj01mPCJKfjcduMq4?=
 =?Windows-1252?Q?B19XkeqdbFPgNYUkykdZSLEwHAMMxnYxTxca81a2L+E4SJFHCpCQCRS3?=
 =?Windows-1252?Q?DnKOgbYQqd15d5OAesXWmYxi2LMi7SoweLP1f5WXSDarG3P80vXWzIV2?=
 =?Windows-1252?Q?UAqyH3oMHTZxdByh61FiXcoLPx45oVjewlmORVPi06Q5bRbOGyM18Asw?=
 =?Windows-1252?Q?vk5kXZdOvDmDbMuVxc86by7hrJRPcThxsoAl+3Tmkk+pl+zGsEHN/S/W?=
 =?Windows-1252?Q?MKsEefq2sU0nbfwLKuyXzAhFeL2iQ0V6lxPqKQkAl7qLDL7d5H3dXd1n?=
 =?Windows-1252?Q?dBe5Zj+vNiQhuL9g6k4+Ut4qhi6dF9MgWa+q8GW0GS5ojw007kw0hWh8?=
 =?Windows-1252?Q?wI6BJtFd+CMqxkcyg/BglJbmZGZXvLdPhxN7CBuRdAalm/Mgc9RS4HFR?=
 =?Windows-1252?Q?ktUZrXMTWyrbvpoWH34LVfA8+LDmw855PBeMqa0j0IAg05b8ke78kgRv?=
 =?Windows-1252?Q?lOf8QxW7YfNWb1C3bKd0Wl0pHDC7mKBHD1Nj8/zKBctjVsOzIF2FgNJI?=
 =?Windows-1252?Q?aDMMU9rR1iOkii7HDO6wzyED2DaaQxao+tQIznLiFHvAe0qQ6j3jWZxE?=
 =?Windows-1252?Q?cOKBILLmimclYt5q0qp37Qau9Vz8dB6uisxddwc89k5TY8M6HbOmpCjV?=
 =?Windows-1252?Q?SXIbdh/na26Iy6KTEU5Fa3yLzybuTsgBd+/Xfj3ZXr4uWGmC7/+cnn8Z?=
 =?Windows-1252?Q?j4iAFJwHtVcB4Kyfye92ya0ZyBo4H54kXLoB2wqU9QlDNfFT3f1+XaDa?=
 =?Windows-1252?Q?N2tuijGshc+A+LWfQ8es/DdiF/jiEwFVcdMKrp2rayBqa7JwB5zkuD/1?=
 =?Windows-1252?Q?f89ilPpxyk8T2EolRio6KUhOEDAaNtE9mxouGATWMqHUC2XzRy7DvFEW?=
 =?Windows-1252?Q?P64wRD2EH7KlB66eUM3/ARAKYz+xkxrFVwrmKZ8jL6Dx0EDRyPLYp//g?=
 =?Windows-1252?Q?hu/YKSqK5ZQT+dgeSOuCVk7n/xCskVsS?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388946a2-faa0-4056-1da8-08de20c9613b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 02:24:02.4782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FL1pHugqAtRllA97+U8aXs9qJdp3YIfqrTPslpIFbQhof28PyD3DfhIlDjFrf3i64ox94HIsF8mKEq+ZBaP8TbbFC+MxWdLElznOuWilykk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6765
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> >=A0This patch adds pinmux support for=A0the AST2700, which includes two =
SoC=0A=
> >=A0configurations:=0A=
> > -=A0SoC0 closely resembles previous generations of ASPEED BMC SoCs, all=
owing=0A=
> >=A0the reuse of existing macros and callback functions.=0A=
> > -=A0SoC1, however, introduces a new logic for=A0configuring pin functio=
ns.=0A=
> >=A0Therefore, new g7_set_mux and gpio_request_enable functions are=0A=
> >=A0implemented to properly configure the pinctrl registers using the=0A=
> >=A0pin_cfg table and to resolve GPIO request errors.=0A=
=A0=0A=
>=A0Do you mind splitting support for=A0soc0 and soc1 into separate patches=
?=0A=
>=A0Having taken a brief look I think we're also due for some further=0A=
> separation of the code. Particularly, isolating the patch for soc0=0A=
> would be nice, as the register design for soc1 is just _so_ much nicer,=
=0A=
> and I'd like to avoid dragging the baggage of previous generations=0A=
>=A0along with it.=0A=
=A0=0A=
Okay, I will split the support for=A0SoC0 and SoC1 into separate patches.=
=0A=
SoC0 will follow the existing design closely, while=A0SoC1 will introduce=
=0A=
a new logic for=A0configuring pin functions.=0A=
=A0=0A=
> >=0A=
> >=A0The driver supports:=0A=
> > -=A0All 12=A0GPIO-capable pins in SoC0=0A=
> > -=A0All 212=A0GPIO-capable pins in SoC1=0A=
> >=0A=
> >=A0Additionally, this patch introduces several pseudo-ball definitions f=
or=0A=
> >=A0specific configuration purposes:=0A=
> > -=A0USB function selection=0A=
> > -=A0JTAG target selection=0A=
> > -=A0PCIe RC PERST configuration=0A=
> > -=A0SGMII PHY selection=0A=
> >=0A=
> >=A0Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >=A0drivers/pinctrl/aspeed/Kconfig | 8 +=0A=
> >=A0drivers/pinctrl/aspeed/Makefile | 1 +=0A=
> >=A0.../pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c | 503 ++++=0A=
> >=A0.../pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 2523 +++++++++++++++++=
=0A=
> >=A0drivers/pinctrl/aspeed/pinctrl-aspeed.c | 47 +=0A=
> >=A0drivers/pinctrl/aspeed/pinctrl-aspeed.h | 11 +-=0A=
> >=A0drivers/pinctrl/aspeed/pinmux-aspeed.h | 35 +-=0A=
=A0=0A=
>=A0The impression I get from the changes to the latter three files here is=
=0A=
>=A0that the soc0 support might even be different enough to warrant=0A=
>=A0separation from the previous generations as well. You're defining=0A=
> similar-but-different structs and macros to what we already have. If=0A=
> the those are genuinely necessary (not yet resolved), I'd rather they=0A=
>=A0be their own driver.=0A=
=A0=0A=
Understood. I will modify the patch of the SoC0 to meet the concept with pr=
evious=0A=
generations. If the differences are significant, I will consider creating a=
=0A=
separate driver for=A0it. But, at this moment, I believe the existing drive=
r and=A0macro can=0A=
be adapted to support SoC0 with minimal changes.=0A=
=A0=0A=
> > 7=A0files changed, 3123 insertions(+), 5 deletions(-)=0A=
> >=A0create mode 100644=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c=
=0A=
> >=A0create mode 100644=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c=
=0A=
> >=0A=
> >=A0diff --git a/drivers/pinctrl/aspeed/Kconfig b/drivers/pinctrl/aspeed/=
Kconfig=0A=
> >=A0index 1a4e5b9ed471..16743091a139 100644=0A=
> > ---=A0a/drivers/pinctrl/aspeed/Kconfig=0A=
> > +++=A0b/drivers/pinctrl/aspeed/Kconfig=0A=
> >=A0@@ -31,3 +31,11=A0@@ config PINCTRL_ASPEED_G6=0A=
> >=A0help=0A=
> >=A0Say Y here to enable pin controller support for=A0Aspeed's 6th=0A=
> > generation SoCs. GPIO is provided by a separate GPIO driver.=0A=
> > +=0A=
> > +config PINCTRL_ASPEED_G7=0A=
> > + bool "Aspeed G7 SoC pin control"=0A=
> > + depends on (ARCH_ASPEED || COMPILE_TEST) && OF=0A=
> > + select PINCTRL_ASPEED=0A=
> > + help=0A=
> > + Say Y here to enable pin controller support for Aspeed's 7th=0A=
> > +=A0generation SoCs. GPIO is provided by a separate GPIO driver.=0A=
> >=A0diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed=
/Makefile=0A=
> >=A0index db2a7600ae2b..1713f678a984 100644=0A=
> > ---=A0a/drivers/pinctrl/aspeed/Makefile=0A=
> > +++=A0b/drivers/pinctrl/aspeed/Makefile=0A=
> >=A0@@ -6,3 +6,4=A0@@ obj-$(CONFIG_PINCTRL_ASPEED) +=3D=A0pinctrl-aspeed.=
o pinmux-aspeed.o=0A=
> >=A0obj-$(CONFIG_PINCTRL_ASPEED_G4) +=3D=A0pinctrl-aspeed-g4.o=0A=
> >=A0obj-$(CONFIG_PINCTRL_ASPEED_G5) +=3D=A0pinctrl-aspeed-g5.o=0A=
> >=A0obj-$(CONFIG_PINCTRL_ASPEED_G6) +=3D=A0pinctrl-aspeed-g6.o=0A=
> > +obj-$(CONFIG_PINCTRL_ASPEED_G7) +=3D=A0pinctrl-aspeed-g7-soc0.o pinctr=
l-aspeed-g7-soc1.o=0A=
> >=A0\ No newline at end of file=0A=
> >=A0diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c b/driver=
s/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c=0A=
> >=A0new file mode 100644=0A=
> >=A0index 000000000000..86da889cc010=0A=
> > --- /dev/null=0A=
> > +++=A0b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc0.c=0A=
> >=A0@@ -0,0 +1,503=A0@@=0A=
> > +// SPDX-License-Identifier: GPL-2.0=0A=
> > +=0A=
> > +#include <linux/bits.h>=0A=
> > +#include <linux/device.h>=0A=
> > +#include <linux/gpio/driver.h>=0A=
> > +#include <linux/interrupt.h>=0A=
> > +#include <linux/irq.h>=0A=
> > +#include <linux/mfd/syscon.h>=0A=
> > +#include <linux/module.h>=0A=
> > +#include <linux/mod_devicetable.h>=0A=
> > +#include <linux/pinctrl/machine.h>=0A=
> > +#include <linux/pinctrl/pinconf.h>=0A=
> > +#include <linux/pinctrl/pinconf-generic.h>=0A=
> > +#include <linux/pinctrl/pinctrl.h>=0A=
> > +#include <linux/pinctrl/pinmux.h>=0A=
> > +#include <linux/platform_device.h>=0A=
> > +#include <linux/property.h>=0A=
> > +#include <linux/regmap.h>=0A=
> > +#include "pinctrl-aspeed.h"=0A=
> > +#include "../pinctrl-utils.h"=0A=
> > +=0A=
> > +#define SCU200 0x200=A0/* System Reset Control #1 */=0A=
> > +=0A=
> > +#define SCU400 0x400=A0/* Multi-function Pin Control #1 */=0A=
> > +#define SCU404 0x404=A0/* Multi-function Pin Control #2 */=0A=
> > +#define SCU408 0x408=A0/* Multi-function Pin Control #3 */=0A=
> > +#define SCU40C 0x40C=A0/* Multi-function Pin Control #3 */=0A=
> > +#define SCU410 0x410=A0/* USB Multi-function Control Register */=0A=
> > +#define SCU414 0x414=A0/* VGA Function Control Register */=0A=
> > +=0A=
> > +#define SCU480 0x480=A0/* GPIO18A0 IO Control Register */=0A=
> > +#define SCU484 0x484=A0/* GPIO18A1 IO Control Register */=0A=
> > +#define SCU488 0x488=A0/* GPIO18A2 IO Control Register */=0A=
> > +#define SCU48C 0x48c=A0/* GPIO18A3 IO Control Register */=0A=
> > +#define SCU490 0x490=A0/* GPIO18A4 IO Control Register */=0A=
> > +#define SCU494 0x494=A0/* GPIO18A5 IO Control Register */=0A=
> > +#define SCU498 0x498=A0/* GPIO18A6 IO Control Register */=0A=
> > +#define SCU49C 0x49c=A0/* GPIO18A7 IO Control Register */=0A=
> > +#define SCU4A0 0x4A0=A0/* GPIO18B0 IO Control Register */=0A=
> > +#define SCU4A4 0x4A4=A0/* GPIO18B1 IO Control Register */=0A=
> > +#define SCU4A8 0x4A8=A0/* GPIO18B2 IO Control Register */=0A=
> > +#define SCU4AC 0x4AC=A0/* GPIO18B3 IO Control Register */=0A=
> > +=0A=
> > +enum=A0{=0A=
> > +=A0AC14,=0A=
> > +=A0AE15,=0A=
=A0=0A=
>=A0Are the ball enums necessary?=A0Historically we haven't needed it as th=
e=0A=
> undefined macro symbols were just used for token-pasting or=0A=
> stringification purposes.=0A=
=A0=0A=
The enums are used to replace the #define M24 0, #define M25 1, =85 definit=
ions in=0A=
the G6 pinctrl driver. Additionally, the number assigned to each ball name =
must=0A=
follow the sequence of GPIO numbering. In other words, the number assigned =
to each=0A=
ball name is meaningful, and the order should not be changed. Therefore, I =
believe=0A=
that using enums is a better approach than using #define macros.=0A=
=A0=0A=
> > + AD14,=0A=
> > + AE14,=0A=
> > + AF14,=0A=
> > + AB13,=0A=
> > + AB14,=0A=
> > + AF15,=0A=
> > + AF13,=0A=
> > + AC13,=0A=
> > + AD13,=0A=
> > + AE13,=0A=
> > + PORTA_U3, // SCU410[1:0]=0A=
> > + PORTA_U2, // SCU410[3:2]=0A=
> > + PORTB_U3, // SCU410[5:4]=0A=
> > + PORTB_U2, // SCU410[7:6]=0A=
> > + PORTA_U3_XHCI, // SCU410[9]=0A=
> > + PORTA_U2_XHCI, // SCU410[9]=0A=
> > + PORTB_U3_XHCI, // SCU410[10]=0A=
> > + PORTB_U2_XHCI, // SCU410[10]=0A=
> > + PORTA_MODE, // SCU410[25:24]=0A=
> > + PORTB_MODE, // SCU410[29:28]=0A=
> > + PORTA_U2_PHY,=0A=
> > + PORTA_U3_PHY,=0A=
> > + PORTB_U2_PHY,=0A=
> > + PORTB_U3_PHY,=0A=
> > + JTAG_PORT,=0A=
> > + PCIERC0_PERST,=0A=
> > + PCIERC1_PERST,=0A=
> > +};=0A=
> > +=0A=
> > +GROUP_DECL(EMMCG1, AC14, AE15, AD14);=0A=
> > +GROUP_DECL(EMMCG4, AC14, AE15, AD14, AE14, AF14, AB13);=0A=
> > +GROUP_DECL(EMMCG8, AC14, AE15, AD14, AE14, AF14, AB13, AF13, AC13, AD1=
3, AE13);=0A=
> > +GROUP_DECL(EMMCWPN, AF15);=0A=
> > +GROUP_DECL(EMMCCDN, AB14);=0A=
> > +GROUP_DECL(VGADDC, AD13, AE13);=0A=
> > +GROUP_DECL(VB1, AC14, AE15, AD14, AE14);=0A=
> > +GROUP_DECL(VB0, AF15, AB14, AF13, AC13);=0A=
=A0=0A=
> For the previous generation drivers my philosophy was "keep things that=
=0A=
> go together together," so signal descriptors, groups and functions were=
=0A=
> all located around the definition for one or a set of balls.=0A=
=A0=0A=
> Given I'm potentially escaping maintenance of ASPEED pinctrl drivers=0A=
> for=A0the 2700=A0onwards I won't complain too much, but was this a specif=
ic=0A=
> choice to break from that approach? You're defining all the groups,=0A=
>=A0then all the functions, then all the configurations.=0A=
=A0=0A=
The groups and the functions can be put together, but the ball define=0A=
as the above reasons. So, I will keep the ball defines at the top with the =
enums.=0A=
=A0=0A=
> >=A0diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/driver=
s/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c=0A=
> >=A0new file mode 100644=0A=
> >=A0index 000000000000..7c5a5e208f63=0A=
> > --- /dev/null=0A=
> > +++=A0b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c=0A=
> >=0A=
=A0=0A=
> *snip*=0A=
=A0=0A=
> > +=0A=
> > +FUNCFG_DESCL(C16, PIN_CFG(ESPI1, SCU400, GENMASK(2, 0), 1),=0A=
> > + PIN_CFG(LPC1, SCU400, GENMASK(2, 0), 2),=0A=
> > + PIN_CFG(SD, SCU400, GENMASK(2, 0), 3),=0A=
> > + PIN_CFG(DI2C0, SCU400, GENMASK(2, 0), 4),=0A=
> > + PIN_CFG(VPI, SCU400, GENMASK(2, 0), 5));=0A=
> > +FUNCFG_DESCL(C14, PIN_CFG(ESPI1, SCU400, GENMASK(6, 4), (1 << 4)),=0A=
> > + PIN_CFG(LPC1, SCU400, GENMASK(6, 4), (2 << 4)),=0A=
> > + PIN_CFG(SD, SCU400, GENMASK(6, 4), (3 << 4)),=0A=
> > + PIN_CFG(DI2C1, SCU400, GENMASK(6, 4), (4 << 4)),=0A=
> > + PIN_CFG(VPI, SCU400, GENMASK(6, 4), (5 << 4)));=0A=
> > +FUNCFG_DESCL(C11, PIN_CFG(ESPI1, SCU400, GENMASK(10, 8), (1 << 8)),=0A=
> > + PIN_CFG(LPC1, SCU400, GENMASK(10, 8), (2 << 8)),=0A=
> > + PIN_CFG(SD, SCU400, GENMASK(10, 8), (3 << 8)),=0A=
> > + PIN_CFG(DI2C3, SCU400, GENMASK(10, 8), (4 << 8)),=0A=
> > + PIN_CFG(VPI, SCU400, GENMASK(10, 8), (5 << 8)));=0A=
=A0=0A=
>=A0If we're going to continue the macro soup we need to take the=0A=
> opportunity to clean this up. You shouldn't need to open-code the=0A=
>=A0shifts like this, the data model needs more thought.=0A=
=A0=0A=
Got it. I will improve the macros to avoid open-coding shifts.=0A=
=A0=0A=
> > +=0A=
> > +static const struct=A0aspeed_g7_pincfg pin_cfg[] =3D=A0{=0A=
> > + PINCFG_PIN(C16), PINCFG_PIN(C14), PINCFG_PIN(C11),=0A=
> > + PINCFG_PIN(D9), PINCFG_PIN(F14), PINCFG_PIN(D10),=0A=
=A0=0A=
>=A0My preference is that this array definition be one entry per line,=0A=
>=A0sorted, that way we don't get weird alignment or reflow affecting the=
=0A=
> remainder of the struct if we change things in the middle.=0A=
=A0=0A=
Okay, I will format the array definition to have one entry per line and sor=
ted.=0A=
=A0=0A=
Thanks=0A=
=A0=0A=
Best regards,=0A=
Billy Tsai=

