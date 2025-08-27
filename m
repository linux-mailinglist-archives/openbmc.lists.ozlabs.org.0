Return-Path: <openbmc+bounces-516-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB07B3789D
	for <lists+openbmc@lfdr.de>; Wed, 27 Aug 2025 05:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBVYf5dQqz30Vf;
	Wed, 27 Aug 2025 13:36:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756265766;
	cv=pass; b=Cg2ghvCG+Ah8FRfMlQWpsLJ68agLLmByq235bV5J8Ym9yKzNjtPVU/Z4xdrclCjpfYE5ehrWUDmROxXt/WHj3x04lrYLfuHmr3os+eZfHwTmaAEdpc7nemXswfnVxtKAFiuBYS7jrOxoxCQ1FzMZQw0zt+sdifKNjn+kDijHPwm6J4ZcNqo/ZQ2LYSzrglVQtXCu5San90mLlT1hVm8buixcVDYTH1maVye/rzFboUiESVxdWKhi1IKbVF5Ex2sNHGJPxcgqoDWyIZcoFbyUs0BSmDAQCRvZR5Fl1MoowxrAyNdY/hUmy/fyF6Mf2M73ffkvBP6xF2Y1lwYSZRqo+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756265766; c=relaxed/relaxed;
	bh=5Yzuwf5NTP9k1F++9so8IUq4W3mmCEC2/Z14iZ8MxMM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jl1hH1PI59gDFF+fAeDaRxRkYY8cCD2Hx6eeGqC3TzIM721XCYWhDeqNfobiHoRD3LqFq0TGzrphVBYhPqw9rkFqphQoZj25C9pQGqa9X8PpTBh0WgtYBhdpk9sJByx1gcnOsCMho3cfmkaIrKjEieqFphrBF/wKxlwV7WsOp6vt7fTGJecTY40cXNsc6IQv3V99thTwtMx9zW6oDMXw6wwOjNm7ruNSGIXJJWSK/UHiWvAKBK6AibnM+QDgp8HrOeQ9J096WE/rJ/sJV/IjTCjf4aFF7EZMXO7xNjYtxfZImXU8utvslV3xP+Ao8GCNlRSMZv11g3//vl6UCuwqig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YoPrxRfK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YoPrxRfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBVYc3yXCz2xcC;
	Wed, 27 Aug 2025 13:36:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+sobYU5sX3p7D6bY1mohtAUidKJ1bxQJ3lwi0Coshol7Fo6h+2E/puqcyefb5Jke6qzs4kzDgx21M66tOW87jyjQbKJ8rQTpTbR1XmxIR6o+8dKQi7fNOPEiHhdmSQINfQuHfFU2FJ/9+XlaDxxC630+ihtwuRJQiB+GKUP0IlIX3QCYWnUtpfk9inAICLGLJ9ovRjfRu/h50uyIcR272pDybuIoKPOCoCOwR8urUPGZnAU/WiEHC9wIX6df0zeICblnTPUwUZCf2yyANPOQMYLNdYBLhMYa3d3rS3Hu79W1NBd3ZIr1x2kTXNFZsIjx78cKU7r9TLSOfT5Vprjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yzuwf5NTP9k1F++9so8IUq4W3mmCEC2/Z14iZ8MxMM=;
 b=doJACVzyMkwfg+mcXE7sBeSxLr+ylytdzVIn4oxxj+Dd5stPzagsiXU3apioDueo4xqNb/HT63lM3EcbO/VX4OUvbPQdxSt/ve6UzMLB/S0KcUljvCdWKjianVI/tMIbU4OVNkM3CF7tn1hnZ5frUl0lVCJD/Ye5wJ/UxedIM7lVwvwhTcgPApHrfBIAbfuDkAFz8IjDDSR04eZXKQZIPLhw5Xe0RDMpDXNSLzB+jG8FzVsXL8WULzEXeKgP+2ilpYHS9yaggqqFmzozXirFGBL22oR8X8OuHuN0yQ4gm7G2j7J4Zg/6TSfC179FlD0Naz5alM4p2e3vZK2aHRzYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yzuwf5NTP9k1F++9so8IUq4W3mmCEC2/Z14iZ8MxMM=;
 b=YoPrxRfKocKsMVSPSzEFc3OvGkH3ztwXkYTmMFhWviM+jri8YdbcDD5wiJniDZagPYbOOVUKfARAAVi/xGoiUdvw0SxatmRvIBbGL4EEXnRixACEjKeba9gLkiAezu2dUp3l4uQXb64ytGv9ij8O0W0aNmF7/PT/y5U0qbMw6WVomKUsx4mVlsY2Ny0cDwAbqdEs3TyFhlp8ax103q0tNJq4ZPzwszsD7evYK8LbU+O5MeQ2SiEkgBeTD9mwYphhDM3SJ21xCXbpePU195mtgBNHRboPO5IjLiEO5+iGGZ8oCL+xdG2VGxCnbgCi1wN6UhepHWbmEh9cm1Ekdf7New==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB6956.apcprd06.prod.outlook.com (2603:1096:405:3a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 03:35:41 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 03:35:40 +0000
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
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Topic: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Thread-Index: AQHcFwOpd9rD8vzuik6wTsL7lhweZQ==
Date: Wed, 27 Aug 2025 03:35:40 +0000
Message-ID:
 <SEYPR06MB513422076CE2B82FAB2EBBA19D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References:
 <SEYPR06MB5134692DCCFD55F5ABD812F39D3DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20250822153611.GA684739@bhelgaas>
In-Reply-To: <20250822153611.GA684739@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB6956:EE_
x-ms-office365-filtering-correlation-id: 97aaabc2-b0b1-48c4-d3fa-08dde51acbde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RmO28UxV5e2XGjMYJOqumtUQu4GuUruwp8a1/jKEog4k87ONbzqlnAfsQ+Iz?=
 =?us-ascii?Q?dgs589nu4Ra66XWnLvJQziLiCJ3oePxo+M7pnfBNimESOx1MLFGGCsaM04oE?=
 =?us-ascii?Q?wlyQMcqR+PTEnAx/eypebPuCmMNBPK4Csd64L52ev5u+2lOfnjk8dk55hqwv?=
 =?us-ascii?Q?PBAv9HavGMghuYdqjeMNI689ifpMIG5wpgPo/IKapeCsj9UZrpu4fBmnF7Fh?=
 =?us-ascii?Q?hd/P0Jej9NOm147ax4siVC/AifVMbtCag7/tf2JaiTfSOdVNTQZCSOSbz3ZC?=
 =?us-ascii?Q?q9PnOQZL3IadCDnDF28P3mETOU837az/2CUBuG1EfVn07QFjXnpWE1Or7NGE?=
 =?us-ascii?Q?gQzC45EBzyPNvg4Oo9igAwuuFJI9UzbDlqGAGOt4EHxpOsFmMuIsBySlLeeI?=
 =?us-ascii?Q?kbryozVOvemRmMUsGK/QTJDlJRa5U88SolKqfeM6xEtbeiNjNECA3J1RQRDz?=
 =?us-ascii?Q?6lXypZsvTF0By3Y8rXjhPq2bwpYi3XQxPFyf19SE05e5YiuZlKP81IIwjbD1?=
 =?us-ascii?Q?VEjNCPjx2+1EdowiYsqX3ljUEWzhxKEsEoCvCIBLoKGEOuRLGls6Yo3WOm6V?=
 =?us-ascii?Q?cN9mi6Wh+43ODMoO4XtxdYY2pO+chYHVjuMvUCLeSjhmZ1FI1U4V/GwkDdKV?=
 =?us-ascii?Q?7pfx1ZTGEb9CgGqJxj7z7ERQEmVcLWVsAl//FyFXHY73VpIwwJp0y+XDaX6r?=
 =?us-ascii?Q?IjUTOWwDpsLN0cSeWZsOYsU4C6w1xMfBah7xMSZ+/cBADzTJDKVGKc+auF/w?=
 =?us-ascii?Q?K/nyCTdPgGCWcRqHdbxkhlNoUIoefZEI7gKZFxPW0H9R2EpH7m6hRQBUdYnm?=
 =?us-ascii?Q?iD2o01OnndjXMQKjlRPO0eKLs5Maag8NaKPHn24XfBeZSXrXUdGNRIpbyOal?=
 =?us-ascii?Q?hKwYRI2Sw97If6X1hEpGwgXEVCRQgR+ocbpzByg9NqS2VqMWW+TMdor1cyQB?=
 =?us-ascii?Q?tJkKH04BwAu8o/HMYgBEa3ZUbf9pmJmYGbN+ZKG7TGBgTjjEltnatphtdfZN?=
 =?us-ascii?Q?NctXxzgtN12vizuHJeIcFgShlhT/yv2/TEy/7u3BUZH4tWmjf4YppdFVpJbt?=
 =?us-ascii?Q?AX9/4NN26H7+griI7o82xbx1lIZN9+4LruSgwZeU48mZ95dES6gG3u7I8mdl?=
 =?us-ascii?Q?0B8TvKe91oOrIvlfZFpCj55npyAUzEQTE7jY9aP+Ee8XABnqdzBCtzz1s1CO?=
 =?us-ascii?Q?/mpiTok9I2QJM9U/7YDujfWZ2xOly6onqxHmhPp46RBmcrdBw5snF5vYBQJd?=
 =?us-ascii?Q?L89PDhLKxS2NLnwvKvMInMnyET8ef0XvyLWPgoRHQ7xe5tvOGjkrgvmQx6ai?=
 =?us-ascii?Q?IB3ihuS05G34igdjEDrfyHarPKrLdXX3f5oPeIhYG31wiTVezJU+bklvTooX?=
 =?us-ascii?Q?b1E1p4CZecXkOkTe4T/jSEIzxbItUPWG5+eDEz38ivio4KKfDnujg1OIRbkH?=
 =?us-ascii?Q?HsyqEXbL9wx+90pHySlEoH1DcsXeV5XTWuSkMjv64mpGWIqKVDOvqQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3aXiThf12SOKyDc8eTpx1qVqcCdc+UKsafdgcDBvE/kitPCAzeZuqEsXjqnQ?=
 =?us-ascii?Q?NTCVzZeYbiGq1UvP7jItx2qj0ArMxXWYL6wgVYCKOgiPVyVTcV5ZsrhQKnS0?=
 =?us-ascii?Q?8yBJktx5RIjo7yjZJrNl0SzArZ6QITaFlLH8pPQjcjUoUrdmvV3/fHRHZDZ6?=
 =?us-ascii?Q?RddIDEQhnp9tAcmWIltspst3M036I4l6uTo4KHJUMkAO35XDwTqGkJZ/Trcx?=
 =?us-ascii?Q?jjVEqUwaRgyw9+qdoyWu8ClvUCEMXFGq5sB9rch+qdUF5IkoIqquboCC5A0y?=
 =?us-ascii?Q?qYTThEFNFij1Jl0z0073rTXpD0zjK/XrYZCHNfGLfRUdgSgz+faTDaRW1LJ1?=
 =?us-ascii?Q?bjxsMLg6I9o3rCFr0rfPHbNzEKryvusD45VbvydXUr1wejI/kzwfnNPirfeS?=
 =?us-ascii?Q?HS3phAyrpfm5rD58QZCm4TT/z+uJqrMIc0izINRGDC/c3aUbXlEWGNgvEP7D?=
 =?us-ascii?Q?CSLRO80WJ8alZmCDFpm7xZ/oM/DKRgmrVVguZ/GKM2vGPLHIDbF9T2PRai1Y?=
 =?us-ascii?Q?qHJK/c7B5EvZR8mDvNgTd/B9kgGd0Zl32xqK0BkoxGvXXc4qj4Hb8P+gTokv?=
 =?us-ascii?Q?tgB8W1zNz71aZ4UOaVZuAFn17ErgV0ftGHEMKt0ug9IYwn/xaw6E7LnJZs83?=
 =?us-ascii?Q?pq2WCghzQQ89KILr0iwYM3R4S33DPhQ41BmIUk6vd/HVxM1d+UgIFCPRrUmP?=
 =?us-ascii?Q?5jBo7IxjEoeJ4es+k9+PdLL6GPgiTqKntuG6HxnbWVQDk1ydzI0LN9ZQ8WCo?=
 =?us-ascii?Q?DDX2yLz4NJzeyY4QRH0hxaj0Mzd4yjuSFJJwMje4EwGzz2itVK+aGgvx71BH?=
 =?us-ascii?Q?hWyPV4ovusvvQY1dU8sedl+psa1LzsnP4fdHygsTpebpAPngO/8HqZgee0NE?=
 =?us-ascii?Q?B94+7+E75RZW9FI2R4IiGNkN/W8zV8LVpGeEoE5i7VBa9Q05NDMc+z1upClf?=
 =?us-ascii?Q?IXEY/eIZOzQcAvyTKEACVhISbbTKUxqZUChmMp0yVikyrfujAr6WqLaLOidp?=
 =?us-ascii?Q?tXeqV7kw3u1o6ns9YhPGuidFXjFKyhgJxXF3m97bNwmDV36Wxa6Kp6e6nGUJ?=
 =?us-ascii?Q?kfC4wFDvA1o9Z5uLSEU3uQMCNSYc0y0egbqIZMYUVZ02SpDKrngDjFoGIy3s?=
 =?us-ascii?Q?hui3JSqaUkithiGV9bWD0h2d3VLGI8Cij3NZdgfPpDotbUCwSHIskG/7tEQc?=
 =?us-ascii?Q?GKwlY2G6a6ugnmvzkW289EqNc1GzRJWyJXzoc88vrFhgT+z3YVPDOPutXpAU?=
 =?us-ascii?Q?+GE8YloqDw2MdrB3+G9sxFxI31oYL4NCYQcgZf4t/EZQhPne3H4vyJ5pnZDh?=
 =?us-ascii?Q?LJ2h3X0xvENZu3nYoRujAPtxE9ZixfbgyOBpuiYZCXcTCQpq8iTvzz8MmS0u?=
 =?us-ascii?Q?i7GstNpZB2gkpcHrJfYEu5HBpPYQ3SivlXooNo9lDYyCw5ffZuQJHnKXMdZY?=
 =?us-ascii?Q?ua+TQLSDMBNXC0d7fcLbCnEVF8A0Pvz6B9ZDB2NHu038kWZrVZZseL7ZpxVf?=
 =?us-ascii?Q?/+YEC1yOwQFI9uolfXZaMEPDZbQoZBmCjD+1GTxVnrPYhwDT97E8gHjhUuon?=
 =?us-ascii?Q?tqST1Y4IO4b7wgyB7LE6m1LpNwq3GIyR/wuniZBNyUl3MFQEWfq32ROsfVBw?=
 =?us-ascii?Q?9A=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97aaabc2-b0b1-48c4-d3fa-08dde51acbde
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 03:35:40.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RCrNfiKSCSnOgAeJSjOP1gd6uNQMcjexiVY/HAPS0RfZXw/pwi+AO1TKp7zlST3LJDp7aU+bZ8nhAcjl6CvRaqHEKB7rx1FhgCO9Tk4xFiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6956
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> > > > +#define MAX_MSI_HOST_IRQS	64
> > > > +#define PCIE_RESET_CONFIG_DEVICE_WAIT_MS	500
> > >
> > > Where does this value come from?  Is there a generic value from
> > > drivers/pci/pci.h you can use?
> >
> > We check the PCIe specification to find these contents.
> >
> > "With a Downstream Port that supports Link speeds greater than 5.0
> > GT/s, software must wait a minimum of 100 ms after Link training
> > completes before sending a Configuration Request to the device
> > immediately below that Port."
> >
> > So, we think delay 500ms to let kernel issue the first configuration
> > command is enough after deassert PERST.
>=20
> Isn't this PCIE_RESET_CONFIG_WAIT_MS?
>=20
> I prefer to use #defines from the PCI core whenever possible because it m=
akes
> it easier to ensure that all drivers include the required delays.
>=20

Thank you for pointing this define.
I change to this define in next version.

> > > > +#define PCIE_RESET_CONFIG_RC_WAIT_MS		10
> > >
> > > Ditto.  If it's an Aspeed-specific value, can you point to the
> > > source in the Aspeed datasheet?
> >
> > This delay is set to ensure that the RC internal settings are
> > completely reset.  We do not put its usage in our datasheet.
>=20
> The "PCIE_" prefix suggests something required by the PCIe base spec.
> If this is an Aspeed-specific value, perhaps remove the "PCIE_"
> prefix?
>=20

Agreed.

> > > > +static int aspeed_ast2700_child_config(struct pci_bus *bus,
> > > > +unsigned int
> > > devfn,
> > > > +				       int where, int size, u32 *val,
> > > > +				       bool write)
> > > > +{
> > > > +	struct aspeed_pcie *pcie =3D bus->sysdata;
> > > > +	u32 bdf_offset, status, cfg_val;
> > > > +	int ret;
> > > > +
> > > > +	bdf_offset =3D aspeed_pcie_get_bdf_offset(bus, devfn, where);
> > > > +
> > > > +	cfg_val =3D CRG_PAYLOAD_SIZE;
> > > > +	if (write)
> > > > +		cfg_val |=3D (bus->number =3D=3D 1) ? CRG0_WRITE_FMTTYPE :
> > > CRG1_WRITE_FMTTYPE;
> > > > +	else
> > > > +		cfg_val |=3D (bus->number =3D=3D 1) ? CRG0_READ_FMTTYPE :
> > > > +CRG1_READ_FMTTYPE;
> > >
> > > I don't think you should assume that bus 0 is the root bus.  The
> > > root bus number should come from the DT bus-range.
>=20
> Just making sure you saw this part since you didn't mention it.
>=20

Agreed.
I have checked our design and verified in different root bus number.
I will modify this part in next version.

Thanks,
Jacky


