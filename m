Return-Path: <openbmc+bounces-577-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32297B416FF
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 09:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGvg934TTz2yrV;
	Wed,  3 Sep 2025 17:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756885269;
	cv=pass; b=oJlRtFk1m0o6FI52xGpKHtyRX0c0kJem+6NCcZbNdUJypBq5B6B/HY+xBRQ0y2b+1WmkNDF7KRcKmqv2hbRdY3eyUgGuOJwsIUORCMnoXJi6TdIWvP1NT8qRmfM7vIcpfFCKhN5HULrJJ+vxBxTDuiJ4Y8T/v80pmN/CcZWt6xpJNR/qBE1W5+mEtqdnPJjX+Kdritw5L3fEoj9eUcqvEfWiolL8J2/tj3uCVqLEcgJeLG2tdCLPL2/o/AlagNmk7kUydCt28vPGiuIIhoVFdQPHQ8eM4vjukAxo41fTdhDM74ARXwRPfUXfbn7QFQURj6iVmjiFgvFrMAjQZohNSA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756885269; c=relaxed/relaxed;
	bh=J5Ggm/qqfpuLOFsBstqNWZwvHwPoY9ED9wLduD0/cu8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VgkW+49NjLxshEH5+8bgc3N7K9ew3WKv6L5dlC1CeRdZUzRLeBWIxElz3CPZF+QSUcQTEwhk7e23Gi/YOitAyba2opnUey5LA1589jq9i2DsOcSJSyDUIFNEckgSTGZwEhbucaLWbFDUzZmid5rnekS5umgFO0T6naZLqhBXats8NwWfz5dZOFdDoMfgdh7oo8NFgRiLpRRc68oRCeSRSsWpLNEvQePLpMzVSlJcbFrNXa6SNMa3zg95r5kxsvtXDSyrVv+Y1oWVPhGUiYpq4veseY749iYW4xyXbDiJxK6LtRinPlozgre/vk7oqCQH7GZMU5lHv3pMxuzCp3kQDQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Z5s2iG6p; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Z5s2iG6p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGvg64CRZz2yGM;
	Wed,  3 Sep 2025 17:41:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhCaVGtpFX6kieA1MFgcbcOtH7LsgGm4mxJJfcEoilUwncMbECPYi5f+fqvDnFgcaosKi+SuniOT7VGd9rV3uwtm1nZ9k/hMStZbty0I6nWtb034ts9zuLtrrEd/WL46OjQGGP+yTQmMSvhHJeNfljSCei00BBtIkmUB4uD4Tt76R2O1tW+xIes6vGzMbf1F4CpXQ4QN9FN8FrSIeujP0wqLsB6FO47OKeScl00XCu9gy19FSVGGdH8jHFaTduZ+QcgzVoqhAwDpk6Wr9O0J3YAfVakTZQ9WYBtpWJtVCGt0wLn7jq3i1KCZq4a2zuEAhG7pBnZ0wbdBcd8n9aHSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5Ggm/qqfpuLOFsBstqNWZwvHwPoY9ED9wLduD0/cu8=;
 b=YxfmMZwhTJNA5BoF93YBb29lWnk1tiDiz4l5013uRk2dsVBd9vUpkBpzHJdJGsT4TGOrQBAA8mEHTAXiv1d4WyM4YC1oPRS6NEEvu5OnjpNDun4ig908oSUv69x2aUrs7/ybTtD3jz183dZkAmdZTY1QrDiDCo3zgSWyVWtiIpcdio30iCwmiIziJ3Z7B8+FKX9M0QEQvu1d5+Jo7zBV6SiLSfQvG2+ayQ6NeO8aT8GG/DjBzOG7ZzLvcIkmgwNg9qCUSVbQz23kSa3s+K641NJDfnMdcbCDlXv/6GCi+Yg9sTz6t8Kjp1gO1TuWC70NQRVhVcI9cjfSsdRa2v41bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5Ggm/qqfpuLOFsBstqNWZwvHwPoY9ED9wLduD0/cu8=;
 b=Z5s2iG6pxmtYHts9tcus2lQDWi9I4tGJY8Xm6RjnGvNGtKLXQPXfixUEiAEJtYHFUaT9EjpqkWOMFx6Ng0S5M84grJbkkEhvmzRsMtO5adwA8E1ky/e0/DLrJxkK4/kUP5d0HkrcYZXyWuKiTqYXpFpJXI1BLcZ9bwbEx2J5hN8rhg0QICUJjKnVIljMgSe7jACjq8uYFq9ZOaZ8xVkRP34II+F7vHQjKDrpDhztlvfyjOzZwEjZ7CUdbVrHAfOd4yhVPzVOp68aEb33kLiRordcTq/bpzxSy0iOK1M7ntxQKTdlHpjOSG2JSQrIb7/vrztq4F1oMPzivOUmODhHgA==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB6084.apcprd06.prod.outlook.com (2603:1096:101:d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 07:40:39 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 07:40:39 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Thread-Topic: [PATCH v1 2/4] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Thread-Index: AQHcGLbRVMuSKOY1hUmazeC/FotlaLR5r7WAgAcYwzw=
Date: Wed, 3 Sep 2025 07:40:39 +0000
Message-ID:
 <OSQPR06MB7252B421354FC7C6981D9AC98B01A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250829073030.2749482-1-billy_tsai@aspeedtech.com>
 <20250829073030.2749482-3-billy_tsai@aspeedtech.com>
 <20250829142403.GA619692-robh@kernel.org>
In-Reply-To: <20250829142403.GA619692-robh@kernel.org>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB6084:EE_
x-ms-office365-filtering-correlation-id: 2c68973d-f95b-4038-cb8d-08ddeabd2dca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Nr1DVS/oIW6p3Laaum0fzyOx6XBSgjANX76MPN6eW2uQqLYiHmqygxnt1dvY?=
 =?us-ascii?Q?9toy7jLFsSj9hpc53eICGckqEVgy939cybztVKdEvqC6ypmXT2Lqc1dXSnMR?=
 =?us-ascii?Q?NdvGm0pDdMGT4aYbL7f7C+mIn1MfKZ+BpF1VBiKaDBhpcFylltzdmFwkZZh5?=
 =?us-ascii?Q?d2RgYvAba8GY1Odh7rlgTB3lHPjEYUkc7FwDKSFIa+eWZSpU8vuNhdPivTu9?=
 =?us-ascii?Q?04vcm859eGFO1u3rfScKwa04Br1Is9g6qvU4f8CpwzBFs/kflme/wcnUljNd?=
 =?us-ascii?Q?K/SvOUAi6ektFCqrXq7/Zt++LBXjIBt/C0e1db5+WPIKOg6IvrQpvD00v59B?=
 =?us-ascii?Q?TwzE5Yet/AGHwLqDDYYBtSQba9qPC2zN21ZxBtuWkiBxUF8J7oCuZvKfB3yh?=
 =?us-ascii?Q?g9/WOD+YEpQGx0LthdBAgUeKK+bpXHGEjYpm56ExIaucQfdhBZRF56mKHH8U?=
 =?us-ascii?Q?fDIqe3TX3QDHgzT9hvpW4rE3RtdWt24Me+lKF4Cdpu0PXHfqTS7A43s63csW?=
 =?us-ascii?Q?decxebOtoSNLVDZ8k7NJwuly+qg2+yEFRLYrE0ltmJj3PttJVaa6035KOOy3?=
 =?us-ascii?Q?4cZTQV7dgnvgyq9aXjEjmVA+ZDKOkHzSbr0fsK5CIaYx2QlH0ALxFttsMP3s?=
 =?us-ascii?Q?mDLHq3b/cqpoc6iT8Hnrobb2SUfZmee/e49P0XYyz+zvlkMq4ZkiLbeQzKYC?=
 =?us-ascii?Q?sEI8JI3iWlDDolosJa4DPrj3mcPsSdp/IcxjbW7N0CYUOLzSbD9ZxA0YVO31?=
 =?us-ascii?Q?+2sHNSt0NkMRKb0lGIAlbm7T9VQwNvUF0sT5EX0RoVzi5gfNukySdmrHNGTq?=
 =?us-ascii?Q?tryWWUlHYKg7o2fUbVsqaqp4PBiqmKuWVTGYUM0I4VasUC3r6/csCWusu3Jq?=
 =?us-ascii?Q?xIaO+p87QlLGK7xTByGw28KKhGf4ehkQ6xfC7Ob6zzCS3nWCdjTT6wn+qN89?=
 =?us-ascii?Q?fpE/hUYVoe/5JQvvZ1fX/j8MWbEGaaaYE7KYiazCNeUjFywEdju2rIcvNCCS?=
 =?us-ascii?Q?dqVZiF1yQb2vi3QDkcOWXOf5FBFw1U1J+9eE8pF8SWD/iaJaM3B7siOxp4+g?=
 =?us-ascii?Q?C9SK69yyMg3w4PPWSSBgiQKg6Zr7FaAQ+uanq56799D6r+TQUI9ytcjrrqnV?=
 =?us-ascii?Q?bGduw+8ncqqS3VgHWq4m7zP2LcGcCUJaSWly6prVwEt0u1W+FQoiz6+WnPMP?=
 =?us-ascii?Q?gmy0HCICIcq2Xayp6UPztkRhpG/u+jOaMOM7eJGBMkR9DTE7On3O1pQQpyJR?=
 =?us-ascii?Q?ssd1/Df0TjG03iYRUP7m9CL0+sgMcRXLCT2JXqN++tXG5kqGljx+/dDmzCQ9?=
 =?us-ascii?Q?yzAoyGxP1qhoBL49fbm74IdfhLevyZIzlYPB/C/QvizrbFOEAPhadBFQDEql?=
 =?us-ascii?Q?8Wv6kLQoxDVFm+Gzri+Jhr85Qr2102biJNzxxp5WPdj4fXisnIZaLdv/4pqf?=
 =?us-ascii?Q?qi4x3QTPU0o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?70VDpAPvcovxhSiqjME95RtvQWpsXS+B98Y6/04egs06YIXYwUkv0KJEiI+9?=
 =?us-ascii?Q?vkNH4qJ/eyH7/FvEZKhkj4+EhR09HdBTB7owe1NnaHwuTTE3sfCxghey4+M9?=
 =?us-ascii?Q?pZ4Pfjpgc/WPSBvVVXDgZgPkAesKiAgxcBKISDoapmV0nuBh+172gByhFD4H?=
 =?us-ascii?Q?4Dj+4e8Qc9khcTqbG4CJC+7oy4I8vZm+Xco4QaUr45lSnGuQxVeyr2hQYxcA?=
 =?us-ascii?Q?+BNKo+0OQQbhbpHmeOX1l4AoOw29iaJCaz+F+BDt7U5scxV8CCeA7vOyPPL/?=
 =?us-ascii?Q?rLzHHLRVIn/DeIV6Peryx6WfhIwejb2cFRymYR9/3NdfwXGn4KPLHAZ3P1mC?=
 =?us-ascii?Q?RoMCjm7G3mLfLwI6LQcEoHgFw2xfLzWcNV7qOBWIUKYDWVnCphUsypQuOyrS?=
 =?us-ascii?Q?Yo/Vy4ifOMwJDAOQlGxpds0+FZbFqMqmJ95HUekzAJhau7RAml+t7Hrk0T0I?=
 =?us-ascii?Q?wHNwN90cVFHfa7GsKZrY/UQgaCmXowqlIwT3Zh6L4IXDjOQxnZ4QtQTfp+sS?=
 =?us-ascii?Q?iPMa40WjSmyEgbNfle6u2sIRyL0smX/TG5hyGUjXRsnX6cpxFzCLAIWUr+w0?=
 =?us-ascii?Q?R5B2kDFOvlffZzYxWhx5qZqSUoAqyigj/FIO0C2Dzb3ajIr4yByNgKbfTJz4?=
 =?us-ascii?Q?vxMKJFsyU0NO6mWIOTD6qadVWKkA4DtMvR61fG3M2SBSl1EOWeCaCI2yzOrx?=
 =?us-ascii?Q?2uJqh8J1Ml0ZG+yIA+o5QLZmXxpjMcRhZdxNQa4aIyXNgl5J+84dahdM6aNt?=
 =?us-ascii?Q?hR5oWUro9VKmtCSIMRyyexYyuLc36ob5hp3Jqko0Yc5VceDKOHmP75Xd6/1X?=
 =?us-ascii?Q?gpfbTDqCYnbXtQ1BNj1MrJviKi784itkQA7bR3K0gmSafRJ37mKZebnhORkT?=
 =?us-ascii?Q?xP/otW4mq1kt59UsRBK05WMj0XSgPCCHNt67gxXl6c4UI3nU6rnSz321YUHH?=
 =?us-ascii?Q?8zw4BoQmVV/8TsNAFfadPg8+bc4/x9aWkJdCvt7fqp5aWE1Dguiy0A+TB8tt?=
 =?us-ascii?Q?PKIrHWeiDGwvg7XI9yl/WRslozftdbLIkwkhzVfETmZHtm0FIu9s+p1axnHv?=
 =?us-ascii?Q?zfQefib5DSiMAsY0vJ3+gMys7u2MIF8mHRVIO1C1dpqWWJ1/qw8e96+1/G0M?=
 =?us-ascii?Q?q5LjpZNukBl6UxMNX7YbH89hJbd9C0+huUITiABzOllz6tHaL8VwbNPjGS4Q?=
 =?us-ascii?Q?wxATks8KunSXCo0YEidSEQ+VzTG/7OALm6bOn3BTzD5Zm+066bSW2HQrF3Gi?=
 =?us-ascii?Q?xsRUbY9WDSrv+cwcafMuU2uUGTdWyc8bRimf4OOJQNdu2JvEA6xzGiBt7AE4?=
 =?us-ascii?Q?/JUWV0fY3RsTjJgYNyRjdwLkOvIGwYOs/bRioRHWyqqnUqM2zaw0OqxV508t?=
 =?us-ascii?Q?eBNFimSZhvPksRtrR+QQHtO3GsY5veVyu/AyQEgSoiPJAOck/MyYa/wkCdFL?=
 =?us-ascii?Q?t0I+osk+rHGKfWhGott6FiUjp+2b0oCNW0We7pPU9mZDGdginVvd7uhmMGit?=
 =?us-ascii?Q?rSETELEH09BHchdKtfkNhGBtYH5VYBfDARfj6kPjjipY1uuXbAwfrGcHBjWX?=
 =?us-ascii?Q?A2QMW2NFlWa1hHf0nxbnsZwb+X1PS02wEKdvvKvfte4pLd8CIYAiYwkF89Qq?=
 =?us-ascii?Q?KG503CCEwtjYHbfuXMETInc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_OSQPR06MB7252B421354FC7C6981D9AC98B01AOSQPR06MB7252apcp_"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c68973d-f95b-4038-cb8d-08ddeabd2dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 07:40:39.4061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aTxiRZeZoEMfhgN17I6RfJQ8sUfTmzjC90Yn5DZOcX36/n5cNkd9ujqXPiV/BPhsbiM9ykPtlaLEZrpyER2Ta1mBCOjIA7FE+e2ts3MS6g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6084
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_OSQPR06MB7252B421354FC7C6981D9AC98B01AOSQPR06MB7252apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 03:30:28PM +0800, Billy Tsai wrote:
> > Add bindings for the pin controller found in the ASPEED AST27xx SoC.

> Please explain why you have defined 2 pin controllers and why they
> aren't compatible with each other.

I will add following description in next version of the patch:

"The ASPEED AST2700 SoC contains two separate pin controllers, each
managed by a distinct System Control Unit (SCU).
Because these two controllers have different register maps, control
different sets of pins, support different pin configuration options, and
implement different multi-function switch logic, they are not compatible.
Therefore, two separate device tree bindings,'aspeed,ast2700-soc0-pinctrl'
and 'aspeed,ast2700-soc1-pinctrl', are introduced."

>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >  .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml  | 135 ++++++
> >  .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml  | 452 ++++++++++++++++++
> >  2 files changed, 587 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,as=
t2700-soc0-pinctrl.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,as=
t2700-soc1-pinctrl.yaml
>
> > diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-s=
oc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700=
-soc0-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..8abdc2fe1d8b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pin=
ctrl.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED AST2700 SoC0 Pin Controller
> > +
> > +maintainers:
> > +  - Billy Tsai <billy_tsai@aspeedtech.com>
> > +
> > +description: |+

> What's the '+' for?

I will remove it.

> > +  The pin controller node should be the child of a syscon node with th=
e
> > +  required property:
> > +
> > +  - compatible: Should be one of the following:
> > +                "aspeed,ast2700-scu0", "syscon", "simple-mfd"

> This should be a schema in the aspeed,ast2700-scu0 binding, not a
> free-form text description.

> > +
> > +  Refer to the bindings described in
> > +  Documentation/devicetree/bindings/mfd/syscon.yaml

> That does not cover 'simple-mfd' cases.

I will remove the description about the parent node and simplify the descri=
ption
as following:

"Bindings for the ASPEED AST2700 SoC0 Pin Controller."


> > +
> > +properties:
> > +  compatible:
> > +    const: aspeed,ast2700-soc0-pinctrl
> > +
> > +additionalProperties:
> > +  $ref: pinmux-node.yaml#
> > +  additionalProperties: false
> > +
> > +  properties:
> > +    function:
> > +      enum:
> > +        - EMMC
> > +        - VGADDC
> > +        - USB3A
> > +        - USB2A
> > +        - USB3B
> > +        - USB2B
> > +        - JTAG0
> > +        - PCIERC
> > +
> > +    groups:
> > +      enum:
> > +        - EMMCG1
> > +        - EMMCG4
> > +        - EMMCG8
> > +        - EMMCWPN
> > +        - EMMCCDN
> > +        - VGADDC
> > +        - USB3AXHD
> > +        - USB3AXHPD
> > +        - USB3AXH
> > +        - USB3AXHP
> > +        - USB3AXH2B
> > +        - USB3AXHP2B
> > +        - USB2AXHD1
> > +        - USB2AXHPD1
> > +        - USB2AD1
> > +        - USB2AXH
> > +        - USB2AXHP
> > +        - USB2AXH2B
> > +        - USB2AXHP2B
> > +        - USB2AHPD0
> > +        - USB2AD0
> > +        - USB2AH
> > +        - USB2AHP
> > +        - USB3BXHD
> > +        - USB3BXHPD
> > +        - USB3BXH
> > +        - USB3BXHP
> > +        - USB3BXH2A
> > +        - USB3BXHP2A
> > +        - USB2BXHD1
> > +        - USB2BXHPD1
> > +        - USB2BD1
> > +        - USB2BXH
> > +        - USB2BXHP
> > +        - USB2BXH2A
> > +        - USB2BXHP2A
> > +        - USB2BHPD0
> > +        - USB2BD0
> > +        - USB2BH
> > +        - USB2BHP
> > +        - JTAGM0
> > +        - PSP
> > +        - SSP
> > +        - TSP
> > +        - DDR
> > +        - USB3A
> > +        - USB3B
> > +        - PCIEA
> > +        - PCIEB
> > +        - PCIERC0PERST
> > +        - PCIERC1PERST
> > +
> > +    pins: true

> You need to define the type as string or uint32 is possible.

Ok, I will use the following to replace:
pins:
      $ref: /schemas/types.yaml#/definitions/string-array

> > +    drive-strength:
> > +      minimum: 0
> > +      maximum: 15
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +     / {
> > +          #address-cells =3D <2>;
> > +          #size-cells =3D <2>;
> > +          syscon0: syscon@12c02000 {
> > +              compatible =3D "aspeed,ast2700-scu0", "syscon", "simple-=
mfd";

> Drop the example here and put a complete example in the schema for the
> syscon.

Ok, I will use the following example to replace:

pinctrl0: pinctrl{
        compatible =3D "aspeed,ast2700-soc0-pinctrl";

        pinctrl_emmc_default: emmc-default {
                function =3D "EMMC";
                groups =3D "EMMCG1";
        };

        pinctrl_emmcclk_driving: emmcclk-driving {
                pins =3D "AC14";
                drive-strength =3D <2>;
        };
};

Thanks

Best Regards,
Billy Tsai


--_000_OSQPR06MB7252B421354FC7C6981D9AC98B01AOSQPR06MB7252apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"en-TW" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<div>
<p class=3D"MsoNormal">On Fri, Aug 29, 2025 at 03:30:28PM +0800, Billy Tsai=
 wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; Add bindings for the pin controller found =
in the ASPEED AST27xx SoC.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Please explain why you have defined 2 pin contr=
ollers and why they<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; aren't compatible with each other.<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will add following description in next version of =
the patch:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&quot;The ASPEED AST2700 SoC contains two separate p=
in controllers, each<o:p></o:p></p>
<p class=3D"MsoNormal">managed by a distinct System Control Unit (SCU).<o:p=
></o:p></p>
<p class=3D"MsoNormal">Because these two controllers have different registe=
r maps, control<o:p></o:p></p>
<p class=3D"MsoNormal">different sets of pins, support different pin config=
uration options, and<o:p></o:p></p>
<p class=3D"MsoNormal">implement different multi-function switch logic, the=
y are not compatible.<o:p></o:p></p>
<p class=3D"MsoNormal">Therefore, two separate device tree bindings,'aspeed=
,ast2700-soc0-pinctrl'<o:p></o:p></p>
<p class=3D"MsoNormal">and 'aspeed,ast2700-soc1-pinctrl', are introduced.&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; Signed-off-by: Billy Tsai &lt;billy_tsai@a=
speedtech.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; ---<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt;&nbsp; .../pinctrl/aspeed,ast2700-soc0-pinc=
trl.yaml&nbsp; | 135 ++++++<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt;&nbsp; .../pinctrl/aspeed,ast2700-soc1-pinc=
trl.yaml&nbsp; | 452 ++++++++++++++++++<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt;&nbsp; 2 files changed, 587 insertions(+)<o=
:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt;&nbsp; create mode 100644 Documentation/dev=
icetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt;&nbsp; create mode 100644 Documentation/dev=
icetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; diff --git a/Documentation/devicetree/bind=
ings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bi=
ndings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; index 000000000000..8abdc2fe1d8b<o:p></o:p=
></p>
<p class=3D"MsoNormal">&gt; &gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +++ b/Documentation/devicetree/bindings/pi=
nctrl/aspeed,ast2700-soc0-pinctrl.yaml<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; @@ -0,0 +1,135 @@<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +# SPDX-License-Identifier: (GPL-2.0-only =
OR BSD-2-Clause)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +%YAML 1.2<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +---<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +$id: http://devicetree.org/schemas/pinctr=
l/aspeed,ast2700-soc0-pinctrl.yaml#<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +$schema: http://devicetree.org/meta-schem=
as/core.yaml#<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +title: ASPEED AST2700 SoC0 Pin Controller=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +maintainers:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; - Billy Tsai &lt;billy_tsai@aspeed=
tech.com&gt;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +description: |+<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; What's the '+' for?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will remove it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; The pin controller node should be =
the child of a syscon node with the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; required property:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; - compatible: Should be one of the=
 following:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;aspeed,ast2700-scu0=
&quot;, &quot;syscon&quot;, &quot;simple-mfd&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; This should be a schema in the aspeed,ast2700-s=
cu0 binding, not a<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; free-form text description.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; Refer to the bindings described in=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; Documentation/devicetree/bindings/=
mfd/syscon.yaml<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; That does not cover 'simple-mfd' cases.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will remove the description about the parent node =
and simplify the description<o:p></o:p></p>
<p class=3D"MsoNormal">as following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&quot;Bindings for the ASPEED AST2700 SoC0 Pin Contr=
oller.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +properties:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; compatible:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp; const: aspeed,ast2700-=
soc0-pinctrl<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +additionalProperties:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; $ref: pinmux-node.yaml#<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; additionalProperties: false<o:p></=
o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; properties:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp; function:<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum:<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMC<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - VGADDC<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - JTAG0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PCIERC<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp; groups:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum:<o:p>=
</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMCG1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMCG4<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMCG8<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMCWPN<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - EMMCCDN<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - VGADDC<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXHD<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXHPD<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXH2B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3AXHP2B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXHD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXHPD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXH2B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AXHP2B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AHPD0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AD0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2AHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXHD<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXHPD<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXH2A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3BXHP2A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXHD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXHPD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BD1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXH2A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BXHP2A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BHPD0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BD0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BH<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB2BHP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - JTAGM0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PSP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - SSP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - TSP<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - DDR<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3A<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - USB3B<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PCIEA<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PCIEB<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PCIERC0PERST<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; - PCIERC1PERST<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp; pins: true<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; You need to define the type as string or uint32=
 is possible.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Ok, I will use the following to replace:<o:p></o:p><=
/p>
<p class=3D"MsoNormal">pins:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $ref: /schemas/types.=
yaml#/definitions/string-array<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp; drive-strength:<o:p></=
o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; minimum: 0=
<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; maximum: 1=
5<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +allOf:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; - $ref: pinctrl.yaml#<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +required:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; - compatible<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +examples:<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp; - |<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp; / {<o:p></o:p></=
p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; #address-cells =3D &lt;2&gt;;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; #size-cells =3D &lt;2&gt;;<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; syscon0: syscon@12c02000 {<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2700-s=
cu0&quot;, &quot;syscon&quot;, &quot;simple-mfd&quot;;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; Drop the example here and put a complete exampl=
e in the schema for the<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; syscon.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Ok, I will use the following example to replace:<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">pinctrl0: pinctrl{<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatibl=
e =3D &quot;aspeed,ast2700-soc0-pinctrl&quot;;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl_e=
mmc_default: emmc-default {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; function =3D &quot;EMMC&quot;;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; groups =3D &quot;EMMCG1&quot;;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl_e=
mmcclk_driving: emmcclk-driving {<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pins =3D &quot;AC14&quot;;<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drive-strength =3D &lt;2&gt;;<o:p></=
o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></=
o:p></p>
<p class=3D"MsoNormal">};<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Billy Tsai<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_OSQPR06MB7252B421354FC7C6981D9AC98B01AOSQPR06MB7252apcp_--

