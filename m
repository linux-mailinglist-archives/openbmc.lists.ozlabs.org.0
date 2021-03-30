Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC70134E9E9
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 16:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8rw55jF9z3byL
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 01:11:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=MnjHol6k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.139;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=MnjHol6k; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2139.outbound.protection.outlook.com [40.107.220.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8rvm5b20z3bpX;
 Wed, 31 Mar 2021 01:10:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJVm2z6jrNIQKeMzklEiamOWZT52IFaqVovOKHByEqrbUq08oawc8tTOnxUXxogsbdv0YeUzS+EegdJ3sVDJ2wTetOsMNzcZlnWU67jT6DXiiqa118cUSTY121zug+uh7N3tF/M4johHj5DBrtGUQB+9WqhXCzbxFhXz3HYJsQRIIoF9h9WNWO3wetdpYH8t98veJvSKugsPeV2pPDRkc6b56Bqi1w64RtcJ1m+F9ljVcskZB7VmMNj2ThBT4fttXZD5YX/GtEzLk1DzIT3FlSeZg1yHEKLJ3vZEcwOa96EUeJBujMFUPRNnID8kODe1OxHU3Qz2T0Wt7Ss/ywCXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGaNVQD5x5rpuDUHjPygn89EnlhnqwajxUtmJtQ1tjI=;
 b=EVd0U2USwcgqIYDDuRIF76nC5E5euX0PLWEGnwzlbt3bLW4KhHjR0H3nXyKKtkqGsnp91dk/NHMvILWiFxvcYjF0a3q2aIElx8r8OJ/OdGG0tvzn+RgisXOfqqA5gMJHv0LWr5/wIs8YE0Ap1EgSqyBSuQVMrEvJbM1cyaR3DnOAyumizODKB5rpMMwp/+gxH5hDxguIQPsM+3fQC6mVpRyHSzJROKxFC/Bcc8nmbpcxoinJru9Iaf+JGLmOqgcZghoZ2JoA0XhjZWHLnEBpxD+0NaFNOs8Ks6+pFpbnU4DfhBObHBln6Jm1NE4SDV25wXZ5QqKY+ghwAO5yCiuKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGaNVQD5x5rpuDUHjPygn89EnlhnqwajxUtmJtQ1tjI=;
 b=MnjHol6kivPOTvDD1C0jNNGzN/eaWnXxaUYw5myJgpal3r6bQ0Q6UlE2q8Fn06PeCLO6d0zg37caApH05kAELQqg7XLw4bxmhw2B6QgiF8oH59CuPH5nVHKRCfdK/kF8riFbG8h+ynIYZ+KFC5rI1syeROL20VkgUHjRESRQvME=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2736.prod.exchangelabs.com (2603:10b6:300:f3::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.33; Tue, 30 Mar 2021 14:10:50 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 14:10:50 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/3] Add Aspeed SSIF BMC driver
Date: Tue, 30 Mar 2021 21:10:26 +0700
Message-Id: <20210330141029.20412-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Tue, 30 Mar 2021 14:10:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1e580d-9674-497c-2526-08d8f3859f00
X-MS-TrafficTypeDiagnostic: MWHPR01MB2736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB2736A8344B26B21FF4827779F27D9@MWHPR01MB2736.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ophLFFlekC5fOWK2mZZrfcwtfEltT3ymCjS2doJIysU1t35D2fCHhXcCwAkQn+6p/ywD6my++L5+aXilJ1ua0b0UQAbHHokYn5T53ykZExZYBkKg9Uv6uiQ231o5PXeeIuiworGNt81iF87A577gm0PZ9HcWUqKaub1niJ2+Faikiya2jJXKqy2wI/dBZc8OH/fWV99k0Dl++M6gHoHH2xl4nq8niBeZVxTgqrnw8xI3TMsdStwzlJCZt2MYe94V4X7myDotoERayH8lPUo3ktYAdNiByqdTDkzHwN/R1ct+kOXgcCQP8DBnYlQjui0vOZp8/ar84mJjrhMyheaVBGGWIZHxsH/2xfmZXNnX/iTIDt+qTLi1HRm3Ocog/c2iDaCJ7avnwjQLsj75Q1HKaBGMhh7jQNt4IxAOhxjdcF9R6NQVy+VPaVY5FZ7NMIQzPJkiBz6YR23MqxOwtru9IieUfDLjYiZVSY3Z6kQp5ocUw8xHiKvvL+Rosz667Sk32k+m/DDsB/Je4Vl0fIBFSVYK9xcJFRvLyeusMLudSZbfb0tXbDM4BEhEy89RiXpA0VF6mlkV8PEkor4Dl7I/eUcZPWIKKbTkX+zLX33vt5HxUGvt5QwPfue4dmU1H1NmyY4eLF7kgfm2RPLX9yS6EsyT0pSRYhthnDC0Wl6jZc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39850400004)(8676002)(107886003)(86362001)(6512007)(5660300002)(4326008)(921005)(186003)(38100700001)(26005)(956004)(2616005)(16526019)(2906002)(66476007)(110136005)(6486002)(66556008)(66946007)(54906003)(7416002)(83380400001)(1076003)(4744005)(478600001)(52116002)(316002)(6666004)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5SPvRRxpNzydOPmiFOL2GEGR7Yg8upPT6OpFf9+z/06DLtvaHYhhY6FHQN9V?=
 =?us-ascii?Q?htrAO0S/MArr2VzMyB8ytjm1r0GU+8sWQyhoDeHpuetWvxJsiEEJDoywFNm/?=
 =?us-ascii?Q?QcLR9t919Lx8f533TN1BR8NpdCPOA2m2QXvWvEoTnW03jImShL5pX3Iaqty2?=
 =?us-ascii?Q?TK5p00cjP8gp+PB5bj4Pk6BPNAPIKjvN45996sZ1pTc646p7Geb6vFPyT70j?=
 =?us-ascii?Q?hD7Bj8B+wL5bF4+k9mBLx/EmKjZb0fcVKZ/y9cyBxFeawnSBSJomNzgQHtym?=
 =?us-ascii?Q?E0PgrcfhD5RVbK56U6goVvB3hLRiFuifiY7mJE0z3BnvvECgIXvo5JqUKaLe?=
 =?us-ascii?Q?tAnw5ZRXOCkbx7hjTMzhTdeMUZjuMK1G++X/zYZzaYxRvcYhVxfbXVwbaI4o?=
 =?us-ascii?Q?Jr9JWhAzvf2c4JhH8PdmPpWm/dtnKnUJTdh//qmeI9xONaTxDjHKiDjSWvpY?=
 =?us-ascii?Q?Ak8IUzxwiymB9E5mG/WrW5Ixt9NTKVaWE9y2Jd3+dLXGug7f0MRzekTsyODs?=
 =?us-ascii?Q?eDTsDhj5MZS7vhz+0hVMhegP86F5JmpPfkNu00HXu12FighOV5TuoYNGdy/+?=
 =?us-ascii?Q?/FtrFraw2zBar2iL69XThzLoY2lTsGYzqwF18dABB/AteX62JmYnH3/ct+Gh?=
 =?us-ascii?Q?sg9FIsSHp6inqaFrPD0Pp0DoLtPNi6d3/dNfStoxd6yu+89LzMl7cWojhnxN?=
 =?us-ascii?Q?JtjBU5Q+dF2pkln59k0vMBiFyjhrtTNXhnhvM9/gHgfOMx1bUO2qjeQTHxwH?=
 =?us-ascii?Q?8j4NU6vXOmaIwjr32ugZ3rWl7S3wAxIyiMjUT/SVC4aeD2prfLwsdTSNFt9Q?=
 =?us-ascii?Q?ZIdaDO54LBX3qFDeaVhzfPbVnY2BlSqdzAxCt43vfm74ZeLyjnq6j6XcT3Ny?=
 =?us-ascii?Q?ZIh7ptsCdKISo/wO/JlxdQhFOJud94bd7sQRCgCaCo8+zy3yrRTyQNgor4lc?=
 =?us-ascii?Q?Wbv6ftBCNTmBapZnPx5PrIGFKfYpbVoQ0aj//8lh47K1VCoMLTrLuO7u/Jdh?=
 =?us-ascii?Q?ie8wJ7N2vvZ64FgUjsHczjbAatFfbSZa9OsmglJAqAHNBSzbEzbKmu9jgQKQ?=
 =?us-ascii?Q?CDPo2Lvt8BXBXemJw++VqaJ2AEWknNhW+68m5yF2L2DE6MTpQYVgATJl4q14?=
 =?us-ascii?Q?l2skR+FOe9REba33fK3fxS6x4G119UgvSyg7gUprXf+JYHCJ0qRa8OPeAczl?=
 =?us-ascii?Q?Qgv2GsPHaES5+3d0lX+rzxHpRu6bR5SPdbjs3DjVOSsyxEny5M/4TKQ4FInT?=
 =?us-ascii?Q?loYWQ+B4nMpGZE8o4fuijvAbGYPCkWbRH5IDKNyCEjE7OXOM9T/mzKPyPzRC?=
 =?us-ascii?Q?/bYij0RvQvUucn8VBw8ZqWWJ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1e580d-9674-497c-2526-08d8f3859f00
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 14:10:50.5107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpOGeTzAsU5M6gClLTCsg2P+k7hmQC69a8zmWa9v4oa/2bpVBgEd0rSCHNmOFG9AxM4KdeWhMQRqQ5SHzuetsqsR8mJ++MRKC8LfBgV5F1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2736
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add support for the Aspeed specific SSIF BMC driver which
is to perform in-band IPMI communication with the host in management
(BMC) side.

v2:
  + Fixed compiling error with COMPILE_TEST for arc

Quan Nguyen (3):
  i2c: i2c-core-smbus: Expose PEC calculate function for generic use
  drivers: char: ipmi: Add Aspeed SSIF BMC driver
  bindings: ipmi: Add binding for Aspeed SSIF BMC driver

 .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
 drivers/char/ipmi/Kconfig                     |  22 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  |  92 +++
 drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
 drivers/i2c/i2c-core-smbus.c                  |  12 +-
 include/linux/i2c.h                           |   1 +
 8 files changed, 922 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

-- 
2.28.0

