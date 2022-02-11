Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346D4B1BC5
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:00:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxdy1Z8Kz3cBK
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=dmQm+FUu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=dmQm+FUu; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxby2Sg7z30K4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU2bTNo/GD0Ihu/M3MIBSKvz6Pbnc/S91IesnGxP4r3YtMLkhRkqy5Mnoi2J92q6zNvSFm1sheLghIQMBV7qrRScGG/qzNVMoADWcna0ihmxQSXjP8WPfYqHO3IVVOeWV0nWKmsljKBx1Bm0N36dZiHwuAbNNTMszVdvoJH+4ZbcV+hrfmJGUnNweWMcBKwgU4R/Pa+SbOh1jXRbdgwRx0BfzB9wO7sJjvcj/iarJzs81vF64bJc2IhbAwDd03w0ZMWehdurMrtIV4DQOL3zgJ2+EcbOTVfulfB0vQKhTLWDH4awE/+teeYuBosoYnzM3UZyjPT6/CoCcBSYQhxzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USuiXqwkT2aalpWAZYhGx9np6+iRUOMUCiv1gY0IuMk=;
 b=McFGjJ7mTI2WSoF/lEt7CZbScPZmSEJ18rxjuJXdZZE8N84l8jqCWRBER1NFuXSgEJ8hlX8oo1652/9H8TzE4pZM+7LabL/ty8kINrKmbjYEvhxBPPacIa30p06j8VF28rXcvLeNmQxrXss8senNjySH5GzaXWipwjO1aCRbmwK13YideqXypyHnp0GaVts0kM6tfbOmOrR/fu/1RKdipsjxxA0tRjp0nW0M9hWEBXj1xI8bXxMJ/4U5ae91+cfHts7zmCx48EAJqX+0ARa1ohFuL2/JPUqFZhVmk3cqora4HDOSHL7KNYe8+A56+cXu+niB7pKtslKoXqIqRDEtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USuiXqwkT2aalpWAZYhGx9np6+iRUOMUCiv1gY0IuMk=;
 b=dmQm+FUu6N/k/pRgEhilpzY3NC+lvzycamBjKpOoM10OFqLKIv2B22bGzNcVy+WAd612ReHbHvS5eKjc1ejbCYjxqXzrVFRyVCFE6aEwOPPkFuCulP6c3kz1mA6ZS9FNShdZr82kSaMT/CDydAzFyj7VIxqeCzIf7TWST+uy2Bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:12 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:12 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 00/10] arch: arm: dts: update Facebook
 Bletchley BMC
Date: Fri, 11 Feb 2022 09:57:45 +0800
Message-Id: <20220211015755.27644-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023fe79a-e3a8-4355-dbe5-08d9ed01f576
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB40154B969099AC5248F0F2AD8E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mEUoKJnT/Ma/iLfyySf69i9Pj8xQmjKS3AQz8EEegBFQMDhuLOK+xp40XRAGidl+lxDXBUfnD5yZZBza0pDLlz94ziIFHwdxRyC8/8QRXQCmlU3qBRyif4kOTYn1gQAO5SzDotHz2JzgVraoq0p111lMwm6LDJu5vcKe4rjuUZeEmQKKwtju4THADbEpMFnjXFRZLjuBP+FFjHYMOJoo7lLu3/tfsIrxOb07qdIndU2QX6xXOp/jmdaEu8gZQAa0ZYI6A3KAF7W1MaBtEAMfg/ESvGmL5JyGUkkfHk0uTmLykF90R4et89oOxzuxCcKovGMOY5O/NkN4hyTlWQpCsAtJfqDfVUF1aEWQtPtzKF3xjWXv2uQfRzEpZHqrepfX8q8Qnlsa26ru+5SZwlQu3DqvLxtFLLolFEbqCwP7TuxOJ3hOjm4jhAy/sZEh5VKqrGbavoTeYQHUYqC6XXvEZLMdMfMu3G9VvAnOROL1CKFSWC7EQX2nChwySVhH46eQTikmOzOHOQ1GJukk+u4N5+RoT+ke2K1ODhDdKRSSp+/kEiEHde2S+ZjFKSdSLQ3TqiiMOdgGmKP0nxLqTv0lNiJHTZVoEXjI5MAFgpys2Ll6nThuyNgEewAVylTZ35dOxFl0AOStE8UMUwv97FbgDz8TvWMXMkQsWq01W6m499idZ4aYnPUice5977zPBPmlaAwjtFE1SuKQi1L27E1WVRmtop0hc+DvF7iq/Cei5jsuom6UBWdqE+5ZLBRzCYRnxX6/ntEZnVMDLIKvSDpi5CQxw2TERcZ3jXHUs8APlN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(47680400002)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(966005)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(15650500001)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N3kGHPcn+LxHHt4NOp20lwT7CLAoivVYy9e9p6tfh4WngmMk93UQUy2LJq5G?=
 =?us-ascii?Q?0cIk67JnsIljiFoItWJLFoWYYeoYuSgTVkJcTAquIpFnMXfozQyjGQF0opd1?=
 =?us-ascii?Q?YGaGQxOeIhFRBMsRPnol9c/lTr+1EmTFgjEzNjZqeKtT3YZK9nUJUsFXQYXk?=
 =?us-ascii?Q?BiN9KTZI5+TuaIltnnQ35Kq+EE+zS/CZCDjkwNE7Ti50egikuTBeR/WOhjWj?=
 =?us-ascii?Q?hb6kqAlLXf6oWuJtF1Rf8p2SZ/+CNhgX0baTqkyErexDFypAau/PpHuHWhMk?=
 =?us-ascii?Q?9DnJgdueWMhb+nJciJJ6PeLE86YKFqCIx/9uydpppgBeRRIF19OEC4+jHRkd?=
 =?us-ascii?Q?6LzXNgdGSVBF/OdpCylapfHKwnqSn9OzptrclzbOxe4x18wUsN5t+ufQUc0v?=
 =?us-ascii?Q?lwWb1ms0yhJuo9N+iZel9J4VK2CVKXP9mNEu0nrcYOBP0Q8E9HbSBrDE5bd6?=
 =?us-ascii?Q?QdJNCKF9IIweDWWiJ7jTwB+WxsUXfjDpHBTYm2kJ9UM7+d13OWwtD9FHHOm0?=
 =?us-ascii?Q?ONiSUnwFxeEdIXKhlCpTbi6uf9UqKMt5P116MWi7wFOMinOWgkvuhYGeyuLG?=
 =?us-ascii?Q?PG4NY0j2qUkoLNjlZ/BAbQlVIfmrB6saeCIBhNiE8bUqbBlUI5/00+5vhgK7?=
 =?us-ascii?Q?V31PqwysfNRx45ccg7DCk2AqYiAXph0fWy3FkZMD05TpHzo5UDmw6MlZUJUq?=
 =?us-ascii?Q?VrfaUXfsj3lL/S25v3uh3zvkLCzfqGPPnj9z3PosIToZyxhOP5Ip/X8ymmEP?=
 =?us-ascii?Q?eozspuGhcVzDjB+iejJcfVmlEknB5yZzuKgZqInLdH7nFkg4/5UXf56NU2Q5?=
 =?us-ascii?Q?nw1sZdvOM79Yadas3KLg42aPksC/P0P2KPbZebZNZZOmf6hCOirRYFX2wOeq?=
 =?us-ascii?Q?ylPPkk4lj/n3r9wNw7f3iTUTZD2zuBoMGX8MhSraZXpVwxfZiCZ7nqAxlDaf?=
 =?us-ascii?Q?lP6VzRBodwtF/B6z8g5GX1/MmkvqCPGpczKYoNBTK5gdH+/OcSBIrsUcYZDb?=
 =?us-ascii?Q?8onrk4iBm8XrOAB1w3yoWbmuIZyqmWZ3zisexxHV1Xa2ahMQdamUf+ByEDGI?=
 =?us-ascii?Q?dllQrqL1E9o52zfWYZ6EA9pW6Jnr6SfxUpjB1oYz74hEcP6lFPzMhbW1qUEq?=
 =?us-ascii?Q?xtUfJbxUAKU2JWEfmeoLa9aThgHco5xXiSoFFNBhWd7X+lS40FozABuyGja5?=
 =?us-ascii?Q?0SjoSNW27k8lIQWlL7wiigNDcPnl7YbxoUmoqgIhU8bYxkPj+AsHtEsAIQUG?=
 =?us-ascii?Q?TFgbxhj4KWdKniDj3RtQiAiN+DHZISScJITsxgOFAQbEDQycyoxkhJ9cVft2?=
 =?us-ascii?Q?LSYZvi0roZ92N3inKI80NRy/HI0UxQKzJbF8oMLITYqtlQipe55gdR7U31qm?=
 =?us-ascii?Q?c/Xk9BrqVFI0A8ZfUySs6ZfNY6xl0eE3ZS+3nsrclnPIQSMlUR35DYTNY+aH?=
 =?us-ascii?Q?yym3Tx/azyrpTuBCNleMrFgh/K13I8wOkzqLArQ6ofAexY0JBDLuoMRXymO6?=
 =?us-ascii?Q?ThgQ9YWN7jmkEx9rMsyWHfKA2Rno1G7v/KUzgXaZKnLrkp5iWHz5/8N0MKli?=
 =?us-ascii?Q?T4feQphRf3zPEgs5h6yrTYjgtymQ7HxMpgoHoreW9kefCxSU1tTgBB6/BiDP?=
 =?us-ascii?Q?FfNQRQSv6KTxDP/8q3orYhY=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023fe79a-e3a8-4355-dbe5-08d9ed01f576
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:11.9687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rbS0pgpT3PfyVLUE2yAB4nq+mydt9HoyCaa1hg18jqBjzUoRdUZRnsrFtB1CGYJasIkJE6A5A+tih8iQUqf92Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4015
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Update Facebook Bletchley BMC devicetree base on EVT HW design and 
rebase sled numbering to 1-based for OpenBMC multi-host

This patch series are modified from
LINK: https://lore.kernel.org/all/20220209100413.23714-1-potin.lai@quantatw.com/

Potin Lai (10):
  arch: arm: dts: bletchley: switch sled numbering to 1-based
  arch: arm: dts: bletchley: separate leds into multiple groups
  arch: arm: dts: bletchley: update gpio-line-names
  arch: arm: dts: bletchley: update fmc configurations
  arch: arm: dts: bletchley: switch to spi-gpio for spi2
  arch: arm: dts: bletchley: add interrupt support for sled io expander
  arch: arm: dts: bletchley: add shunt-resistor for ADM1278
  arch: arm: dts: bletchley: add INA230 sensor on each sled
  arch: arm: dts: bletchley: enable mdio3 bus
  arch: arm: dts: bletchley: cleanup redundant node

 .../dts/aspeed-bmc-facebook-bletchley.dts     | 303 +++++++++++-------
 1 file changed, 194 insertions(+), 109 deletions(-)

-- 
2.17.1

