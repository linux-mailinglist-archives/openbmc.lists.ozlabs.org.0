Return-Path: <openbmc+bounces-1369-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNzkOR1MkmkLswEAu9opvQ
	(envelope-from <openbmc+bounces-1369-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:41 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6C13FEAD
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDgsz367sz30FD;
	Mon, 16 Feb 2026 09:43:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770966634;
	cv=pass; b=EeX35iRCo6JQO0chWuZ6GwsPwphJktIcwqRNJCOxxYRZzYGhj9y5C9g1OltYzIighah+SLDrtee2Zt3gPs9AL6gxvc0PUVcJyBZNDaxG/KinQpw4u0znzZPWNtaAdmgJas3ISgZyjCL+ZBZ0Q5tGqsqJPmWA/MwNxSdgz7dr9ggDouubFcLui0JNZCCiEJIbzPLTi6G6dUwOl587CjJxzlenm2yw1KwmZCV1k6JP8wVypA/P++BGBPNE4F5Z8xrBqLnlIGGpSjEsBPceAHpNKYXdioH0tbIQkZVukXsg5uBO0zFlulSGGRaK7CHmJjgwSN4+rzeAfO52f/+QfZnIBw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770966634; c=relaxed/relaxed;
	bh=QwkYJaSuexYDq6xw9TdLOgp+XNTCmGPtSmGEXtdxGOM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M6VlDYftdbSKFsXiq0gZUmA2i8ME/uOw1jr6gaEdrE/wW7JVBGc3mApgFy44wklXPAG0d7hU8m3ZOD4c3SpqUNkDHBkQjt4Nz8T6QZF1b2w8cDVU+qP+uOserp3vf4ryLWw47SRiXcCZOl0nCWMsbnrGIMfPWwrnjXVKvbMt7t0b//pDfhrTogDctIC6Y0y9kINXbYDwUE1sbS8/UmTAscXY5Dj5o5CR+3irPTCZs492FBfDFH/3JBEP5mINinMzRRCABQ2g0tdgu7eVKmMrfO8eXIl8rsbnxaTWGD1qMdSSbMGfg7SuienmBjBGhGFOBYOtrPFXhTf/VHTC2+klhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iXyOUm1R; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=iXyOUm1R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC3Gc6QMTz2xdY
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 18:10:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ygd/8N13FBJortAByA4+CLuMYEP84C4MnPnCYOB7QXw9nCUwiDHYfvuMqFAFTi4VHBPMhreQZJR9AGnOYsZf6+EaqlykcSycp7Tv8V1TPayuCwRGCH9GSC64L9d5BvVPh3RE+dPdNdhLJPhxWDg6SJt5pPYJZqxSNMyn4P5efvKRAM1FreMBlsSYd7q2ntJ/xBtrEOB71VQZGPMAuRzrOzoS0r2i0XsVfg9LQ7LgKfL4e+GdSNH1YvtOboLY18uxKBd9UVApORm2gdN1g0GL5xOdjLMc/3wCvhussJj6BvDpzfMWJv7cCHRwc+X2G8BNGUrzGpHSF9MpnKBaHGPdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwkYJaSuexYDq6xw9TdLOgp+XNTCmGPtSmGEXtdxGOM=;
 b=JU4UpF8MAUmOXQ8/hPEyCfHGRq4o+JsIuQvK/pM0200Z6l3A/MGzPDwt6x3poS8LeORyX//2Nt7kMLwdgcpwUhaLcrYp4Qx+6YK7Zc0l6bb7T2Mo+IdneucD++PZbaGTjuZqQWtNXKQN1iYcHN9V7JSYk8mR4RvS+tKTTfRiTrG6vPqoteTdvdd/+amskKoCVzaWm+lFyEwuwhQc5DtaFhyek7ciPgGxHnAWc16z4v7Rbxe4HpNWVoCBSx71rzfaFcEF9Sf00cBYXXovsBXnYPtmA5YbAUxKvmAKke9HNuEPvgT4WXY7k2DgSW9BV03h5QS5AMqPVjEq97XI3a7oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwkYJaSuexYDq6xw9TdLOgp+XNTCmGPtSmGEXtdxGOM=;
 b=iXyOUm1R2+d55IFoFhEu42732vZMOLao6qPin2XWt+G8W8Q6hSVxVDwSJqc/bVkj8TuCHb3/1tv+SSm6xRWoZ3Dgr88Q3nAM1+zSUefwEGY2npTwTN6utWVIBCGimGjbXq9x1su8Nr4ijOzH4b73qE6jhW6HoQDZ1DqGynXNFgXGb5jIZUXxjFqSZCa9lrFRhlXvp/8p1xpbhjsfm/jXgYj57htoXYNTPTh+/bss0qZfWSUeqrLoIeM4/hDu0w5BW+EUW/mb5AvgyK8x2q3bbPajjihUYMsG0yw6IMDtMXPZc7/CjFjc6G6HuTBMVHEyHmUKecpLj0w8NkIrFglSKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19)
 by BN9PR18MB4121.namprd18.prod.outlook.com (2603:10b6:408:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 07:10:04 +0000
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21]) by SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:10:03 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 v1 0/3] Axiado AX3000 SoC SPI DB controller driver
Date: Thu, 12 Feb 2026 23:09:24 -0800
Message-Id: <20260213070927.1114371-1-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::19) To SJ0PR18MB4479.namprd18.prod.outlook.com
 (2603:10b6:a03:37f::19)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR18MB4479:EE_|BN9PR18MB4121:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b135a2-cbf2-4264-74c4-08de6acee861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D4WeoqGBAWYx4XzaAWAINlXlM5F8Lzx948j/hsaCGqbHkGJE4L3y+qRJHKwi?=
 =?us-ascii?Q?ccSmG/IxOwzzq28wwZYToKX/jKll/60u4/pZY/e/aCl5NMq/UPtWd0rZT5qn?=
 =?us-ascii?Q?NFZJnyVBO/lENZrNfJ0D+HdgUogCYnmxxrY74+1hfKLkhCOzshMCdEUPecvT?=
 =?us-ascii?Q?EJcUseMU+c0izuN3wHV8+fOkByTtXYw3KXz60sEgWNEsYfw6YZ1RB++35sGB?=
 =?us-ascii?Q?TyyeNmzvnYY0EaL1u1u5tc320OdWxcfNIfB8nSBSqHYJdNFii7fXA7T68gLP?=
 =?us-ascii?Q?irMK6uqk6snBEuioUZARWxsDkPa9xtEDSldWVE5uV2TdKFP9IoeicEtj9hXH?=
 =?us-ascii?Q?39rlkwmO2YcAFqUFa2HkAkgWe0KPjRklLDsyvb8rmC79AqjnZHvKx4yB0W2i?=
 =?us-ascii?Q?Kjbqf1j4d7ubeUXXHhCaiyX+Ct0rcanjCMJqaVkv+3oPdQ2CrKVLJZrVdX/k?=
 =?us-ascii?Q?MpNUStNgp6giBMhaNK78U+B0d6lZfMQG4weA9kRrAB6aKtSBdUkxRc0FaJjW?=
 =?us-ascii?Q?ODMD5Tt/viKN3qBTm4eYIbczRyVROAYOwuUINxkXDSxIK1U66zQjJ3LtGqe5?=
 =?us-ascii?Q?WmdJQmR84/wp0sN/WI5nKyLRX2peG86bYUXmHCTrr+ZnuwDPPIUbFvtZ0Zzh?=
 =?us-ascii?Q?ucJCs3OQE11UtlftZEFnr0eDkkdHEJxI1p4Vv+RuAw/5E5r8R6ewXpineMXs?=
 =?us-ascii?Q?E7NI0XMqlBsZtk8Nk4eaiz1DNVEDpldXpY0XChmOAoAA8rl73tmQjLVmblhZ?=
 =?us-ascii?Q?DNE7sNbWLuKFeTkU3rWoNzx76mrKSYLxM+i9ZoQnD0+W4qa3/jO/vJcYFsAu?=
 =?us-ascii?Q?ARE/yUGczeTWhk1T+at5Z208/Mx3wM72kiHQwIlWk0zuBMKG11m6Zb4rnPQ0?=
 =?us-ascii?Q?Bx/d+v3JqQ3UoU8Rg1CTfXn3jnyXw8lh3syMOkZhOXi6Qa6gbIjjwZwZRJr2?=
 =?us-ascii?Q?Tqa6r/t6wZFdZJgSEsm+b/R4UqBO2edRiqVCB9pOI7ANEX6A1B6MGfFm5PQ1?=
 =?us-ascii?Q?Q/l5QbpPd/NMAEyt/r19bv0+yitewnnFKZjWIfTOCRcsIguLkzZAWiE6Dc9e?=
 =?us-ascii?Q?9tc4bHAKiFoRtbkdCg75QdlG6aOAkUAArSwGnR+coeaGizolW4eu6UpeVbF+?=
 =?us-ascii?Q?PLFB352hax4VOjSWY+Q/bSJcLxZ0YUrBTQe5Lh0w1Tx8OQ6h/TOwS5sGEBHO?=
 =?us-ascii?Q?wN0vkL1Hv1cZ2IcewGHpGqBIAJwRUVRh+T3eyKXoSH4zneCUcXInVLeLKiws?=
 =?us-ascii?Q?/IjFQv7sqnujQ3/C8T5Cb4IwI9G1b8i1I9xBzBTAB6F44nfSEI6Qaa7S3W5Z?=
 =?us-ascii?Q?FM2VkI6DXfPrP687TP9J+eU7O7BxFxfSY9/H5A6js7ftK3yGpUYiFxFl+C3T?=
 =?us-ascii?Q?7GzO8K/Zr5aGCsSKS8Bu0H91GrKqaeitJ8Tn0vn6ahkAfqdIL/s2EQEQn6Ym?=
 =?us-ascii?Q?cXOmrO9suYZloJ4bUDejCZkMijoNiMaVCQzYfzQPYGe8AGzTgSjpFuJcR73+?=
 =?us-ascii?Q?b1ZgdKId79Xsr6oZxLiadtzo7bY93QSvf5JFWUnmnWtob57xU+OHvS566Tuu?=
 =?us-ascii?Q?TlY/IcBJwESJbE2SeAU0CRhxVIAkhTJGBX/HkdsDlMkEMr72wg42ZlPIdyXc?=
 =?us-ascii?Q?e+UkBbe4RVgpAhcgGETmQq4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEv9JuFuYf3XED1bJxWYpZW22XLl7A991vDIgiGsiT7+c8PsuT9rvYiXxEoR?=
 =?us-ascii?Q?OM3fVMsqnJgmhZ8vFcwd8mKen1Z6LCqrLV6SPEJitlwUePHzNzCnlaKiRWIq?=
 =?us-ascii?Q?WZ4vrY9NIeQNnNZ2Q94x1ps82J0rYlp2EDS8H7LW+lZa/pbPgDAPWoXcLezz?=
 =?us-ascii?Q?r2uD0zKbH87EX3qA/4AndhDL9Mv0VPqnGkLPqzjobJCtn2JDYraXrsdpcZou?=
 =?us-ascii?Q?rhv+Sio7VnbqWdmU3JFEvVPvEMo1Cowj4ys02fQNN+Nq/YpWaPT/GO2out3K?=
 =?us-ascii?Q?Kf0ohv5WYyqrC9PAbhBHOqQ5s2VKIsc2N8GC6vpfVLplVhGMwEsRSHs44lR6?=
 =?us-ascii?Q?WO6AhDnRMc4HpEFNgsGjWg20LzSwj5FB4nUsSEOVDUEoiew7dWuAf1mNj5ui?=
 =?us-ascii?Q?yBEwQ9tPnPEkttvOriifcvAyzjX/LU93awXejRfNyJcAHTB+hHdrX8JCtFa+?=
 =?us-ascii?Q?PqJnfkeoUdlDqcqr8wxXp7kiqrqeq0Edwfw5D/4hqCLvZXBwZJKQfpeFinWa?=
 =?us-ascii?Q?K9vZU/fUtydZSSotYFYHqSUBsz0/v4q2pR+KU2qbSEkiXRDUvb51ReIrZLrC?=
 =?us-ascii?Q?yjIEQFmvXbo6EXzo38MOShy1wL2S5ifBj/EJdC50WhzjLGqfQZaXRJpzrCwY?=
 =?us-ascii?Q?ejzweod0aT+CHyYP/epIHviEUKSW7ncZ29tNO1CQ2SGqSF6o6zZdAdGX96St?=
 =?us-ascii?Q?GCzDaPkrLbrxEl1tbj/gGG0zkwcwvudqdaXyrzqbETR2QcqPiHCrYg1uMshq?=
 =?us-ascii?Q?9x1axsU4CY9dNlQ0a0REq6CM2dIpLux9q0X8n+/iH5dN69p43AffIsFnpnM5?=
 =?us-ascii?Q?aUMrBAEhqFMons4IWaZcG19qOSIBwsWf9iJkpl7E9iG62PE7AmTmw2MQxT7o?=
 =?us-ascii?Q?9oi0OP+BUMhZC+YzcPYwZxehX1VEJqvVCP3ONH3UNwMl5kcDOGoQ4BNup434?=
 =?us-ascii?Q?zhileiQ3m6DMKPrsp4W810fmdr0PgdRrtt0zlSFAp3Vkk+UlvmqWiFJTiDb5?=
 =?us-ascii?Q?s010zvghMXwsKq8444T4qo9bdlj2j/zMznWMTSRFAXGOEe1a9uR98r9C0gc4?=
 =?us-ascii?Q?rEqOyoR3/Ra1GUn8XhmxoymTtte9pYXmAssKOlBU7DfMZKgVWR8mqQmXDzMb?=
 =?us-ascii?Q?75rohShj780N6izryTeumWt7gsvD0h9LrLJ2NR0qZq+D/tNjkwqWQhhKAUSm?=
 =?us-ascii?Q?bCock2jf1MLVvXXKv7CtXA+cOQQXF/VSgWoNyorUsG+5qcGGEZMnhlR8Y25y?=
 =?us-ascii?Q?LDNZusly6O0BuuzpIPNHK4+YBlaLYNt39plKrtBpNMNMFSJRBMOuOBE2G2hk?=
 =?us-ascii?Q?sFeoZzFgv6Ltwki1mpPnlr6jeZZwEbViymUwRusc3BvJA2f+TCyZiH/fJ+0E?=
 =?us-ascii?Q?744G4tkqQATJvQt0CzFmcptS4bWG71T/CDppk2gFzRXdV6Xy5ONjpiPpJkez?=
 =?us-ascii?Q?JU4yPGZ517pab3UBG6LiYTrQPS0Kuq6mw1Pl01W6Pl+kx9UVe3drfBBEqeiK?=
 =?us-ascii?Q?nusyNaahVGTnLUcZpgfU/3xHV1PGTPidg2s06XMJh1PRlsnruSo2uTZjxEMF?=
 =?us-ascii?Q?2/LZabVbyXAEZbwbCEtszWrU3B0ozrA8SjzP6xkPUISo6bfPBBHPoM17tQP7?=
 =?us-ascii?Q?PYn/RaVrJdhTz3cVd6WHJchF+uJiD7EmTgT0RgJ4yRmPB9atz6HCfwJHN8KU?=
 =?us-ascii?Q?35bQY+DFqdsyjgCDSnqkcJX4zMu2p62aW8u6ejae6TPqUm0l?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b135a2-cbf2-4264-74c4-08de6acee861
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:10:03.5220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBu6z5Hdn7oRpIww9kA4k7TyAIYa3VdKw3vI032NNlBHvBwsWddKJgg0rJxP9wNjN2pW0JXE5hnr7mojrBS/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4121
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	DATE_IN_PAST(1.00)[63];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1369-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kchiu@axiado.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axiado.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:mid,axiado.com:dkim]
X-Rspamd-Queue-Id: 3EB6C13FEAD
X-Rspamd-Action: no action

This patch series introduces new SPI controller driver for Axiado AX3000 SoC and its evaluation board.

The SPI controller provides:
- Full-duplex and half-duplex transfer support
- Configurable clock polarity and phase
- Interrupt-driven

Vladimir Moravcevic (3):
  spi: dt-bindings: axiado,ax3000-spi: Add binding for Axiado SPI DB
    controller
  spi: axiado: Add driver for Axiado SPI DB controller
  MAINTAINERS: Add entries for the Axiado SPI DB controller

 .../bindings/spi/axiado,ax3000-spi.yaml       |   73 ++
 MAINTAINERS                                   |   11 +
 drivers/spi/Kconfig                           |   10 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-axiado.c                      | 1007 +++++++++++++++++
 drivers/spi/spi-axiado.h                      |  133 +++
 6 files changed, 1235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
 create mode 100644 drivers/spi/spi-axiado.c
 create mode 100644 drivers/spi/spi-axiado.h

-- 
2.34.1


