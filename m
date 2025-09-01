Return-Path: <openbmc+bounces-538-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E774AB3D637
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 03:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFW194NQ5z2xrL;
	Mon,  1 Sep 2025 11:06:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756688813;
	cv=pass; b=AQGQybAMP1g2YBgCbp7ZLGzkA3C+GBSyN7sfYBJiXAyoZrJap1mZQUBr1r75OWcd2+uSjxKIEobDJH8tnzDbsx1PXuwy1oSOnCscaTm0Ojyjsp89dyUFNE5Gdm4Vw6s8H7s7hOcH9nYVz4CojSHI5k5gMP2SVHydXOwnkNN2BgOrnEWnPfCgVXJHgRQ6hxg+jUZyp39gl/PlYm7gnGD3pRkHd03508e+jUhAJrFy4zzDTsRRCbi1RsAFtmsbmtRAoVHOPjom8EVYEMrSH6ekL6N4QoU1tc1RxDyYnkbMmOWE6I1rdI55ahnehbeWBUAvntFvucjAV6uU2oRKJFJilA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756688813; c=relaxed/relaxed;
	bh=V+xfgeqXfcZqAOojhdbvV5ksLOGydFvVWtQjQr8UXi4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lL4nCn2NJWR3jOQrVwga/JGhjNpz6BkzN3JjY+rxS27B/ZDhV557R+6R1knzciNagyP2Z4b5T1WNyW49q76PDjXXPRGkrPuqwGvNHfjGskS/xRXV0EtIX3bKHOux8Y2jQXhRFDsUpAsG/nb3EUWt9jJYUS0D0OcYCx78IssiQ/zfeCxmP7hXZAafH+YJzRsOwbOo3fV9feRXutqCDAxt0blS7LRY+sEk3fq3jZdAbppRXpafBDEBrJbfFH/NvcFdwgRU96rh6hMvzqrZKVeOvzT6Z/lB1ZU4ukT7oA44Y5aAgcvXMfPEm3OQeb47Sy+jAAIIYRkEPL2JsH1PksPhkg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Pqghb3zL; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Pqghb3zL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFW1861tTz2xcB;
	Mon,  1 Sep 2025 11:06:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVmH5/7zl1fVqjv57hZr8JWksE9YW1EvxYEyuE06rvEePvk1Nv8LaMqkrpyA/uNJzVFZmBrtcpxgDkS3MxLZdG2eJTS/eqxQky1JzXy1nC9oRHrYBC0qtfhIyWd1Q2rZgnmJmGjUm/uGLCoAc4iubWeKi1sA+KRxqQKn8am6e7rDyz0ZuvNIshgx331ViW1IKwSHDOWJ9lL8+ztddCQ90EuHmuGpU3/bfxchgCbkncJ5WlOrdV5fQ5iHawqZCjsjF3BSfIlpndP1u7FlT/SRuGi1NSq3JX3oARS6DqTH4HGSgWKgN0ELD9FNOMF5T7OFUJMWAJOUJrFw3bxLPRN9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+xfgeqXfcZqAOojhdbvV5ksLOGydFvVWtQjQr8UXi4=;
 b=LW7zPUJW47lZUNEi2v+t2dz0fCnJLpOL9/OhQd8jIVGZLYFiONCQhpmd/h0R37nlRNrOPn9IdLOcrT1w0ysSt21y6oyrXHVfp6ljmxHkBaHMNog/Fg6xT+hWLCYcTAm6LAp9m7MnWGb7ipLbvl1FMfBI9iUWnRp2FvlNFiLY7SpPsU2ZjABMsXtHN3UwajGPoG/7xUR9TXumrD3ymSEBK5D7OdEyQEHN+kNxx5eQ8y+FzClK/ifNGmJ/toPfIGHnYvHcAjdtd7X5r0g9Wg2g8rHu4iFBDrle0WookxWfCbYWkstVJXoPZHWFuH/DPMSZGsQaEov2TT4CePWHqj3czw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+xfgeqXfcZqAOojhdbvV5ksLOGydFvVWtQjQr8UXi4=;
 b=Pqghb3zLR8+0/uIpmy1SMAMhwjuaUG0h5k89bIWFUREs+cnaSm6urIJtF5Nb1X5sh/khycKiC+2Ht99bjej3K2yU6YurgwaFkj9PIDsX8m2+2q1V52T+bJDJyBCCMLBR59ZTHXO61WUi+Wz7IEO2yAEbM2/CZk1t/yb6KOH/H7Z61e5QQVug3iTUx3/9DdN3q5tQZeLpxkIYsum1K2tkiBLfmgWfLPhkOs+d4orP0+rzMMjhwVVjBFXpXOoibD9wIX49pmLu5wdsFFmdMnv5Sb6euX7nRnkoJtos+fjgoAdFsdZQCiHta5gwRWF81Yfho0bY3p47ZuC4+X4iq9s2Ew==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by TYZPR06MB6142.apcprd06.prod.outlook.com (2603:1096:400:336::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 01:06:28 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 01:06:28 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v18 3/3] i2c: ast2600: Add target mode support
Thread-Topic: [PATCH v18 3/3] i2c: ast2600: Add target mode support
Thread-Index: AQHcEZHj/2ZS7X9ozUeVFo/iyMWUxLR9leGQ
Date: Mon, 1 Sep 2025 01:06:28 +0000
Message-ID:
 <OS8PR06MB75419AAE072E44CB2F1839C0F207A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
 <20250820051832.3605405-4-ryan_chen@aspeedtech.com>
In-Reply-To: <20250820051832.3605405-4-ryan_chen@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|TYZPR06MB6142:EE_
x-ms-office365-filtering-correlation-id: 92f7e770-1518-485e-bc41-08dde8f3c7cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JcrsBZwzqcFpv2TlhHF6lWk4Xo2J5xWCaI7CW3tK8UirSvC9K/lYylbUQqp8?=
 =?us-ascii?Q?cT7Hfe73190AevjE9Vwkcti5Q98zNtk8oPOziDkf23BxhWvcco5C7g/pqY3z?=
 =?us-ascii?Q?beMAxMI80cRtbgeaCLOXtMmgp/SiMqMpC7jfZe1wZPIt//va9+CkCfHjoZxQ?=
 =?us-ascii?Q?hFreKUkFfDEyKJV7leN0uFAQ6uK9inOk5BSoUC3a32BMbLfFTwS6rtqK5eg1?=
 =?us-ascii?Q?iqy3xW3jHScykdM1HqRytfR97GEmsJbIQcyJzUOoyp7LKkMlSlWTCBIiPmp0?=
 =?us-ascii?Q?ipAgJ1s9rRGzXGYgO6aqozDPZ38HK8hOUi9icuSPgaiGYnfnXbUk6IoSxLc4?=
 =?us-ascii?Q?LnqQSTIS56bW7LS/RV4j+MmJjngEOgKXHxBIIofxSONmQQbi6b65tDqLcInZ?=
 =?us-ascii?Q?LDMczEddOOS4HUcj6sWdoSq+ahpa6auDw9tCRe0LqT/OtxiKeG1vCEaWlpFM?=
 =?us-ascii?Q?3xPXrl1iGh78jYvxLQTNT1RyjVoGm4VqUQ6gXQHE1Vu0oj+z716W5iEUJSf9?=
 =?us-ascii?Q?RPIMKo8jLtXUoTRPXR18mWFtE1jgksc21c41QfGG3+mMRlE6YCgPddUDc0+H?=
 =?us-ascii?Q?a/juBHmZzYBiBBhJL/L4DPf8y0oP+p5Xhsarf44Fe+PnWbhtRRcSU++YKXRE?=
 =?us-ascii?Q?hSiKFyRVcFpVdLrTs503elLKsj9V0WRo2xCL1uKOcs1bzBNfeBhDVMK0ny8m?=
 =?us-ascii?Q?67p5xXwLXoGB+MiUUFTJjqUS4P5U2J2x2yDmi5O9fDRw8AK5vmfLN7xAl1uE?=
 =?us-ascii?Q?+YtJzsxY3QBs1Ofy5aXOlBspBzJfvblJx0G2dO/QzJcBFXwLx5R7q96Rqji1?=
 =?us-ascii?Q?DHtNTFgAUe2jSwJ24c7uGd9uFAMyTati8mpW0+Hq2FkVMV5XBFlmKdDnuGXB?=
 =?us-ascii?Q?9UZheSEhLG2d4wl8YoaH+NjEJBKC+ItxafluV5Z6ZXk0DG6p6VFktIHhWmUT?=
 =?us-ascii?Q?pMNmBItUaRuEXForOkbWhKyDFDMmcTfpmO2T03c00HRN2EYw8IORxBoLbfkH?=
 =?us-ascii?Q?mDMNp10ESs8uw3VDIcQ6oelYG5Ymcrl87aEHrWe6I7Z4fqtEeKKtah+m6Qdw?=
 =?us-ascii?Q?8S2LYgd+F6NMG8FUXxFIbltd3maQRNC9RoggDAHlTLrPuzW91D7SXG/ur4L9?=
 =?us-ascii?Q?nza1zamjBnbgHP1DwbFKVGcA0jqnwMU5hrarPvVzf8D5SgxSq3+MysN4LOpM?=
 =?us-ascii?Q?r1I6xLnmT/TKXuSDakZUlZMJFP2lIF0824zl99NWWyou12lyFbBaLGw/aSAL?=
 =?us-ascii?Q?ACkUjDq151YS1GO5XvjGfh+axvwW2K1MeQuelfbKkC/5NY4/IPKeEoKuguA5?=
 =?us-ascii?Q?PU9YC40MAcqM9Ih/Ejpwzc/tjg/G7ngkc8JdoO0L/mKmRYdlR2CvdLsqnYq5?=
 =?us-ascii?Q?wmRakrp2ulSff66AkGKXrI7CU0AdJfSuySvbZ8Aa5a6m9mTI8XsZF3nZLCe4?=
 =?us-ascii?Q?C5LhKpN4cVlU98QcvTZOd6DEfohJZSMR8D7o/cY4rdHLSA4MWryLVSjaNurs?=
 =?us-ascii?Q?2n6IOfhznwJ0w3U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ta9SZkr/Dr6qfQUXZxwXVey7edxIt65uw4gY8Szo2Q5vGr8Ci+8M/tLoArlQ?=
 =?us-ascii?Q?MiGFOu5+mzQtIz2NKnlsXuU2aCpz8GhczQ2DlLFxAkQ+vp7q7XEFDsqHxecP?=
 =?us-ascii?Q?RVnOnVTzCx5TBltNHDt8a3oWzCs0d8AdN7MSwwy0JsbwXjhXs77LgDLgNIeA?=
 =?us-ascii?Q?CbsosU/6Ni6b4avY4MltblfXer/P3Pnm3ZCMXZWmjkGPu5YQArPtzUeMuatV?=
 =?us-ascii?Q?DkQYDM83DZZ6ShXTxBbsL/PggFVePMMaLCJZwcXvM1uExJzqFERU8LMGZrwg?=
 =?us-ascii?Q?wY0XNcbuOe0kmgu7yacqxVAQRda8Wb9ieUkbqKZ3m3KLwxeO8rckgK3PQrQ9?=
 =?us-ascii?Q?+AWOsJgblVyv08ADuRYuIEE1KSgqPgSv4ssB5R0ImmC/Btwgiw4P6dugDm/g?=
 =?us-ascii?Q?nsRUcsrK098MO6Qkycx9mwtf9SPtmkFl2ZCUYqP2EvLnR31Xd2hx2Z9pR8du?=
 =?us-ascii?Q?H0Ds9GG+tJhG7YJRaqQ/6838wv0oGoh1aJv6z8WFoUn00Gg8nxp813yzfILJ?=
 =?us-ascii?Q?zvY2ZNwVkr1OtiESSTw2frkIwuft33UTG0r/C/l5JGn6AyslhG2lhYkJmOuq?=
 =?us-ascii?Q?is9dXlmVKOfe4TSpSDr6rz2IYDy30e+bO1PSHek3auctmM2bBRwKcMf71j7/?=
 =?us-ascii?Q?jgkS5qZNSnPApkfeD8KIECUe30VfVupcG0IfrpEZ8/GmPgd01RhwkBnOrrRY?=
 =?us-ascii?Q?BTrkB2raz/MieXmhjyKk11Y3yzUDKMP8fV5aWciIRYjjC402p4AdrrnIdg22?=
 =?us-ascii?Q?XWZY237CxuEOo0Dx08BIhp2ptlOJpz+LA9W/mryJwcslfPRsqaJiBg+ZTDPn?=
 =?us-ascii?Q?BWzFzwh2UfxnB5s9sej2t1i7qrwARI6mUbWbgakemz3qW1T28TH+uRCkUz20?=
 =?us-ascii?Q?HvYWRPoD9BsVhfkIGc35ghJv+/UH6MbjslTiC2OWf1gx9gun3/1shuQlU2b3?=
 =?us-ascii?Q?IyP5NerOcNVMRzHS3O5KQydql6Xh1GciDMcu41iozHhiGxpNLlIzzIDk8bwO?=
 =?us-ascii?Q?hZ6FifNqCjRICQNdIW6Igfug0iOvodM3pQPSYDDdqWU1b3ysqQkjMAJgMk4K?=
 =?us-ascii?Q?5SNq+NfyhBymJPkRLJb2JDt10P8/8JK3kyC0pXyHfrQ/22g94usmPI7twLQN?=
 =?us-ascii?Q?ZkThkLG1Dcqmb0Bvb0zv1tsPOneNaA/iofvlAzBeZb8dgf2mYM8b+cF0HLLN?=
 =?us-ascii?Q?sXQYek3NgmGhma2PACyfsbTNZSDWfXjsncZvlCgvfyiCln3Yn0UZ0urQATtW?=
 =?us-ascii?Q?QkjW/piWBOWoCIUeSAAzwSyQ+ZYfIcU73mNL+BU/xtNvwhDr6mvdDihzqOj1?=
 =?us-ascii?Q?3EAO+KDU7VspHzR0IEpG4chWIYsnBZcjG0ERHKlogrbbUYZGbqPdVRT8e+/1?=
 =?us-ascii?Q?q/lnlZFOj/YBORZEWVhqz9M+YB7Y/OMgl8deV3VSHJHPxmxsCAsC2FvJrWp8?=
 =?us-ascii?Q?+uUZOCESdUD1B93ZlodvzvzO8L4182kcsuBDK8Je3wmOCBvaRROKizJO/bg5?=
 =?us-ascii?Q?0MOlDbL40epLuRIO328GFSD8BgBhZE0iZBqd7UQxG0YZA+qcTw6f/kfeCzSP?=
 =?us-ascii?Q?RR4GS74AK+3kWFOn9bGkOOyQeTukGJU6yLBpS7qG?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f7e770-1518-485e-bc41-08dde8f3c7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 01:06:28.3098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxaPUCZcpLJBZtqamUf8y8kOb3Kxz/ehboaPljqaJgTTWZtgkj2Q99AY8GfbIzfWMXYV88pWwlp1PyrSNo6HCJjsr+nrKeZ5KYsmKL2n29s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6142
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Subject: [PATCH v18 3/3] i2c: ast2600: Add target mode support
Hello Andy,
	sorry to bother you, do you have time to review this patch?
Ryan=20

>=20
> Add target mode support to the AST2600 I2C driver using new register layo=
ut.
>=20
> Target mode features implemented include:
> - Add target interrupt handling
> - Address match and response logic
> - Separate Tx/Rx DMA address and length configuration
>=20
> This complements the existing controller-mode support, enabling dual-role
> capability.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-ast2600.c | 560 +++++++++++++++++++++++++++++++
>  1 file changed, 560 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> index 885b451030ac..81d1eb51334a 100644
> --- a/drivers/i2c/busses/i2c-ast2600.c
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -81,6 +81,7 @@
>  #define AST2600_I2CC_THDDAT(x)			(((x) & GENMASK(1, 0)) <<
> 10)
>  #define AST2600_I2CC_TOUTBASECLK(x)			(((x) & GENMASK(1, 0))
> << 8)
>  #define AST2600_I2CC_TBASECLK(x)			((x) & GENMASK(3, 0))
> +#define AST2600_I2CC_AC_TIMING_MASK		GENMASK(23, 0)
>=20
>  /* 0x08 : I2CC Controller/Target Transmit/Receive Byte Buffer Register *=
/
>  #define AST2600_I2CC_STS_AND_BUFF		0x08
> @@ -271,6 +272,13 @@ struct ast2600_i2c_bus {
>  	/* Buffer mode */
>  	void __iomem		*buf_base;
>  	struct i2c_smbus_alert_setup	alert_data;
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* target structure */
> +	int			target_operate;
> +	unsigned char	*target_dma_buf;
> +	dma_addr_t		target_dma_addr;
> +	struct i2c_client	*target;
> +#endif
>  };
>=20
>  static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus) @@
> -361,6 +369,423 @@ static int ast2600_i2c_recover_bus(struct
> ast2600_i2c_bus *i2c_bus)
>  	return ret;
>  }
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void ast2600_i2c_target_packet_dma_irq(struct ast2600_i2c_bus
> +*i2c_bus, u32 sts) {
> +	int target_rx_len =3D 0;
> +	u32 cmd =3D 0;
> +	u8 value;
> +	int i;
> +
> +	sts &=3D ~(AST2600_I2CS_SLAVE_PENDING);
> +	/* Handle i2c target timeout condition */
> +	if (AST2600_I2CS_INACTIVE_TO & sts) {
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		cmd |=3D AST2600_I2CS_RX_DMA_EN;
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_ISR);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		return;
> +	}
> +
> +	sts &=3D ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_WAIT_RX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		target_rx_len =3D
> AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->target_dma_buf[i]);
> +		}
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE_NAK |
> +			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA |
> +			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE_NAK | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA |
> AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_STOP:
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->target,
> I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +		target_rx_len =3D
> AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->target_dma_buf[i]);
> +		}
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		if (sts & AST2600_I2CS_STOP)
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +
> +	/* it is Mw data Mr coming -> it need send tx */
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_WAIT_TX_DMA:
> +		/* it should be repeat start read */
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->target,
> I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +		target_rx_len =3D
> AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +						      AST2600_I2CS_DMA_LEN_STS));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> +					&i2c_bus->target_dma_buf[i]);
> +		}
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> +				&i2c_bus->target_dma_buf[0]);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA:
> +		/* First Start read */
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> +				&i2c_bus->target_dma_buf[0]);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		/* it should be next start read */
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED,
> +				&i2c_bus->target_dma_buf[0]);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
> +		/* it just tx complete */
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +		cmd =3D 0;
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		break;
> +	case AST2600_I2CS_STOP:
> +		cmd =3D 0;
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled target isr case %x, sts %x\n", sts,
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		break;
> +	}
> +
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR); }
> +
> +static void ast2600_i2c_target_packet_buff_irq(struct ast2600_i2c_bus
> +*i2c_bus, u32 sts) {
> +	int target_rx_len =3D 0;
> +	u32 cmd =3D 0;
> +	u8 value;
> +	int i;
> +
> +	/* due to controller target is common buffer, need force the master sto=
p
> not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15,
> 0)) {
> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		i2c_bus->cmd_err =3D -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		complete(&i2c_bus->cmd_complete);
> +	}
> +
> +	/* Handle i2c target timeout condition */
> +	if (AST2600_I2CS_INACTIVE_TO & sts) {
> +		/* Reset timeout counter */
> +		u32 ac_timing =3D readl(i2c_bus->reg_base +
> AST2600_I2CC_AC_TIMING) &
> +				AST2600_I2CC_AC_TIMING_MASK;
> +
> +		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +		ac_timing |=3D AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +		writel(TARGET_TRIGGER_CMD, i2c_bus->reg_base +
> AST2600_I2CS_CMD_STS);
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_ISR);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_bus->target_operate =3D 0;
> +		return;
> +	}
> +
> +	sts &=3D ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
> +
> +	if (sts & AST2600_I2CS_SLAVE_MATCH)
> +		i2c_bus->target_operate =3D 1;
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_STOP:
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		fallthrough;
> +	case AST2600_I2CS_SLAVE_PENDING |
> +		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH |
> AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH |
> AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							       AST2600_I2CC_BUFF_CTRL));
> +			for (i =3D 0; i < target_rx_len; i++) {
> +				value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +				i2c_slave_event(i2c_bus->target,
> I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +		}
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) &
> AST2600_I2CS_RX_BUFF_EN)
> +			cmd =3D 0;
> +		else
> +			cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
> +
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_RX_DONE:
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						       AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		cmd |=3D AST2600_I2CS_RX_BUFF_EN;
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> +				AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								 AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		cmd |=3D AST2600_I2CS_RX_BUFF_EN;
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		break;
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_STOP:
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								 AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		/* workaround for avoid next start with len !=3D 0 */
> +		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		break;
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								 AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		/* workaround for avoid next start with len !=3D 0 */
> +		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		break;
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE |
> +	     AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_STOP:
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								 AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> &value);
> +		writeb(value, i2c_bus->buf_base);
> +		break;
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_SLAVE_MATCH:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> &value);
> +		writeb(value, i2c_bus->buf_base);
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_STOP |
> +	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH |
> AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
> AST2600_I2CS_STOP |
> +	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH |
> AST2600_I2CS_RX_DONE:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +						AST2600_I2CC_BUFF_CTRL));
> +		for (i =3D 0; i < target_rx_len; i++) {
> +			value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &value);
> +		}
> +		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA |
> AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
> +	case AST2600_I2CS_WAIT_TX_DMA:
> +		if (sts & AST2600_I2CS_SLAVE_MATCH)
> +			i2c_slave_event(i2c_bus->target,
> I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +		if (sts & AST2600_I2CS_RX_DONE) {
> +			target_rx_len =3D
> AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +							AST2600_I2CC_BUFF_CTRL));
> +			for (i =3D 0; i < target_rx_len; i++) {
> +				value =3D readb(i2c_bus->buf_base + 0x10 + i);
> +				i2c_slave_event(i2c_bus->target,
> I2C_SLAVE_WRITE_RECEIVED, &value);
> +			}
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> &value);
> +		} else {
> +			i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED,
> &value);
> +		}
> +		writeb(value, i2c_bus->buf_base);
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
> +		break;
> +	/* workaround : trigger the cmd twice to fix next state keep 1000000 */
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		cmd =3D TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		break;
> +
> +	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
> +	case AST2600_I2CS_STOP:
> +		cmd =3D TARGET_TRIGGER_CMD;
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled target isr case %x, sts %x\n", sts,
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		break;
> +	}
> +
> +	if (cmd)
> +		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if ((sts & AST2600_I2CS_STOP) && !(sts &
> AST2600_I2CS_SLAVE_PENDING))
> +		i2c_bus->target_operate =3D 0;
> +}
> +
> +static void ast2600_i2c_target_byte_irq(struct ast2600_i2c_bus
> +*i2c_bus, u32 sts) {
> +	u32 i2c_buff =3D readl(i2c_bus->reg_base +
> AST2600_I2CC_STS_AND_BUFF);
> +	u32 cmd =3D AST2600_I2CS_ACTIVE_ALL;
> +	u8 byte_data;
> +	u8 value;
> +
> +	switch (sts) {
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_WAIT_RX_DMA:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED,
> &value);
> +		/* first address match is address */
> +		byte_data =3D AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		break;
> +	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
> +		byte_data =3D AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
> &byte_data);
> +		break;
> +	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE |
> AST2600_I2CS_WAIT_TX_DMA:
> +		cmd |=3D AST2600_I2CS_TX_CMD;
> +		byte_data =3D AST2600_I2CC_GET_RX_BUFF(i2c_buff);
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
> &byte_data);
> +		writel(byte_data, i2c_bus->reg_base +
> AST2600_I2CC_STS_AND_BUFF);
> +		break;
> +	case AST2600_I2CS_TX_ACK | AST2600_I2CS_WAIT_TX_DMA:
> +		cmd |=3D AST2600_I2CS_TX_CMD;
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED,
> &byte_data);
> +		writel(byte_data, i2c_bus->reg_base +
> AST2600_I2CC_STS_AND_BUFF);
> +		break;
> +	case AST2600_I2CS_STOP:
> +	case AST2600_I2CS_STOP | AST2600_I2CS_TX_NAK:
> +		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled pkt isr %x\n", sts);
> +		break;
> +	}
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	writel(sts, i2c_bus->reg_base + AST2600_I2CS_ISR);
> +	readl(i2c_bus->reg_base + AST2600_I2CS_ISR); }
> +
> +static int ast2600_i2c_target_irq(struct ast2600_i2c_bus *i2c_bus) {
> +	u32 ier =3D readl(i2c_bus->reg_base + AST2600_I2CS_IER);
> +	u32 isr =3D readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if (!(isr & ier))
> +		return 0;
> +
> +	/*
> +	 * Target interrupt coming after Master package done
> +	 * So need handle master first.
> +	 */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_ISR) &
> AST2600_I2CM_PKT_DONE)
> +		return 0;
> +
> +	isr &=3D ~(AST2600_I2CS_ADDR_INDICATE_MASK);
> +
> +	if (AST2600_I2CS_ADDR1_NAK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR1_NAK;
> +
> +	if (AST2600_I2CS_ADDR2_NAK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR2_NAK;
> +
> +	if (AST2600_I2CS_ADDR3_NAK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR3_NAK;
> +
> +	if (AST2600_I2CS_ADDR_MASK & isr)
> +		isr &=3D ~AST2600_I2CS_ADDR_MASK;
> +
> +	if (AST2600_I2CS_PKT_DONE & isr) {
> +		if (i2c_bus->mode =3D=3D DMA_MODE)
> +			ast2600_i2c_target_packet_dma_irq(i2c_bus, isr);
> +		else
> +			ast2600_i2c_target_packet_buff_irq(i2c_bus, isr);
> +	} else {
> +		ast2600_i2c_target_byte_irq(i2c_bus, isr);
> +	}
> +
> +	return 1;
> +}
> +#endif
> +
>  static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus
> *i2c_bus)  {
>  	struct i2c_msg *msg =3D &i2c_bus->msgs[i2c_bus->msgs_index];
> @@ -690,6 +1115,20 @@ static void
> ast2600_i2c_controller_package_irq(struct ast2600_i2c_bus *i2c_bus,
>  		}
>  		break;
>  	case AST2600_I2CM_RX_DONE:
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		/*
> +		 * Workaround for controller/target package mode enable rx done
> stuck issue
> +		 * When master go for first read (RX_DONE), target mode will also
> effect
> +		 * Then controller will send nack, not operate anymore.
> +		 */
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) &
> AST2600_I2CS_PKT_MODE_EN) {
> +			u32 target_cmd =3D readl(i2c_bus->reg_base +
> AST2600_I2CS_CMD_STS);
> +
> +			writel(0, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +			writel(target_cmd, i2c_bus->reg_base +
> AST2600_I2CS_CMD_STS);
> +		}
> +		fallthrough;
> +#endif
>  	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
>  		/* do next rx */
>  		if (i2c_bus->mode =3D=3D DMA_MODE) {
> @@ -799,6 +1238,12 @@ static irqreturn_t ast2600_i2c_bus_irq(int irq, voi=
d
> *dev_id)  {
>  	struct ast2600_i2c_bus *i2c_bus =3D dev_id;
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) &
> AST2600_I2CC_SLAVE_EN) {
> +		if (ast2600_i2c_target_irq(i2c_bus))
> +			return IRQ_HANDLED;
> +	}
> +#endif
>  	return IRQ_RETVAL(ast2600_i2c_controller_irq(i2c_bus));
>  }
>=20
> @@ -815,12 +1260,30 @@ static int ast2600_i2c_controller_xfer(struct
> i2c_adapter *adap, struct i2c_msg
>  			return ret;
>  	}
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> +		if (i2c_bus->target_operate)
> +			return -EBUSY;
> +		/* disable target isr */
> +		writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
> +		if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) ||
> i2c_bus->target_operate) {
> +			writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_IER);
> +			return -EBUSY;
> +		}
> +	}
> +#endif
> +
>  	i2c_bus->cmd_err =3D 0;
>  	i2c_bus->msgs =3D msgs;
>  	i2c_bus->msgs_index =3D 0;
>  	i2c_bus->msgs_count =3D num;
>  	reinit_completion(&i2c_bus->cmd_complete);
>  	ret =3D ast2600_i2c_do_start(i2c_bus);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* avoid race condication target is wait and master wait 1st target ope=
rate
> */
> +	if (i2c_bus->mode =3D=3D BUFF_MODE)
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_IER);
> +#endif
>  	if (ret)
>  		goto controller_out;
>  	timeout =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> i2c_bus->adap.timeout); @@ -837,7 +1300,26 @@ static int
> ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg
>  		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
>  		    AST2600_I2CC_BUS_BUSY_STS))
>  			ast2600_i2c_recover_bus(i2c_bus);
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		if (ctrl & AST2600_I2CC_SLAVE_EN) {
> +			u32 cmd =3D TARGET_TRIGGER_CMD;
>=20
> +			if (i2c_bus->mode =3D=3D DMA_MODE) {
> +				cmd |=3D AST2600_I2CS_RX_DMA_EN;
> +				writel(i2c_bus->target_dma_addr,
> +				       i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
> +				writel(i2c_bus->target_dma_addr,
> +				       i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +				       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +			} else if (i2c_bus->mode =3D=3D BUFF_MODE) {
> +				cmd =3D TARGET_TRIGGER_CMD;
> +			} else {
> +				cmd &=3D ~AST2600_I2CS_PKT_MODE_EN;
> +			}
> +			writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +		}
> +#endif
>  		ret =3D -ETIMEDOUT;
>  	} else {
>  		ret =3D i2c_bus->cmd_err;
> @@ -886,7 +1368,78 @@ static void ast2600_i2c_init(struct ast2600_i2c_bus
> *i2c_bus)
>=20
>  	/* Clear Interrupt */
>  	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR);
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	/* for memory buffer initial */
> +	if (i2c_bus->mode =3D=3D DMA_MODE) {
> +		i2c_bus->target_dma_buf =3D
> +			dmam_alloc_coherent(i2c_bus->dev,
> I2C_TARGET_MSG_BUF_SIZE,
> +					    &i2c_bus->target_dma_addr, GFP_KERNEL);
> +		if (!i2c_bus->target_dma_buf)
> +			return;
> +	}
> +
> +	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CS_ISR);
> +
> +	if (i2c_bus->mode =3D=3D BYTE_MODE)
> +		writel(GENMASK(15, 0), i2c_bus->reg_base + AST2600_I2CS_IER);
> +	else
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base +
> AST2600_I2CS_IER);
> +#endif }
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int ast2600_i2c_reg_target(struct i2c_client *client) {
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(client->adapter);
> +	u32 cmd =3D TARGET_TRIGGER_CMD;
> +
> +	if (i2c_bus->target)
> +		return -EINVAL;
> +
> +	dev_dbg(i2c_bus->dev, "target addr %x\n", client->addr);
> +
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +	writel(AST2600_I2CC_SLAVE_EN | readl(i2c_bus->reg_base +
> AST2600_I2CC_FUN_CTRL),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* trigger rx buffer */
> +	if (i2c_bus->mode =3D=3D DMA_MODE) {
> +		cmd |=3D AST2600_I2CS_RX_DMA_EN;
> +		writel(i2c_bus->target_dma_addr, i2c_bus->reg_base +
> AST2600_I2CS_RX_DMA);
> +		writel(i2c_bus->target_dma_addr, i2c_bus->reg_base +
> AST2600_I2CS_TX_DMA);
> +
> 	writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
> +		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
> +	} else if (i2c_bus->mode =3D=3D BUFF_MODE) {
> +		cmd =3D TARGET_TRIGGER_CMD;
> +	} else {
> +		cmd &=3D ~AST2600_I2CS_PKT_MODE_EN;
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
> +	i2c_bus->target =3D client;
> +	/* Set target addr. */
> +	writel(client->addr | AST2600_I2CS_ADDR1_ENABLE,
> +	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_unreg_target(struct i2c_client *client) {
> +	struct ast2600_i2c_bus *i2c_bus =3D i2c_get_adapdata(client->adapter);
> +
> +	/* Turn off target mode. */
> +	writel(~AST2600_I2CC_SLAVE_EN & readl(i2c_bus->reg_base +
> AST2600_I2CC_FUN_CTRL),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL) &
> ~AST2600_I2CS_ADDR1_MASK,
> +	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	i2c_bus->target =3D NULL;
> +
> +	return 0;
>  }
> +#endif
>=20
>  static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)  { @@ -89=
6,6
> +1449,10 @@ static u32 ast2600_i2c_functionality(struct i2c_adapter *adap=
)
> static const struct i2c_algorithm i2c_ast2600_algorithm =3D {
>  	.xfer =3D ast2600_i2c_controller_xfer,
>  	.functionality =3D ast2600_i2c_functionality,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_target =3D ast2600_i2c_reg_target,
> +	.unreg_target =3D ast2600_i2c_unreg_target, #endif
>  };
>=20
>  static int ast2600_i2c_probe(struct platform_device *pdev) @@ -930,6
> +1487,9 @@ static int ast2600_i2c_probe(struct platform_device *pdev)
>  		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL,
> I2CCG_DIV_CTRL);
>  	}
>=20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	i2c_bus->target_operate =3D 0;
> +#endif
>  	i2c_bus->dev =3D dev;
>  	i2c_bus->mode =3D BUFF_MODE;
>  	if (!device_property_read_string(dev, "aspeed,transfer-mode",
> &xfer_mode)) {
> --
> 2.34.1


