Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056113888AA
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 09:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlQ646c9rz302c
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 17:50:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ZcagqrcP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.111;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ZcagqrcP; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2111.outbound.protection.outlook.com [40.107.93.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlQ5h3PHyz2xvc;
 Wed, 19 May 2021 17:50:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5Ofs9DiV3HM7R4zcK9DP4Taw4TgDOeJAxW0/iQriSMa8KG3VkOtWOmQ5H/t+wFWZ3hbF9E5vkwSoJZo7hGVUyGnMdwpup7ZZ5ILGgdo1RhuS6X5wq80NCgYEmYWGgdvZVi5DqcI2B/joP3ZCDf50/z2DB3+ey/R2U+kVpiQbSzED/iZz3vKp9wRI2oee0tIbCB/Op7GLjHjrKKVgKAZ8tgowujsR2++/Vlnm/NBoQEk+SmsiRaYZoOXoeb+OEx+4OTZ5yIqdlTO6A02dbbPFmM2CQXz9m6Ls7GuI0gUVaNAP6Huahk4zl+nbEHlnvXPxBGPepxkL+ThTVccDsWrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMzGIKuhioI5dKKj4UXaGOHki/qKge3G2HGDlIHJmJM=;
 b=FNL/PtlVQLZETLcqiXV3vjKM+TUo0lHim9yotoMsR9MDVOaIEHPalwq5kb+rE3thg9NKxkTs1FBmyZoa1PWKuiMzxdV6W58o/PSZGafZy+WdYjt5/0KGHxO8c5y9wQzahOg0RIwBbwiqZTDhas0/EkLAbPeJKb584/Co+lJdI2QghKwFCJjwijzWTclbU8YNiHnRpP400Dw6WRM0TQVzIoJqyqBsAnEWXb0cB+3SOcooKBNvjdZn8FZ92A0aJGDKtncWkFu850bYhgMT4HGsmadgcwArGheWHi3cuCMwrZhJqlQhv3Gwce4dyzDqfmWdjJo5zDqpqaBm+R6HYg25YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMzGIKuhioI5dKKj4UXaGOHki/qKge3G2HGDlIHJmJM=;
 b=ZcagqrcP7E/DGZkcVZyXhWAfBp9yaUlYYkrHbVydvpDz0kmecJz9ZwCuFw3baxlqjhkQPeStuxjKYk0cXFpeT8EBRf0tcQmEodZR4AB4shDXeZNYg/Q9ScM2Rd5u3zsOAi10fSwRoAVQ2pQD87nvSY0ZXKaeGAfC6aLM/Hl5XLM=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3451.prod.exchangelabs.com (2603:10b6:302:10::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Wed, 19 May 2021 07:50:16 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:50:15 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH v3 0/7] Add Aspeed SSIF BMC driver
Date: Wed, 19 May 2021 14:49:27 +0700
Message-Id: <20210519074934.20712-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: HK2PR04CA0081.apcprd04.prod.outlook.com
 (2603:1096:202:15::25) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK2PR04CA0081.apcprd04.prod.outlook.com (2603:1096:202:15::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 07:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b64fa7f-f974-4f92-1693-08d91a9abd15
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34515934BD192F5A6C4F1803F22B9@MW2PR0102MB3451.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksnt2QQ8Y3z1deR/dYJGCaIpFivW2U6uwYxH1H+5nPCOVcdgbVFRYMv0TQg1luhylipfMcD3wUY0PF67agnlhGIouFEB65OvCPI32eGfk70Yd3iknzLQiSTmVeBtbYDNORIPpVUeMEoaDo/1LJuIQWMTUqSjBCsUKAZiFIZ7IiQZCNDa7yH5cWUX1sEIR32EFYyoCT+shHZAukQ7jh44qs23Wh+EZW8+ZI+dS2dOKz8WqJWNw+61PEgXfooKYgkYj2wWSQsYaprvKT/RRe4QqExOrMdBheH08SuHPIVEy5fz+vC2gGE8Vjo8WuGT2yoeu5BmRK4GU5YOTpKx/bJzFELmTT2Tx62eOIA2v3OotAITei70ACYeitEUBfeIqxAi6Av9i4F+bZflBetT4mAoLLC+ib5f8Abe09kZ4+DpAsZpiQpoLO/ezWWYK1WXBaSihJSkVm0B4Vx1LIikqzlPAO9luXDAzS9V10tQkn/efHlEAnzzvArFCsjadtpVUhlbAi9miYVEZKvMm8VgWpK9ygf+lEu2A6k9/fkR3l3mH8ZjKA4ET1o2/KboH0s4aE/TlkbNxHTC0KOqHME9gDxeBobZfA3ua+hflYsQMxl/ID5hPvzpn+7/dKy4Opb18uli/0IXk+SwFuI20LOAOzzIGEv5xnwxt7btp8tLW749kGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(376002)(366004)(396003)(346002)(83380400001)(7416002)(8676002)(2906002)(921005)(6512007)(478600001)(38100700002)(8936002)(186003)(16526019)(38350700002)(52116002)(5660300002)(956004)(2616005)(4326008)(110136005)(54906003)(316002)(66556008)(66476007)(66946007)(6486002)(6506007)(1076003)(26005)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Vliqi79pWnJuaAvUsAEf2F90MxOAy0oGVEof5NIjm0bQ+UzcmffP8KqNNiN4?=
 =?us-ascii?Q?yD4kq6IIy0HHcVFn3er0Gpnxsg9cZ1JqERAPgAvYKMx3fRkNNaxrNZpY0lIU?=
 =?us-ascii?Q?d6C3b0Qjc+UJsB7E+5KDhGsc7aE+cZ4D8Rg6u7AlJs5zbklNTVR3LRlchljJ?=
 =?us-ascii?Q?mJO2xht4w6C+4rHXtpxfKDSsnMjWva5W96oVJKv43jDIV+138EqnLq021xN0?=
 =?us-ascii?Q?wQArxOWONyLtmNCfKYUs9BTNt44vlW8nK3fIi2Jno5NeiBIrbhXWWLh468i0?=
 =?us-ascii?Q?ccwfYbyQ/SSBre66SC09hz6GI60H51dmprXFm7gJ5/g6dEII241uFTDx5mPl?=
 =?us-ascii?Q?u9/cOgeAXJ2b+Ftu75CecAqUdJfJKh2v2iDOJM9KB3lh0gEb48D4kGIc8Q23?=
 =?us-ascii?Q?MQDzmT+vCPyKru8OshuMjujMtACA2baTQMNNI5dNSq9UYuaBTHpYn9Dt26tv?=
 =?us-ascii?Q?vbvaqEzYFBlXMNA7bXXN4NO5CknCx8q00sv39kZFnt4fitrdFbhXur7g9EH0?=
 =?us-ascii?Q?oSin8wcCPSqKO9/Kj4BmfA64CSJpl3IURYmgGyuxaeU/YaGQziiFZyEJMOtc?=
 =?us-ascii?Q?UnuFCR+7E2hmX6O4lkT/6rCeiN9Qjt0eND5yY2QfOl7kR6LYMowTa9Y6jlBQ?=
 =?us-ascii?Q?ZEDW+Djtp9+3NwCDQCFVJcol1YxL0wv/+LR1956ALndA6zNxtIYO76p1weBA?=
 =?us-ascii?Q?5y/OI3IaoJs1X+3HFPftZ2EU7twxiFH2pZPeb5PTmrbqzVa+bbaqBsPkvyDK?=
 =?us-ascii?Q?2K/HQE3JXm27STUuNrQKgQztu640vIHdzO7jS7UWPH/jkCm5hUsA5J4o4XQ7?=
 =?us-ascii?Q?f143ebgBltqtUJvzVeIL1WoPm4x+EqcbyayccViajyYGvfcsIQWrQ7ZuuDk5?=
 =?us-ascii?Q?3c1Pcrh8WuBZXGYYfEuh+bXnn7SMxIyvcsoThcjn6/hBZmDKsWa7pb8WWB8f?=
 =?us-ascii?Q?iUWnQT590e4GZ/AsSMR6P0Fmlics+6A3Lr17aAKw3PYa/c7nHU4mfffFK1Mt?=
 =?us-ascii?Q?zJNpKR83m4Lm98LUA9T7aypx02jOE0B1FXdISS+x3jL/TYHGEqq7BmPvYsWi?=
 =?us-ascii?Q?nruFxgjovG+ji6qpgCgcqhKjTzMUC8DIs/TmkGwCaKipLh1Lt6SDWZe9YW3I?=
 =?us-ascii?Q?sP1tsscotMxzwgNGQwUPEy1s8sIvx/0/dqC+3JLDuQcoIbmYOCeJxne4Q/Oj?=
 =?us-ascii?Q?Zr3/+3ZloIBLUrqOJUCLSRkTHl7+DaT6nWp5lZnnHdZQUUU91knv1R6ng0NO?=
 =?us-ascii?Q?Ko5/XmRg8J3YXvw+3Vfjz/Z/XEYfHIY8HGCWeaTffYlqQ2d7F4XW3NphHL/0?=
 =?us-ascii?Q?DRLD8L2WyRsHJYOGzynllYIi?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b64fa7f-f974-4f92-1693-08d91a9abd15
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:50:15.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2Tce9SYQ5hlRUHkEIcbAmbxXV0HMeRnJX9xIRioTlO4ScCgiHGj8EwTmSnPSK5ahlafF/HRAbZ0o+t1IHzq+NziCeUDUmvwDFO2ylmfBRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3451
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add support for the Aspeed specific SSIF BMC driver which
is to perform in-band IPMI communication with the host in management
(BMC) side.

v3:
  + Switched binding doc to use DT schema format [Rob]
  + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
  + Removed redundant license info [Joel]
  + Switched to use traditional if-else [Joel]
  + Removed unused ssif_bmc_ioctl() [Joel]
  + Made handle_request()/complete_response() to return void [Joel]
  + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
  + Remove mutex [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback [Corey]
  + Removed the unnecessary memset [Corey]
  + Switch to use dev_err() [Corey]
  + Combine mask/unmask two interrupts together [Corey]
  + Fixed unhandled Tx done with NAK [Quan]
  + Late ack'ed Tx done w/wo Ack irq [Quan]
  + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
to fix the deadlock [Graeme, Philipp, Quan]
  + Clean buffer for last multipart read [Quan]
  + Handle unknown incoming command [Quan]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

Quan Nguyen (7):
  i2c: i2c-core-smbus: Expose PEC calculate function for generic use
  ipmi: ssif_bmc: Add SSIF BMC driver
  i2c: aspeed: Fix unhandled Tx done with NAK
  i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
  i2c: aspeed: Add aspeed_set_slave_busy()
  ipmi: ssif_bmc: Add Aspeed SSIF BMC driver
  bindings: ipmi: Add binding for Aspeed SSIF BMC driver

 .../bindings/ipmi/aspeed-ssif-bmc.yaml        |  33 +
 drivers/char/ipmi/Kconfig                     |  22 +
 drivers/char/ipmi/Makefile                    |   2 +
 drivers/char/ipmi/ssif_bmc.c                  | 605 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  |  93 +++
 drivers/char/ipmi/ssif_bmc_aspeed.c           |  75 +++
 drivers/i2c/busses/i2c-aspeed.c               |  51 +-
 drivers/i2c/i2c-core-smbus.c                  |  12 +-
 include/linux/i2c.h                           |   1 +
 9 files changed, 884 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h
 create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

-- 
2.28.0

