Return-Path: <openbmc+bounces-188-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A3AD7EB5
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 01:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJJ1B22Wqz30MY;
	Fri, 13 Jun 2025 09:01:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20c::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749741568;
	cv=pass; b=WjQDHalP6oxZ/UaMI+5BFScNbFaxXY1kI/RqU2IWLHE0LwJHkzOhiNNgvh7/amOoSprYUS+9hqdhsNEIAmkUGF37k/3UgdhJW0SJr9ESPe0jFtN997U/AWrS/ZEKBwOv+yY0d5sn5SkoiOC3Fyw3A0DtFIHPuQzuUzMe4kTQkIFuxmrUIfC2DMyfz9jFjIxcjfq1OqEVJS66B3y9RTY6nUCDQ5/1RkuXPEgNZQRB05cZlyH1sVYSMyqe5FTIA8YgNKmgXIPb9uC68gD6bKWgH1d9JDjztaENwjUJI8bOCcILGeHncJ4a334oDRSZHghGQum0UyANly+m5MNkbecDyw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749741568; c=relaxed/relaxed;
	bh=/7QBolZuLgWE3f/SzPJCWH+6GD07xvh2jTNHJv6/k+U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kUXEzzyUfkWVcdSfVRPdvL5ARIUSLrC7Vz02sTD02CDTB8oyFIKdRYGZlKTjJQGFleNVu+dN6+Zqe0MkxHndT7BVolA8wYVcvm2BdRA6RRhbTdM9fM7EUX0jkf3SV7JJV4J1FPRAvFLOiKcbesOAGpqA/TEWeEhhcJ7GhDDcM4z6d+WFDS6vStnWysYZ1ia4j0mE5APW7qHMhT9jR2uORnSKDOrgw5VezZpv2NGzuNpecLk1WbA8wo3dtAW1Z/P0A2ncd0qXPcMdpiNZ9yPPQeAs409lAIUIlPKbgI+WDzmWlguLrmrdXu7BNbjoJqZ+cfWvGZPKFjfYc7GcCSZ/ig==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=siewert.io; spf=pass (client-ip=2a01:111:f403:c20c::4; helo=fr4p281cu032.outbound.protection.outlook.com; envelope-from=tan@siewert.io; receiver=lists.ozlabs.org) smtp.mailfrom=siewert.io
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=siewert.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=siewert.io (client-ip=2a01:111:f403:c20c::4; helo=fr4p281cu032.outbound.protection.outlook.com; envelope-from=tan@siewert.io; receiver=lists.ozlabs.org)
Received: from FR4P281CU032.outbound.protection.outlook.com (mail-germanywestcentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20c::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ5mG62xsz2xC3;
	Fri, 13 Jun 2025 01:19:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaeJp5iEOKHNi+ZR8nQ5+WWzP+ydSSO3DVd7R2CrNX07zrMPuh2l4zOBGcc8HobSbFwkyHVWMFMxFBKTfC5D/0ehDXB1xPnCgZDDNTFWMZ4q4U+FT03pB8MYISY5Gx9cGTxubpTG2/wUmUuZQ1sjQW6SUENWin44JveKQRI45vozoQG4fBomELiKbxodv26bUGjAj0/cb/OCY8yX+wAfbN2V96TMIEy/NJfS/HEimj0kOOW7vXAMzXtAlPn7uOMw7p2y+Kr49DP0HP7TN2l3quj/7SqXPyVm19nAN9GW8+4pzjNXFXpoIQzi1oZT1fLBp7OxR6gDGBx5y1ZshFMuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7QBolZuLgWE3f/SzPJCWH+6GD07xvh2jTNHJv6/k+U=;
 b=o/A5YDi5Eipmd0YzA9kkyr/3BNPXNvG8bwArRn5UpLUTky/rjjgUDXpe/vw5/tiUr1aqIgN8nNCUjrUvNGpdl+tcJ/G6mITlDpQjsIAA/oYsVBI6NfeewbgdkZEQ6ZU+AcHCm0q9gJsvmvRsvwB9paFV4p22JJQt7PwRhVYp/8kcClNBpQKoDhZWWTAwmysFbgjjPYhNkSvO7imIBv2YBA476m/asFwsSIFa8HGM8YP6kVSNJ8W3RewRwoDRZi059xAKhsiiNZixA3HbyiBqIOJOJQrAO8hs3qdfULIkfETb4xDSNDNSw+nQByp6OJ+zPMk+n00Ai1m7lWvncYzfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::182)
 by FR3P281MB1600.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 15:19:01 +0000
Received: from FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6ec7:ece3:1787:5e48]) by FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 ([fe80::6ec7:ece3:1787:5e48%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 15:19:01 +0000
From: Tan Siewert <tan@siewert.io>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tan Siewert <tan@siewert.io>
Subject: [PATCH] pinctrl: aspeed: Log error if SCU protection is active
Date: Thu, 12 Jun 2025 17:18:59 +0200
Message-ID: <20250612151900.32874-1-tan@siewert.io>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::14) To FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::182)
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
X-MS-TrafficTypeDiagnostic: FR3PPFB3D0CF1D2:EE_|FR3P281MB1600:EE_
X-MS-Office365-Filtering-Correlation-Id: 440bd7d2-42d2-42cd-dd59-08dda9c47599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|52116014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVZ3OvyOxTrA8sII4eyNssVnKG5nULplEKnTaaYufmpkdeHCWAwstmLDvMY0?=
 =?us-ascii?Q?cYN+fcoSdYhnNL1rcJyhvahuZvLI7rWQClI383RB+o5HdKU7Bxt6VVQPjO1P?=
 =?us-ascii?Q?sSHzM+a2pG/zUnrlkmUDG4mX5C65qKZmckKzHWmd5XHfk12oGCxkmi7Zebbt?=
 =?us-ascii?Q?dOlI4rEi9z0YyflYdxOdcAE4DCK51Ty26yT1VjHBFKhGZhGHnB3fFiqUN/p+?=
 =?us-ascii?Q?mFCSy4zutw000iz0KZXJYIF3Jg8SVgyc8VGHwLKlIWVy6PiRB5nMkXnnRvo4?=
 =?us-ascii?Q?8/NvYFDffR5i2oOi5M9b7t6c420fxuiGfSsQavjzyV7aEDFGstDpgrU98Pca?=
 =?us-ascii?Q?bsukr79586pC/c1pggAlKHF0wNxhO+HU7h99T6zpG8/TwQPBK5yALepNVnXn?=
 =?us-ascii?Q?HbscFUDFhVHEKjTJdhFRgxnbrx0G8Cza9eivK58orrGw03tJPgFvcZ7VytyG?=
 =?us-ascii?Q?cUkTz0HvlRIRlDF7uNOlbNZAB8qcN5eqVdcDId3TYm9O91dzDJ3MqA+66h4I?=
 =?us-ascii?Q?57Hs06bm0ZOslhm70NjupeUFJJfTqJippc8L300ETQTrWp4n5C7+Hp3oS8Dv?=
 =?us-ascii?Q?8R0ImCy7fh54CMXbPyWfx6Enerv27misG9nR+QwXvJA5J8dYTRAQ0Ej1xoI0?=
 =?us-ascii?Q?FeJQpONFOW5cdj32q+Sa+6s4+u4Jp+PLG695H40Zmsi6NO92GvEPz8XlXDXE?=
 =?us-ascii?Q?L1+TU0+0PkPN8xvSw2Tx+ia4NuiOWk4xiPrshGFheKYWk8NyCSQJRaNm+zN8?=
 =?us-ascii?Q?HJCBP8V0o9fcor8EWzxX241rmsLuPdRfBpDRV8TzeE9asNyb6sD9ToDBjfke?=
 =?us-ascii?Q?LpW+Jn2FEOLbqDiXW6p4pu2Kwah1HMX7UpjzR8uTyOWT6h9AylY/JM8IElVU?=
 =?us-ascii?Q?ZdAZ1OPBQsnOJzrcshOgS7XlzIW9FZ3uFZp7S3BcoUfgAKS3UjRst8TIDx/E?=
 =?us-ascii?Q?rwisiBvnE/ptx3tQwKZ6porJvvfcPRodTbkJIecj1x9FWqcCogjCUB/nZPle?=
 =?us-ascii?Q?q+WDm2VeX7+13vMdKIjFs/jMomwIpcXQjMG8Du2QBONhcPJZAnr8hSa8b5sr?=
 =?us-ascii?Q?8x2n1zehitVYSWz4yNe/974P441T7Z9dRsmU6YFsZuzb28XikVFI10uotU6p?=
 =?us-ascii?Q?BPR1bBgvoCpwKHiMi8KuVg9/1lf/HzHgCTagjVj/sR4kdYoPYuMMQwzTaotp?=
 =?us-ascii?Q?FHiLY9WsOySNic3s4P+37m18GA/h2D1vF76q/Dg95V1B+FWV+xjW9iQoHmE+?=
 =?us-ascii?Q?RGQQtN202aQKbq0oyigRan3Ygd7RPqToQfbCbEBlAf7PTcpvEXKsMZbEtL9P?=
 =?us-ascii?Q?R7zzRZkwECDTX7kQkn81FgaOASlW21FZcDvbMEByGrZjfDWIdZCUQzHHztMi?=
 =?us-ascii?Q?MSlOcJLOrc3ThSodimgd207URKnrotzzSxA8uKpxOuEvjPsIGslqWfqF9yDJ?=
 =?us-ascii?Q?91hNhbFIO4s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(52116014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RvDSfGpThgEyWqCoWOLVSXtLdLNUk3djpN4NidPYmZYu/MspXtvJD7Rjh3r4?=
 =?us-ascii?Q?k1w0nkeDUXRqM8Rb/L4Dr3DdOOvm96h/8uSW5ybEo+oCu8Qk2LXnR1PAgPGx?=
 =?us-ascii?Q?T+TRtHHAY30hbI+WGw9SX4pjQvLAW3wA1bkQbn94mkAnmxRh0wU375erjf1o?=
 =?us-ascii?Q?mgxNjx4epdXdS8dllTzClkLMZoVtd5YvV51pqRjKijIu/biSlz7gITagkMJ9?=
 =?us-ascii?Q?KFAb1qR3M81Vc1c6225j6GXjrxu5y5tV9TVXmmoa6HFMz28sXQMNMrCcH0fl?=
 =?us-ascii?Q?oSqwQ1hUP20equJsi45cwdn9HDt9H5N/F4nmPytfhoX3PAZPDUirQ5rNSKuk?=
 =?us-ascii?Q?MGxIY4VEd26G9mmWXY6Jm+ltpyhiriF1GXYxCuQs4sJKXoPs7Wy73UdddYGJ?=
 =?us-ascii?Q?Hple6tleG7mrZRNahf19GmU33aWBiL3pWtVj2MGjaKo7eflPcJvuoqov/+xG?=
 =?us-ascii?Q?oBLBSi8Ygi5U06Skca0hiyQD1Nb0B1LQ5793W1x1eor/nEPOid2WV5EfQ/HF?=
 =?us-ascii?Q?EijpE4C1WbyMS9bnDoe7M2v6/T3+zt14CJUENndX2kWKSj71y/N/gsTJLwrZ?=
 =?us-ascii?Q?m2MJLtQ4WHhJiTFrTlblEEnOutg7YGNc8nBTkx6DMiiYyCO2g04LgjFCztdv?=
 =?us-ascii?Q?BbrVS4IG02sInMm7EKu3fOqstJjwsz/of4KUr4mru/+kNMo3b85JWXUD8cxd?=
 =?us-ascii?Q?tIn/1/lL4kY40LMf/Of71oHvrx0p9QwomWv/OvGPHX8VblZk8j+1syMBirzE?=
 =?us-ascii?Q?ieI6WSdKXTtkOrrGwMbLsu7BGl0KSzfo9CQaO7mzFMjIeEZY6epKACxnaDMq?=
 =?us-ascii?Q?eU4+KXbwtIuwjStAMrsTiDSnWftGivt8w+mFHt8ueFX6PigTKO/C05G9kwlj?=
 =?us-ascii?Q?ZG1OT8lTa/irFEsNJT4uyhzpOJxzVBs+nf1vQBE2x2NEBPz7JZvVujdnS9ni?=
 =?us-ascii?Q?2rJ0x5GLGhJVUMYMujBca7i2Gg/DWQLRzyaU5jQ6IkMQ2wyGX3K0wF9sTxpY?=
 =?us-ascii?Q?FpuHsQZRI131dc4ETeNRYT4lRtNaVsY93WQzLfE6s+igZjoOoki3KdoHd6s3?=
 =?us-ascii?Q?9ActVvMwqWlLsHTKqPk2Yddlm1PWVTdMxEVtjRGTT2l76tnCs/snwspUNBK3?=
 =?us-ascii?Q?PZCY/QEIj6dmmRrOEDwCQG6t0YyaUpH50fVanSBjLNVME2Zz2dioDc5DM5l3?=
 =?us-ascii?Q?UOY57Ex2TawEGF1jilH3MEVcav3YRfrqE9xUlsB+nhr5x3AwfzS9XrlK6zsR?=
 =?us-ascii?Q?djHtFbCaYkwb4NguMP7XmAiqFQwFzf1jSKolBvqHNuJluzs8pz75S9rOXnbW?=
 =?us-ascii?Q?vH0WqxzzsPpmZRFSQAee85SCOqcv3oFTNQkAnu90UnDwc48nlFGCsa0svjmP?=
 =?us-ascii?Q?nuSt5vA8rI/xHK0aDtyfV+0N+FQGVyW6a+iH6HLcktuGyuXoij3q+mVk/Rs0?=
 =?us-ascii?Q?DPRL+TD7LGP15CYeR/LN0Fb2S1x+epw9qTK2ATXVaLxBZ1tjh58rnOPHUuH3?=
 =?us-ascii?Q?4ngE7Dv9J2HllpX5R+dgNIt+sFtVstzcoeeqvh6Gz5ES2pOKXyK/+LVttXJa?=
 =?us-ascii?Q?ZbtZohnTg++dZtkViZcSsnpvAWHkjugOA9HAWRWZpcDaBdxdRhu/VU0vV/My?=
 =?us-ascii?Q?672nkogLDUV5+XLx61+hxBc=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 440bd7d2-42d2-42cd-dd59-08dda9c47599
X-MS-Exchange-CrossTenant-AuthSource: FR3PPFB3D0CF1D2.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:19:01.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZPBBA8+h3l6ClMLaGt+WqEzY3+ESrJjsM1/ZvIzYj4vDvNd6opasu5CJKYFJ4bP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB1600
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

ASPEED pinctrl and other drivers accessing SCU registers rely on the
bootloader to unlock the SCU before handing over to the kernel.

However, some userspace scripts may re-enable SCU protection via
/dev/mem, causing pinctrl operations such as disabling GPIOD passthrough
to fail in not-so-obvious ways. For example, a GPIO request for GPID0 on
an AST2500 fails with:

  [  428.204733] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 24
  [  428.204998] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-24 (1e780000.gpio:536) status -1

With dynamic_debug enabled, the SCU write failures become visible:

  [  428.204657] Disabling signal GPID0IN for GPID
  [  428.204673] Want SCU70[0x00200000]=0x1, got 0x1 from 0xF122D206
  [  428.204708] Want SCU70[0x00200000]=0x0, got 0x1 from 0xF122D206

Since SCU unlocking would need to be done in multiple drivers, adding
unlock logic to each is not viable. Instead, this patch adds an
explicit error message and early abort in `sig_expr_set()` if SCU
protection is detected by checking the SCU Protection Key Register.

Before:

  [  428.204733] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 24
  [  428.204998] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-24 (1e780000.gpio:536) status -1

After:

  [   43.558353] aspeed-g5-pinctrl 1e6e2080.pinctrl: SCU protection is active, cannot continue
  [   43.559107] aspeed-g5-pinctrl 1e6e2080.pinctrl: request() failed for pin 24
  [   43.559434] aspeed-g5-pinctrl 1e6e2080.pinctrl: pin-24 (1e780000.gpio:536) status -1

Suggested-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Tan Siewert <tan@siewert.io>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 21 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 24 +++++++++++++++++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 26 ++++++++++++++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 774f8d05142f..81680c032b3c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -28,6 +28,8 @@
 #define SIG_EXPR_LIST_DECL_SINGLE SIG_EXPR_LIST_DECL_SESG
 #define SIG_EXPR_LIST_DECL_DUAL SIG_EXPR_LIST_DECL_DESG
 
+#define SCU_UNLOCKED_VALUE 0x00000001
+
 /*
  * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
  * references registers by the device/offset mnemonic. The register macros
@@ -36,6 +38,7 @@
  * reference registers beyond those dedicated to pinmux, such as the system
  * reset control and MAC clock configuration registers.
  */
+#define SCU00           0x00 /* Protection Key Register */
 #define SCU2C           0x2C /* Misc. Control Register */
 #define SCU3C           0x3C /* System Reset Control/Status Register */
 #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
@@ -2582,6 +2585,24 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
 			continue;
 
+		/*
+		 * The SCU should be unlocked, with SCU00 returning 0x01.
+		 * However, it may have been locked, e.g. by a
+		 * userspace script using /dev/mem.
+		 */
+		u32 value;
+
+		ret = regmap_read(ctx->maps[desc->ip], SCU00, &value);
+
+		if (ret < 0)
+			return ret;
+
+		if (value != SCU_UNLOCKED_VALUE) {
+			dev_err(ctx->dev,
+				"SCU protection is active, cannot continue\n");
+			return -EPERM;
+		}
+
 		ret = regmap_update_bits(ctx->maps[desc->ip], desc->reg,
 					 desc->mask, val);
 
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 5bb8fd0d1e41..7b3f887edda5 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -28,6 +28,8 @@
 #define SIG_EXPR_LIST_DECL_SINGLE SIG_EXPR_LIST_DECL_SESG
 #define SIG_EXPR_LIST_DECL_DUAL SIG_EXPR_LIST_DECL_DESG
 
+#define SCU_UNLOCKED_VALUE 0x00000001
+
 /*
  * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
  * references registers by the device/offset mnemonic. The register macros
@@ -37,6 +39,7 @@
  * reset control and MAC clock configuration registers. The AST2500 goes a step
  * further and references registers in the graphics IP block.
  */
+#define SCU00           0x00 /* Protection Key Register */
 #define SCU2C           0x2C /* Misc. Control Register */
 #define SCU3C           0x3C /* System Reset Control/Status Register */
 #define SCU48           0x48 /* MAC Interface Clock Delay Setting */
@@ -2763,7 +2766,26 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 
 		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
-			u32 value = ~val & desc->mask;
+			/*
+			 * The SCU should be unlocked, with SCU00
+			 * returning 0x01.
+			 * However, it may have been locked, e.g. by a
+			 * userspace script using /dev/mem.
+			 */
+			u32 value;
+
+			ret = regmap_read(ctx->maps[desc->ip], SCU00, &value);
+
+			if (ret < 0)
+				return ret;
+
+			if (value != SCU_UNLOCKED_VALUE) {
+				dev_err(ctx->dev,
+					"SCU protection is active, cannot continue\n");
+				return -EPERM;
+			}
+
+			value = ~val & desc->mask;
 
 			if (value) {
 				ret = regmap_write(ctx->maps[desc->ip],
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a88687..68e40f2c015b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -17,6 +17,10 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-aspeed.h"
 
+#define SCU_UNLOCKED_VALUE 0x00000001
+
+#define SCU000		0x000 /* Protection Key Register */
+#define SCU010		0x010 /* Protection Key Register 2 */
 #define SCU400		0x400 /* Multi-function Pin Control #1  */
 #define SCU404		0x404 /* Multi-function Pin Control #2  */
 #define SCU40C		0x40C /* Multi-function Pin Control #3  */
@@ -2668,6 +2672,28 @@ static int aspeed_g6_sig_expr_set(struct aspeed_pinmux_data *ctx,
 		WARN_ON(desc->ip != ASPEED_IP_SCU);
 		is_strap = desc->reg == SCU500 || desc->reg == SCU510;
 
+		/*
+		 * The SCU should be unlocked, with SCU000 and SCU010
+		 * both returning 0x01. However, it may have been locked,
+		 * e.g. by a userspace script using /dev/mem.
+		 */
+		u32 scuprt_val, scuprt2_val;
+
+		ret = regmap_read(ctx->maps[desc->ip], SCU000, &scuprt_val);
+		if (ret < 0)
+			return ret;
+
+		ret = regmap_read(ctx->maps[desc->ip], SCU010, &scuprt2_val);
+		if (ret < 0)
+			return ret;
+
+		if (scuprt_val != SCU_UNLOCKED_VALUE ||
+		    scuprt2_val != SCU_UNLOCKED_VALUE) {
+			dev_err(ctx->dev,
+				"SCU protection is active, cannot continue\n");
+			return -EPERM;
+		}
+
 		if (is_strap) {
 			/*
 			 * The AST2600 has write protection mask registers for
-- 
2.49.0


