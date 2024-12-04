Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D19E4778
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:08:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Wph1qd3z3gBs
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=185.132.180.100
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733289881;
	cv=fail; b=jS7n3aT4ocEGqN279DFqpjuAZFCbRF3Rqgn0bnHZiKn3d0p74SfQEc4flITE3sDXMqLiAGoUU6YeLOEN34t6JLaveyt9xqi05KrROSz0XDGk470vbNBWIxsa33YtnVKD8NszymHc3f+nR5AbmhiZkNwXdFY9fMbhHQfhdR+vxatigd3j5TBGL4QwbewItPVQggapabvsqcPrPEcszorJGuiM+eLnTm4wISQrbuqCeOnRNYiBJUhbAXh+MJF4OwTQWMdrueLwzhGRhIdLl/FKeEeKligyqYyO75JPtB7kxLTQbRWojTiNxHUqWsEoEu8fTFCIFlwbKKzlEQAmhEOdBQ==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733289881; c=relaxed/relaxed;
	bh=ZEHMGo2vNfZNk77rXe2okqxAKikFvS9QADrYy8Jwp8Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W3sS6Udp+jW1QTkWoZ9OhdEXZ1uJLAfRtKjsvPvegveZYveRi06mFLAU8sByhhoZH4OE7BJ38xUpu5zlL2nsD0L1KEoD/aaxmm4WE4Xc3E1HE9IYMXHYRsiFEOpWacSf6AV0hliOdW1z3KRKwxVLclZA1Q7IM2JAVdPtgDGXQ547wQrdd77AnLSxibjq1lJkCjwXjit1eUWiFjs/sdtTIOue2sRPgf+jUxYvD5sfjcD/8FmPPVvDoUa9W0cow1zyzgu8SOR0sfl6zbiFQlF32sV5vZG8Fws4t+pujJlcmbbnNnauadm96HvaXxM1NMvGQQgYhKCy8IGQLF9cf4zL8g==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=flex.com; dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=PmbHpT8t; dkim-atps=neutral; spf=pass (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=2068dae523=jacky.lee@flex.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=flex.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=PmbHpT8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=2068dae523=jacky.lee@flex.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2420 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 16:24:38 AEDT
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com [185.132.180.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y35Yf2hWyz309W
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 16:24:37 +1100 (AEDT)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
	by mx07-002d6701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B43j69Z025370
	for <openbmc@lists.ozlabs.org>; Wed, 4 Dec 2024 04:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	dkim; bh=ZEHMGo2vNfZNk77rXe2okqxAKikFvS9QADrYy8Jwp8Q=; b=PmbHpT8
	tJwSPGw/l8NTymbopSUp+z/S+Y7gZtTVtLy9fbDT7V3jg1egFdjDWyIpTMksBhWt
	6IR0aaCUrC/1WgdfvmbFuHZ1jPYXGwLRkTh1AifHtcoU0ZdLLclGzxrwmozBrZe6
	ibIMTVT/tZrA6jvqOAWNY0YupNgraDRretKkCnoIqe4Jaw0JzbApBkj7xeEhrJ0N
	UlNBsUnCfQYoIIbCejNeh9o4hzqrIwkjJfWXNJNN002YcYGvCNIdp8ugZQeqwCin
	2jXvaD3gBVBs89a1sCH2I9XYIOHYe6IThAQQrFTd7PneasUfelqQz9Y9ECoa9CJR
	aU0FfAHxqzR578A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx07-002d6701.pphosted.com (PPS) with ESMTPS id 43a7u51f9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 04 Dec 2024 04:44:11 +0000 (GMT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Xfcoq0pLG1wliDECIxcGorUOUlYgfrVbmJgpCeHLmrRsonSdrIGkZu0h8QUvsquVnzRGinkJgwvcrDkIeQQYmXBK4QKrhcN8Bqz2uGF6ZICjmcm6oEZJZhXqE+x9Oi1Fv4Uy2/fFG2eq2i4IgpkviIRtP9wZ0IjWjJGJARkPN7jsPYUt6yHCu61enZ6JAYgi3tlXbP2Ly7L6me5p7/Y8cY0ChXOR/fqpUZKJvFmxD6kYMcFvEvfWORL3a+MIS8gwFZXG8WAEhWJHyozZXgN3jYZXpXF5D1IPQwoCBFh1wlr37y97fCubND6MgSmlSJzb+37bB+LUEQOlN07KYvIb2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USHMMQhkFpE237f/1GYSU+oUWxHeCvIizIcmQVpe9ds=;
 b=YJOnD23xOYMG2+grO6kOcKVeZ3kKnkoyWQ4OZNADdh21tsAps8+r1Cf+Ps1RzkfWonfDHOV4y75R5K+gzJxWvkxiuqBESyZ1ZQWiUWTqeTUkA1ZDyjoW9butcjVDkCiX2BdZxNtg31agGh8pKAP+wNkJIzKySF/I1hf8TxEVDj4VGSdDUWYNsxeNY9d1ZP6gh1EwFoEl5yUcKY9Tt2P5+cvAE5zXMwmgqdhPf8oVw7TN+y0V2Rb48ZFo3/x9YaOkVgUBhkp2Iau/35Svsd1KSbgAZ1JAESvaItM7qgIlPM3fSRSraX9ygprAJJj0gZ9S96GCiNirrzaAcQcW1o5IJA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.27) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from CH0PR03CA0317.namprd03.prod.outlook.com (2603:10b6:610:118::12)
 by MN6PR08MB10337.namprd08.prod.outlook.com (2603:10b6:208:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 04:44:07 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::4a) by CH0PR03CA0317.outlook.office365.com
 (2603:10b6:610:118::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Wed,
 4 Dec 2024 04:44:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.27)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.27 as permitted sender) receiver=protection.outlook.com;
 client-ip=144.49.247.27; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.27) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 04:44:06 +0000
X-CFilter-Loop: Reflected
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkeWwA+I8KeIH4QyUDW6kG8Vkt9P2fyflhLuUjmURxkVs8JId7Y8HcipdtXgISj6/E77+7tGp4i7I10ZLNcDkDIHXP9zYDftZnpbtj9nKLh5NG3BJvxiGGH1w9t/Yvqo3Dx1hgn8PaCjfUCsygtioVNbt5zCXawysk7jCtGLOE2VezzfAyEUq4g34/1+IYlIuE1sNGXOENcuXRvWzPnx/3iqaRZrnGCzcC16Ei+vVl3uiWKZZc0V66jgBDpOAA+/HrfFtwHe1iA6E6v9cUd+GNMKWBokQ4maDE3RQ32iVRLy3lXs6dl1TI4gLy4IgISvM4thp3+//YRPx9ecMvehOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USHMMQhkFpE237f/1GYSU+oUWxHeCvIizIcmQVpe9ds=;
 b=kIWK9fpczVSKasn9BbOVAp+jmMR9Y0YeDdLqeLYf0SIiwsBtYJ9Pbqrmj4olyk5M3WX9ok8uXZGCXVgXWTml1oHgt4AdPlmqzLh9R6SKOjcGN81hRmggJIXlUo3ttNnTlpKz0y2I5tlkXac0uAh9EiOnQXA3ANT0sj0BJBkix8OlRI4+0TVgpnrLZc2x4Q4MSwAb4bp6xLLNneSOhoJcYTSODMh2SvnlsuLmv0M6Epz53RyS/+9TgoF5JW2A/PEunXXa3ZLC5O/M5bgYc+4CjT+C31VDlSIGBBuZTXu2979wqbOhbZBhjfQXtaVGzCSYPLdOM2SidFkeNDuMrF7dtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from LV8PR08MB9486.namprd08.prod.outlook.com (2603:10b6:408:1fc::15)
 by BN0PR08MB6854.namprd08.prod.outlook.com (2603:10b6:408:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 04:44:03 +0000
Received: from LV8PR08MB9486.namprd08.prod.outlook.com
 ([fe80::f3d0:78b4:9c6a:ed7]) by LV8PR08MB9486.namprd08.prod.outlook.com
 ([fe80::f3d0:78b4:9c6a:ed7%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 04:44:03 +0000
From: "Jacky Lee (TPI)" <jacky.lee@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Help] How to debug 'sometimes the specific sensors get no reading
 after AC cycle the system' issue?
Thread-Topic: [Help] How to debug 'sometimes the specific sensors get no
 reading after AC cycle the system' issue?
Thread-Index: AdtGBxJ5ypD38G4xQpyiyBZ7dT45ow==
Importance: high
X-Priority: 1
Date: Wed, 4 Dec 2024 04:44:03 +0000
Message-ID:  <LV8PR08MB94865788E99E0FC65AB42B119A372@LV8PR08MB9486.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
x-ms-traffictypediagnostic: 	LV8PR08MB9486:EE_|BN0PR08MB6854:EE_|CH1PEPF0000A348:EE_|MN6PR08MB10337:EE_
X-MS-Office365-Filtering-Correlation-Id: e785e94a-cb59-40f3-dddc-08dd141e491e
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:  =?us-ascii?Q?3doAyGG6qcqxL3zVS0T51LNXBHq4yJugqLzq/42i8w0cYVnX88Tx5jhRf5DQ?=
 =?us-ascii?Q?Nu9ybr9UYd4exZPJEjgb48LUqwgxO9ZyALPtB47fNCDwqDIblgD/97okJFK4?=
 =?us-ascii?Q?HdQ5x7SoByiIahTZkuDm5gGujwQp3J0eGItswp6D/6EkYMp0mqltdoXswONn?=
 =?us-ascii?Q?QAbV12m1hmMwo38U65cTXiizVAdFtk0nUDaL9hcSolmLZq9DzPhWtBKYs5D0?=
 =?us-ascii?Q?4UBvl7/c9ZseqrjV4QZ9A5KdAuT0/vM5QrY5437B9XpZM7EU7+ftqcbxNi7k?=
 =?us-ascii?Q?OuQb4rKO5OVIQv58a9Kq5JZ8eK0SlJNQpiBqcTUPOmx/FjScV+rNV3bIfP/U?=
 =?us-ascii?Q?nf+CCAKnJOjSg1lT/Ubs6PGNRj4h8k9iN6ECPd9CMi67hWcEqW50MHbkt6YU?=
 =?us-ascii?Q?RCf16obuJ1kY9xxn4GrBoedX8ILiztCNVj/u+hbBRxYuAu/IsiCmCAzd5qxN?=
 =?us-ascii?Q?xnIRBk6TETr4/vRComFzn8EgcMuBUf0zD54OGHhE00meqpL2o1mx360QqhNm?=
 =?us-ascii?Q?Gy6oPFTtw9+sbpzORpD59Tg7h2wHzpsdk8RGGJnRfU1nXrjayIkidziN79ZE?=
 =?us-ascii?Q?KBHbg6NYos+uTcMtyI9xUnn4cgRX36U5l4N2xxoBkcTh3Dlbw78zA208ueY7?=
 =?us-ascii?Q?4Qiek0uW6Cu4EbwQLN5qO+ptKNsPhh+c1WF3laO+KFYslHf7/YE8L+jrVxzs?=
 =?us-ascii?Q?2cBTPB69DK8TNPVcrJr4dCrqQOzQSEzfo24EFg95dfMT9MRWoe5VihMhH1wD?=
 =?us-ascii?Q?pCtkF/1WyKdkHm7C3Mq70kIVXfFoVeuARolzyCi5EAWYkLXMgJyBLxmiqM0C?=
 =?us-ascii?Q?lR1vgW7Ci/hZVSRxjNQdIITu/T/BryASkKiz0S32E49V7CwTclsFNR4xl00s?=
 =?us-ascii?Q?J357ne67Ej02YS8SJT805JsHI9r9uzkFeMfTc5kqvt7GT3D0FpiwAA3SuBfA?=
 =?us-ascii?Q?Bm4CWqmvHuX/WMfRNdhbdDbHhNY7N8JaGYrrvc7gI/VUAtQOGtuRzmunIZgv?=
 =?us-ascii?Q?7UeTw8fV3/TUd0bqWf/uY8zhi/Zx1++CviFqxoInOgRNbG3wJrGUtT625Y3T?=
 =?us-ascii?Q?HtljEzyMRkKSLB/dJsgnKa65+IiCKjUYbPJlQJMct2Lq9E+4MNTBuTm9xT2d?=
 =?us-ascii?Q?4PcLrn6Cw3e/6e+EyoY3LJ0PgYgkhNY959VID01yZBp3LEE7lkUNEEfOrpVZ?=
 =?us-ascii?Q?1LE1G8h9m+ULEY4p9siVBWn4uKkEmlitKKmRkLOqABk7bZYQqh0or6AGLEwR?=
 =?us-ascii?Q?9evGuoD9eC+cNJWMEUjhXu7D5MtvpoU2tr6VJR10gCS4grBKVd//kOTGKe8X?=
 =?us-ascii?Q?9XU6J7RCElf9/2RmjkMVXhz+TExtxPZM02ZGPFdpLkIduSUhLUA230EdWZEE?=
 =?us-ascii?Q?JNGGw41P6bsHEKmTZiraVal+y8nOo8JOLbA29IX4GkmgpU900Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR08MB9486.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/related;
	boundary="_004_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB6854
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	e6e9499c-eeec-4aa0-9b00-08dd141e4751
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014|8096899003|4076899003;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?N7o+D9cA0A8musgfZ+TSmsJC0Waian+1ulsD7vghHWMpC2zPuFV9p3qSK0b/?=
 =?us-ascii?Q?Qi0g0nbQNHwWBuJ0UGRFv92Bsk6NCBBOIWMAwyTXxAeNY1AN5HZMskyNOoFV?=
 =?us-ascii?Q?DUw53rnJAFmNLYD+smAW8BUKKWBCSl8SNOKCESLDJOQaLdLZP5NCZgLA8vrh?=
 =?us-ascii?Q?FKSSiK2Y/u9p/S5RHqEPax6/Yabhe4BSPl0HTlOia5kTJUYar9yw9gg2/Uc4?=
 =?us-ascii?Q?rv1LsX6c9vDdtLcxhGWHYe/qxUiiuNRR2mQVt6isURyw2koq3MCK54Ps0LgB?=
 =?us-ascii?Q?ktmYUYk7ebw5h9nls2a627PDCw/TGMJBIOMciUv4l/uNoDDHoo3nBBF68hgx?=
 =?us-ascii?Q?Vk/O51YAZbnCLKc9aN8nPtMUmemHj14sCp9cuLzoFLnix6JtnzI0EsMbhtj1?=
 =?us-ascii?Q?nfO+hDZqnspp77w9rX/iiFHGy7VjN2uJwKD2++1PpZIItstUaGAy26dzgQS3?=
 =?us-ascii?Q?I5frAZ8eAI4Vh7a5l8De/zcHypjKT5Azi6fspKRBqS//hzqigl9DGE+taXzN?=
 =?us-ascii?Q?mSTa/J2gqpYAQyeM0GFTPYZCz9VQf7CSLfLToQQ5o4GXcDeUnBSjo5dEBLLM?=
 =?us-ascii?Q?ie/4fLw8m1whfwpdT/QhJkCjgxcr3360jCb+neXZ49eC86hCI87WNCB9I4V5?=
 =?us-ascii?Q?jeYt8cZ5TE9IUSnYTKFRhsfPwPJEszbVLEBu1sZnNwtkuW6m40XUvhP1hQLL?=
 =?us-ascii?Q?ARtYlvfYIGY/0+rpzjLEGToPLEHxyf502W45bzHA7+tUui7okmlE0qXNKAtb?=
 =?us-ascii?Q?amYZjrm6iVjDHQfWNc0W+xxSCskSCKZ1pYGEIYvpABSiAVt+5KljsVtswfM/?=
 =?us-ascii?Q?DEiDLbFr2PtdjR7bfs7MUODyNOdn9BG+HdNtvVzrInZ6Y+2ye2tmsj5kRE03?=
 =?us-ascii?Q?5NMRQOaZs1ylwyc1+y3xHqFOvvHr8ocFxnjaczWzL6R6eHftOfU8Te9ACa+P?=
 =?us-ascii?Q?aCBsSDRFrC2fmKFmJX8cGSl24s9dY6Gng8+oev5aPP0bz5/ibgSkfsbfras1?=
 =?us-ascii?Q?g+TZR/qjQSVlz9PCwdZ5+uLj/UduZMlNSSxRVCIG6rzU3rXyL960gh2OaZjp?=
 =?us-ascii?Q?dnC4lnw/GdiFmBUIQ86jzEH1P8sti15yl8znjvUOlCrbVHvi2fhQQ7AWv5/V?=
 =?us-ascii?Q?hdGCJ5nww+ndG5rzRAc4mZaB6VJEqtlUkRNhRIXofSmoU6LX723nGQJsw26d?=
 =?us-ascii?Q?75IVBM/bYt9OdgWHkfJ/n/BvpXZ/Qvk8TRNiwhpG03VviyCq4/XIRYU7+tWR?=
 =?us-ascii?Q?f9/hXeIIRFOhCBsOHzFnQxsT+sYvaLRwkhJFcjHbmXs/sfZ4nR7QaHfMnDlR?=
 =?us-ascii?Q?bCF+QBNWtyl2usiBuFscLWSIrkktduQ0AQjlmEvSRXyIuO3QfAMQA8j7qqp9?=
 =?us-ascii?Q?+Ui0XuzfNScBNJNTw6f++FDtU+bqrcyxcv9OQZ0Joso+xXrmHIm9P0YVkV5o?=
 =?us-ascii?Q?51syQy8mXvADn9YQ15mJss9r4sJjC74F?=
X-Forefront-Antispam-Report: 	CIP:144.49.247.27;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014)(8096899003)(4076899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 04:44:06.1218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e785e94a-cb59-40f3-dddc-08dd141e491e
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.27];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR08MB10337
X-Proofpoint-ORIG-GUID: XJJc98YZoZkklDOzFqqJv3Ko8kAExiM_
X-Proofpoint-GUID: XJJc98YZoZkklDOzFqqJv3Ko8kAExiM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-05_03,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040036
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 05 Dec 2024 09:07:01 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_
Content-Type: multipart/alternative;
	boundary="_000_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_"

--_000_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi sir,

We have an Intel Birch Stream platform, and our BMC FW developer are implem=
enting OpenBMC onto it with a DC-SCM module, the BMC chip is ASPEED AST2600=
 and the RoT is ASPEED AST1060.

We got an issue that sometimes the specific sensors get no reading after AC=
 power cycle the system, the failure rate is about 12%, below is the exampl=
e log:

CPU1_PVCCA_EHV | 00h | ok | 0.1 | 0.39 Amps
CPU1_PVCCA_EHV | 01h | ok | 0.1 | 2 Amps
CPU1_PVCCD0 | 02h | ok | 0.1 | 0.16 Amps
CPU1_PVCCD0 | 03h | ok | 0.1 | 2 Amps
CPU1_PVCCFA_EHV_ | 04h | ok | 0.1 | 3.90 Amps
CPU1_PVCCFA_EHV_ | 05h | ok | 0.1 | 29 Amps
CPU1_PVCCINF | 06h | ok | 0.1 | 1.25 Amps
CPU1_PVCCINF | 07h | ok | 0.1 | 17 Amps
CPU1_PVNN | 08h | ok | 0.1 | 0.08 Amps
CPU1_PVNN | 09h | ok | 0.1 | 1 Amps
CPU1_VCCIN | 0Ah | ok | 0.1 | 255 Amps
CPU2_PVCCA_EHV | 0Bh | ok | 0.1 | 0.39 Amps
CPU2_PVCCA_EHV | 0Ch | ok | 0.1 | 2 Amps
CPU2_PVCCD0 | 0Dh | ok | 0.1 | 0.31 Amps
CPU2_PVCCD0 | 0Eh | ok | 0.1 | 3 Amps
CPU2_PVCCFA_EHV_ | 0Fh | ok | 0.1 | 4.76 Amps
CPU2_PVCCFA_EHV_ | 10h | ok | 0.1 | 26 Amps
CPU2_PVCCINF | 11h | ok | 0.1 | 1.09 Amps
CPU2_PVCCINF | 12h | ok | 0.1 | 15 Amps
CPU2_PVNN | 13h | ok | 0.1 | 0.08 Amps
CPU2_PVNN | 14h | ok | 0.1 | 1 Amps
CPU2_VCCIN | 15h | ok | 0.1 | 255 Amps
FAN0_INLET_PWM | 16h | ok | 0.1 | 29.79 unspecifi
FAN0_OUTLET_PWM | 17h | ok | 0.1 | 29.79 unspecifi
FAN1_INLET_PWM | 18h | ok | 0.1 | 29.79 unspecifi
FAN1_OUTLET_PWM | 19h | ok | 0.1 | 29.79 unspecifi
FAN2_INLET_PWM | 1Ah | ok | 0.1 | 29.79 unspecifi
FAN2_OUTLET_PWM | 1Bh | ok | 0.1 | 29.79 unspecifi
FAN3_INLET_PWM | 1Ch | ok | 0.1 | 29.79 unspecifi
FAN3_OUTLET_PWM | 1Dh | ok | 0.1 | 29.79 unspecifi
FAN0_INLET_TACH | 1Eh | ok | 0.1 | 5292 RPM
FAN0_OUTLET_TACH | 1Fh | ok | 0.1 | 4508 RPM
FAN1_INLET_TACH | 20h | ok | 0.1 | 5390 RPM
FAN1_OUTLET_TACH | 21h | ok | 0.1 | 4508 RPM
FAN2_INLET_TACH | 22h | ok | 0.1 | 5390 RPM
FAN2_OUTLET_TACH | 23h | ok | 0.1 | 4606 RPM
FAN3_INLET_TACH | 24h | ok | 0.1 | 5390 RPM
FAN3_OUTLET_TACH | 25h | ok | 0.1 | 4606 RPM
CPU1_PVCCA_EHV | 26h | ok | 0.1 | 0 Watts
CPU1_PVCCA_EHV | 27h | ok | 0.1 | 0 Watts
CPU1_PVCCFA_EHV_ | 28h | ok | 0.1 | 59 Watts
CPU1_PVCCFA_EHV_ | 29h | ok | 0.1 | 47.20 Watts
CPU1_PVCCINF | 2Ah | ok | 0.1 | 11.80 Watts
CPU1_PVCCINF | 2Bh | ok | 0.1 | 11.80 Watts
CPU1_VCCIN | 2Ch | ok | 0.1 | 82.60 Watts
CPU1_VCCIN | 2Dh | ok | 0.1 | 70.80 Watts
CPU2_PVCCA_EHV | 2Eh | ok | 0.1 | 0 Watts
CPU2_PVCCA_EHV | 2Fh | ok | 0.1 | 0 Watts
CPU2_PVCCFA_EHV_ | 30h | ok | 0.1 | 47.20 Watts
CPU2_PVCCFA_EHV_ | 31h | ok | 0.1 | 47.20 Watts
CPU2_PVCCINF | 32h | ok | 0.1 | 11.80 Watts
CPU2_PVCCINF | 33h | ok | 0.1 | 11.80 Watts
CPU2_VCCIN | 34h | ok | 0.1 | 82.60 Watts
CPU2_VCCIN | 35h | ok | 0.1 | 70.80 Watts
Cpu_Power_Averag | 36h | ok | 0.1 | 124 Watts
Cpu_Power_Averag | 37h | ns | 0.1 | No Reading
Cpu_Power_Cap_CP | 38h | ok | 0.1 | 0 Watts
Cpu_Power_Cap_CP | 39h | ns | 0.1 | No Reading
Dimm_Power_Avera | 3Ah | ok | 0.1 | 300 Watts
Dimm_Power_Avera | 3Bh | ns | 0.1 | No Reading
Dimm_Power_Cap_C | 3Ch | ok | 0.1 | 0 Watts
CPU1_PVCCA_Contr | 3Eh | ok | 0.1 | 34 degrees C
CPU1_PVCCA_EHV | 3Fh | ok | 0.1 | 34 degrees C
CPU1_PVCCD0 | 40h | ok | 0.1 | 42 degrees C
CPU1_PVCCFA_Cont | 41h | ok | 0.1 | 43 degrees C
CPU1_PVCCFA_EHV_ | 42h | ok | 0.1 | 44 degrees C
CPU1_VCCIN | 43h | ok | 0.1 | 49 degrees C
CPU2_PVCCA_Contr | 44h | ok | 0.1 | 33 degrees C
CPU2_PVCCA_EHV | 45h | ok | 0.1 | 33 degrees C
CPU2_PVCCD0 | 46h | ok | 0.1 | 42 degrees C
CPU2_PVCCFA_Cont | 47h | ok | 0.1 | 42 degrees C
CPU2_PVCCFA_EHV_ | 48h | ok | 0.1 | 44 degrees C
CPU2_VCCIN | 49h | ok | 0.1 | 51 degrees C
DIMM_A1_CPU1 | 4Ah | ns | 0.1 | No Reading
DIMM_A1_CPU2 | 4Bh | ok | 0.1 | 36 degrees C
DIMM_A2_CPU1 | 4Ch | ns | 0.1 | No Reading
DIMM_A2_CPU2 | 4Dh | ok | 0.1 | 36 degrees C
DIMM_B1_CPU1 | 4Eh | ok | 0.1 | 36 degrees C
DIMM_B1_CPU2 | 4Fh | ok | 0.1 | 36 degrees C
DIMM_B2_CPU1 | 50h | ok | 0.1 | 36 degrees C
DIMM_B2_CPU2 | 51h | ok | 0.1 | 36 degrees C
DIMM_C1_CPU1 | 52h | ok | 0.1 | 35 degrees C
DIMM_C1_CPU2 | 53h | ok | 0.1 | 36 degrees C
DIMM_C2_CPU1 | 54h | ok | 0.1 | 35 degrees C
DIMM_C2_CPU2 | 55h | ok | 0.1 | 36 degrees C
DIMM_D1_CPU1 | 56h | ok | 0.1 | 34 degrees C
DIMM_D1_CPU2 | 57h | ok | 0.1 | 36 degrees C
DIMM_D2_CPU1 | 58h | ok | 0.1 | 34 degrees C
DIMM_D2_CPU2 | 59h | ok | 0.1 | 36 degrees C
DIMM_E1_CPU1 | 5Ah | ok | 0.1 | 34 degrees C
DIMM_E1_CPU2 | 5Bh | ok | 0.1 | 35 degrees C
DIMM_E2_CPU1 | 5Ch | ok | 0.1 | 34 degrees C
DIMM_E2_CPU2 | 5Dh | ok | 0.1 | 35 degrees C
DIMM_F1_CPU1 | 5Eh | ok | 0.1 | 32 degrees C
DIMM_F1_CPU2 | 5Fh | ok | 0.1 | 34 degrees C
DIMM_F2_CPU1 | 60h | ok | 0.1 | 32 degrees C
DIMM_F2_CPU2 | 61h | ok | 0.1 | 34 degrees C
DIMM_G1_CPU1 | 62h | ok | 0.1 | 37 degrees C
DIMM_G1_CPU2 | 63h | ok | 0.1 | 35 degrees C
DIMM_G2_CPU1 | 64h | ok | 0.1 | 37 degrees C
DIMM_G2_CPU2 | 65h | ok | 0.1 | 35 degrees C
DIMM_H1_CPU1 | 66h | ok | 0.1 | 37 degrees C
DIMM_H1_CPU2 | 67h | ok | 0.1 | 35 degrees C
DIMM_H2_CPU1 | 68h | ok | 0.1 | 37 degrees C
DIMM_H2_CPU2 | 69h | ok | 0.1 | 35 degrees C
DIMM_I1_CPU1 | 6Ah | ok | 0.1 | 36 degrees C
DIMM_I1_CPU2 | 6Bh | ok | 0.1 | 35 degrees C
DIMM_I2_CPU1 | 6Ch | ok | 0.1 | 36 degrees C
DIMM_I2_CPU2 | 6Dh | ok | 0.1 | 35 degrees C
DIMM_J1_CPU1 | 6Eh | ok | 0.1 | 35 degrees C
DIMM_J1_CPU2 | 6Fh | ok | 0.1 | 35 degrees C
DIMM_J2_CPU1 | 70h | ok | 0.1 | 35 degrees C
DIMM_J2_CPU2 | 71h | ok | 0.1 | 35 degrees C
DIMM_K1_CPU1 | 72h | ok | 0.1 | 35 degrees C
DIMM_K1_CPU2 | 73h | ok | 0.1 | 34 degrees C
DIMM_K2_CPU1 | 74h | ok | 0.1 | 35 degrees C
DIMM_K2_CPU2 | 75h | ok | 0.1 | 34 degrees C
DIMM_L1_CPU1 | 76h | ok | 0.1 | 35 degrees C
DIMM_L1_CPU2 | 77h | ok | 0.1 | 34 degrees C
DIMM_L2_CPU1 | 78h | ok | 0.1 | 35 degrees C
DIMM_L2_CPU2 | 79h | ok | 0.1 | 34 degrees C
DTS_CPU1 | 7Ah | ok | 0.1 | 57 degrees C
DTS_CPU2 | 7Bh | ns | 0.1 | No Reading
Die_CPU1 | 7Ch | ok | 0.1 | 57 degrees C
Die_CPU2 | 7Dh | ns | 0.1 | No Reading
T_DBB_U44 | 7Eh | ok | 0.1 | 28 degrees C
T_DCSCMB_U91 | 7Fh | ok | 0.1 | 30 degrees C
T_FIOB_U1 | 80h | ok | 0.1 | 30 degrees C
T_MB_U30 | 81h | ok | 0.1 | 40 degrees C
T_MB_U31 | 82h | ok | 0.1 | 39 degrees C
T_MB_U32 | 83h | ok | 0.1 | 29 degrees C
T_MB_U33 | 84h | ok | 0.1 | 29 degrees C
T_NVME_E3S_1 | 85h | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_2 | 86h | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_3 | 87h | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_4 | 88h | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_5 | 89h | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_6 | 8Ah | ok | 0.1 | 26.89 degrees C
T_NVME_E3S_7 | 8Bh | ok | 0.1 | 27.89 degrees C
T_NVME_E3S_8 | 8Ch | ok | 0.1 | 27.89 degrees C
T_NVME_M2_0 | 8Dh | ok | 0.1 | 44.82 degrees C
T_NVME_M2_1 | 8Eh | ok | 0.1 | 45.82 degrees C
T_PDB_U10 | 8Fh | ok | 0.1 | 41 degrees C
T_PDB_U11 | 90h | ok | 0.1 | 41 degrees C
CPU1_PVCCA_EHV | 91h | ok | 0.1 | 11.80 Volts
CPU1_PVCCA_EHV | 92h | ok | 0.1 | 2 Volts
CPU1_PVCCD0 | 93h | ok | 0.1 | 1 Volts
CPU1_PVCCD1 | 94h | ok | 0.1 | 1 Volts
CPU1_PVCCD | 95h | ok | 0.1 | 11.80 Volts
CPU1_PVCCFA_EHV_ | 96h | ok | 0.1 | 11.80 Volts
CPU1_PVCCFA_EHV_ | 97h | ok | 0.1 | 2 Volts
CPU1_PVCCINF | 98h | ok | 0.1 | 1 Volts
CPU1_PVNN | 99h | ok | 0.1 | 1 Volts
CPU1_VCCIN | 9Ah | ok | 0.1 | 2 Volts
CPU2_PVCCA_EHV | 9Bh | ok | 0.1 | 11.80 Volts
CPU2_PVCCA_EHV | 9Ch | ok | 0.1 | 2 Volts
CPU2_PVCCD0 | 9Dh | ok | 0.1 | 1 Volts
CPU2_PVCCD1 | 9Eh | ok | 0.1 | 1 Volts
CPU2_PVCCD | 9Fh | ok | 0.1 | 11.80 Volts
CPU2_PVCCFA_EHV_ | A0h | ok | 0.1 | 11.80 Volts
CPU2_PVCCFA_EHV_ | A1h | ok | 0.1 | 2 Volts
CPU2_PVCCINF | A2h | ok | 0.1 | 1 Volts
CPU2_PVNN | A3h | ok | 0.1 | 1 Volts
CPU2_VCCIN | A4h | ok | 0.1 | 2 Volts
V_DCSCMB_P1V05_U | A5h | ok | 0.1 | 1.05 Volts
V_DCSCMB_P1V0 | A6h | ok | 0.1 | 1.00 Volts
V_DCSCMB_P3V3_RG | A7h | ok | 0.1 | 3.29 Volts
V_DCSCMB_P3V3_ST | A8h | ok | 0.1 | 3.29 Volts
V_DCSCMB_P12V_AU | A9h | ok | 0.1 | 12.20 Volts
V_HPM_P1V0_AUX | AAh | ok | 0.1 | 0.99 Volts
V_HPM_P1V1_AUX | ABh | ok | 0.1 | 1.09 Volts
V_HPM_P1V2_MAX10 | ACh | ok | 0.1 | 1.20 Volts
V_HPM_P1V8_AUX | ADh | ok | 0.1 | 1.78 Volts
V_HPM_P2V5_MAX10 | AEh | ok | 0.1 | 2.47 Volts
V_HPM_P3V3 | AFh | ok | 0.1 | 3.27 Volts
V_HPM_P3V3_AUX | B0h | ok | 0.1 | 3.27 Volts
V_HPM_P5V_AUX | B1h | ok | 0.1 | 2.79 Volts
V_HPM_P12V | B2h | ok | 0.1 | 12.18 Volts
V_HPM_P12V_AUX | B3h | ok | 0.1 | 12.18 Volts
V_HPM_P12V_STBY | B4h | ok | 0.1 | 11.92 Volts
V_HPM_PVCC3V3_AU | B5h | ok | 0.1 | 3.27 Volts

And our EE thought that it is not a HW issue and request our BMC FW develop=
er to debug it. We have also tried to exchange both CPU1/2 location either =
the DIMM module, but the issue still goes with the slot, not the CPU or DIM=
M itself. Also, when this issue happened, it would be always happen unless =
you AC power cycle the system.

Because this issue only happened with AC cycle the system, it could not be =
reproduced with DC power cycling test which the BMC FW has not to reboot it=
s firmware OS, so we think it is possible to cause by BMC firmware issue, b=
ut we don't know how to debug it thru BMC firmware even the console log, we=
 need your help to provide some directions on debugging it, thank you.

BTW, the OS we used on the system is Rocky Linux 9.4, and the sensor list w=
as captured from the OS thru ipmitool during the test.



Best regards,
Jacky Lee
[cid:image001.png@01DB464A.31816750]
2F, No.6, Sec.1, Jhongsing Rd., Wugu
Township, New Taipei 248, Taiwan (R.O.C.)
Tel(TW): 886-2-89771415
Fax(TW): 886-2-89769773
E-mail: Jacky.Lee@flex.com<mailto:Jacky.Lee@flex.com>

Legal Disclaimer :
The information contained in this message may be privileged and confidentia=
l.=20
It is intended to be read only by the individual or entity to whom it is ad=
dressed=20
or by their designee. If the reader of this message is not the intended rec=
ipient,=20
you are on notice that any distribution of this message, in any form,=20
is strictly prohibited. If you have received this message in error,=20
please immediately notify the sender and delete or destroy any copy of this=
 message!

--_000_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Bradley Hand ITC";
	panose-1:3 7 4 2 5 3 2 3 2 3;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Tahoma",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p style=3D"margin-top:0in;background:white"><span style=3D"font-size:10.5p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:#1F2328">Hi sir,<o:p></=
o:p></span></p>
<p style=3D"margin-top:0in;background:white;box-sizing: border-box;margin-b=
ottom:var(--base-size-16);font-variant-ligatures: normal;font-variant-caps:=
 normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0p=
x;text-decoration-thickness: initial;text-decoration-style: initial;text-de=
coration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">We have an Intel Birch Stream platform, and our BMC FW deve=
loper are implementing OpenBMC onto it with a DC-SCM module, the BMC chip i=
s ASPEED AST2600 and the RoT is ASPEED AST1060.<o:p></o:p></span></p>
<p style=3D"margin-top:0in;background:white;box-sizing: border-box;margin-b=
ottom:var(--base-size-16);font-variant-ligatures: normal;font-variant-caps:=
 normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0p=
x;text-decoration-thickness: initial;text-decoration-style: initial;text-de=
coration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">We got an issue that sometimes the specific sensors get no =
reading after AC power cycle the system, the failure rate is about 12%, bel=
ow is the example log:<o:p></o:p></span></p>
<p style=3D"margin-top:0in;background:white;box-sizing: border-box;margin-b=
ottom:var(--base-size-16);font-variant-ligatures: normal;font-variant-caps:=
 normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0p=
x;text-decoration-thickness: initial;text-decoration-style: initial;text-de=
coration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">CPU1_PVCCA_EHV | 00h | ok | 0.1 | 0.39 Amps<br>
CPU1_PVCCA_EHV | 01h | ok | 0.1 | 2 Amps<br>
CPU1_PVCCD0 | 02h | ok | 0.1 | 0.16 Amps<br>
CPU1_PVCCD0 | 03h | ok | 0.1 | 2 Amps<br>
CPU1_PVCCFA_EHV_ | 04h | ok | 0.1 | 3.90 Amps<br>
CPU1_PVCCFA_EHV_ | 05h | ok | 0.1 | 29 Amps<br>
CPU1_PVCCINF | 06h | ok | 0.1 | 1.25 Amps<br>
CPU1_PVCCINF | 07h | ok | 0.1 | 17 Amps<br>
CPU1_PVNN | 08h | ok | 0.1 | 0.08 Amps<br>
CPU1_PVNN | 09h | ok | 0.1 | 1 Amps<br>
CPU1_VCCIN | 0Ah | ok | 0.1 | 255 Amps<br>
CPU2_PVCCA_EHV | 0Bh | ok | 0.1 | 0.39 Amps<br>
CPU2_PVCCA_EHV | 0Ch | ok | 0.1 | 2 Amps<br>
CPU2_PVCCD0 | 0Dh | ok | 0.1 | 0.31 Amps<br>
CPU2_PVCCD0 | 0Eh | ok | 0.1 | 3 Amps<br>
CPU2_PVCCFA_EHV_ | 0Fh | ok | 0.1 | 4.76 Amps<br>
CPU2_PVCCFA_EHV_ | 10h | ok | 0.1 | 26 Amps<br>
CPU2_PVCCINF | 11h | ok | 0.1 | 1.09 Amps<br>
CPU2_PVCCINF | 12h | ok | 0.1 | 15 Amps<br>
CPU2_PVNN | 13h | ok | 0.1 | 0.08 Amps<br>
CPU2_PVNN | 14h | ok | 0.1 | 1 Amps<br>
CPU2_VCCIN | 15h | ok | 0.1 | 255 Amps<br>
FAN0_INLET_PWM | 16h | ok | 0.1 | 29.79 unspecifi<br>
FAN0_OUTLET_PWM | 17h | ok | 0.1 | 29.79 unspecifi<br>
FAN1_INLET_PWM | 18h | ok | 0.1 | 29.79 unspecifi<br>
FAN1_OUTLET_PWM | 19h | ok | 0.1 | 29.79 unspecifi<br>
FAN2_INLET_PWM | 1Ah | ok | 0.1 | 29.79 unspecifi<br>
FAN2_OUTLET_PWM | 1Bh | ok | 0.1 | 29.79 unspecifi<br>
FAN3_INLET_PWM | 1Ch | ok | 0.1 | 29.79 unspecifi<br>
FAN3_OUTLET_PWM | 1Dh | ok | 0.1 | 29.79 unspecifi<br>
FAN0_INLET_TACH | 1Eh | ok | 0.1 | 5292 RPM<br>
FAN0_OUTLET_TACH | 1Fh | ok | 0.1 | 4508 RPM<br>
FAN1_INLET_TACH | 20h | ok | 0.1 | 5390 RPM<br>
FAN1_OUTLET_TACH | 21h | ok | 0.1 | 4508 RPM<br>
FAN2_INLET_TACH | 22h | ok | 0.1 | 5390 RPM<br>
FAN2_OUTLET_TACH | 23h | ok | 0.1 | 4606 RPM<br>
FAN3_INLET_TACH | 24h | ok | 0.1 | 5390 RPM<br>
FAN3_OUTLET_TACH | 25h | ok | 0.1 | 4606 RPM<br>
CPU1_PVCCA_EHV | 26h | ok | 0.1 | 0 Watts<br>
CPU1_PVCCA_EHV | 27h | ok | 0.1 | 0 Watts<br>
CPU1_PVCCFA_EHV_ | 28h | ok | 0.1 | 59 Watts<br>
CPU1_PVCCFA_EHV_ | 29h | ok | 0.1 | 47.20 Watts<br>
CPU1_PVCCINF | 2Ah | ok | 0.1 | 11.80 Watts<br>
CPU1_PVCCINF | 2Bh | ok | 0.1 | 11.80 Watts<br>
CPU1_VCCIN | 2Ch | ok | 0.1 | 82.60 Watts<br>
CPU1_VCCIN | 2Dh | ok | 0.1 | 70.80 Watts<br>
CPU2_PVCCA_EHV | 2Eh | ok | 0.1 | 0 Watts<br>
CPU2_PVCCA_EHV | 2Fh | ok | 0.1 | 0 Watts<br>
CPU2_PVCCFA_EHV_ | 30h | ok | 0.1 | 47.20 Watts<br>
CPU2_PVCCFA_EHV_ | 31h | ok | 0.1 | 47.20 Watts<br>
CPU2_PVCCINF | 32h | ok | 0.1 | 11.80 Watts<br>
CPU2_PVCCINF | 33h | ok | 0.1 | 11.80 Watts<br>
CPU2_VCCIN | 34h | ok | 0.1 | 82.60 Watts<br>
CPU2_VCCIN | 35h | ok | 0.1 | 70.80 Watts<br>
Cpu_Power_Averag | 36h | ok | 0.1 | 124 Watts<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">Cpu_Power_Averag | 37h | ns | 0.1 | No Readi=
ng</span></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe U=
I&quot;,sans-serif;color:#1F2328"><br>
Cpu_Power_Cap_CP | 38h | ok | 0.1 | 0 Watts<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">Cpu_Power_Cap_CP | 39h | ns | 0.1 | No Readi=
ng</span></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe U=
I&quot;,sans-serif;color:#1F2328"><br>
Dimm_Power_Avera | 3Ah | ok | 0.1 | 300 Watts<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">Dimm_Power_Avera | 3Bh | ns | 0.1 | No Readi=
ng</span></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe U=
I&quot;,sans-serif;color:#1F2328"><br>
Dimm_Power_Cap_C | 3Ch | ok | 0.1 | 0 Watts<br>
CPU1_PVCCA_Contr | 3Eh | ok | 0.1 | 34 degrees C<br>
CPU1_PVCCA_EHV | 3Fh | ok | 0.1 | 34 degrees C<br>
CPU1_PVCCD0 | 40h | ok | 0.1 | 42 degrees C<br>
CPU1_PVCCFA_Cont | 41h | ok | 0.1 | 43 degrees C<br>
CPU1_PVCCFA_EHV_ | 42h | ok | 0.1 | 44 degrees C<br>
CPU1_VCCIN | 43h | ok | 0.1 | 49 degrees C<br>
CPU2_PVCCA_Contr | 44h | ok | 0.1 | 33 degrees C<br>
CPU2_PVCCA_EHV | 45h | ok | 0.1 | 33 degrees C<br>
CPU2_PVCCD0 | 46h | ok | 0.1 | 42 degrees C<br>
CPU2_PVCCFA_Cont | 47h | ok | 0.1 | 42 degrees C<br>
CPU2_PVCCFA_EHV_ | 48h | ok | 0.1 | 44 degrees C<br>
CPU2_VCCIN | 49h | ok | 0.1 | 51 degrees C<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">DIMM_A1_CPU1 | 4Ah | ns | 0.1 | No Reading</=
span></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&qu=
ot;,sans-serif;color:#1F2328"><br>
DIMM_A1_CPU2 | 4Bh | ok | 0.1 | 36 degrees C<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">DIMM_A2_CPU1 | 4Ch | ns | 0.1 | No Reading</=
span></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&qu=
ot;,sans-serif;color:#1F2328"><br>
DIMM_A2_CPU2 | 4Dh | ok | 0.1 | 36 degrees C<br>
DIMM_B1_CPU1 | 4Eh | ok | 0.1 | 36 degrees C<br>
DIMM_B1_CPU2 | 4Fh | ok | 0.1 | 36 degrees C<br>
DIMM_B2_CPU1 | 50h | ok | 0.1 | 36 degrees C<br>
DIMM_B2_CPU2 | 51h | ok | 0.1 | 36 degrees C<br>
DIMM_C1_CPU1 | 52h | ok | 0.1 | 35 degrees C<br>
DIMM_C1_CPU2 | 53h | ok | 0.1 | 36 degrees C<br>
DIMM_C2_CPU1 | 54h | ok | 0.1 | 35 degrees C<br>
DIMM_C2_CPU2 | 55h | ok | 0.1 | 36 degrees C<br>
DIMM_D1_CPU1 | 56h | ok | 0.1 | 34 degrees C<br>
DIMM_D1_CPU2 | 57h | ok | 0.1 | 36 degrees C<br>
DIMM_D2_CPU1 | 58h | ok | 0.1 | 34 degrees C<br>
DIMM_D2_CPU2 | 59h | ok | 0.1 | 36 degrees C<br>
DIMM_E1_CPU1 | 5Ah | ok | 0.1 | 34 degrees C<br>
DIMM_E1_CPU2 | 5Bh | ok | 0.1 | 35 degrees C<br>
DIMM_E2_CPU1 | 5Ch | ok | 0.1 | 34 degrees C<br>
DIMM_E2_CPU2 | 5Dh | ok | 0.1 | 35 degrees C<br>
DIMM_F1_CPU1 | 5Eh | ok | 0.1 | 32 degrees C<br>
DIMM_F1_CPU2 | 5Fh | ok | 0.1 | 34 degrees C<br>
DIMM_F2_CPU1 | 60h | ok | 0.1 | 32 degrees C<br>
DIMM_F2_CPU2 | 61h | ok | 0.1 | 34 degrees C<br>
DIMM_G1_CPU1 | 62h | ok | 0.1 | 37 degrees C<br>
DIMM_G1_CPU2 | 63h | ok | 0.1 | 35 degrees C<br>
DIMM_G2_CPU1 | 64h | ok | 0.1 | 37 degrees C<br>
DIMM_G2_CPU2 | 65h | ok | 0.1 | 35 degrees C<br>
DIMM_H1_CPU1 | 66h | ok | 0.1 | 37 degrees C<br>
DIMM_H1_CPU2 | 67h | ok | 0.1 | 35 degrees C<br>
DIMM_H2_CPU1 | 68h | ok | 0.1 | 37 degrees C<br>
DIMM_H2_CPU2 | 69h | ok | 0.1 | 35 degrees C<br>
DIMM_I1_CPU1 | 6Ah | ok | 0.1 | 36 degrees C<br>
DIMM_I1_CPU2 | 6Bh | ok | 0.1 | 35 degrees C<br>
DIMM_I2_CPU1 | 6Ch | ok | 0.1 | 36 degrees C<br>
DIMM_I2_CPU2 | 6Dh | ok | 0.1 | 35 degrees C<br>
DIMM_J1_CPU1 | 6Eh | ok | 0.1 | 35 degrees C<br>
DIMM_J1_CPU2 | 6Fh | ok | 0.1 | 35 degrees C<br>
DIMM_J2_CPU1 | 70h | ok | 0.1 | 35 degrees C<br>
DIMM_J2_CPU2 | 71h | ok | 0.1 | 35 degrees C<br>
DIMM_K1_CPU1 | 72h | ok | 0.1 | 35 degrees C<br>
DIMM_K1_CPU2 | 73h | ok | 0.1 | 34 degrees C<br>
DIMM_K2_CPU1 | 74h | ok | 0.1 | 35 degrees C<br>
DIMM_K2_CPU2 | 75h | ok | 0.1 | 34 degrees C<br>
DIMM_L1_CPU1 | 76h | ok | 0.1 | 35 degrees C<br>
DIMM_L1_CPU2 | 77h | ok | 0.1 | 34 degrees C<br>
DIMM_L2_CPU1 | 78h | ok | 0.1 | 35 degrees C<br>
DIMM_L2_CPU2 | 79h | ok | 0.1 | 34 degrees C<br>
DTS_CPU1 | 7Ah | ok | 0.1 | 57 degrees C<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">DTS_CPU2 | 7Bh | ns | 0.1 | No Reading</span=
></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,=
sans-serif;color:#1F2328"><br>
Die_CPU1 | 7Ch | ok | 0.1 | 57 degrees C<br>
</span><strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&q=
uot;,sans-serif;color:#1F2328">Die_CPU2 | 7Dh | ns | 0.1 | No Reading</span=
></strong><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,=
sans-serif;color:#1F2328"><br>
T_DBB_U44 | 7Eh | ok | 0.1 | 28 degrees C<br>
T_DCSCMB_U91 | 7Fh | ok | 0.1 | 30 degrees C<br>
T_FIOB_U1 | 80h | ok | 0.1 | 30 degrees C<br>
T_MB_U30 | 81h | ok | 0.1 | 40 degrees C<br>
T_MB_U31 | 82h | ok | 0.1 | 39 degrees C<br>
T_MB_U32 | 83h | ok | 0.1 | 29 degrees C<br>
T_MB_U33 | 84h | ok | 0.1 | 29 degrees C<br>
T_NVME_E3S_1 | 85h | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_2 | 86h | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_3 | 87h | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_4 | 88h | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_5 | 89h | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_6 | 8Ah | ok | 0.1 | 26.89 degrees C<br>
T_NVME_E3S_7 | 8Bh | ok | 0.1 | 27.89 degrees C<br>
T_NVME_E3S_8 | 8Ch | ok | 0.1 | 27.89 degrees C<br>
T_NVME_M2_0 | 8Dh | ok | 0.1 | 44.82 degrees C<br>
T_NVME_M2_1 | 8Eh | ok | 0.1 | 45.82 degrees C<br>
T_PDB_U10 | 8Fh | ok | 0.1 | 41 degrees C<br>
T_PDB_U11 | 90h | ok | 0.1 | 41 degrees C<br>
CPU1_PVCCA_EHV | 91h | ok | 0.1 | 11.80 Volts<br>
CPU1_PVCCA_EHV | 92h | ok | 0.1 | 2 Volts<br>
CPU1_PVCCD0 | 93h | ok | 0.1 | 1 Volts<br>
CPU1_PVCCD1 | 94h | ok | 0.1 | 1 Volts<br>
CPU1_PVCCD | 95h | ok | 0.1 | 11.80 Volts<br>
CPU1_PVCCFA_EHV_ | 96h | ok | 0.1 | 11.80 Volts<br>
CPU1_PVCCFA_EHV_ | 97h | ok | 0.1 | 2 Volts<br>
CPU1_PVCCINF | 98h | ok | 0.1 | 1 Volts<br>
CPU1_PVNN | 99h | ok | 0.1 | 1 Volts<br>
CPU1_VCCIN | 9Ah | ok | 0.1 | 2 Volts<br>
CPU2_PVCCA_EHV | 9Bh | ok | 0.1 | 11.80 Volts<br>
CPU2_PVCCA_EHV | 9Ch | ok | 0.1 | 2 Volts<br>
CPU2_PVCCD0 | 9Dh | ok | 0.1 | 1 Volts<br>
CPU2_PVCCD1 | 9Eh | ok | 0.1 | 1 Volts<br>
CPU2_PVCCD | 9Fh | ok | 0.1 | 11.80 Volts<br>
CPU2_PVCCFA_EHV_ | A0h | ok | 0.1 | 11.80 Volts<br>
CPU2_PVCCFA_EHV_ | A1h | ok | 0.1 | 2 Volts<br>
CPU2_PVCCINF | A2h | ok | 0.1 | 1 Volts<br>
CPU2_PVNN | A3h | ok | 0.1 | 1 Volts<br>
CPU2_VCCIN | A4h | ok | 0.1 | 2 Volts<br>
V_DCSCMB_P1V05_U | A5h | ok | 0.1 | 1.05 Volts<br>
V_DCSCMB_P1V0 | A6h | ok | 0.1 | 1.00 Volts<br>
V_DCSCMB_P3V3_RG | A7h | ok | 0.1 | 3.29 Volts<br>
V_DCSCMB_P3V3_ST | A8h | ok | 0.1 | 3.29 Volts<br>
V_DCSCMB_P12V_AU | A9h | ok | 0.1 | 12.20 Volts<br>
V_HPM_P1V0_AUX | AAh | ok | 0.1 | 0.99 Volts<br>
V_HPM_P1V1_AUX | ABh | ok | 0.1 | 1.09 Volts<br>
V_HPM_P1V2_MAX10 | ACh | ok | 0.1 | 1.20 Volts<br>
V_HPM_P1V8_AUX | ADh | ok | 0.1 | 1.78 Volts<br>
V_HPM_P2V5_MAX10 | AEh | ok | 0.1 | 2.47 Volts<br>
V_HPM_P3V3 | AFh | ok | 0.1 | 3.27 Volts<br>
V_HPM_P3V3_AUX | B0h | ok | 0.1 | 3.27 Volts<br>
V_HPM_P5V_AUX | B1h | ok | 0.1 | 2.79 Volts<br>
V_HPM_P12V | B2h | ok | 0.1 | 12.18 Volts<br>
V_HPM_P12V_AUX | B3h | ok | 0.1 | 12.18 Volts<br>
V_HPM_P12V_STBY | B4h | ok | 0.1 | 11.92 Volts<br>
V_HPM_PVCC3V3_AU | B5h | ok | 0.1 | 3.27 Volts<o:p></o:p></span></p>
<p style=3D"margin-top:0in;background:white;box-sizing: border-box;margin-b=
ottom:var(--base-size-16);font-variant-ligatures: normal;font-variant-caps:=
 normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0p=
x;text-decoration-thickness: initial;text-decoration-style: initial;text-de=
coration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">And our EE thought that it is not a HW issue and request ou=
r BMC FW developer to debug it. We have also tried to exchange both CPU1/2 =
location either the DIMM module, but the issue
 still goes with the slot, not the CPU or DIMM itself. Also, when this issu=
e happened, it would be always happen unless you AC power cycle the system.=
<o:p></o:p></span></p>
<p style=3D"margin-top:0in;background:white;box-sizing: border-box;margin-b=
ottom:var(--base-size-16);font-variant-ligatures: normal;font-variant-caps:=
 normal;orphans: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0p=
x;text-decoration-thickness: initial;text-decoration-style: initial;text-de=
coration-color: initial;word-spacing:0px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">Because this issue only happened with AC cycle the system, =
it could not be reproduced with DC power cycling test which the BMC FW has =
not to reboot its firmware OS, so we think it
 is possible to cause by BMC firmware issue, but we don't know how to debug=
 it thru BMC firmware even the console log, we need your help to provide so=
me directions on debugging it, thank you.<o:p></o:p></span></p>
<p style=3D"margin:0in;background:white;box-sizing: border-box;font-variant=
-ligatures: normal;font-variant-caps: normal;orphans: 2;text-align:start;wi=
dows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;t=
ext-decoration-style: initial;text-decoration-color: initial;word-spacing:0=
px">
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#1F2328">BTW, the OS we used on the system is Rocky Linux 9.4, and t=
he sensor list was captured from the OS thru ipmitool during the test.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif">Best regards,<br>
</span><b><span style=3D"font-size:16.0pt;font-family:&quot;Bradley Hand IT=
C&quot;">Jacky Lee</span></b><span style=3D"font-size:12.0pt;font-family:&q=
uot;Tahoma&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><img width=3D"89" height=3D"43" style=3D"width:.927i=
n;height:.4479in" id=3D"Picture_x0020_5" src=3D"cid:image001.png@01DB464A.3=
1816750"><span style=3D"font-size:12.0pt;font-family:&quot;Tahoma&quot;,san=
s-serif"><br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,sans-=
serif">2F, No.6, Sec.1, Jhongsing Rd., Wugu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif">Township, New Taipei 248, Taiwan (R.O.C.)<br>
Tel(TW): 886-2-89771415<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif">Fax(TW): 886-2-89769773<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ta=
homa&quot;,sans-serif">E-mail:
<a href=3D"mailto:Jacky.Lee@flex.com"><span style=3D"color:#0563C1">Jacky.L=
ee@flex.com</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_--

--_004_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=6557;
	creation-date="Wed, 04 Dec 2024 04:44:02 GMT";
	modification-date="Wed, 04 Dec 2024 04:44:02 GMT"
Content-ID: <image001.png@01DB464A.31816750>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAFkAAAArCAIAAACcg7MyAAAAAXNSR0IArs4c6QAAGVdJREFUaEPt
emmTXdd13Znu+KZ+/XoegG6QAIgZHERaEimRomU5kcr+4LiSqqTyL1x22U7I/IV8SMp2ysk3V8WV
xFI0lCWRFieBGggCaIAAwUaj5+l195vveIascx8AURYt64PjsCp+dav7Defee84+e6+99tqXJkYK
oqkhRlNKOSF4SzQx+E+ppCbXJieUU+oYwjQGasMJZfjVjiD2wFiSG5NLgmGeQxyWGZ1J4rHU0QlT
GBlI7ucUvxsHd6HkU/lijDCCAxNkdnWEwQSYMw6NH6w9CMsJSYnOiJZUa25wKK4lUzgUvrGnwFqw
CGyocBLe4SLMGI7r4a3BiOItfvgUv2ALzI9qQrAqY/9rirf2MNh3ZjgjDiGuNkJpnmuWKZopk+dG
5vinqIRZjFE6y+E0THMYzmhcxNqAwM04zEAKM8Mmn1aPGG4QlRrBgdlLQxT2DrMfWqcwEH4lidJK
CCwuN4gEojRsYzyGCCAudl5LoxTWnzGWcliNCUq8TDu5dF0OD0rhHoQ7hguEGjxDWCf6dDoHxe4q
VtiiAA5hEcBGjSEC8Z8SOjDkKNX7vXR/kLVjmWba5Wy85Byv+zNlpyqoozXGbKdmqxcposcr4Wzg
1AzxbbCo3Lob47CFLIyAC/+9tvh/ZCuaYV8BATYocqoyF56sMXtXUi+lrEPonU787u3tO1utvYR2
cuspLlGTIX+87r586djZqWqJkI2ufP327tLauiLZuRPzL5yaPVXz64Y48BkGj0PwMK6KsPl50LAg
83955QZ++fOvv8sx2XCTCrCDGZBOFE5WlCWUdg291Yy+ef3+t++sXdnrfpDwZRWs6GA5E3cH+qeb
zVv73aY0LaWvbbVe+7B5vWV+uhe9fmftvY2jljQZsBSITJB3LAbZ7ARs/vmV436fnniBy1pTwBCC
UOQ7C3yMSSoGhO4m6u3b6z+4tb7aVT1SSomnkC+p6zCHaeNYaAAoWgTZbWerXdJ2R1tO9X4/W+3E
XQCrzSjF8g3ibpisbb765Xjxi9v4j2asAiiHUGkMPiAjIPmlBk5BVjvp+6t7h6lrRI0ZIeJ4iqpL
df9z07Vfm6y9dHLh6dnRBqeuYUKUJS91FU+EZ0pl5bopdhxrL6xQGGKYRwhyjl2tdcIHL/xoxxYv
+2tx3i++Hoz42L9/cBsh8xd+iplaRzYaeYXSjDL4xUYn2o1ULmqGhY428yH/4mL9dy+N/eunpv7t
c8d+++LsybJfkgQ/aSQSyhBdiASJa9j/1gTIITZNW0IGB0SaKpaNTwWdKz4+fFPQtmJPPgE//hEM
gQljisU+wBvs/yHQI/2ZRJvdfhS7YRyUI868kjh7Yuyli43nF9znZsSlcWexykoYi60s1k9U7jDj
cARZrmQKqlYwlGLtlmsxY7lq4RoIK3uKsVwV2etnh/3+78KPoeGGh3WlT/SeRw720HiFo/3srF/u
ShYvsA5QBxBI0CLF/Yi4KQGnIv00yzmCwwGUup4zMx4er/OqkZ7KaBYJI12snOiUUQ3WgHVJRYxg
zMd1kDzAuAxY69AVgJv4ZMDDE0XyhJguZQeEbmm6rtimYvuGtSmFM8aEZmAxhb8UE7NXkvZ71mWs
zViPMiQ4VdgZYyTuij/F3YrhVCuqCM2td5OY0jahXUrxJqMUpscULaEsjuIu9hjaFyCIrAEalOOO
QMGYe01C+4TAFkS4WZ6SJAU70ETg9vAb2KWvROqUE+Zg0lh7DIauc4F6hTClvVx50lgykYGT4u4E
Nrbm0ErGWT/WSZ/oTamvddLvb/f+13L7v3949Jd3Dr+1cvTOVmfpKNlKdUeTyJCI6MQkyoDlKjjp
dqKuHvbf3e/cbMdNZTAgNQZ1T2pUqnIpM9RDJtU4VI5z7BW6hOwoc72TvrtzdHO/3YyzGPxYKcQy
tgjQjvnjwHuYAy/++6/8oabg0URkRHLngIsf77evbXXXDtXSdmenk6e5oxhnLgMsRirb6PRWe8ga
SU8a1xMEttDkzm7/5m5vYEkl86k6OVZ6cqY6JmRQ0HFpuATtZKzDxIb0bh2RdzY637uz+4M7+++t
d25tdG+vH32AY6t19yjaSsDlXS4YAe0zMCnmKY5y8uO15nduLL+7srXRGjAvrFY8pGsglaCCU65z
WfB8zBRVJByH9ijZkWSpGX/vxtqV6x9u7+xzxsfrNWETm31ZRBjWTZZqW3Tgv/fKH4CDu+BCmSXR
V3aaf3n99lsfgVxFW13TS1GUOjnjMTUH/fbdnZ2lrd1bu90PNg4OO4NqKRypeFqZpe3e0n5/gDxL
SUjlE2Olp2cr48wEtrzh8KCEsy6h6zl7c1V9/eraG8u7dw6jncQMcp5kNM1oX7LdJF/uJXdbg719
8FhRrvqBg3IJXi3uHfS//f7yj7Zby0jYrV4nUQjaasUVMAAYLWGgwgyRwXMiNOKwT/m+oT/eir5z
ffPdj/Z223EUJWkUTcEYJR9hDFr1wAS2ZASU2cxma1FrFJSUxkEqvXF/4+ZeczM3awPZM2GqPbgU
yIdiXls5OzHfTvz7Hbp8mN3d7mwfRrlCaMk4AQrYhISQExqWJZ6hni3JOKhKxNiBNsuR/O6t3jev
7r232dtJaMQEwkfoNNCpkyVUSozsCm+HuD/ZG3xraf2N5f2dlCbUiwxrpflOP21Rf1Ce3ODVN3e6
//PG8pX1/f1MI0L7GbYDlTIylcSG9pja0eTdrfjbN/bfWRvs87GkMndoyuut5DDOtMDuwglAIOwB
yl0AfIEXcDDrjqi5mS3A/MCHg1oSRTmiTnOOKMDuAD9EosoZCwc6GOgqMi31A1ZcGD9zVmCSBTQB
kq6NR0DLbKEHGIZH3I+yd1a2X791726zndr6Xld5fmrU/ezCyFcuzH7+5Pi56dJ0hVXA8pRMvGCp
2f3u0vJPtg72JI1Qzrh+OQyBCommutRoOfWre8m3ri5f3Tw6gr7CaZZLrZDZgZR8JSPv7HS+eWPz
p+uDLq1Lb6SnAGq80hjzw1AhBLEsIhlBHYbKo+CAhS34v3/1VQQkNwx5L+FUVEuJoSEPxyvjrSTJ
BQoQ4KLjU70Q8oujpdO+t+gFZ+ojzy5MXl6o18ocKLXUHNzcGyTgY8bUiDrbCJ+aq44Kmzp6hO0R
DOi/fuvunYM4EwEnacOVzx5v/OaF+S+cHH/6WO38fPXEfK0ShlnUH3S7/cwAX5Ic3CYdGx0ZDVzP
FYY7rTjvZirSXLJQAr8HcRpllSCcrXklJGxiIuata+eN3e43rq9f20mxZYq4nOaeGpwcC1+8sHB+
tlqjymfKserMMCAsjSgQhPBX/vg/IGTgB/AAlNiB7xwbrV+YGXtsptrMsp0BJgaz6VGhv3iy8S+e
nnxxof5rC6PPnhg5O1OarHI4VVeTG83Brf1BCrFD6wqRZ2CLY7UaZ6k0HWPux+q7S/eubTW7PDCO
A494/uTMbz157PJ4uBjyhktqPquUnMl6MFkt9Q96O52eDL2cqDhNAiFOjtdqDp+qBqHntNqdbj+n
rCK1B5486LQrlJybHfGtbkJ3jXhto/X1m9uA54GuGOm4Oq2Z7ulx78uXj392sTbhmiqVQHeOfGox
1Eax/VvQPJSPFqqtIMWUS7NRkp126CXffcLnU750WAQRA0nT4/FYII/XxGN1jmNxREwENAD5eMBk
HhJGyyof5Gz7TvCBYR/tdJf3Oj3iJiRntHdqbuSFM1Pn6+4MUXWdVkgckrRK1JxHnxkvf3FxZrrk
ai1jKo6Us3wQ7UfapeRYwF483vjambkLFa/c77sZSbSX8jClTkeSrmG7hL+13v7enaMPDsAJqiiS
XRVPivjSmPjNc9PPHStPeqZMcqFjZjJbgg5J5sdoLniSZZoFNZOcZIFJank8muu6JCWdOCZh2uob
jEKsiTnD3y4TPSQHUB4GVjIMtUeKleXXiEKbwBGLiMtuqm+v7u50kpwHnkMnyvTcsZHFhhcoU6I6
oMrB/Eju0SwkajZkzzw2cXJm3OMALyel/nYr3jmIoRGFMjvm5C8/NvGVM7NnKm4tixwABRICd0DP
2sz8cLPzP95bfW+z38tCrlwvHYzS3plR8tWLMy8/Vjvhk6pKgUdWfLJklA2r5o/TXFzLZhQQSBsi
mD+8AEoD1w6UK0NcRYWBEgPfwflSkjQ3saSAsAw02qYfgA2A17LrYQ0Gs8EWYIogQgTUoxVlOwe9
RLmKBDJVVdebGK1hCREhA8oPJGsbr2dc5OO+tl+6FT42NuE5JSirID2DJD9og3yBU+ZMDsY9/flT
oy+emVgMslk3rTn5zHSYeuT15b1vXFu92Yz62gczZL12Q/cuzXhffKLx/Ik6PK6sslDnDrRa5C8K
KigUSLZVHoclkWVbEDStNglXRyYAdwG5iR0WuwybBdFaKAdCHWRM3IAbZA2kGNch4FjAJPsReQS5
EbawetWwUijEUku2CUkM6URpggAXoTIe51Xm1Lc6/If30zfWktc2s++vRn+zGr2xNriynby9Ff9g
O/tJUx7AF6WLrVESnFV3o0EEqug43EUZmNU8emrcO1UzjwfZV557bGa+8uP7zf/9/r2bB9GAlSlx
WRpXZO/shP/yxdkXTk9MCFPSeZVTDxw8BbWGx7moKGEOrLxIp0MujqqJ2W+wnaCHSDcJ2DtnHc4G
SDtQ/KRgWmAQ18LVbmD8kFR8U/aM7ypPaPCcwtU+5nDQb+AwCB6YA+kryqAT425cKXCNkfsH/Bs/
2vivb9//0yv3/+Mbd//8p1t/8vb9P3nz3p+9de9P317+z29/9Oc/XL26cpim1OM+zoFVojiOcpJQ
kVEXHQowgrHAnBwTL54bf/LEyPLG4WtLy/d6WZcEOfYszwHzlxbGX3py8dKxkYZDfBRQ1uXh/tD8
rSFyewhMyW6fZQIPSkJriQeiE6CDoajwbH4tvN8WGAZSblFw2hp7KG5D+kXqLGKiCDgrdmtbk1uu
LsHZQLcd2BRqIK5j6wSUcUUNxZSIBuagk7RysyvVR4P+vTRbSbKVfrbSStePkvVmvN2M+93YV3mD
qko+8LMenB42zUBVNHe5N+LwuRp/6szkqTPHb623r9xc3evlA0lymQc0K6v22Sn3S0/OLo77h82D
PlithR4GTojpC8fWjY9ElYe4PwR7i5tYCzZXaZtzPU68QNOQqqENGC9SjoUB1FgPazuLK4UoUUCP
7YzApJDRsXhwIZA0EPoCoMHRHG4hCX4o0F2J+mWdQjQ+PsJnK2phjE2PqNkGn2s48zVxqh6cq4bn
y97ZEedk2ZwK5YW6uDBRPj076jtWG4Oe5jEHnlgK3cZ04+p697WlneWDeAD/RSVt0hEWnZ50X7o4
/fhUsLHVvHJr9VAJwJBEW4KjtjRZlkFSsQBXzK0gFw+kN/sB1R5HKQ3Oxph1HhBjlSjhrUv2X95e
/+7dzmGO0NXTbvK7lyf+1TOz0xb5bYep0LfRFmPrmflv72/8xY2tvgxByCuh/PWz4//mqePn0RNQ
4MLd//Tm0q0urFNylFocL33h8txinbl5js8or5iLt5bu+IyBvGMusYF6YotwwFXVMTNVb9JzQsye
0kjTPiPbiXl/s/Odq6soalDpS1BFGdeZvDA99vzZxRMTleXVw6s3bkGz/JdfevbZUa9OCDgFyVBa
pq5fosJHtY0SH5aAyzJLGnB/CJeFMGIFvsLhC1kaby2SSpyAoCq+tAoPyLWVtjUQDEWHbSRAK7DN
NIwEGuS5yDKRKjQSWArOiZ5AqM10GI5gMyU4L6oUCgmg6pmLE97z0+HL46WXx4KXRv0XJoLPTgSf
GfeemXA/M+V8flq8MO8+Nx9cnimfHgcvoCWT+DSHnNEzZjUzb2z2/ura2spRlHAvF6VE0pLDz07X
v3Rx/vx8ZWOv/+a1lRt7/fWU3t7rtHMT2S6PZZS+hwVnTKXIrIhzSyZsRfbAS2wn54HuU8R8Ub1a
s8BGyK45ymELrdZeticIn4d5MHJoiwfIU3QeLXVRGjZk1tJFq0UGTDdKfG685gmDlNgXZK3f/3Dv
sJcbnxpfZmABoYwrJgtIJgyKYpC6jJPcITpkpERNSCR4h4ddtTmatJT50WrrOzc3rh1EO1L3FZG5
GaH88vTUP7948uL0CFXm3tbhZpS3ndpGxN/8YPvKcms/1wkXKcLIQXvLSpKAZKT+IQ0vxEfbSB7q
4ENzWO8Yao4259rUWKhDoLcc60PZ9LCbUaTkR/okzuDKcaXHwQ+h7QDMtU20SCMIpMCjJ0/MjNRd
6ucZ1al2Vza6H9zrHUUsh9YhKsaAVRY1JhExcY6MWE/F7cNk9SiOJO7D0cFJNPivsx2rq6s7b974
8PbW/oA7CQzM1Lggn50c+9qJmecmylO2xletpNU1OcZHqrxyqL+9tP7WWm8lJUcUFAbwjRK/6Bw/
YkQPezYFggzNUbyGYWKNUuQJK8sJmjmwCPjzUAKyDegHVY2lm1bGhBWYCqgOicFfV+AoxljdC/R5
2p+b9EteAudwRbh5MPjetZU3Vts3B3qDunvC3adOk4gtLe7E9N2m/ov31v/stet/9e6tu7udWGMn
/AELtjJxZe3or6/eu7PTNo5vA5ybMpcXRpyvPt74jWPhCWEqWpc4Kfuq7CPnw4P9ZupfO1Jfv7n5
1lp3W5IOc2OOnr+Va5AX/lZ3gv/hK6+gbV44PEREewfYFkJZT7PrW/2PjqIYzJmTEsvPToYXZ6pg
M0VrHvIoQkKBgnU1vb0vl3ayiAfUcZHPL0zUL09VxtBepAy5UCKXhMFB+6DXTbIMWVa1VfpR+2g9
TpuM7cp8C2l1kF3djV9fbn7/7s77e8nGURT1exWHTY+OQD1rZuTtjw6/dW39dkv1eAm2oDKrOfpi
I/ydC8e/vFieokBHSgVV2HOHtbtRq5NG0k+dUsT54aDf6XYqgTta9W1yRDTY/S8eASgwwpIIwMYf
vfpKwb6tTyAd2n4fSBZ0cMKXNlsf7rUGNlyyupAXpkoXpqoVe60iWixNBYQwNBZvNZPr+/0+esvw
DZmcb5QvTZUbDnOLyENWLXui5LhpN4+6eDADjuYeSXPvqHN7c+/O+v7Svd1ry/vX1lof7EVrPdza
lUlU1fETU9XTsw3hiLvN+K9vbL23PeiwqnZCQHpFy8vT9a+enfvCfGVGaB/U34KzcRkbK/ll1+8N
8mZk0K+ReCIEHCfqsjyeblTr8Bn0kIe1edEwtbYoVD/7zIH9avhAAJR8iyjaA7AZE6jUT7tB0ha9
QzftuVDPgKAF2Ub1D0UGi7QMwoZ7THTHFZFHQJOSQCFgbAUEhVooWVfmtCN+fW7ya6cXnpudmHKE
yEGfgkzUWipcOchXmmBZ6X5L9hNUYQFJ4umSePKx2fPHp0ZB9zVp95JmN9IidL0yzTQa109Ojf32
mWMvzo9MOvDOnnEy+DZMX1NqwZgX58e+dmnh8nypxgeuHHCZmCzuddpZlg+SdGVza31nvxMhtwwL
hwdci/+7V1/F4m3z0Ko5LM9z1CJAIKT8zXbS7PRVHIU6Xax6zx5rnB0vl0hmYwSylw0UZA0ChX63
318/2I6Ttp8NTgbu5+bHzkxAV0QeA2hDQWc+Hs0RrD7iV0bLECdhihw6FJ5kgcWFAOTZi0G1dUTV
o+ca3kuPTXz5/LGLkxWIIECodpqvHXQ7gwEqijpJn5pr/LMLsy/MhxMCYIhCUSL4IT8AsF0k7yxz
Oa/UAuG5aRol7UN3cDDJs7PjlSdPzPE03l5bl1leCkol34cAUzxjZLUM/sevvoLUUvAvhkdwZJ66
4GkqJdzNsQmO70u50Kg/tTjzzPzorI+cGoFI2tG2G5Sj8wHmzQPuoCWSdedK/ouLxz+3MD4ZMFSD
SFwIEfvwhXUj43I1UiLHxqsLEyOzI2HDFaNUN4QZd8yUzxZG/HMzI08fG3n59MznjtcfrzlVLbnK
Oee+72GrZNIdd9RTM/XfODfz3Fw4AcEFmhvyAnfwIAxESja8IbMdPOHwWtltlPxAy2lHP9EIP7M4
c2Z23AfG5aocliqVitUz7cbac20SgG5a1FA2gmCLNO5XRK6zKHerO7yy3jeddoT7jVW9udDUzQBU
l4sAz+jgKhqtCVRfPOwR3YyitXYCCr8QVuc94ZIs87LE3sYtG8/BHTBT1Ub3SPHygPgdLQ4i04kz
JaGbIA+RwHXKgRu4DPENzS5AspXI6SrjVhDaTiTCxEjd8P3jtbAMlFQpkjYUcWwGOD6eb8CTILbT
bR9vEKgDUmq6iq13sixNSkRPV8N6ycUVcmRp+KDroNZGrSOIAspYgEAL9UGtXeAcnrFxYFaFp5Ec
9I3gf0O6gX6FB2TSoEMgX2CeRT6Cn1tBzEHPEYIFBHlgqme1X6RTKJIafSq4h0ugHxbQbBJwVBs0
8GW4je0k2uw8rFyGTQqbh0E2bAloVRWchbIAnWpIeIB1+yBZ8ZQLJgpNxdbEttQu0iOeIwH3s50p
3BMk2XaqEcOQDmzvA8qIZRVF/iiaIw85RKGGFyLfMKn8rdcj/lVIxA8HFDRsKIsNGdkDalLgT9Eg
HzKUh789ks+GQx+NH44aDh5e/2MDit8K3e3jX358Go9+esQOHt33E5fxy59F+fhdPtEWP3fNX/G5
ll9x2C/Y/RO6xP+wD3T96hOzvPOfXkML/JMtfuYJf3+M/P/jNf8HFrkGi7wRhw8AAAAASUVORK5C
YII=

--_004_LV8PR08MB94865788E99E0FC65AB42B119A372LV8PR08MB9486namp_--
