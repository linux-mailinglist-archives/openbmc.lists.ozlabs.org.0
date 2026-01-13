Return-Path: <openbmc+bounces-1179-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A4D16BA4
	for <lists+openbmc@lfdr.de>; Tue, 13 Jan 2026 06:46:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqysc5B95z2xjb;
	Tue, 13 Jan 2026 16:46:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.85.82 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768281544;
	cv=pass; b=D1klwC6Ophv6Do5+deKMsoDBcNiPF3HEyI+I3h1yTPQ5oOkPWV7logKkXGaludb697tvw/XlOKVcLeJUGf3c6MCqJ+ySlg0raA6gpmKERyApX8JpEzjryo1DHDHwx7IQ6MHmnPBqkJMhdiSqMeexwPi1w5Qdj3yLJFPfWCRtYOjloKS29Om7sHF6gEZQGM59JmTffy3u3QQFnlpgKH9IBLzU2gnlrSb3ppw26GzAqN+SjT9XYwBTo/CnT4oCnh+CK5ZDwJPukon+yhupISZ8B+zTp6OUtSmOK0oJmJI7mQ7ehzUYn9iJQ45yL069+y6jcF8kBRpjR6nQg2yzZPgPWg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768281544; c=relaxed/relaxed;
	bh=BmV+4x/nL7X/6X+n0Qpzelqkaw5J2JjXez4gq8Q6+cM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SvOakHgNbb8IUn4dinhQaI+fCwCrsDBIUkhyQjxGqmJGZxWGuEXHYIe10KOUckolrPhNIdBamYGN+klYBcPhCRjKiN8XSVVBvLlLDG6ca+VYefA1vx+nCQDHqINszzz2JosbnE/3pl+wMFEjgIybkNdOugJrwVUCVGkGOG+sW5YLHp8zQKwkDbGcB6AmDJmxIMJSNirT8papBsY+T1RADkMKPwC4ZhppuJIHXz4SMmNno4h2jlrN0FjinF0JbHh+QGK4Ba1zf8ASg0you6qG3HOSXMUe1/u0Y8WeCHDa/VnKzDEZta4cImN/t9hi/x5i0MVf2F2eMUa8dE/pooVlCA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=H9B3QZVr; dkim-atps=neutral; spf=pass (client-ip=52.101.85.82; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=srinavmani@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=H9B3QZVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=52.101.85.82; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=srinavmani@axiado.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020082.outbound.protection.outlook.com [52.101.85.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqyGG5m5Cz2xJF
	for <openbmc@lists.ozlabs.org>; Tue, 13 Jan 2026 16:19:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JVo7xML7XoCqsVpfIf6XWhoMtTmYzGfkFvxoZpxMDIdx0vTv/ON2f/Bc/YECZa+TDRzytYWjI8DJtaOiBDhdQtXuqGFnkaZ/+owU7cyh6Ewuy5M4J1rR1CDtiCEg+c/ZVEcUwwNP38FM40wdLzDmxnwQ/CPIxIjODQKIh7DeVOW5luuIgJjiX5mh8AF5sMhTprKsfol4Pw25AyxNACm4zLo++2ZqeiZBazpZkZpeqjAHQJ1WfQZGyiHzHFiP9V0rgf3JMScj1tszCcCsZgZOJqecfR/8BUOSihzLjtI+dCMYPQaCUDVjtdDO50FSYzrduNW+SMZkX/yl1QvH6Vfm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmV+4x/nL7X/6X+n0Qpzelqkaw5J2JjXez4gq8Q6+cM=;
 b=D/kD1+zS7ykPXSdQDGdf7a6SZyfng9jZqVN66F9t2j9FPI9i1k9P7HpFd+HVJrEVpsXioxjFcr4EK+VhDWaQjeUHw9h3KLg7pAlRWQk9II5KYtxPgA4d2585prSb5NTd9UYps4KQL9LjcdXQZIiS0j8zZzQ8hG5w4xdFe5RJCZsxkMIW8audSV0MrPiG/ulE214HhnQTWK2RRmbRG0NAItKuLRWLr52NkW5VBAIqvmeKP8jvnU7PwR6wmeMO9DYs0CK8PyWmgOV1bRuHAFnjR9lwJZnKLcSOjMtIH56XYemxt4Tt99od8po1TJOMZJjCO8FJYNnZ721ftbb88J0aWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmV+4x/nL7X/6X+n0Qpzelqkaw5J2JjXez4gq8Q6+cM=;
 b=H9B3QZVrX8u/ATpYHPPTVRTpNyO8dYa6hNqfzM3JHI/Gljd+j2JhyMDvZ0v9lr6dp2IsAPatnh2JLGGTZ7ohMeicRyqq4m5kWVvr9Sr8buLE57W3nGuXvkZrRceLsQ3hBt3/bRkOpdvofvlCoMTWNhMcOipEBOqiXpBpoGMyNcn8aNNYk9um/3TMMJXWzuuQPqHxGKWd6xN2Ft3VFqXO+SH6FkCPEjLHUn3Wh1yvjLyfnFqL/jWu/7t6p8JGctTOroJOXjD8CZfWeq1vWmnrPH5RJZuyEJm9nEnJ1qDQDrFePYXlGsw8WkO3KUf5sHXHSm/kS6m0HUX72L4+zIjMog==
Received: from SA1PR18MB5844.namprd18.prod.outlook.com (2603:10b6:806:3e2::16)
 by MW5PR18MB5151.namprd18.prod.outlook.com (2603:10b6:303:1c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 05:18:15 +0000
Received: from SA1PR18MB5844.namprd18.prod.outlook.com
 ([fe80::e143:7ca0:8a1c:a3c]) by SA1PR18MB5844.namprd18.prod.outlook.com
 ([fe80::e143:7ca0:8a1c:a3c%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 05:18:14 +0000
From: SriNavmani A <srinavmani@axiado.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
CC: Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Thread-Topic: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
Thread-Index: AQHcgUx0i4FNCYQZ5EyAF/dJ7IVWbLVMytAAgAKuxACAABpa/Q==
Date: Tue, 13 Jan 2026 05:18:14 +0000
Message-ID:
 <SA1PR18MB5844951309A515CD3D5281FFB58EA@SA1PR18MB5844.namprd18.prod.outlook.com>
References:
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-3-dd43459dbfea@axiado.com>
 <20260111-watchful-pigeon-of-brotherhood-6ada05@quoll>
 <0642a1b1-bdb8-4c04-bfa2-1253044e4b77@axiado.com>
In-Reply-To: <0642a1b1-bdb8-4c04-bfa2-1253044e4b77@axiado.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR18MB5844:EE_|MW5PR18MB5151:EE_
x-ms-office365-filtering-correlation-id: a0dcce94-9725-49f1-deb0-08de5263275e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021|13003099007|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ou9T0u4RULmg6eVp2rlS3wLUfdgDBNCnwiCbhpdDmOKWpL9sW2bDqG+5a/HD?=
 =?us-ascii?Q?MH1XBt/u9dNGVYgfBlTAv0I8zpb/KeGrQCa8KGerr98js5gqZCeWNFUn0Tgd?=
 =?us-ascii?Q?6UDP1pDs2c5gDLUdxcSvL5cJCa6Ewd8IS/5pEIQ3AmOTLkcIUq2f42IYINCj?=
 =?us-ascii?Q?O1U5pgsIw6fh/w2HkxOcokQyOdx4G/c5SkgQayYrwvPsqTE6tvcObwejjcnW?=
 =?us-ascii?Q?TbOeiGtQi7lY6SgwuNSfmlifDshoXWR4mSgkuwQkA1enKyHy1mUvBuMtl0Pn?=
 =?us-ascii?Q?Sjn1nczuurUnrW6p537+tutXe8w1OYhw+fPrECGqavlh8asTfPm+xa800j8n?=
 =?us-ascii?Q?4LIXnl3MOZ2ZIlEzupMlMBJExrGOmjPGoDQ+jPcH08FLdW/quI/7Zijw2p34?=
 =?us-ascii?Q?YrneOWNhpQoZNJ+TETrnUesQkwIagT+H1dhqM1JvWee1YYYHyoqvvYKlsGnS?=
 =?us-ascii?Q?wj2kGoGcCFBpPOdscamKJfIeEQGWbuCh6d2F1qWzRQo02h7qi3ZRQDAW2gV1?=
 =?us-ascii?Q?CYgeNDe5COpNH3aXV5xc8ywPafTpOI0ORN+JevokIvaE7C4dmmREdGgTI1FF?=
 =?us-ascii?Q?NYm/ZxCP5euw5qjinR87y/+PMUunidE7vPmTwyZk4aL6HpDgFpZjd41DE1ZW?=
 =?us-ascii?Q?Bic9c944sZmSghbejCF5FDbmOT6HyCnrwrFAJXXHmdgxGY2otEvm0WXDycp5?=
 =?us-ascii?Q?9HFYVSmM5f85s6e6N3oddsb+cvA/ybSovqQsCy6FpRJNXuYwOwcvqLHzWlHM?=
 =?us-ascii?Q?3mQcQeu268udrO05iBPqLU2dFXbYl8F0InzxeaUHXFMB8JxxaILkXhSI1ejZ?=
 =?us-ascii?Q?shAm41pr13N+Wa0ma+eGhM6vZT7pD3GfPWeqSsANnzozEeC2aeedkK07s2SI?=
 =?us-ascii?Q?DXl3NskdUq6tLoHDOZ7FC7lTitey1UiM861eswxLtr0oGwZbwIhRlozQgXiv?=
 =?us-ascii?Q?b4ED+d1q7exmGqC0lDIYZK4fr7tKXo6wc9UtPyt1+rNrcfivvYsBzaKqylDc?=
 =?us-ascii?Q?kG/DuG6axJMoX8Wzk9UXR3WLp/3hQ8GhH1s/oGo/NTZ15TLOA0jORRU6Ognb?=
 =?us-ascii?Q?q75p0USHtlsFVrYtE5wkPN6T6lvRmw33U7xQUPzAcJuZEtU9PdogBDTZYrzF?=
 =?us-ascii?Q?J0g8DRlOXoCRbIYuucgbzU+1gznTz6S1zCLRyVAzzpKG63bPi5uQDjaaVBvC?=
 =?us-ascii?Q?6Lbmox+u5DbH20oNmw2IvqXrcdbAVNmRylNVP+7eeQgYyd+9P2VWnPnH2785?=
 =?us-ascii?Q?cSDnHVrqNBHSuOBqtkia78Mu5ZYhKYgcfW/XGBNrgcUHc3egJdqEQfaWyMsr?=
 =?us-ascii?Q?dyVdqKASofA4iV/JF0nk7CUEbL22vFpd17MiKndbct4N624KR/RpO+P+klMI?=
 =?us-ascii?Q?7T/n2qjBaq3ym/F/1kGBKG9NGQQRkO2P9n+3zDCItrvyX8wYFjUOtRS/VeNJ?=
 =?us-ascii?Q?YNYVteo7JhlfcGayQUK2KVQhkq0ZLHwk/CpGLFEPDgoqGSg93sr5aMMjescL?=
 =?us-ascii?Q?tRl3uj3Z4LaWWey/uAzZntln4n/PPmqClP18VluB1btY/GuchfErUujTyA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR18MB5844.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021)(13003099007)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iDDzXF6RvCDXpwS9T2wGp8cu87x+2ii0rfkMuKGbxAoy2M5g85TxlDm/GSZT?=
 =?us-ascii?Q?2E1oMKGkJxFBpGRiGlfM9mBoi4YVPBSN8JQw1SQYlrV5KNTqtTHrgYWP2YBj?=
 =?us-ascii?Q?qu4Z6ikgdiQg76IKUWMlghIR3Z0eUsXGfLzoBMOQTjs9WnTrWjn7tGyBVDKT?=
 =?us-ascii?Q?vbwTe5O9uexiyu+tZ2iClGxvMyo+mffcuVxzX740E7ea66Mc+PBF/43k7hA8?=
 =?us-ascii?Q?xZZiUeEkntyVuURootPBDIDzfKhgtBNdYPY2gewyXUgZkSJgbRHdKACbSJV8?=
 =?us-ascii?Q?28pCimlidzbvevWpi3daRE53zbylNZfFMXdLCEVx1JjQcFCjWl36yDVrnxIo?=
 =?us-ascii?Q?3sDKuP0BwLth9gqBYsLHjYUGGhJXlWb+IPhPh+1St9XtzRG9wTEyuVyrsA0C?=
 =?us-ascii?Q?UEH4LPpTB6ry2SuLH1PiMktOs3CZxh9rGR5ycqN6+O0YDUxdtGg8wHMqtCBM?=
 =?us-ascii?Q?IIgyPq2NxCh+VJq23oSGGD8TpPOnjVnv/WMaLzhtKxt7lSF5rsifRx2LrVji?=
 =?us-ascii?Q?zUETIa1tNsHUAewiaIBl8qRKQPSnGClyQrRdFCSHzpmMj3up56hIUSB57qhb?=
 =?us-ascii?Q?9cZKreqO39HTArU01lsPbdn9jG7hSMOgnHQ4H4WUihWEz5Qe24405/y632uv?=
 =?us-ascii?Q?2UNkz8f5YXtqls5I8gjS274wtPo9+fs0O8BmSfA80ZrYcxK5OH/Nzeap/gnK?=
 =?us-ascii?Q?9N7it5O7RSlCS62FAUmFgQJErOZvfPrs+PvaS1tD3C8UwzziN6/CygAb28Ll?=
 =?us-ascii?Q?x2mq1a5O1hDE0NjIbD2XsrhPWhlC3VYR07CqKCPOTiyFwOE/tHzzPiik8pFk?=
 =?us-ascii?Q?GiukUKisTzvzzHAWYFYFkPpVLWZfze3/oofhfXFprC31KqQBjUEOj6aFv1eP?=
 =?us-ascii?Q?p3/bbgGKj9mUQXLd4r5DkVB10Ab19b6upb+3rOdXEiguJXqHaNPS09pAP3e1?=
 =?us-ascii?Q?Q9JL+7eW9DCBiv3pA4yvXSnCGxEVRAP6tFP2CriVBwEOPSL5kH85yhuDJpd3?=
 =?us-ascii?Q?vEH6ei8lJij3BXYBhCda+ZDXwhNcwX3wX8LRTEKaWVp1QfBY1BhrYtGFAQbn?=
 =?us-ascii?Q?KWPa6SkOSl04G15LCZmCqA3AHC5EWAxqZLczwC1fmyDch923iYR9/afllxU5?=
 =?us-ascii?Q?DW5BvHiwBkeCScVh6kD6/29M6e3B8w2BqO9VQ7frK4L+0QmIMjLz2jD4hdzs?=
 =?us-ascii?Q?zimI1bYTgou9ThmpzjXaLWndN7qw0AuTqG1WoPipWmnSNoNDsvJXqH1br3wJ?=
 =?us-ascii?Q?34KDLkwoW4eE7ZManteJJHNNzkPEErEvvjiKwmnlITBAfeYASxv1/6RX3I2z?=
 =?us-ascii?Q?4RPYGnLcNjxtQ0Bbe0w806UnTuuEUFH4yPufxXTWDtu/lfLT5x+5tTgURzih?=
 =?us-ascii?Q?X0N347FLnQgBOH/iW/11glnS1XHrhWyTJi/MgiGpUD5liS7aYGgJlR7Gqgbh?=
 =?us-ascii?Q?2NeylfNJckHd1pzujQoC+SNt51T/EK16lV54SZ3UmsQ9zXfuhv1Bj63q2a17?=
 =?us-ascii?Q?jAWHqoxxMxN/YT3Layw4CzgUscRUJ4u+EMeoXiVuR24JGD8qvUVafhUAEgiz?=
 =?us-ascii?Q?2JaCucRLxD9b6cFd03AegowDOxEsGYMVVI68gcJpF+/V4AvZ1VD8If7kLTiw?=
 =?us-ascii?Q?SQfGJM9GgEY/PtB+i5YBzin+lorAyivzjG7lWwA8/DbUOq6+lnKrag7OdXlX?=
 =?us-ascii?Q?tMf1vsoWHsT6oChkDbuM7XuMiZu4+KOBmF2ujaSmPz0xEp2y?=
Content-Type: multipart/alternative;
	boundary="_000_SA1PR18MB5844951309A515CD3D5281FFB58EASA1PR18MB5844namp_"
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
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR18MB5844.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dcce94-9725-49f1-deb0-08de5263275e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 05:18:14.8727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQi5XpLaFgXg3AK/X6EUb1S0pVe0UtJrceDLpjfWcY1Muzo3hzkm0Bxk90ZrBXjR3gu31iHZqfKTj8icYt4Mhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5151
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_SA1PR18MB5844951309A515CD3D5281FFB58EASA1PR18MB5844namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, we will maintain the eMMC PHY driver.


Thanks
________________________________
From: Tzu-Hao Wei <twei@axiado.com>
Sent: Tuesday, January 13, 2026 9:08 AM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: SriNavmani A <srinavmani@axiado.com>; Prasad Bolisetty <pbolisetty@axia=
do.com>; Vinod Koul <vkoul@kernel.org>; Neil Armstrong <neil.armstrong@lina=
ro.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel=
.org>; Conor Dooley <conor+dt@kernel.org>; linux-phy@lists.infradead.org <l=
inux-phy@lists.infradead.org>; devicetree@vger.kernel.org <devicetree@vger.=
kernel.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.i=
nfradead.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>;=
 openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver

On 1/11/2026 6:40 PM, Krzysztof Kozlowski wrote:
>>
>> +AXIADO EMMC PHY DRIVER
>> +M:   SriNavmani A <srinavmani@axiado.com>
>
> No activity:
> https://lore.kernel.org/all/?q=3Df%3Asrinavmani%40axiado.com
>
>> +M:   Tzu-Hao Wei <twei@axiado.com>
>> +M:   Prasad Bolisetty <pbolisetty@axiado.com>
>
> No reviews:
> https://lore.kernel.org/all/?q=3Df%3Apbolisetty%40axiado.com
>
> Are these maintainers going to actually maintain code? At least Prasad
> should provide proper review now.
>
I'll ask them to Ack/Review the patches.

>> +L:   linux-phy@lists.infradead.org (moderated for non-subscribers)
>> +S:   Maintained
>> +F:   Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
>
>> +F:   drivers/phy/axiado/Kconfig
>> +F:   drivers/phy/axiado/phy-axiado-emmc.c
>
> If you are a maintainer of Kconfig you imply you maintain everything, so
> simply entire directory...
>
Yes, we will maintain everything in drivers/phy/axiado/

Best regards,
TH

--_000_SA1PR18MB5844951309A515CD3D5281FFB58EASA1PR18MB5844namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Yes, we will maintain the eMMC PHY driver.<br>
<br>
<br>
Thanks</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tzu-Hao Wei &lt;twei@=
axiado.com&gt;<br>
<b>Sent:</b> Tuesday, January 13, 2026 9:08 AM<br>
<b>To:</b> Krzysztof Kozlowski &lt;krzk@kernel.org&gt;<br>
<b>Cc:</b> SriNavmani A &lt;srinavmani@axiado.com&gt;; Prasad Bolisetty &lt=
;pbolisetty@axiado.com&gt;; Vinod Koul &lt;vkoul@kernel.org&gt;; Neil Armst=
rong &lt;neil.armstrong@linaro.org&gt;; Rob Herring &lt;robh@kernel.org&gt;=
; Krzysztof Kozlowski &lt;krzk+dt@kernel.org&gt;; Conor Dooley &lt;conor+dt=
@kernel.org&gt;;
 linux-phy@lists.infradead.org &lt;linux-phy@lists.infradead.org&gt;; devic=
etree@vger.kernel.org &lt;devicetree@vger.kernel.org&gt;; linux-arm-kernel@=
lists.infradead.org &lt;linux-arm-kernel@lists.infradead.org&gt;; linux-ker=
nel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;;
 openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: [PATCH 3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY dri=
ver</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 1/11/2026 6:40 PM, Krzysztof Kozlowski wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; +AXIADO EMMC PHY DRIVER<br>
&gt;&gt; +M:&nbsp;&nbsp; SriNavmani A &lt;srinavmani@axiado.com&gt;<br>
&gt; <br>
&gt; No activity:<br>
&gt; <a href=3D"https://lore.kernel.org/all/?q=3Df%3Asrinavmani%40axiado.co=
m">https://lore.kernel.org/all/?q=3Df%3Asrinavmani%40axiado.com</a><br>
&gt; <br>
&gt;&gt; +M:&nbsp;&nbsp; Tzu-Hao Wei &lt;twei@axiado.com&gt;<br>
&gt;&gt; +M:&nbsp;&nbsp; Prasad Bolisetty &lt;pbolisetty@axiado.com&gt;<br>
&gt; <br>
&gt; No reviews:<br>
&gt; <a href=3D"https://lore.kernel.org/all/?q=3Df%3Apbolisetty%40axiado.co=
m">https://lore.kernel.org/all/?q=3Df%3Apbolisetty%40axiado.com</a><br>
&gt; <br>
&gt; Are these maintainers going to actually maintain code? At least Prasad=
<br>
&gt; should provide proper review now.<br>
&gt; <br>
I'll ask them to Ack/Review the patches. <br>
<br>
&gt;&gt; +L:&nbsp;&nbsp; linux-phy@lists.infradead.org (moderated for non-s=
ubscribers)<br>
&gt;&gt; +S:&nbsp;&nbsp; Maintained<br>
&gt;&gt; +F:&nbsp;&nbsp; Documentation/devicetree/bindings/phy/axiado,ax300=
0-emmc-phy.yaml<br>
&gt; <br>
&gt;&gt; +F:&nbsp;&nbsp; drivers/phy/axiado/Kconfig<br>
&gt;&gt; +F:&nbsp;&nbsp; drivers/phy/axiado/phy-axiado-emmc.c<br>
&gt; <br>
&gt; If you are a maintainer of Kconfig you imply you maintain everything, =
so<br>
&gt; simply entire directory...<br>
&gt; <br>
Yes, we will maintain everything in drivers/phy/axiado/<br>
<br>
Best regards,<br>
TH<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA1PR18MB5844951309A515CD3D5281FFB58EASA1PR18MB5844namp_--

