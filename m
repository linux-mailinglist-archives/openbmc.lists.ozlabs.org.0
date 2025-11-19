Return-Path: <openbmc+bounces-924-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FFC6D19F
	for <lists+openbmc@lfdr.de>; Wed, 19 Nov 2025 08:28:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBCkZ03TYz30HQ;
	Wed, 19 Nov 2025 18:28:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763537285;
	cv=pass; b=SH2SIjtGTUy00pCpaUKgcvIblafOm683B60JJ4YIDsr9SiaeNek4KibMnk7avmQWTDpEufV9XYltetbaBDaTJhFusT4TIzsk2/1MtavGgLjPppQEI3TeBMZ0Jt9eDUO+xH/yTIlIBqHekHs0narfJ69P5jeR3HgWowpH57sOtWVAgn8J1CTqtKz/gRsgkedoOREh/8RgE/PFGC5c6zbAUAdx9zmgyuqgQeGu5/zDzRJF/7euG4bUa8JqVO0SaULJLqpVE+/4cjd9xVB6FCjUn0FUBqUWIPpr3cBZ4aB6wlM3oH1gyRLGe8EqkV41IbevXN7bEdCvaGF8XmIGEjcJVg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763537285; c=relaxed/relaxed;
	bh=ErqT1PqzGlHg8I3g5E4R1x1ZlU7VgPTZli0pAC4VmW0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TkkPT004L/NRO8ldOfq1GmkTi5fVlKkMqMggxiJKJdd3ClXUt+YUiCueXn7RWiTMVpHQ3iONrP6zj7+02S7rl+QgCIKHC+cUa2J1Ji+VP0Hgx8XU9D4M94fiMnbLYiM7eaTiCULIGj59W8tfGmUU5RrZFcut8tCxqABF95N3qlQdXHBVTIj06XkQkqK946x5vXPRAH0Ejn+i0dSzl7g2dqIr3EAafsV+eXi37mzqFFAc5ZnAXLKRHVXCnDIctt1QfX4KdSDsly7OhgHjM9+dwVA8ucqyYHUdCjhJ37qI3khIjX9z1AnrotkqoZtURfznGJym36BwVaQCx8hMMt3gEQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=r3KvMgk8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=r3KvMgk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBCkX3zMsz3060;
	Wed, 19 Nov 2025 18:28:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkEC0EknqpqmfvoKH/+LFtmhr8AVwtqlj9Ompj9uW3ne5eTzQ8VduUMfwuqX7xgTk5kojt4A3kmahX6iMAcjwZr/Ue9AHBYy+/aqR2OYfydmruJgXyMLIa1oFh5Jc7X4ucMnB8xvBRCW60mARpK3YmOktcMIJukxJdf91g1lysZWSxUFNQ3sa2xKXV4EpIVTZfwE50MBgdYatyf9yH63V1tRB8YhkOwI1w+3JIzs+RBtDZw0aYBDaTUYh9U7ER4B0Bb/FiBYMUIAlaNFygpz4yuZLrPCoit2nj9UCef1eic+7umedZcL6RUmbumHxlxqZhEHXUSa6rrTdAL9tTBG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ErqT1PqzGlHg8I3g5E4R1x1ZlU7VgPTZli0pAC4VmW0=;
 b=vAPlhBbBhuIOEt8W6WZPn2ZYhU1emaHgnkkuf3e9pGBH6yv51GXsNcL9so0hvRyBuXQkxACzzNzvNfAGXIZ6QMtSePH4LMyhRvu2zahqd1fKHEtqo4DEDfYMy7PtxL2gAOTD/VJL8RShBoZaar2syWTOpZKH7mcCSxrYVM7kmOQLzrNhogPIp8SmWe9vHXDg9/T87itLfpL479yYdJk+ELNxat+fOd3sfY/i63xzfWEj5a6NS9wP4L1YldlqxHsDSBcns6ULhvbDoXmgKTJGFV4caKClQmp1MGo8MCzb+ly5YxUQJikus6yJL36EIq772lz2n3Jr4zE3uRmbQok2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErqT1PqzGlHg8I3g5E4R1x1ZlU7VgPTZli0pAC4VmW0=;
 b=r3KvMgk8sthn7Sy1rKvDGl8fSpw1D1FqMuq6mOofLBzVymeJjvs8YFjU7OQKdSMdWL2aI/ZD6LNms7o59iWMI6wZu68mr/Ktsg/KDuwZKT+r5PP3UWprWMM5ja6UnGP7gzV0kDX4/HiYHZyGNCRzfTnMcvf78D0RXxIN8nKcgJSWv0NVold9Z4yCutb6S8O+/z7BQCYfmQcX0FQfyh/yWmoZc3sdrMQBSRepFMwIGZKxkgRwPrY/KFDe4/Aa9UgkJf+UvXhyfskq81+6acZRn4cwGcqsMAzqgF8STOpqmPu9PEpkLdCinAWrRqZJQf6WdHNqVCZEyTRdtf4zH5VNjQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR06MB6886.apcprd06.prod.outlook.com (2603:1096:820:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 19 Nov
 2025 07:27:38 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 07:27:37 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW <BMC-SW@aspeedtech.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
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
Subject: RE: [PATCH v24 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v24 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index: AQHcWCxZjKBOPk1hB0uBFZIyIShnT7T5mzKw
Date: Wed, 19 Nov 2025 07:27:37 +0000
Message-ID:
 <TY2PPF5CB9A1BE63C27E6E0CEF4D3CC0513F2D7A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
 <20251118014034.820988-2-ryan_chen@aspeedtech.com>
In-Reply-To: <20251118014034.820988-2-ryan_chen@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR06MB6886:EE_
x-ms-office365-filtering-correlation-id: 5b3cdd40-7bd3-4314-c018-08de273d1d96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700021|13003099007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CH39fuFZa+v9dUjLZVX7xqZ6VtGXD9AIvj8rE6YbDcexFeFpGecE1tn8RsaN?=
 =?us-ascii?Q?tLfmhm8sYlqM1Cr07pGaTVSdhu7CFevbMw+9bqxHuqqWXPy6R1uu0+9Zxk4w?=
 =?us-ascii?Q?UoGD8WTUo9l6Dvj/vgOKVUa805PA0HYPZy34WrH4ncwmf9xfyY5/OyITczhG?=
 =?us-ascii?Q?2fg0LJMuawFobtQC0YtiTuwD9FO981WJedQtLC5WrplSP2/TP3T04pLftAYQ?=
 =?us-ascii?Q?wFFCvJH6FVYEmS6nKn0AvjHBS5dZEJXiroAV5h6nRDtfdk0qHx1HKR/V04ya?=
 =?us-ascii?Q?6j1IF04Ppy+W5ZNnx9BRJ2PVNIy2ev4KOBw51Zacx6QNwu5wLoN6+Ih3WCNv?=
 =?us-ascii?Q?RhhHVFPZBxfyA3Gh1m9ZP2eqqpVbsQAsYU/TM+PAjy5+0en/XEW7nEjFuyKX?=
 =?us-ascii?Q?PNl8JkoCFxJhIYzT3/tduUioGD8QSGiV/baqqwkht0bW7VRLSnDrv05O2VJI?=
 =?us-ascii?Q?jzFP51o5f9TjZnQvAthoS2umykmQKyicv2li1WcvwmwHok71SxWIJcfIgASh?=
 =?us-ascii?Q?cfL8W22be7aeF124LWYE1GUqkGiVYGevPfhfF2q+ePLKEc/jIG31yM0XBHUE?=
 =?us-ascii?Q?9azz6trHkX0YtjlFzDeCOhsUOkhSlpjjmLGytwlkhCezIvEylqWeHr1NUSzl?=
 =?us-ascii?Q?TgaS5uBnLH8hzVuagy97yr6OHbzMxD1hgzeB+sQ63XENyTQ62z2EW6/HWtXb?=
 =?us-ascii?Q?HH+7sfpuwXdSBOaTabFAnA2zpfKPd0FmgUGjRbg4J8bDx5UMRBJzvh8McTC6?=
 =?us-ascii?Q?PjXVzbzkfN3dqjHDvAQ5EHmnCWm2dtmbIEl800XBgK4S1+6gJsQW7z37zTNM?=
 =?us-ascii?Q?dHCV9xciBuzwB11cwfRxUVhamYCtuSUHbL9UvMaGJHQE10Q5/Z5/TggomkhX?=
 =?us-ascii?Q?EVIlCXf6q+Uv7KnFw3eyJEZS0tmdu8rPSJOv6QZ5jC1XGWJmMRRvtVjIyzxb?=
 =?us-ascii?Q?lox75oSwqJ7EAwbIUv4AlvM2DlM55O3nZYjA9g5zAW1g0O96TgUhnkIpLm3P?=
 =?us-ascii?Q?5xlwFRe/nEbW+lYP4HWcet44kjY+9XAg+BUsYdb4DRQhuaIOxR3rh4JlXxsm?=
 =?us-ascii?Q?Rfbkcgp4CWko+zI4cEMRW2hh5e2U/dMWAOEAoPVkOFat10IRNqajdhScWn7t?=
 =?us-ascii?Q?gRhwe4O3L95Gmqb6nHR2hjdfs36kLGsMh5QUBldzwSig4WYeIN73KlW+fH1t?=
 =?us-ascii?Q?CoE67My78F/a4q3kbsR44vR2WNLgo11m74JT4nFgzA/33FO3rMEZ2mAZMmSb?=
 =?us-ascii?Q?ggFNKEP3nYLSTJSwsDxMkNuowMNGQObec76HkMSj8UnsR9CEl1Swsn7cf2Xf?=
 =?us-ascii?Q?1xJCF5EWQSBnM8Zl0/enMGg6o9o4qpk5ljhGUIWwlQ7YDmuOXKVcYAdV7ExK?=
 =?us-ascii?Q?jaN7o3Bn/K7bHZ3HKeE7u50wvR3rQyJblPMOxYnVxXP7j/knH5PSKzOrDTsa?=
 =?us-ascii?Q?Fe8tDjekDVepZgB26xDgAmzSlOGRGRMNI4hSakOCPEv3mMFEowIY42xjlBD2?=
 =?us-ascii?Q?jliQGKje3wq1E0c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021)(13003099007)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TwbT7hcSSDJ3QcsAd4FakxAMmE1kuAAWnijZf1BZIZEK8lURoEdJbzvPn1lg?=
 =?us-ascii?Q?6wDNs14W0R/jIIwKUofQaVSgMzolebwasrPjpbp3br0QMS+wS9yJkgw0Msa4?=
 =?us-ascii?Q?KqZr9wIs01RJtfPSp8mTxXtCFcKgiVusiJCYFs5mULp5IM3lI9Jtv58d9rAi?=
 =?us-ascii?Q?GDITaagj/P9eh5cM6TcuY9J4D/225u8d+gwfOYxdh3WcQmfPdGCyWSWxyVP2?=
 =?us-ascii?Q?C0Z8fR+5p6DqJ0iYY44kXFRg1evQu7uQLJisV9Ln37EeyqGTFsuwYB6LzHxS?=
 =?us-ascii?Q?YccORWoUahva8EERKGBeF4joHvjz8vu8lZhPnn1e/NTb5CWl799TCD9pARI8?=
 =?us-ascii?Q?jQ+vd8hao5Gu+LgbGV6A3I9Xq6EvVDbdXDng7Vz/uDhrq75RKUeQnyz1KHHW?=
 =?us-ascii?Q?VWyxApXhjdbZXDfQS8JLwkHJDaUdQ2ymQCXsGEO2PYmMp1onMOluIo5ridtj?=
 =?us-ascii?Q?GQIdRgchWUzehYIror1+xlcbADiXfggV9sg/6D3ty6IFZUIkrEBEpaBUgc3N?=
 =?us-ascii?Q?qNgbYvKMhAKBgDzdDhie1l8fEm9FcQQby5z8pUfoutGBJgxl2oqGxfo9aGu5?=
 =?us-ascii?Q?yurKdNeEd25ErE9z9qajCy7kisXoVqi8UeM14Yox7OUmugpHTTQ4doGjxvwt?=
 =?us-ascii?Q?5cePUnLUV8iV9Ul60PJgX4uOY764NaseYcuFySFRCbI2uliD0/q2V0owaqRc?=
 =?us-ascii?Q?l0zPG2RVnTVk5bSGT1JF2n3zgzY4h2QurwMp5YE4lUedJI0vtkV3pSomSgB4?=
 =?us-ascii?Q?hE24KPzSUiROTsj/4DcWeKuQu12FMUbSKN09vSd7VnYKAd1RuQM7or4CQVv3?=
 =?us-ascii?Q?Sudfo8gw/MbPE9vdkxGVMKpwT+qrkLwtpTxE9fP4k/ltRpMU4j8ITlAi8w2y?=
 =?us-ascii?Q?NPGjOYwOXB3pdudtQVdBBudr3aOPiUxC6e5lj71m11KoPAjpfDXHa5GpixRf?=
 =?us-ascii?Q?gOrdOariWz0hG5/kGxq+5tELzwMdWiK6jRsDKqsluejsBp6ZSQG2+gV7ggsI?=
 =?us-ascii?Q?NPsi6TnXNZkW8fTTZFIveUn5zRl7Ywc/ExVA1YxThVV+AWDuYej5saw0M3aU?=
 =?us-ascii?Q?L1/FaQ1ygAdY6MS7Dkgxe4lr3Jt5pys8j82PkC6VZGtQ1AWbW1mE8SewRb9L?=
 =?us-ascii?Q?hCUPEqnv2MX+QHP31i8kXrIjD+WXojyIwazgO8q3nfs5jt149FEHPg+p1P19?=
 =?us-ascii?Q?SuRMQttK+d4iHtZJtSdWsTRmPI6jIR5Y1Rbr4Dv/TxFmb7nO29PRomDspHiS?=
 =?us-ascii?Q?dc1ihZkAK0nXC210SVipOcOVS0RDizpMe4k4T+bXLXDI1fsy15EF9C1WhyXb?=
 =?us-ascii?Q?GoxhTbyd4lzzDv317ZkQmVB6pstvDL6edBiZ2SNxZAFeObdl/6eqQ0K2RAFc?=
 =?us-ascii?Q?jEOmpyEBXrQUhsSn/phCZx+ZVNWqOSzHhJ2xhesuIDqnVjAHUQP3g+GrAwW3?=
 =?us-ascii?Q?F1yguQwStFiuncXtOQsSXRAD1WKX8pco6nLlb+HYMo0h9paS/lFYoLkBBAnd?=
 =?us-ascii?Q?gCR2b+q+z6gFZdAVOA4NsQfC0jb0hRKNhkzHK2QHGr/C5qdNL37LQDcWN9VP?=
 =?us-ascii?Q?oXRT55cBcQZUtkAKfUzsEk2XH7bV4GQcPCMKuuuF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3cdd40-7bd3-4314-c018-08de273d1d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:27:37.5460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXnZFnLdSlkYjOIJ6qpyvy1D1pcSGsBvz0Ej6QVfp1F9jBEX5me3o5ag13IpVEOWmvCTjTRHq7NSrHCaV/w1ZFpwalcyyiP9WE1JPJPybr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6886
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Krzysztof,
	Sorry to bother you, did I still miss something that I didn't update this =
patch?
Ryan

> Subject: [PATCH v24 1/4] dt-bindings: i2c: Split AST2600 binding into a n=
ew
> YAML
>=20
> The AST2600 I2C controller introduces a completely new register map and
> Separate control/target register sets, unlike the mixed layout used in
> AST2400/AST2500.
>=20
> In addition, at new AST2600 configuration registers and transfer modes re=
quire
> new DT properties, which are incompatible with existing bindings. Therefo=
re,
> this creates a dedicated binding file for AST2600 to properly describe th=
ese
> new hardware capabilities.
>=20
> A subsequent change will modify this new binding to properly describe the
> AST2600 hardware.
>=20
> The example section updated to reflect the actual AST2600 SoC register la=
yout
> and interrupt configuration.
> Reference: aspeed-g6.dtsi (lines 885-897)
>=20
> -I2C bus and buffer register offsets
>  - AST2600 I2C controller register base starts from 0x80, and the
>    buffer region is located at 0xc00, as defined in AST2600 SOC
>    register map.
>=20
> -Interrupt configuration
>  - AST2600 I2C controller are connected to ARM GIC interrupt
>    controller rather than the legacy internal interrupt controller.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,ast2600-i2c.yaml      | 65 +++++++++++++++++++
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  3 +-
>  2 files changed, 66 insertions(+), 2 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yam=
l
> b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> new file mode 100644
> index 000000000000..e5484d18f616
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,ast2600-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST26XX SoCs
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c-bus
> +
> +  reg:
> +    items:
> +      - description: controller registers
> +      - description: controller buffer space
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  clock-frequency:
> +    description: Desired operating frequency of the I2C bus in Hz.
> +    minimum: 500
> +    maximum: 4000000
> +    default: 100000
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@80 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      compatible =3D "aspeed,ast2600-i2c-bus";
> +      reg =3D <0x80 0x80>, <0xc00 0x20>;
> +      clocks =3D <&syscon ASPEED_CLK_APB>;
> +      resets =3D <&syscon ASPEED_RESET_I2C>;
> +      clock-frequency =3D <100000>;
> +      interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 5b9bd2feda3b..d4e4f412feba 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> -title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs
> +title: ASPEED I2C on the AST24XX, AST25XX SoCs
>=20
>  maintainers:
>    - Rayn Chen <rayn_chen@aspeedtech.com> @@ -17,7 +17,6 @@
> properties:
>      enum:
>        - aspeed,ast2400-i2c-bus
>        - aspeed,ast2500-i2c-bus
> -      - aspeed,ast2600-i2c-bus
>=20
>    reg:
>      minItems: 1
> --
> 2.34.1


