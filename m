Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6488E99C781
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 12:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRvDT6dfYz3cW5
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2024 21:51:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728903093;
	cv=pass; b=H1SU8TawRLneYJOQ4qdtcWfcyFAJhEB1PlfxM0W7SfNuhKo4Sg+d+K6P6kkKnnn89R+DLKoYEPE1cX1kPj97DV/1MyVNe+AyKVRSN31KEo+qMcUx910D1mVmLlDSIc4rbVihEiX7To802+o9M0H1q7aOicIdk+fBlGz0MiiX9sL0TrFJgPC6FHNpgtBKi6vDJO7YncbCO6Gne5Q+3GtC/ednLYYaFm448Mv53ASkpo7dS8vvFPQNvbYkevxpxgEgDuuOYSBI2FznFyoKwS5SrgqH6CwOpnN8w4g1LDk0mNu3PFzlOlttbsxtk2sIShfV8x2/u5ni5gSE+scBDQTTeA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728903093; c=relaxed/relaxed;
	bh=HinHxHotdiGULVOLe7BS6hh6xf1Ebz9EgyyDEKVh0WM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ShzHURYVku4wr6nf8f9AqSTensBzF/fFUP9DlVxo9U/FueoaJ2SChFPEHOCrw6THUppJBHuiwvbHTfnLuKx7CDY5K2ubAScbsFjjuhi76CwUwAbukW04r+/terP5RSVlAdkYsDUIQuUaV8fW6cDuY9dObwzn/PLhslBj+8tVZGKF8dS5DslaIDxDfCUrlBbG8o+Qqs42t96lDLIwN8WA35AHa6OoF2egxV1ke+3yqTGx0QqaE/HgzBYpLpRCnQWs4M9AqI0jZ5Uy0r9bf0BSBC3MQBYhexFq/y4fat38UqUkZeSjrXDFbOPcWim3Qn5fA2W00XatticGxDkcAdNWNw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=i9ThdZLb; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=i9ThdZLb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRvDL4kMnz3bmf;
	Mon, 14 Oct 2024 21:51:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUEk9dvKoreks8LaHxMWhn2pc0KeV2xsFZr3c01BwcyMYdwQFBW7BWSGk+Wnn1forX8lpxNybtBWiY4Yb50qsnyD/PyFGTPwfKsDuatAB6Etv8ZLUr3fkEl15lRtTMpxl3amYxKJ0ECzex1O7cS6Kut2oSs7jdkQTOvz2WBDdJrra+R6s5Eu4PZ0B3sKoOHLoE97wC+Y413DEgM/L+uoC7P70OlteljObFrn+XhfhWZAwMoGRSyMAnLJHNj64cx0tOZvTCvGLVqI5OPKWfa1zezt/OBmWVEKeJK8mSnPApD2W5HfhHCfxOCVa3bxcd/BqfclQgmBpu6YqDi1nXhOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HinHxHotdiGULVOLe7BS6hh6xf1Ebz9EgyyDEKVh0WM=;
 b=Lmhgb2Y2SaCfWOSzGnJbx7UouS2BJewggbUinubKECik5VrwIvpOVbUL+/q0H09nTQA2EsetwsS2cERx9KRXNnE8MQE1Kx2XRCh+n4St5Qj1o00TedBD1EmLAstP88R8Me8eDJg3XMWm8x4TfE5NAhXUdCGLSoZlwJVhLTkLDkVe0c7/zvtYEAh7i2W1u/9pxQXLWqeco0LFwBBi/4PQy0inzhgrqj4PnoIeZ8izhkVJ6hbkmh9m/cdeL4t+V2hnDTm0vcgSfz64mNDD5/6YHk8ZAs+7oZCQN5Q5ikkVxt+LZZOWwdHVezKnaNFpUah/HQpU24+cyM+gGcUMGsM6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HinHxHotdiGULVOLe7BS6hh6xf1Ebz9EgyyDEKVh0WM=;
 b=i9ThdZLbbFWqJcKu1aDA4zOWcudzc/D6RGhPwsYJ8hyRVv1dHEdEufqZMgim59J8kZytqHWVE1lToJ3XC6qBGbh/a8u1Uq8lB2QWsUmte7OTa3hJ5hPtSDPtppWaToaljUOkUuCBWghxPIRGn/pm0sampTLgnrQnYvCtGOMZUSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 PH7PR01MB7752.prod.exchangelabs.com (2603:10b6:510:1db::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.34; Mon, 14 Oct 2024 10:51:02 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.033; Mon, 14 Oct 2024
 10:50:59 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt. Jefferson BMC
Date: Mon, 14 Oct 2024 10:50:31 +0000
Message-ID: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:54::17) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|PH7PR01MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 431e88d1-10bf-4c7d-c519-08dcec3e1679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?FdWmK0Tmk/xoOwFh84NtgOoGIlZkmoIi6oDrQNhNtLilMV7X0/3XDKduEPW6?=
 =?us-ascii?Q?or0fRdiNP0JJRXSKNcQmNm9ydIdIN5ZonqUX09ZdH6J1uNNcZANj9rBo8tQU?=
 =?us-ascii?Q?WhRUL0RoYtOIWNEbWv7C4lmj2cXSYn1HW+edEa/od1CLSFCR1HS40ayrmNO8?=
 =?us-ascii?Q?1qaqfniC86b+JJACr8qiG/2R97QLJuDuzTPZ4Y0A0fATc8ZpVQiPfVboXStJ?=
 =?us-ascii?Q?Lkz8yoR6DLceHA5V2H8NDQKaQKh1e4eJC0NAkSbfIiJH+5lnOIPqTDhQsg4G?=
 =?us-ascii?Q?Lgm22jXG91teqSIu/G0Slk/jpfEsFzCVU1LkUXxFSsbUGCUbHhUzOjqykcPB?=
 =?us-ascii?Q?/7CkMA+JEFP/S056byDWD453mhPPGV65h8fvJ4jaz4jtOiuZMajbQnCZp/ve?=
 =?us-ascii?Q?2gu08tI4dW55K/1Le0XO5FFRbxP42t2XEXgv1DrlI6ZolD06qD1Pu3F5QMFf?=
 =?us-ascii?Q?bqNe9rC8i7CVpzakOmNoFyyqVSOwe1Jaan+UOuZFvXqAeQMvoeyKwW5xofNC?=
 =?us-ascii?Q?ZhEDNBo32yJ3sHrG/hcGN25lsSwAzeW3oteUVvGHFHlzIavpYaRJih0n3ETD?=
 =?us-ascii?Q?BjyW9z9XRYcw2Ex2VAtK1WytoVC/Nv8DNBPQqAFvrs1JO957/5Uz7Ml/yvO+?=
 =?us-ascii?Q?cizfn9W0zAyR3nt3zmhn9ZoxunW+7hvRDdt6NOFCEMMYL98fs13bhGndlC6L?=
 =?us-ascii?Q?tl9De/nIpxNxKJvYfdL0pDzXjam7hcVZRhlcgORtFjl8XV1LUrMB1ov0eIkN?=
 =?us-ascii?Q?EL/Q4B8Q9fK2MiG65n4SQ+Hl5LMDSKPIwmVb/4SMmiCmAJT79op6yoi00Zg9?=
 =?us-ascii?Q?ZZD70ohMMRXzimSNy+igG4TrBIPqiFFCA6InFaMDZ9SL1HPBXjJ7TnSsFUB+?=
 =?us-ascii?Q?fz7zDDsItNT4vCidtp9TSYqCNKPR+1wqhPVxQ2csnOeTuyPvMyvx9BBZOl91?=
 =?us-ascii?Q?H7thsSqc7+nP2LV+zDgEvKzKgBxp7eDHIsvBL/yOpNaLqFQTEKQFHTzzB7sg?=
 =?us-ascii?Q?MF42frxKuw9807PcGXsi2osBKbYl7eFk0comEbV8rKmHFIxKceyM4PS01T/J?=
 =?us-ascii?Q?IWX6y8RXCAkjkio9wUI+wo0DY1hXlc8tKQySB1MYpY13wzDOAK1scvSYImxG?=
 =?us-ascii?Q?FUT8Ap5ki/osJsqq1EGVbFFacMXsRLMkL5Ic7bXtw3I5pkb50axw0FTWjf3g?=
 =?us-ascii?Q?12CN1pvHhH/Tmgr4G769EXadnqCu+B3wt9sKGV6aU1ZaM9YPgCy8ACtjmTEj?=
 =?us-ascii?Q?Bj0gNmsQw2rKyT7npm6Le2hPTfeswEGrmCJmK9MBs6dI+6nhokb3hfzxNWxc?=
 =?us-ascii?Q?vF0R8WypaJqQiGsr4p+2B4BM7s5nzmQhHWuzHQLBUdne1g=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9oAgAV3dQeBbNhT4x/KUbOCL7FQPI1pTg/9dhcl30wJI5HUPLuEgSUOfn3Nu?=
 =?us-ascii?Q?N4V6oDjBFsBk2gFRywLE6uRinlLR4xX4oh8RI/Sg3kqksUhKkEJmW/d8kg2D?=
 =?us-ascii?Q?tYEPX5FNpbB2SIK9DzgWjkUsEt2f7/929hZMBGZ2u9qIV8pB28K0YOJOamSb?=
 =?us-ascii?Q?4Sgnqv4lKRjxET4xBB+lf4pGFIY0Mmvk/XgSktAc1iPn11KTlifDnbWpwEVv?=
 =?us-ascii?Q?EKX3Fr7vl9ln8rETy0kFMpITvITthwIgcsb0bNtfn8Ofxw9r/gRbnFhFuUmV?=
 =?us-ascii?Q?H/QHLc6iOwRs/3ri0LOxa8Os1xPsyFj+Lvm5cJtXrxnE2KRGUsonx7eWo/WZ?=
 =?us-ascii?Q?Gjh/2WO61pjYNnztjSsR9ymVzVi6AqikTnzQRck0OkYhjDhZnF3fbNRcEznv?=
 =?us-ascii?Q?DMy9tJWfR39TC4blqdpazIPQ8Ab4TzHYILBTPbgOZtOlLlGNVmzjgW0s/ExV?=
 =?us-ascii?Q?rqi/pqy9BF0eZya33FoGe6gW+3ZyUrQBy0AoUsY9T+cD6R+KCkyfvQNQPnza?=
 =?us-ascii?Q?tQcaF5Rv2tPkUK5MGW6AzYpt73aeKYtdJuUjdfjvCkmuXqGK17wZI4UEOS1j?=
 =?us-ascii?Q?aByPACXbocB7EcWbDHGqXHMcx4dW17TI3mFqEk1EcqxModiNzJVm3POtxU3o?=
 =?us-ascii?Q?LyMZMzA5y8RbrdecOf3dISl4jWld0JMbohCMV8qSN8PuIwnDr+TP3ICLlqXS?=
 =?us-ascii?Q?FpJItMryPBw9kSCvUEUGSXCXTWMoPLirxdX+FN8+gcfmTbu91Go2pVFxaNgT?=
 =?us-ascii?Q?l0mjW6mt+R5bdJ10EeGtxNWigEHKTgfY2xRUvVBh3XAeBZdEil/+4ido/8ne?=
 =?us-ascii?Q?4NdXwHF1zzkIhDpMjzo9U3PFypkA5BrikGGcH/b+2SU0UyOt55FkPMec3oRR?=
 =?us-ascii?Q?Ig/eGoy34ZdsutMRJN+2BjUzQhRB8SOsnSwG255Hfwm6pocZPzYjWxUcZOfH?=
 =?us-ascii?Q?wemnKbSSQah37XbZCG1SSdLLoTJu+LX1wg9FAiLp96omkbpixk95r4aMH0N8?=
 =?us-ascii?Q?95F3zz5Ui4w3B9dwCO5JweoU3UppqJJYbN5Mvmr43JzUKjgYuJB7mcGmfVbs?=
 =?us-ascii?Q?WbxwqZtWBUktxu49n0SPBwyaaSOAficswKxr9rtk59l7x2g04SqmIpngQIKX?=
 =?us-ascii?Q?Yi8rSfonDR9YuNGQvlincIR8W70X8q0ll88GTgODXSLmjc1xg02ZIit5LDAe?=
 =?us-ascii?Q?7qi627u9fylYFjoRIivtIVKSCd+NCGeVPXJefXhidPITSBXV53zT8BtDD32k?=
 =?us-ascii?Q?HBxck0CM+BlwysX9Ez5dzfMwG+oDBxMflpUcNcyCfE4ctIm44CLMkqOt+KAo?=
 =?us-ascii?Q?YsEgu+h8aNDJr+0RJ52f7XpdmhYGSH9fCkbaL8XszeqNoVsx0w0FiFoT7B9n?=
 =?us-ascii?Q?IMwdth10iJx9m8euc48Thc8TQdgAfQPhynwBuVhOxumt1ZHCwRz9ZUhFt6O1?=
 =?us-ascii?Q?lZwSavEMjutUJKgQiJd+VfB18UnxlKaecra1kuHXygiUnAPf8H9VkaZ4YTuI?=
 =?us-ascii?Q?U0JTOI1wFXHnqNf2fynOCSOK/z5SNW4rIvTcm6eu9+OXAPtsgJae4gmOcCX1?=
 =?us-ascii?Q?3PK7Mzdprsr1yKXQCKLMqymVlJqEV5Z1m1FdQZlBHW2U6aVqfOvwWPLmIxpe?=
 =?us-ascii?Q?RIumVVhxjDOxdlEHyWwwhsQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431e88d1-10bf-4c7d-c519-08dcec3e1679
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 10:50:59.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5md4ziiM2jG//rbhd3YdSKhhoVascLJ4Q06U09JE2C7AdFXm+imktbxtVKmBaU58Hq6dZTL+dZRzIwZ8e1+19saW2F/7dfWGwpOy/ybcrMXQE6+0/xvdbNktPlKs0tE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7752
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,WEIRD_QUOTING autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jefferson
hardware reference platform with AmpereOne(TM)M processor.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 ++++++++++++++++++
 2 files changed, 647 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b073..b1fb0853a789 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-amd-daytonax.dtb \
 	aspeed-bmc-amd-ethanolx.dtb \
 	aspeed-bmc-ampere-mtjade.dtb \
+	aspeed-bmc-ampere-mtjefferson.dtb \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
new file mode 100644
index 000000000000..f24111ab9e65
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dts
@@ -0,0 +1,646 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright 2024 Ampere Computing LLC.
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/i2c/i2c.h>
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Ampere Mt. Jefferson BMC";
+	compatible = "ampere,mtjefferson-bmc", "aspeed,ast2600";
+
+	aliases {
+		i2c20 = &i2c4_bus70_chn0;
+		i2c22 = &i2c4_bus70_chn2;
+		i2c24 = &i2c2_bus70_chn0;
+
+		/*
+		 *  I2C OCP alias port
+		 */
+		i2c30 = &ocpslot;
+
+		/*
+		 *  I2C NVMe alias port
+		 */
+		i2c48 = &nvmeslot_0;
+		i2c49 = &nvmeslot_1;
+		i2c50 = &nvmeslot_2;
+		i2c51 = &nvmeslot_3;
+		i2c52 = &nvmeslot_4;
+		i2c53 = &nvmeslot_5;
+		i2c54 = &nvmeslot_6;
+		i2c55 = &nvmeslot_7;
+		i2c56 = &nvmeslot_8;
+		i2c57 = &nvmeslot_9;
+		i2c58 = &nvmeslot_10;
+		i2c59 = &nvmeslot_11;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+
+		vga_memory: region@bf000000 {
+			no-map;
+			compatible = "shared-dma-pool";
+			reg = <0xbf000000 0x01000000>;  /* 16M */
+		};
+	};
+
+	voltage_mon_reg: voltage-mon-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "ltc2497_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-bmc-ready {
+			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH | GPIO_TRANSITORY)>;
+		};
+
+		led-sw-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-identify {
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fault {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels =   <&adc0 0>, <&adc0 1>, <&adc0 2>,
+				<&adc_i2c_2 0>, <&adc_i2c_2 1>,
+				<&adc_i2c_2 2>, <&adc_i2c_2 3>,
+				<&adc_i2c_2 4>, <&adc_i2c_2 5>,
+				<&adc_i2c_2 6>, <&adc_i2c_2 7>,
+				<&adc_i2c_2 8>, <&adc_i2c_2 9>,
+				<&adc_i2c_2 10>, <&adc_i2c_2 11>,
+				<&adc_i2c_2 12>, <&adc_i2c_2 13>,
+				<&adc_i2c_2 14>, <&adc_i2c_2 15>,
+				<&adc_i2c_0 0>, <&adc_i2c_0 1>,
+				<&adc_i2c_0 2>, <&adc_i2c_0 3>,
+				<&adc_i2c_0 4>, <&adc_i2c_0 5>,
+				<&adc_i2c_0 6>, <&adc_i2c_0 7>,
+				<&adc_i2c_0 8>, <&adc_i2c_0 9>,
+				<&adc_i2c_0 10>, <&adc_i2c_0 11>,
+				<&adc_i2c_0 12>;
+	};
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "alt-bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64-alt.dtsi"
+	};
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "pnor";
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c2_bus70_chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+			psu@58 {
+				compatible = "pmbus";
+				reg = <0x58>;
+			};
+
+			psu@59 {
+				compatible = "pmbus";
+				reg = <0x59>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	bus-frequency = <1000000>;
+	multi-master;
+	mctp-controller;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c4_bus70_chn0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			eeprom@52 {
+				compatible = "atmel,24c256";
+				reg = <0x52>;
+				pagesize = <32>;
+			};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+			temperature-sensor@49 {
+				compatible = "ti,tmp75";
+				reg = <0x49>;
+			};
+			temperature-sensor@4a{
+				compatible = "ti,tmp75";
+				reg = <0x4a>;
+			};
+			temperature-sensor@4b {
+				compatible = "ti,tmp464";
+				reg = <0x4b>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				channel@0 {
+					reg = <0x0>;
+					status = "disabled";
+				};
+				channel@1 {
+					reg = <0x1>;
+					status = "disabled";
+				};
+				channel@2 {
+					reg = <0x2>;
+					status = "disabled";
+				};
+				channel@3 {
+					reg = <0x3>;
+					status = "disabled";
+				};
+				channel@4 {
+					reg = <0x4>;
+				};
+			};
+			temperature-sensor@4d {
+				compatible = "ti,tmp75";
+				reg = <0x4d>;
+			};
+			temperature-sensor@4e {
+				compatible = "ti,tmp75";
+				reg = <0x4e>;
+			};
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
+			temperature-sensor@28 {
+				compatible = "nuvoton,nct7802";
+				reg = <0x28>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+				channel@1 { /* RTD1 */
+					reg = <1>;
+					sensor-type = "temperature";
+					temperature-mode = "thermistor";
+				};
+			};
+			adc_i2c_0: adc@14 {
+				compatible = "lltc,ltc2497";
+				reg = <0x14>;
+				vref-supply = <&voltage_mon_reg>;
+				#io-channel-cells = <1>;
+			};
+		};
+
+		i2c4_bus70_chn2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			adc_i2c_2: adc@14 {
+				compatible = "lltc,ltc2497";
+				reg = <0x14>;
+				vref-supply = <&voltage_mon_reg>;
+				#io-channel-cells = <1>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		i2c-mux-idle-disconnect;
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			i2c-mux@71 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x71>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_8: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+				};
+				nvmeslot_9: i2c@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x1>;
+				};
+				nvmeslot_10: i2c@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x2>;
+				};
+				nvmeslot_11: i2c@3 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x3>;
+				};
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				nvmeslot_4: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_5: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_6: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_7: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+
+			i2c-mux@74 {
+				compatible = "nxp,pca9548";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x74>;
+				i2c-mux-idle-disconnect;
+
+				ocpslot: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+
+					ocpslot_temp: temperature-sensor@1f {
+						compatible = "ti,tmp421";
+						reg = <0x1f>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						channel@0 {
+							reg = <0x0>;
+							status = "disabled";
+						};
+						channel@1 {
+							reg = <0x1>;
+						};
+					};
+				};
+
+				nvmeslot_0: i2c@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x4>;
+				};
+				nvmeslot_1: i2c@5 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x5>;
+				};
+				nvmeslot_2: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+				nvmeslot_3: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+		};
+	};
+};
+
+&i2c6 {
+	status = "okay";
+
+	rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75";
+		reg = <0x4f>;
+	};
+};
+
+&i2c8 {
+	status = "okay";
+
+	fan-controller@5c {
+		compatible = "onnn,adt7462";
+		reg = <0x5c>;
+	};
+};
+
+&i2c9 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+
+	eeprom@52 {
+		compatible = "atmel,24c02";
+		reg = <0x52>;
+	};
+
+	temperature-sensor@18 {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x18>;
+	};
+
+	temperature-sensor@1a {
+		compatible = "jedec,jc-42.4-temp";
+		reg = <0x1a>;
+	};
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c11 {
+	status = "okay";
+	ssif-bmc@10 {
+		compatible = "ssif-bmc";
+		reg = <0x10>;
+	};
+};
+
+&i2c14 {
+	status = "okay";
+	eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+
+	bmc_ast2600_cpu: temperature-sensor@48 {
+		compatible = "ti,tmp75";
+		reg = <0x48>;
+	};
+};
+
+&i2c15 {
+	status = "okay";
+	gpio_expander1: gpio-expander@22 {
+		compatible = "nxp,pca9535";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"presence-ocp1","presence-ocp2",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","";
+	};
+};
+
+&adc0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
+		&pinctrl_adc2_default>;
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0-A7*/	"","","","","cpu-type-detect","i2c2-reset-n","i2c6-reset-n","i2c5-reset-n",
+	/*B0-B7*/	"","","","","host0-sysreset-n","host0-pmin-n","fru-rd-complete",
+			"chassis-id-sel",
+	/*C0-C7*/	"s0-vrd-fault-n","","bmc-debug-mode","","cpld-3v3-irq-n","","vrd-sel",
+			"spd-sel",
+	/*D0-D7*/	"presence-ps0","presence-ps1","hsc-12vmain-alt2-n","ext-high-temp-n",
+			"","","","",
+	/*E0-E7*/	"eth-phy-rst-n","eth-phy-int-n","","","","","","",
+	/*F0-F7*/	"s0-pcp-oc-warn-n","","power-chassis-control",
+			"cpu-bios-recover","s0-heartbeat","hs-scout-proc-hot","s0-vr-hot-n","",
+	/*G0-G7*/	"","","hsc-12vmain-alt1-n","","","bp-cpld-program-en","led-fp-sta-gr",
+			"led-fp-sta-amb",
+	/*H0-H7*/	"jtag-program-sel","jtag-cmpl2","wd-disable-n","power-chassis-good","","",
+			"","",
+	/*I0-I7*/	"","","","","","","power-button","rtc-battery-voltage-read-enable",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","reset-button","","","",
+	/*M0-M7*/	"nmi-n","s0-ddr-save","soc-spi-nor-access","presence-cpu0","s0-rtc-lock",
+			"","","",
+	/*N0-N7*/	"hpm-fw-recovery","hpm-stby-rst-n","jtag-sel-s0","led-sw-hb",
+			"jtag-dbgr-prsnt-n","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"ps0-ac-loss-n","ps1-ac-loss-n","","","led-fault","user-mode","jtag-srst-n",
+			"led-bmc-hb",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","identify-button","led-identify","","spi-nor-access","host0-ready","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
+			"host0-reboot-ack-n","s0-fw-boot-ok","host0-shd-req-n",
+			"host0-shd-ack-n","s0-overtemp-n",
+	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
+			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","vrd-prg-en-n","","","","host0-special-boot",
+	/*Z0-Z7*/	"","ps0-pgood","ps1-pgood","","","","","";
+
+	ocp-aux-pwren-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "ocp-aux-pwren";
+	};
+
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0-18A7*/	"","","","","","","","",
+	/*18B0-18B7*/	"","","","","s0-soc-pgood","vga-ft-press-n","emmc-rst-n","s01-uart1-sel",
+	/*18C0-18C7*/	"uart1-mode0","uart1-mode1","uart2-mode0","uart2-mode1",
+			"","","","",
+	/*18D0-18D7*/	"","","","","","","","",
+	/*18E0-18E3*/	"","","","";
+};
-- 
2.43.0

