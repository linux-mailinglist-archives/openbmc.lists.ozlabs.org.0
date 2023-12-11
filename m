Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C67BF80C650
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 11:23:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=G+RnZEIi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpdBS20MKz30g5
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 21:23:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=G+RnZEIi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spd9h4746z30NY;
	Mon, 11 Dec 2023 21:23:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg4Rsou7wwcdZUWNR0ZD6ReRnhemirOOKRRvfVfa7WiNRrD27+RPj4RG2LDsX9kFeFOtMZTW/FhLoxSabsvFgOHtRejL455cyzb18+Dq70P7z/h3xYhmsBZhzt+QMvCoAPx4AU0kcIdS3e+LMjdml4Wqe8JGC3tN86VOaAW63Gm/OpWQBZ7ZHPyFXY+aLWhuQQeIlU7f/R6HvWuD1aJW61LbEx5gp7X15vzTWkZ/7nouHN/EFEmlp3E8PDPySeEwWxcU7POmKLFIrgztZ5qRaxVUyQrfE6wdj7CilRes8oVsrPO8V/8HW8PGOG50aEirAY3QccXHn2cPHVQxup8kwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkNVu8BCBYHj+9GrrTL1RInEeIlIgrqTWkAajkbyTKs=;
 b=FjUR3gWzGBsP87X/WWZOcNpzHlALi52sb+5p+zjmeohonFFfscwwX/3uVD4gYa6MvXW9ms4e+o0M4ftpx3Sde/EBJiJwCYPaC1nUaylZGwVw/zOGEzCk7qavdkHdv+WRHm/BWntk+tY9gdqHvV6VRzXRaJNmU0kl+rpdo2mn8Rc4/q0mZ+YQzUccF7Q1HocfSbrOaZOTNwWtTYfsLN3jwiigY/5FVAK6dWt1vHf7OeztcESDS1d/oYQZ7Y4YfN3od3CYkZ1VtkxcB3FFmFcs+nw3r6EnBEE4ML05COaccWm8MdwD4YDEP78Xs1NAyIEUBQ6T7dfKx76fSjZpOCMbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkNVu8BCBYHj+9GrrTL1RInEeIlIgrqTWkAajkbyTKs=;
 b=G+RnZEIiJQQtHCP9OQA79+b12wuh6dWV4gSvLOuqIgvk7VoWKgh/x1qZl9tX7xm9rL4YroDl9NhoQ+kubRhNQy0GQXZEclGL1KmBzA/vif5ACylxucvXkUTtnQgBZikEiTS9Oai3R2gB5wV+e9FWY22N/90sgqRWdQSUAYrRvhE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CO1PR01MB6568.prod.exchangelabs.com (2603:10b6:303:f9::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Mon, 11 Dec 2023 10:22:39 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 10:22:39 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] i2c: aspeed: Late ack Tx done irqs and handle coalesced start with stop conditions
Date: Mon, 11 Dec 2023 17:22:15 +0700
Message-Id: <20231211102217.2436294-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CO1PR01MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: 800de197-143e-4aec-65a9-08dbfa3319b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tY8UcZfQqGnOvz8i4bzN9Dh4Lmj1GVS+2ok8YWjTFCiB+nBPJtbn9nDpi2AYHb2iRUmnAJbRBRw8z8mo0P53wa7G3WzVOPkRvnQI3l+6Y0OMk9GSWV0rr6WSKw7Hh1syzHHZwCcljwTOKxbhkfK4R1JXq2HW3srm0bHyk2dnj4ak6a7c1lyDlz6V5FIYBAhC55EYdLnMiNZZqXmHimoYwtc069Bug1UcTqRiY1MtZekUj546VpomfqZtIqFGTHStMJ4cs3wnnrIW/sbrBtM5VQNcHZ0uKTVHGmtti8idkOur4ng1XhEkllfMPHHzjVvM6FaARub4f356w2hS3+MMWEa8wCbqkeqmTo3vVByFRAfYzUHcpRS7UwsdADVUKbftd/rjfC21bOvxIpLSQOqgCTmRG6XVfeqTJnDchJtLtB2NEMMvJQsw+y0NRjyT1s94YgN6Kv7kAOXmQkTsVxwbvDWoumlkmKF/XTDYOEVxlESEAJArrzSR7SFJ/y3hvXCoWClLt5sjt6xn7wmdaBR6nAKyxwOT9MJwqHI5H5ORnY2swdDOvmHfSjfyvrFIEVUe9MGDySOVdeFRywKbT7h4ZmZPhcHZhwWHjlPacvU6LgKeGJ1puktLQkc9v49Yum8Zl5Vfsgorf2vJFjvIAvUImg+Z6C3est8C9OpIjSL6OX4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(346002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(107886003)(2616005)(6506007)(6512007)(6666004)(52116002)(83380400001)(5660300002)(7416002)(41300700001)(2906002)(4326008)(478600001)(966005)(6486002)(8676002)(8936002)(66946007)(110136005)(66556008)(316002)(66476007)(54906003)(86362001)(38100700002)(38350700005)(921008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dLVzhlg/mHw+f5A3uVvyr2rrRSrcn1B0ErXVcJLgSm4ZmUyockQxMkfBG//D?=
 =?us-ascii?Q?cspHlK9w8DCqLDNMuC5Wr3MplgrWKWGcesrcQuAmaetNtHd6+ln/fuNos8qr?=
 =?us-ascii?Q?soe4HGWhKZEUPCvglGhfKeD+SbgYF5t8y8SB36hhCP5Zz1SNJ8YL7Qr7z6G0?=
 =?us-ascii?Q?G5IH6PFZWauGE/XZkfd1UpXf2qhiQNN19NHIp6yJLfCAJj3dm/QPuBfKi1BJ?=
 =?us-ascii?Q?nlUGneqWLHld2jMvpBGd4ahJ9qgfjNtoAA++lUC5BjzxJwUHK9UZkvqpFNTV?=
 =?us-ascii?Q?EeGv5g6RGw5Egk6LPmbBZ6qDg9ffhHueNX7j01wYq38Hvh6U/LB9uHCW+92+?=
 =?us-ascii?Q?mtiAQ2Q4aB6VaRWPUcP85uDVhx0crh6LuNk7+fN1M/9RyBpBieRPNa5JrHIW?=
 =?us-ascii?Q?O/WHs6gixoUl7SwbBivKOwmTt+AW+KnBIVbpRQolghhVe8TsSpsYQklZD79f?=
 =?us-ascii?Q?AXcFz/31H3NWttITWCqvBQQoRl2FPWxcftoAi573bCfKFsYvDZemFc2EJVia?=
 =?us-ascii?Q?1xoCpJSl+0BOLVDwaocffKxHRtd9u5l0JzrsR+rpyV6v4TTBktZMgP2YtAy8?=
 =?us-ascii?Q?XJG0oJu71/QXiINLtX4CJMet4PTr90RqFjjrODG/L2wQPel8QOeR9FRcoP+4?=
 =?us-ascii?Q?VP6v6Nmj0bKFSKBaWKVLJ9wrYD8/3ONk+IwW0dhsol+fewFWGiTHYAhWUw+I?=
 =?us-ascii?Q?7TMQZJzyOqd7Pr7PEbRqrZk7tjRQYvjGDHcM1esI3xDiAu6Acj3deOypw1ay?=
 =?us-ascii?Q?xcou6LATJro/JYAcx92bdqlKFnLat85pnYEYuxnZvCPaxGhcwg0zLDwLJqOd?=
 =?us-ascii?Q?v28mFHcHTgOmDW0BzxIER7QJ7axFcX7ChAH5olpqjqlhTApmWwdhoJNeTN+r?=
 =?us-ascii?Q?A5dFRTFN3yOdnoERP2ER2sXbxdQMs/v2vACIzIcfM3OqrPBeHnV2SizYWTw3?=
 =?us-ascii?Q?0t8yHlA4V9UjfVwIzAO+HEp8C/DNc6CTfj3vvUxHNcBbRnSRXcQ2r41OYF0h?=
 =?us-ascii?Q?44ZIJdSX6+arcg72d1F9SQK3cc5CC7d6cNrP9nVDrM70TuYuxNlsONqL6Fg/?=
 =?us-ascii?Q?vuDB9/YUMhT1Ecs+TMCS8/SXvxWBgq+sfna2KdzaBncSXAp0qfFGDVAjxVGe?=
 =?us-ascii?Q?eunSbtBepia5G67koAur9RQo+tyzdiQOAc+pIu3mvlGDOubE0oLkgdGc64rd?=
 =?us-ascii?Q?byJP/Rrjh/ryjLr3oHchTz6CWdCC7Es28aR8d/Esuo4Vy1P/hXHT67cSlnoo?=
 =?us-ascii?Q?khGmqrC8sMeiQ+bGsuNZ7Nm03+7e/9bmZ1gXW4u2LlgVsdkS+48WqdfzbgGg?=
 =?us-ascii?Q?E2gHpm/YEvu4UFOVDjud8LBryAlIQPx41fe24uRXpDTotGp45bGOHKC46gB/?=
 =?us-ascii?Q?/EW1qdCpScHfMn5Eo6iYuEOf9jzGp1LyRp2Yxn30VMldPudAKittkCzzOJ4I?=
 =?us-ascii?Q?Qr2/HIfCZe+4+e6gvK4OHLlm3Cf3RRPNh28KiEhbLYV9VvI4yswhyjsJNqzw?=
 =?us-ascii?Q?ajYmI0xcfbiM1TaqBb+0hWN0fVaDRk2H/wtOar6+AbAxXtwQBbGLGwMMgvUW?=
 =?us-ascii?Q?K9iibTNfL8RNo7/gevzs6Eh3DyfxOk2YifPjIGWLGI5gg5ZajcVCASmIwLTo?=
 =?us-ascii?Q?1m7+xh9jrZ4xvMCzMFScvbc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800de197-143e-4aec-65a9-08dbfa3319b9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 10:22:38.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2MEKC3BKOotvQ+Q0T+nxfOw1CndocZXpznfOpeFVsuKqkYkxOaZdwjqanGAeD0ks2drovNtvQHyaPEwk1t7ODSGnTqJI+cKXOnoL80xSYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6568
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series consists of two patches to handle the below issues observed
when testing with slave mode:
  + The coalesced stop condition with the start conditions
  + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
  read request".

This series was verified with ast2500 and ast2600.

The prior discussion could be found at:
https://lore.kernel.org/all/20231208033142.1673232-1-quan@os.amperecomputing.com/

v4:
  + Switch to use define macro instead of variable             [Andrew]
  + Make the early ack conditionally to avoid unnecessary
writel()/readl()                                                 [Quan]
  + Add an extra empty line before the comment in patch 1      [Andrew]

v3:
  + Fix the unconditional write when ack the irqs              [Andrew]
  + Handle the coalesced stop condition with the
start conditions                                               [Andrew]
  + Refactor the code to enhance code readability                [Quan]
  + Revised commit message                                       [Quan]

v2:
  + Split these patches to separate series                       [Joel]
  + Added the Fixes lines                                        [Joel]
  + Fixed multiline comment                                      [Joel]
  + Refactor irq clearing code                          [Joel, Guenter]
  + Revised commit message                                 [Joel, Quan]

v1:
  + These patches are first introduced from this disscusstion
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/

Quan Nguyen (2):
  i2c: aspeed: Handle the coalesced stop conditions with the start
    conditions.
  i2c: aspeed: Acknowledge Tx done with and without ACK irq late

 drivers/i2c/busses/i2c-aspeed.c | 75 +++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 23 deletions(-)

-- 
2.35.1

