Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D694D4603
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 12:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDnHG214kz3064
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 22:42:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=frRlcky3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::714;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=frRlcky3; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDnGp27fWz2xrc;
 Thu, 10 Mar 2022 22:42:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQl4BLY6w9o0U9hr1rseWdbh9rJ0v2+fxf9Fh/avgcwiBsxGH0zhowhdw3zWgFe80Sov76VZoz21B8dJeWJ0FUBGIvChVcFUaGl2YCBatT8jYS0/LJo0H0hPjTUXVMfZ2W8tGmFcSkLj1Ax56Ig1ABFODPYJJgr/LQnfbmwUUk5zICSRohBOEuf1xTl6r63JLPqpNCQvWFDTZIroY8NtnjiATnYU9N/NLt4NO2msICZCVkUlbPkaGUkcHyYaWnHTYlvkFtHDYGiQXr4BVvOv4Uae9ZHpabgASpyv4Q5rVGh7IPQhOqllGOIwSIhRxem5mJaKHQx1k0Y8J2kGfNnWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcXyPO1Uz98fuoGSTH6S1bkbX95D4KrDYZ5T1HchXOo=;
 b=LbmEs4Uu+Tw8QW9heDdobDS6B6PZI0c27JoS3/D6RjqYitmUFCR8K5rQnf7KKuqqP/c0U+YpOz0PJPM370U7i8O6iYsdUW9+w5kvNTDavwyK23FOQ46+FDsUke5jw6y1pqr1uMgq9IT4oKAN0CYfnE/FLYH39zmdFVFa/kgLget46nP8kkk/9Db7wkl5V6/cXzGo4wPx2jU9Apc04igN5aWSs+fHC6P/nI7kF1froV+0ns4NKkqgp0DKtirWX+aOAdd+lZlbPVGUX/Flhs33N6AUSMmXiofwYePnA7C2Kx1AzFBeZj7S1uXIHLKpxs//DlGf5uCDyMrplaMCnyOUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcXyPO1Uz98fuoGSTH6S1bkbX95D4KrDYZ5T1HchXOo=;
 b=frRlcky3s4xc9yAwLrKseub1Xf3eYgDpTspai3hmUEsrVa7n5Vyk606LVs510T8/ceggNTgdvj66V3bfQaxMxINj6O75w6ZN2BT7HV+E9abxIbdbrqWLRpNuZKlVmWO7XCBPrft6I3+uXE6erQpaN6gLe33cOOjNDcJmR9F977U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB4305.prod.exchangelabs.com (2603:10b6:208:4d::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22; Thu, 10 Mar 2022 11:41:48 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 11:41:48 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v6 0/4] Add SSIF BMC driver
Date: Thu, 10 Mar 2022 18:41:15 +0700
Message-Id: <20220310114119.13736-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49ac4a4c-2da5-4473-611a-08da028af5e3
X-MS-TrafficTypeDiagnostic: BL0PR01MB4305:EE_
X-Microsoft-Antispam-PRVS: <BL0PR01MB4305B9DCD554C1DFBEC94E36F20B9@BL0PR01MB4305.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+1WnDvA5i44nFiQSwDPa0IRUWhoFkE6Rw0FF0ou98xI+D7UilEEwoZBUUABVM1cVT7XaGphI2KXQuBeLQLRYI+ylynnHxxn/a8EAhztOnaiZRBc2cC203FwReOyYu62HJB5ZKH0fQBP4BTkpJ0yun8pbOZdbyo8dBaDHir0cLKW3G+wGlvNF6g7e1nzlpZjyocZaWqWGVpaMpjC1YkTkVPL1gAArIE/mItQz9Lrwu0BlrSOcI75mBVymIkLBhU89/TDDiwrXNAdCeRIhvLT7AouAQdYCuiP/81R8lG4O1QMpDSxya2KtfhfY3h3ts1kQSOj/eEUPT0l/mdER3eUg3dmlVX9gw41O1UvJgzurDdRPDrWkKaUMc4aZ4ImfCVCEyp6XueAyg0b0Vch2KROSxI/eUCCEeTugZzgAQ0ib+bs6A4FbbabO/EA1bMHzcCcbj0xDVHd5Lpw8F98q2DH6BXgfkAA5bZ3AyN7m08mi3KofjkZsgknIv7VZx2h/siOy7/URXCBNLapf0qCatsWW/pSr1COA604bFrZjQNgREb4sS2+tcT5JpaOAu1ImNgNlrYFWy7OJOHoTBAr/gQFo+zqsqTHExfBEMy8RGuwxL6SgE+FNczqZenpaZETO5Y707EaiUKrbONobviqaF6AZYAAyuwWo6laHCWWbfJTTpJ8l8FAOPot2r7RyiFr8rCK6fMXPKFROXwdkhhJccRSvPScVEBRlGhfB8OgNtdmpKJ9G+ukbnExuUtp3iHUQxjjxmO4k89jGL49Wd8wWnj0vQU9F7hVaI4V0U3+KD7OzdJXR11o6+sT7ZdayYmcITOO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6666004)(66556008)(66476007)(66946007)(1076003)(5660300002)(2616005)(7416002)(316002)(38350700002)(38100700002)(86362001)(4326008)(8676002)(8936002)(83380400001)(26005)(186003)(921005)(2906002)(52116002)(6512007)(508600001)(110136005)(6506007)(6486002)(966005)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5CGCWEzuqjvXZspVdaxmMYOt0khNlWYVhsfR1gLdx+aMdZCcvIb7X6wSWeP6?=
 =?us-ascii?Q?QG8rZx3BEbVRyOnulCPOmiJy1lh7XxjrApUeUDdX9EzEljRON/SC8+0/ZcTA?=
 =?us-ascii?Q?YgOfVbT8PyqRAUpVR5mPSrbvGHPPXKQ970pdE2cA0eCAqFihboY31KHFhMsL?=
 =?us-ascii?Q?+HzHTlBcBbMRCkcs/1zy3M/eWETfl81apF8NI2WCFU/G1Ci5BlZ24A+1Zvvo?=
 =?us-ascii?Q?0P3GtKURPgAJW6vmu/+XaRmWZ6Q9GAXI63eMR14/2g3qgUvwDlou2pQsCkWc?=
 =?us-ascii?Q?5r4Z1KwypfygBR2EuNUb1Mn4b5YJtKnmBncE3AeFKFn/SNdycAqx5ztiM8lW?=
 =?us-ascii?Q?duDvY5pnp05s6HTSp04hJjhjASOW+bIcAlV9zRPRt0EEpCOlY9QTn5lt3o+G?=
 =?us-ascii?Q?T4wCeWPApPO0hw/2mc6QGaRmZl3EL6Dwh/hEkMsIGbZG4bx5ranM73qNvq3A?=
 =?us-ascii?Q?aDaAnYVT7LLYXr4DxhX8eCIJk5Ypx7xnWiNny59J+y8UzkSzHs3prXGQRPmc?=
 =?us-ascii?Q?V3JP8HLl7ZW/zdYz/Anzp8pvij0cSTxwL82FRYe/QkDbRjObUqOvm9ICmriU?=
 =?us-ascii?Q?fJjh08qhPyt806OiTc7Ew8Wd2EHki00Q6JdMhrnq4owt/CjCvsvKMZV2Q3No?=
 =?us-ascii?Q?ZMxJMg2KtWcK8OBJdbh70xdRbQnoLgVLJI08xh7jwZ2OCszbb8cnpFdHl9cn?=
 =?us-ascii?Q?cJsottLVb7OtBJ5fdYIb7WLGafo3+sQ1eK+KAvd+G+jPuhI+UqN57OiWqD40?=
 =?us-ascii?Q?Xl5ums+TdwBlFQhL6tUpF8hiCgPaXjI+CTbgpeTE5mWAhC61lj7wFa3LJ3B0?=
 =?us-ascii?Q?Gm+yh6YDjMCrlYWErU6yM+AqODwxfUJAYGyQK94F0jgcRs/oqBix1UASSUAe?=
 =?us-ascii?Q?44owzpaVoWldsYdNi3LLWnh6i3xvXlK40DZgHqQD2R8s3+K7RWrY1RvDYaz+?=
 =?us-ascii?Q?0yFhdITy4QxqLHvOMUwtxagnOjpxuES16juzqrTdnC4FcnJb0i2FbYaGcxD2?=
 =?us-ascii?Q?Id7hqGhou/jAJaNzdfuMqfgqV51HLEU7BVBHHsG6GdCDdFo2wPsZrhWkndAG?=
 =?us-ascii?Q?Y+4MhXorwIF1wzxKFgE+oScE8p336JB2hXSrYyVUWA3jFEkbGXjrq0tySVZE?=
 =?us-ascii?Q?5J3VWixXFeejGvFo1YDHcbcUJbrQoD7+EQBS+Lp78w9JxkJruqBqfLih7qQb?=
 =?us-ascii?Q?W/6kv3mUUsq290YwSpOot7ppsC/RxsSXiDOUzsHneNsyJRMjh3J9Plgy+Yhm?=
 =?us-ascii?Q?KirKqBpqQjm+am+SBahEb9pQO/WDJNQV3RcmUmiqcrbbOme1lT55c26g8q+0?=
 =?us-ascii?Q?YHTYBtNsJ9+TzY7LGbTUSWWp2T/bEB/xhcIL8RO4mlkg9p0UvO2USxvqfyGN?=
 =?us-ascii?Q?rVi7JC0rnzcikmWNomZUTwleU0XXog/yeQUbzPb5L4TeKLX0ufAb0pzcdGYU?=
 =?us-ascii?Q?PCpQRLHhpuWm4IooqJ7y79kgCxbWqWhfBmY+Jzl7u6xcOPeTrvv9lYjFrWVW?=
 =?us-ascii?Q?oKDE/3HBWgy7Zh4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ac4a4c-2da5-4473-611a-08da028af5e3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 11:41:48.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqE5GNkY0MbP54b4ZIn9hWTKEYPrbsUSXycB90nhRNiLK9lsepcp4QE4VejSs30RqL7OzHQcNW1/0wno6WLU24Ixu2LW3gechQB1KuX2uxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4305
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
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add support the SSIF BMC driver which is to perform in-band
IPMI communication with their host in management (BMC) side.

SSIF BMC driver in this series is tested with Aspeed AST2500.

Discussion for v5: https://lkml.org/lkml/2021/7/13/868

v6:
  + Drop the use of slave_enable()                             [Wolfram]
  + Make i2c-aspeed to issue RxCmdLast command on all
  I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
  + Make i2c slave to return -EBUSY when it's busy                [Quan]
  + Drop the aborting feature as return Completion Code 0xFF may stop
  host to retry and make ipmi_ssif.so fails to load               [Quan]
  + Add timer to recover slave from busy state when no response   [Quan]
  + Clean request/response buffer appropriately                   [Quan]
  + Add some minor change on error and warning messages           [Quan]

v5:
  + Correct the patches order to fix the bisect issue found by
  kernel build robot

v4:
  + Fix recursive spinlock                                      [Graeme]
  + Send response with Completion code 0xFF when aborting         [Quan]
  + Fix warning with dt_binding_check                              [Rob]
  + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml                  [Quan]
  + Added bounding check on SMBus writes and the whole request     [Dan]
  + Moved buffer to end of struct ssif_bmc_ctx to avoid context
    corruption if somehow buffer is written past the end           [Dan]
  + Return -EINVAL if userspace buffer too small, dont
    silence truncate                                       [Corey, Joel]
  + Not necessary to check NONBLOCK in lock                      [Corey]
  + Enforce one user at a time                                    [Joel]
  + Reject write with invalid response length from userspace     [Corey]
  + Add state machines for better ssif bmc state handling         [Quan]
  + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
    SSIF BMC driver                                               [Quan]
  + Change compatible string "aspeed,ast2500-ssif-bmc" to
    "ampere,ssif-bmc"                                             [Quan]
  + Toggle Slave enable in i2c-aspeed to turn on/off slave mode   [Ryan]
  + Added slave_enable() to struct i2c_algorithm to control
    slave mode and to address the recursive spinlock      [Graeme, Ryan]
  + Abort current request with invalid SMBus write or
    invalid command                                               [Quan]
  + Abort all request if there is pending response                [Quan]
  + Changed validate_pec() to validate_request()                  [Quan]
  + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
  + Print internal state string for ease investigating issue      [Quan]
  + Move to READY state on SLAVE_STOP event                       [Quan]
  + Change initilize_transfer() to process_smbus_cmd()            [Quan]
  + Introduce functions for each slave event                      [Quan]

v3:
  + Switched binding doc to use DT schema format                   [Rob]
  + Splited into generic ssif_bmc and aspeed-specific      [Corey, Joel]
  + Removed redundant license info                                [Joel]
  + Switched to use traditional if-else                           [Joel]
  + Removed unused ssif_bmc_ioctl()                               [Joel]
  + Made handle_request()/complete_response() to return void      [Joel]
  + Refactored send_ssif_bmc_response() and
  receive_ssif_bmc_request()                                     [Corey]
  + Remove mutex                                                 [Corey]
  + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
  + Removed the unnecessary memset                               [Corey]
  + Switch to use dev_err()                                      [Corey]
  + Combine mask/unmask two interrupts together                  [Corey]
  + Fixed unhandled Tx done with NAK                              [Quan]
  + Late ack'ed Tx done w/wo Ack irq                              [Quan]
  + Use aspeed-specific exported aspeed_set_slave_busy() when
  slave busy to fix the deadlock                 [Graeme, Philipp, Quan]
  + Clean buffer for last multipart read                          [Quan]
  + Handle unknown incoming command                               [Quan]

v2:
  + Fixed compiling error with COMPILE_TEST for arc

Dan Carpenter (1):
  ipmi: ssif_bmc: Return -EFAULT if copy_from_user() fails

Quan Nguyen (3):
  ipmi: ssif_bmc: Add SSIF BMC driver
  bindings: ipmi: Add binding for SSIF BMC driver
  i2c: aspeed: Assert NAK when slave is busy

 .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
 drivers/char/ipmi/Kconfig                     |  11 +
 drivers/char/ipmi/Makefile                    |   1 +
 drivers/char/ipmi/ssif_bmc.c                  | 790 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  | 102 +++
 drivers/i2c/busses/i2c-aspeed.c               |   5 +-
 6 files changed, 946 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

-- 
2.35.1

