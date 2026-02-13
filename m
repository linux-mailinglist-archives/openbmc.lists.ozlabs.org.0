Return-Path: <openbmc+bounces-1371-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIp2D/1NkmlVswEAu9opvQ
	(envelope-from <openbmc+bounces-1371-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:51:41 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7013FEE2
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 23:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDh3X5RXMz2ydq;
	Mon, 16 Feb 2026 09:51:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770966636;
	cv=pass; b=G4PJyE5ZDm0MSPxZz1MENyQS5u0UuVGA3zYxXmPFYg5ULbmyfAqEACxIqHWmXp7SjaegPxC0N70pN3FIrYelOlhs881uf6uygMI+BSrM42+A1XdZK1JQnycMtLiQuzC0u+k29YHqrWK9TroRAkygm3HhckVEZw2CZbucByyzdvR6ccdys95oETnTMoFc02Et38s8R+XZWDHtMqAf934qLcioM24Fe4HSm1OQFlfu8jk2PY2rHx7BOhGF/kCWJXUyl07rHx9YEheW18YzmFa31jS8pGuSm6thqxJhlPxfdn4sdpZCi3UJK+Kvo2vnM4jqLSyA691YG78FuB/OV9nkqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770966636; c=relaxed/relaxed;
	bh=tiAGlXSsiM70I8licYpnE4FDLAuNcONxUtRzxWmcZvY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mmp+H93/zhYsmiICEQBSFwtqlaV/dXYPaobrAz/dtI1Mqz9XNWhbtJQudmb8zU4YH2rdtJ6pP9ZlBVfqLIjT3jdLdrLPJMD1jTEeUqJHAjs8gsC+2AUeZStP676O9+/a8QQM8ne0wt+XUjCZ0Atn/c1sap9Q3T6EEFgzRWN0Am0v1e5u8aawurJSrZqHr1Tiyfk0MHlDKYu1we8raoKo75V42rOqXu9IBnDg18l2SLOcZkHFZZISciOq3JenXaJKUtld0lL/KEoS0hYZDlnHx11GXj6F+B2uFoEyJpr/ypZReLHylsCyp8yc9wdTgWfd1NXNoXX75/DOpWRUnuh/bg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com; dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=VFbt5v7g; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org) smtp.mailfrom=axiado.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=VFbt5v7g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axiado.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=kchiu@axiado.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC3Gf6ZZ5z2ydq
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 18:10:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAg2oRJy2geAfgXSHRuucf31FQ2t2SK8rAjaXE6bBgCwXvrE1nuMsmSgyhCCs9ZKZvRvW4PR9mkbJpTX0aUurOT7Sio9tVdFAgHM9zCojO6XBhIXCygppL6/1YKVoycrRIzaW6/iboeA85YJsRc2TmjfkkpU0T34kEhtDOnLvHAUVGBN17gqLPymId9MXn4fO83/zthncIo4nhqf9N1juY5x6K/I+SjjlItvA1sMiEeSKRAx6K8SfXyJ0i59LseUHosV02DZlTS2ttmkmPLePBraBu7XOKqlURW3VmayXIhYAATZnVOdDJfRj0sFvAyNpk4G7qhoE15fa41aDhjX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiAGlXSsiM70I8licYpnE4FDLAuNcONxUtRzxWmcZvY=;
 b=M6raOntMakuQAp6XvmSHnqlkBQLcGUAp8MJ3Bw3s3gbJnu96Xs6bS7eLUfMGCzNdd6QwcpuRrJgXlKfXPWhc1c6Gioz+AK6YKVwLmNgBOSlYFX29RUAu8r2Oknuu5UPELNJ1Ozs2pbJDz4EaFHUEdFjwTSM0I3tqum40n6TI+4K4BrSmSKAnXzSTq78c1KxckhdB41tv0jzvX0J5BCFzAKnRnX0aXOx5wKzeTxpUVejbgWqACaKib/IRxyln0m5Pr3yOJ11+L4kOkXpPqD1RFB4LQZhOvGtf1KGh2b73gBQ8QYW+4Erv5Jol8xIQvt/+Fx+hPgnBxx6Oq0EbJWCKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiAGlXSsiM70I8licYpnE4FDLAuNcONxUtRzxWmcZvY=;
 b=VFbt5v7g/wZSFtZiPldtZhGnWrJ0+vnjrtsSY61Ow7Zpb9XeXNc7iWQPtGaumWc0dALfmlNsZZSWU5CFQIYYbJn4kvTAUeEfjOnsg8adiFrwSlkoL8mQ/je5MpvZN4fBJx/RZHLBzp/aKpF+VYssMVq1cFLLDZykV4iCLEpnIVuOfZKgntBkSwcdclU3e1ebbCU/ioa3o1qtR0JrM6DOFjytmMS0nRu9J2rI+G4C7JjSEG2JPCzw0LGwoAsIr8LJGXTqSPizfj68cOwSFCkq+qGuZfUl1qofKGZ75QRT4dekFA/+wBBGP9IxYaiiX295r+wM6hkZmCCs6r1jWy88ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com (2603:10b6:a03:37f::19)
 by BN9PR18MB4121.namprd18.prod.outlook.com (2603:10b6:408:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 07:10:06 +0000
Received: from SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21]) by SJ0PR18MB4479.namprd18.prod.outlook.com
 ([fe80::2bc8:6a5c:b10f:9e21%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 07:10:06 +0000
From: Kuan-Jui Chiu <kchiu@axiado.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 v1 1/3] spi: dt-bindings: axiado,ax3000-spi: Add binding for Axiado SPI DB controller
Date: Thu, 12 Feb 2026 23:09:25 -0800
Message-Id: <20260213070927.1114371-2-kchiu@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213070927.1114371-1-kchiu@axiado.com>
References: <20260213070927.1114371-1-kchiu@axiado.com>
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
X-MS-Office365-Filtering-Correlation-Id: a5a7cda9-f13a-4516-9860-08de6acee932
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RMFIwqxfY47bFzH1NyAopAk2oLHsYerYWMxwfc94NxhQDVqsx5XSxW8EeI8v?=
 =?us-ascii?Q?pv7B/ipScr7Kg9ByCm2zvglOYsQKl/8D3vyKbTIhMESgSWt2jrm7MN9sz3aM?=
 =?us-ascii?Q?OkKTQ6Hx/o+DoVHGQaSaVisXRAO804uIxlGKBomn1NQORDzZdl9k5DS+mOiW?=
 =?us-ascii?Q?fgpfgIJPpxXtU7wwOnPw7S4a5aNAWmJITZhTl2hybnP4MWrIPifdcQgB2xJ9?=
 =?us-ascii?Q?V+O2KO9XQr0yGcVyxh10dSfguYSPPOn93fKhb/VvlgZLLVQJyc7TZyssrFUS?=
 =?us-ascii?Q?8XRKlrmKKVFHrH8/GVdRy4pECedZCW0y48sw3ywHRj48302+XgJ7dVifDSLe?=
 =?us-ascii?Q?HjlDKmW98sxvAAl5xKqprk923LYWR6qZhpgZEESwWk6A4g8rLdq5ljjxZuXx?=
 =?us-ascii?Q?oYOvL8G68ph/Nw/KSYCpfOglrF1MQsuYtOlUzCCDJLszzMXCSWyLO0SP5m0Z?=
 =?us-ascii?Q?1Qp7W2yAu2RnQ+O2usqqB91r2Iv/AGO/9loG3UtK6yHJwjmgSCUtEk1968EU?=
 =?us-ascii?Q?/b/kzPAAXJQAa+wjoNDFJLYTJTJ2GvNI27K1DSPVoiwup/fX/lrDZT3bmlWj?=
 =?us-ascii?Q?u0/fU463uEh3QRuE+N1Z/Axsr4r6qD4YEKxGcL59mD6MMEEAY7/IqTIDa/KM?=
 =?us-ascii?Q?9cOdRjqwQP1Dz0LfhKeVMF9Ttc1ngyaL6ZJ9LCvLfshhi84ZZI9O8J1ZQJU2?=
 =?us-ascii?Q?APDCJPnzbIFTmtY4uIgleI1xSXhderVTG3ZD9MwKAmRFmpM2BeVF1R9WIVmz?=
 =?us-ascii?Q?gIGaw3eDUdFWF7/f+ThCneVTKpzjzkquPkUkMJyk13YGEjDZWmWbQ7t6xmxY?=
 =?us-ascii?Q?e3bHQiyS58dzuheEAJT5wgdPXEL+fgViucZ2jeOh1mBEeJoKblbMUxunILFF?=
 =?us-ascii?Q?m0j0y99dbGSRQBc8vPtSJ8YICzYY/mGG+z5vYj3ttMgIf6mOouaSZu7nvC4d?=
 =?us-ascii?Q?/BWvsIZilFFB/w4op+5BqXvEd2MHe6QeJ+HUGor6nMhNfDWJY+ns7kVOt8m5?=
 =?us-ascii?Q?8Vfcjx1lSCQb02HwpAAeEWSsRAlwch2QWKkaAZjdvlXPnwuLF2nXoUv7lV+I?=
 =?us-ascii?Q?PFIFijf5GXJlAS06QAHUxqxhyiszB4wiIs80zQMRuVkw1/NTZrFvKLYMFWMh?=
 =?us-ascii?Q?fEGG6Qje0s8NuA5Cs2JhuCZ0mdSkV4SoG3omJmMiaULtoQKwnUWabox86Q40?=
 =?us-ascii?Q?tAVASJIx5qGVWZad5g/LBhvt38b4iWmTdBXYhP4M3+YrJPH5u5yXbU564rVW?=
 =?us-ascii?Q?b4HwU1i+7IhEHkGhk1VLsB9QOsMBP/sIoAeMS7tRxmrhgGvXxwBGox75vfqY?=
 =?us-ascii?Q?xyRbwd26qSR0SARMe7VpfPgAicHfs84UGgPrUWaGi9ZE9eaRmSrEMltmv2Ei?=
 =?us-ascii?Q?wdhfqNHX8z+IAAVUwbPea+d48YWwCFmIU0DzokxErhX4RmeVZTUeSQHZvBhj?=
 =?us-ascii?Q?B/U78Tc73h90xi8U7eM8TZNerbEF2N8rxFeWrR4eUa+for0QEwJD7aciTY9q?=
 =?us-ascii?Q?M7lo/CKbEfLr8pUIS6VXgz04GDzCN+zMxWc2jNpDyj30YygSQNpegZG5ChDN?=
 =?us-ascii?Q?hQ5o7IiOfIMZGNfesr3yUUF/v5l5E3/Zsg/pFOYU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4479.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/vw95TpUH5EZ0QWwoeCXFbVbz+cYmlESjPsaUtp1G55OWJJaz/FE2nGcjeAo?=
 =?us-ascii?Q?T2eyhXLc46bbXSoqhjdh2OuTCKj7IKPtAgFcexySY1kD0ECeJpxKXpdW3ySb?=
 =?us-ascii?Q?6PL/pF0Q/w71/bWYERGTksJZYvFc+qVodZMvxC1RRLWKbRNsvjkcecDwxUPg?=
 =?us-ascii?Q?j4ob4e27T2bNNDH5kF8X7Yc4LzOm2/++sgHD7YpT5RqK+Nu61cJ0s08ujXat?=
 =?us-ascii?Q?lUtBKO0bN4QkEWTR+ABUTPQSeuXrPCCycP5HlSULK0PjUCNUxglEdaT2lZCQ?=
 =?us-ascii?Q?CPVaXmNYpqoTJHXDMEbYwQ0P6kqcperTwxno6GUY3I/ZV5b8jY2oMbVxkNmi?=
 =?us-ascii?Q?/OtC+H4Ho9SgFwxKtnleicyQUdPIeOuzsrRlV7Jdrp02YHa0IVxa2aNJWzgg?=
 =?us-ascii?Q?bz6lkl5SfXb9/WTOLmJa1ZMNeq3Peo3qmEawaLWpkqOeN/raPG8ITsga2iBp?=
 =?us-ascii?Q?FtmXc1n1iK1G8zMaVPCTgbc17UR0Fh39tw86NkSiyJiP4cPQxVvc6v1ylm1y?=
 =?us-ascii?Q?pd2CNFCqnWdAqylACL3eKO8KB35QjNfBpDdRTg1snkZ/2QaaHX3dvH/j26Ua?=
 =?us-ascii?Q?RMOFysAZlkRhY3boM9aT/yM/C+QlbWf6eO9SI0+Nj5w/JmLHTGzChF6JHIob?=
 =?us-ascii?Q?yMQ3Ktg4g8OzFhXD3gcMFe6Zf3YJYG6RrNTJFPY0GdxPAuxF2Exr8/5ncNN7?=
 =?us-ascii?Q?9TMdbmrFoAUixX9ckvULyXaS46/iic0n+3GTh7tH9mOwoWHlFUtPn+KLEQ0u?=
 =?us-ascii?Q?miLpEVHaxJakojXD/Y/QuoOfahR21MVo/aI/Xxih2wJwOchnSiALKR2pDR4N?=
 =?us-ascii?Q?gRPjdLpmzt05WlacRkQGgIkXYG/9Jf5KS6BzmLhBlS7R2MTMObApeAyRMa6+?=
 =?us-ascii?Q?4bWNYce7AA9d9/07Knb+HtLGabboVcpYdJOKlMYsaNT5DRsoaOkj2YPAfAr1?=
 =?us-ascii?Q?eDEhtHMMEUwRygHWOfbrBtmGqYjXnHi4VPa1fc6aFkSK+VypWkVlq+RRTzIO?=
 =?us-ascii?Q?jhtf5Zg43uaFK8/I2aBhMCVQ4bm0S007OFSaDE1HmT4PhwleYJNK655OdAKc?=
 =?us-ascii?Q?ReHEIna5cDiggsX1I7QIJeObpUoBfofN2+SpVSIwwR+0Y309vT03ZF3PKGsb?=
 =?us-ascii?Q?h2Xt51ZhkOl3Ckx7wE5R2R9GZ6tnp8jKl6CTU4AefDxNTQmNAU6N4HmjXbwd?=
 =?us-ascii?Q?fO42a6X/ncZOS54UK3Pe3awi+XMS2YmLsbBcHelgJWbioEls9NXIheu+2/ld?=
 =?us-ascii?Q?cMY6Y/tBoXgiJ9gx9RB4GfVl0En+C42wapqXQGksYuYPxS7cEiNPPkGCqfdC?=
 =?us-ascii?Q?1hjqdJo9+O0InVJYSQQH9jHC0873rZXPcavJxnmXgifikNslnWMiMWrmSHbo?=
 =?us-ascii?Q?ea1mBhFBWcn9urHefGXoYN8udDvXrvvFbuysGn/Xu3OU6mJAe8KALibCg2Hl?=
 =?us-ascii?Q?Eeu2kPuHHNq6dQ0ZWKzVk8ql4muZ3DNlPxNkYn68wxfElEA7o/123s8vGGBA?=
 =?us-ascii?Q?afTmKfIWArcxUwLMg+QXbs0y62mjBYfpcVQ1ScrMb5c1RSIQJVOoQ+K71S9G?=
 =?us-ascii?Q?sop5uoD2G4VJPLwsVomODgyzXs/Xd0lco2ZclfHDsQM2eXaj0/GevVs2Yvoo?=
 =?us-ascii?Q?nCuYt2OkwqUhVPQpUQej/BSA20u3pqRbJR0qVgLwGYLFsdh7qxcSP6tEKdjU?=
 =?us-ascii?Q?rHdngHnKpr6RDcQrOyC7HLjxDGRrJPe7hxO+Oyh+i3OtQGUr?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a7cda9-f13a-4516-9860-08de6acee932
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4479.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 07:10:04.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6AL8BcYLMKmpcivvXpKDMI+BIF+RtcL5e1WxyyUd6N6DhZcUPQlx2knKWEpQXpUQJhl5O4qybONT7RZNkfOjw==
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
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1371-lists,openbmc=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kchiu@axiado.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[axiado.com:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_PROHIBIT(0.00)[4.204.124.48:email];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:mid,axiado.com:dkim,axiado.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 6DC7013FEE2
X-Rspamd-Action: no action

From: Vladimir Moravcevic <vmoravcevic@axiado.com>

Add documentation for Axiado Digital Block SPI controller.

Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
Link: https://patch.msgid.link/20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-1-726e70cf19ad@axiado.com
Signed-off-by: Mark Brown <broonie@kernel.org>
(cherry picked from commit 7b122b1eb627059bd331d5119124a2da5e142c01)
Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
---
 .../bindings/spi/axiado,ax3000-spi.yaml       | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml

diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
new file mode 100644
index 000000000000..cd2aac66fca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/axiado,ax3000-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 SoC SPI controller
+
+maintainers:
+  - Vladimir Moravcevic <vmoravcevic@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Swark Yang <syang@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+
+  clocks:
+    maxItems: 2
+
+  num-cs:
+    description: |
+      Number of chip selects used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+    default: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+   soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spi@80510000 {
+         compatible = "axiado,ax3000-spi";
+         reg = <0x00 0x80510000 0x00 0x1000>;
+         clock-names = "ref", "pclk";
+         clocks = <&spi_clk>, <&apb_pclk>;
+         interrupt-parent = <&gic500>;
+         interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+         num-cs = <4>;
+      };
+   };
+...
-- 
2.34.1


