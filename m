Return-Path: <openbmc+bounces-1215-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B05E3D38C5C
	for <lists+openbmc@lfdr.de>; Sat, 17 Jan 2026 05:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtPPT03pDz2xP9;
	Sat, 17 Jan 2026 15:48:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768625324;
	cv=pass; b=HwDffheNk+NyYRtlbpkGsBY3KQ5mq6kvHtwT2Id6GgQi32SKRkPFCzM55oESVj2Jizp4q7nkXxjtg/wRNHBthbhlFqdOcbRJZxdwfgWyxC9l02cMk2hAEwC81Ny1H1YeU4EgqqLGyVaJnamMvLY+MMGRB5LDMFRIVtmQw58gUEioZQaxxNvxvsEVyCgSHDHGAVtYlq5HQzo1TWgw2e9jMBdDzm/x55QXX4EsBJOPsMGQdtGmWG7gITBYBEIsawbQH4UPVdROplvcz9vkVGEkA7ZPZMyqUeS8brToNPSvy/xlaQf5s9uu1DIZqImx8S0CMFcwRhiLuPaPPeE3aTygLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768625324; c=relaxed/relaxed;
	bh=lUhLlSdAlz3YVdYZup0Q0JUHLW370MUlcaI2EaX//UE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VHgMSwCejROrq+C/fXHgbZ46eC2tFVW3v2EZwQRTnMfefpjnAu/dYAUM5ArBiFx8hCE1k4bOEHCYvU83e2NIhF6HPQUnyd18UC4UG2lC2Rt22QUvn+CF8uhbkXlbdOLzbMoePQybDJ4rJxjQGyQ7oKfV8SuJwofEc5Z1zfyJQqQ0+o3xjUHKu/y/6Df5haiFbPOsRhdZaHFtBaO5jdzyex0GSxQDTwNOwU1BM9JmvuLKrIqpV0ZFqXnMThMZfa5ilYYrAQzCyAVyd0sIc5/56sP8Aw0X/mAc7w5iGYIMOoII0M/zxiid3P/zbMAKmDZ/QAtjd+4Y4DCQu1Z7tfp5xg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=loOlUdno; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=loOlUdno;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtPPR2b93z2xC3;
	Sat, 17 Jan 2026 15:48:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM3QPW/ptGjsBE+rj9e1L8PkhOu5Jt84JG+aEbdCaRXQZMO5O+LV/nz6HgB0lIvoLxidSCrnZ3WvReI6z2SnaiwYSxBnISrVIIMzKTqo2CXS8cYiPULp1HFmLAyvvWNrBRK6mOMy1G+mm56bizvPS3rYgrwe2Twe5vr9631gvH6WUtld9EC/a7ZCa17Q2YkhzcMofEPJhZdEIXC8+8AUi19mnYEygPKJAID4ZF7sG/CCccfqxJT9jn9/pp8VMHf8Evzdbg0QZGmwWuHX6NudIRlJTUfam5sviMsSMVyoDb/wolslQj5LY1n0kTzh/6rEzw9PHcM4fqZi9T0utKrDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUhLlSdAlz3YVdYZup0Q0JUHLW370MUlcaI2EaX//UE=;
 b=oBsAn43aCQptDjuYsnLJkMSdKU9yAUM7bXBBLAlJbYMPS09RROddV3KpAtaRPnfRZsQZ6ZZjMTcodhUN2UrLVXT/sN0A/aUGOwC5Cv1SQ8qltzn4YEK21JxR6lvuhGjtzaXHyRjwkY1duobbOicE0OFI2rspvmG8SEyEiWYdbqrGsn9W47YAdnnQ1l99uwqQrBy1t7XpVQpZIOfrTcwrLQ9LThoKi8uNID64bYWYi731NzclpyYfX1t3n5ZrPy06VrABlNRc5G8i3VTypR1W/pCFDJM30T9pF0VcOtTNVlzYjJtOe10FWAqmRjL+MTcilPz63QCOrfpmTOiiYWn4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUhLlSdAlz3YVdYZup0Q0JUHLW370MUlcaI2EaX//UE=;
 b=loOlUdnoc95ww0AWzNWkWrRTDJBt1r0LwNOdBxG8y8LmeiyRu3WSQiU4uyVArZe5RmtYR0HQwm8v3ZINDd1G8YWIsv9kk2hfo3lkIc6EJvxN+ylwjSNs/TM7q9zE2S82Swt676OL2zG0TCCwGuFadwV1x1F6jJC9uZzw0rPK0xv8Spf8FjL35jcfdR2+Cak1oSkVuxjuctjuyoZ8eZr9I8GF3n5Z8iLpQM68dPmvrHFg2c2yZ7lJj4uUFf6OhWH/mZKxVSbEmET1p5gOMmf7+qrkZ1Oiudddsn4C3+5cueWgqcwj/Go4EWqLgqsTRnHXvn/WeTVT8VlWUGGHW5ttMg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Sat, 17 Jan
 2026 04:48:18 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 04:48:18 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Mark Brown <broonie@kernel.org>
CC: "clg@kaod.org" <clg@kaod.org>, "boris.brezillon@bootlin.com"
	<boris.brezillon@bootlin.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Topic: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
Thread-Index: AQHchjBRO6Hlmfd2eU2DMR3RJEQgSrVThciAgAJGLiA=
Date: Sat, 17 Jan 2026 04:48:18 +0000
Message-ID:
 <TYZPR06MB5203DC69FD31B7550F86DE3FB28AA@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
 <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
 <1adf54a9-56f5-4fc4-bba2-837a132fd123@sirena.org.uk>
In-Reply-To: <1adf54a9-56f5-4fc4-bba2-837a132fd123@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYSPR06MB7068:EE_
x-ms-office365-filtering-correlation-id: 5ff7b775-e250-45f9-9c45-08de5583a266
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JomvGh8kcjn2CcheT3ZmTt4mAo6KPQzrXXAF9OzqsI/GN8KcFRDHEETqr8i5?=
 =?us-ascii?Q?5792Zhq7Vzu+249xysrLV5Yht+H3hegPIoNrWx4CQ3YtgrZY1NJnCwjobV4G?=
 =?us-ascii?Q?PzO48P5NxKQYf1cmV/0ojLpii04b/hS2lawcT0eYxu7gAVuEffdG61fUMV/u?=
 =?us-ascii?Q?RnuvpB0oNxRx+Q2kRLFUgmRMG8oX0pEdeV53Lrti/iPyxMzxNr4wBySgxMvO?=
 =?us-ascii?Q?E7dxhJFgBPLTqzJfMg863l63A9kIfl1wsbJ7dBiwxtHXfooL/T4CmQEy2IKj?=
 =?us-ascii?Q?9CWdfLsee+2GybdrrKhBJuMfRKlNIwEopGHChxAtJoueA6OwPgaPxqsXOCyQ?=
 =?us-ascii?Q?8A1Ok51hMoXn6TPrJ3P/J5d+hfyzM0EfqulGv0ZsnI6tTy/hp4w8Sp8EhEEr?=
 =?us-ascii?Q?TIA51BR+ugp1N/x8ML/COOoXzOh9O+LGQBB/zVzbYBunb3cGevsVujTejHlh?=
 =?us-ascii?Q?YFvmvrmCyTyfthC0mY8BqtH6R/SJcX8zCe/9ChcWbQzsfvvxyc8D/waYBxZT?=
 =?us-ascii?Q?11WwEWZle3rt663QJQFOC8Avi7QpraCMiCjGdojRpXwqxZEDmX0Hr30cQEye?=
 =?us-ascii?Q?BQCdSRRE7yjL2QNI0Q2MgH8dRX+ScvRaTPc4t/R6+IgIoqG2+bfU0XXkB4RR?=
 =?us-ascii?Q?wvr4Yl7HtIIoANWlvcDIVxoVQNzcLuaP3Md1291kZdOGYhwNRIhhzHO/bzMM?=
 =?us-ascii?Q?hI5Uy9xktk+RAc+ziOCCyvDc+iIINhWVKat/Lri2BMrIq7TMKdz7FnYqQjhX?=
 =?us-ascii?Q?3EpjrbX/8lyP7vXIqksYXJO/UwtzgN25yR46U1gvdoHy1X5ATcyw92HTEg9e?=
 =?us-ascii?Q?DzUcpfzznCn/ix91LNPxwxYhbUCradV1FRfrHXF7MzvubwM7K2nEFkd1uWdk?=
 =?us-ascii?Q?GWgOuAtry8hca/nnvZWzAvnt/cx0fQc7Oue7LLgyUNCKXIPHztUBaMXk4lVs?=
 =?us-ascii?Q?e6hwJ0DVAT2yYdybh8cJoPLQ6v56UueJLF/VgU+vKUiKsvvJdVvPYj4CGozF?=
 =?us-ascii?Q?9uVKBNFLOqXjd4fp9OU02MFCNi51lZyMerHsPpwlulbGpBCj5/4RFe92ykAN?=
 =?us-ascii?Q?cu/NUjne90liZLmK+HzTaiA6Dh4GRT6FnmflfmfGdmEfcV+6re6E/AQQSfXS?=
 =?us-ascii?Q?af1omOysvni2/TGbH8u1wENWDV/+WdirHIGO9EygdDxmuQsejOR7mzkt7Q0Z?=
 =?us-ascii?Q?RMs6X394sNG/G6sHmJZALMKEAFL5+sfl6DnjK7T0suPrk3b/T0mOgK4GRahY?=
 =?us-ascii?Q?/wllVHck6mPNvyjmBx+cLvyn+toMajpRnKJ5wA2IQsyU2DDWvRup8M1wNLPN?=
 =?us-ascii?Q?+2ogCVwzjbFZk19qbZYpfZ45T/sN7unzZbqglxUJC8v9xS5QTBwFcEqdBPap?=
 =?us-ascii?Q?+A4kYmEY1IBbX0xhIeb3+MtI6qzDhmALE0qyXfEm3Zbdxmsid9dXfNMBHSfP?=
 =?us-ascii?Q?F3VnqCtrfGEy7ymmDR6v+jCEaCHnK/wpmouad1Ieiy/JFWquH7pZluQIjGUf?=
 =?us-ascii?Q?cVEzfMr9JFQBwkb675w2xy33VJhz/T4yzMRUoYjUsQL6GT5mIvaAlqU7PqWV?=
 =?us-ascii?Q?lfM5uNMHTYK6xqJVeqOJ3FlM5TSSaUALEi2tciJwiwOORBQCiMxSpTKet3kj?=
 =?us-ascii?Q?LlTVznvdT8+Ph1DSM6Ws1K0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VcO1xeNHvvQ9rO/kTh2GppkIiABxqAXEcEYdkbQyRl7tRXQa9hjCbeVKwj5A?=
 =?us-ascii?Q?9imzd9mCcwsPSbSQRHzwZWnGty6FB3+xYMglATA5eUqRWleZ9aS8vrwTBtsa?=
 =?us-ascii?Q?vKDzq96+YNYkszegHigF0rBkfFbGuyC2Su+FjGCdsy4N+kjXpzOh/zq5sS7H?=
 =?us-ascii?Q?DyUdgaXXUB4nc0yzs2WPWXVmcR1Z9OoEYm3m1KDgKzWT72A8+STD4NTSvSnh?=
 =?us-ascii?Q?wS/bps6r3VY8yl0maaDdcf2GztDI/pmnT/AtKrKYQwUEN2ZyQ+3c4KSmI65l?=
 =?us-ascii?Q?BHGkOdihZOrY7bJeQjJP5BgY2+EIUczFbbLz1WaRgGHMD80qz4CyhAjovsiF?=
 =?us-ascii?Q?bV2RSb+aWBmpxxXWLW7WPQn1fdULmiOLF6hfDmaSLYS2k4lPUHW8dijxO5Zx?=
 =?us-ascii?Q?8gUd46bwRE36Hln5rpPCEmbfbKDaZGH8Jqb2xcZ5eOWRNhm/j+lDrBGzENzn?=
 =?us-ascii?Q?0/I/Sy+vFnmSMwNXbaIfgjKdlK90u/RBdqTP0u9Um2Fbb1r5HOMt/SyqZfcj?=
 =?us-ascii?Q?QXe8pQAmrrH7W/jiOQMv81MwRsHcPmEJmzNa/wvCZuL3uD/a2J22mcHqGi2A?=
 =?us-ascii?Q?hkNHcgySFF3n8l0ONhSuPyfYFh/e58FG8zFMxTr2XnEeOnA9GQw3xvhD1WgE?=
 =?us-ascii?Q?3fk3tKQgI55Y1qMNGAiJnFr0YJQqjQDE3wE2gDmrUk1IZHzSd9/79haA9NKD?=
 =?us-ascii?Q?QjwH50Ez/bM3XtG1ls+fBxLMCtqjDniVHhRbYyxo0elUj8UCNl7dKmlq7EQI?=
 =?us-ascii?Q?mtohSLvsSss1P6epbsrRLS34W2uHkGTgCvJ9RBQK/6iY73sN6wKdrNGFvtm+?=
 =?us-ascii?Q?iz1iwQ1hcy/5Lz0tR0QZHx7an5tGnLdqOiql+wV+57hL5jchPXKPePpbiwYf?=
 =?us-ascii?Q?A5XWyydq21i3BFpGqBb9NOgrR0zBUKyBF/pOIV3rZn8rGPmZaNmp8AY2Ujkf?=
 =?us-ascii?Q?AyPTvdifOYoqn0s7aiDW6QrHE3DAuwP4fs+syrAiaILjJDcy6uJ5rqZQR7CH?=
 =?us-ascii?Q?h11hfkvQPXNrzvcsC+CGOQKCS98BbK4t/wHl97i1xJTWUkfHR37JbJQgDpS7?=
 =?us-ascii?Q?W9NutxaxPQk+FIooOk8hCshL70C/XocxGpT61GC90zs0mNvTzxpmy7CqmqLv?=
 =?us-ascii?Q?W/rtynAww2oingHh+mtZLzVDsaOU/ETJiyRO5I+XaUDKi3ovWUvf2kUaEpMz?=
 =?us-ascii?Q?BedttfgOuS7kM6cLwzxE6rCzLcl7OD5sXjsj0FVwqe8+KFAsxMYFJTrOSmGo?=
 =?us-ascii?Q?l30Fj50SwR2tVwYybXXV1hZbFWGEoWW4M0cQgPt5HuNqOtSzLColMmna7jtw?=
 =?us-ascii?Q?vQtwE/cJao7mD4Twy/xj/JNhzl6+kdzZMc4HEqBPN9ZlrOSED08EzfWwnx45?=
 =?us-ascii?Q?jod+eFaAMvxFsVe/ufQ9O/chQcXEZYk+VsPpCzplMKdEB60GNeM06JQ77pJM?=
 =?us-ascii?Q?qQoCDTkxw3sI0sM18tGUF8Hh90uBdA7VujSHV3tADNRirqvctAutc9qVqjjK?=
 =?us-ascii?Q?fRXFXgg4AmnCQv7peedocrVdwyA+W/K3m0W3n6X5iBS8R/vNU+N0b6yGEFrX?=
 =?us-ascii?Q?AKs/nkZphA1CXgX9Ysi53hWLOm+f989hr8ZICbdGFnwZkKtxiTPSj3zdGAAR?=
 =?us-ascii?Q?b3VXPgaMyg7GwRsB5R8h1aKz/bMzcQHM+5FvTXhzjG4hOSNV85LMJGcrJOGE?=
 =?us-ascii?Q?2bfPTukDcW8Ibbg3esaeNOLhuqg2cWYIusuv16oD13Y12ZP1KrLul8JhzrWe?=
 =?us-ascii?Q?iKPQFgrHM6aDz8pkX9yfimyIz7NVFDU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff7b775-e250-45f9-9c45-08de5583a266
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 04:48:18.6800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBBGNkNXQhx90flawaPGVZwp7j9M+9jwZ8RAXrw2qyLzFrvI130prAeOGirwFyQzJcNECwFFPTCOZPa+cR/LUsUWSzhJgyKMsuvMYDPkD6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7068
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mark,

Thanks for the review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, January 16, 2026 2:02 AM
> Subject: Re: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
>=20
> On Thu, Jan 15, 2026 at 11:04:54PM +0800, Chin-Ting Kuo wrote:
>=20
> > +static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
> > +				    struct spi_message *msg)
> > +{
>=20
> I'm not seeing anything here that won't work with transfer_one() rather t=
han
> transfer_one_message(), that would reduce open coding so if you can do it=
 it's
> preferable.
>=20

Okay, I will change the implementation to transfer_one() in the next patch =
version.

> > +	ctrl_val =3D chip->ctl_val[ASPEED_SPI_BASE];
> > +	ctrl_val &=3D ~CTRL_IO_MODE_MASK & data->hclk_mask;
> > +	ctrl_val |=3D clk_div;
> > +	chip->ctl_val[ASPEED_SPI_BASE] =3D ctrl_val;
>=20
> This should fit with the prepare_message() callback.

Okay, prepare_message() and unprepare_message() callback functions will be =
created in the next patch version.


Chin-Ting

