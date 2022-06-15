Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41754C42F
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 11:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNK9w3gvlz3c1g
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 19:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=A3rw1DSb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::71d; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=A3rw1DSb;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNK9P24ggz2ypf;
	Wed, 15 Jun 2022 19:03:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6ixYa2Ax+n4USEPyFFfokiqQhzojpMgEaTMVdybd0KnhQLBM4e7u4ag56usajjL+1TyyflPpuNHwhtCskJwGXEIYSNGuuk4nq417KoO0HR9znEykzejNCTf5hWYxf0dII/YTx5oBUMiyU6skyN5vHCfbtQBLInPoDQvIe3PBfRcWBkEIsP73wRD3W2Ujwc0f0ZzlFHa2k31IgSaKckm0mRhgIaQAmlkpWVO/9CrRrsY6MWRi79fgrWZrTuJnMz0+9F8NEafrVmsXWVjnelEUFOAfbj2yD7jWrnYdNTz0vyH5HKc2Oc1KCGB/UNpj8C6TNrdS0G5DWUx4FLWBLMgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5ILu6O5pGyOSenTp8GHVVJzY8VeQWIjZHgAYpoOAto=;
 b=M8E/AoN66A1WI/4+IPQYKCZZleDBs1azfqc/xhb3d4Bd9sygR2PU8hCFh9AyVFfVTVM2QW3gFS7248wQcmCUNhUCEQIojDB4tY2KBeU5j/+5PhR5IDMuKWm4EyfYsMuv7rXLu7RFOmj1SxKuOgyjn3kqUButdoWp6Q3gMvrELLwoCszlgzgLJIRtGxWr6MYKb3OU+0ncXLI6AqP4BlMkLe83MtTeEcnLfGdNXqmguT8PoMjMuRZGiVqgTnOdgM0CoTh1sCFKeYTKnaoJr+5BEyaZ8rPq7LWDityN+LBkBCzcPbfupZ0bIWlQCb6sWtn3K881P5GOT7TceBWWqtu51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5ILu6O5pGyOSenTp8GHVVJzY8VeQWIjZHgAYpoOAto=;
 b=A3rw1DSb54jYMdNJXvrRGrYLi49msDqMHQcQXXb+XMjxXFoe+F+R4D+skI+DsSnD93nX7Sf4F/F8IMoJKI/RB7f8vMmXZUrTcgBw+7tsCxV7gffn/EgmTuguzUYtGKqA7rjJ8/ipJ3W+RMfSlTTi75plPn6+hdE+M+LjpPXG4q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM5PR01MB2666.prod.exchangelabs.com (2603:10b6:3:ff::13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Wed, 15 Jun 2022 09:03:27 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:03:26 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Wolfram Sang <wsa@kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v8 0/3] Add SSIF BMC driver
Date: Wed, 15 Jun 2022 16:02:56 +0700
Message-Id: <20220615090259.1121405-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ba64fe-ffe4-41c9-db81-08da4eade872
X-MS-TrafficTypeDiagnostic: DM5PR01MB2666:EE_
X-Microsoft-Antispam-PRVS: 	<DM5PR01MB2666D591E95370480012A570F2AD9@DM5PR01MB2666.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FI+s2EsmWtl0JVpWuuG63f/RH1IUlRY2c7K99+/jrjK2j9qrvxJluY2xead9WOs8wisntYJOXXnxDtxZDjC4084BAK3Kqh7A9SKSE0eu8qWgllWnL6kMYS05MFO2PJxji9YvDzRiAfhxL2fgpnaDpKAjFG7zrDlxUh149iAU3GLCGuaztvGhdQP/yjWFfSWvLsEMS22/C0H79JQ+4ZhErZjYYDH9wPkXxEq+LrZGFH4NNUDwFMhVZOho2rP6LWtubuO+Ux7yomMZ7IpTnnIaTIugpGWerBzPgxetsd1lCqCiK/HanN6TpJOq4dR7lq4g4l2okxrljmXnUTTcXtOIgJ7ukaoQ8LLP1AaPA4eOa8MY2xy0Y1MYREYStEH8j72Ykx5rg6GT+oZvTEpYsH3vxlC6uppbd9x8Vu1ro779qEmRbE8X8bEyT7+01OTLiGStBimt29PydWSYfd2XA6mxjY6rLUhcLSF4cKIlS301Z/57pgPIG0+pCn9Xe918QLaGzM2GYGAQZrix1IkKAtJVqTdwF5hxJiKZNVjfoY+AUBo75Jt586kyQ1Qu6LBHH+QhARSwQie//uk5X/bryEAEW439+fukITt3MVpvU7cPy8OMJRNy2viHkBe7+qY++kFi8+Wfn/0W+9zcj78ItSRp8OlFMpnhGqeOlYdoRfxwuOz/Wkxep+cJBJsQ0LoXdtg7qWmGBPEvdl/65ROWDFX9sYszxGfClohGVEgps1VAHOZnVSUTlJONBibuCW/uI7YjU0j0klU1JJM+Gw6MVslJoC4Du6Uy0wUJulJ5BDwcEhiAyXXp1dYjDyZGQcDR4VWc
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(7416002)(8936002)(107886003)(5660300002)(26005)(52116002)(6512007)(6666004)(6506007)(508600001)(2616005)(921005)(38100700002)(2906002)(38350700002)(186003)(83380400001)(86362001)(966005)(6486002)(1076003)(316002)(4326008)(54906003)(8676002)(66476007)(110136005)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WK084hNYKVsV92t7eC7p8XCkRzs8MjfvMtWUYCiuus737+TwIpmukKF6ltDG?=
 =?us-ascii?Q?U4CBaAr2/rtP3OodqeyBfn0aLiyd/ryozOdhJchFvvSMLokEcWT5CtL1ETXR?=
 =?us-ascii?Q?mwr9Kr2jiVusOQRxF6W2KSlZYs7P0rGiwtJg359Xmqjo6BetlhSPoEqkCYN+?=
 =?us-ascii?Q?Jq2VBc2ktVYSAznVFS11lguOoIbZoJhtK2sRqcGOA0fsvTeVGqeDIwxvSX0o?=
 =?us-ascii?Q?d/zj9Yx7qGvC8MoEapdM5mWvFRJXPt2e9LjYEJ89AWs+4/vJFxk7UcdTDjDs?=
 =?us-ascii?Q?I7a/s2357ROgUBsEruMe0YQdQFubv7FToIhDox2FzjanKrrwq2CcZFIJG8Ba?=
 =?us-ascii?Q?kyuBfATJaVveDxE3EUwJNEDEO3gth82Wqlz4wy3bhrE5y4fnX+rpM9E1yilI?=
 =?us-ascii?Q?CTmzIYg687i2W95Mspzrlv0MdFc9UH6SwO0w0CGz+vr7Uy4YaNX0K/qQ+UJP?=
 =?us-ascii?Q?2gdGYwYIjDbcLo7wEQs6Yxgw+E2FA6CLyFjFlO21H4kiwvUp/NyV4qK+VqVr?=
 =?us-ascii?Q?FvUND2S8/8LTNedHznLtF2LLSINKpn7l8hbA0EyUB0X4r3WD68WKfw2PX9YA?=
 =?us-ascii?Q?ouYIM5Ne/j1HyV2zs7n3ZHGpk/UXnrgoh4tUaLTEYhJY3rcB0cWdx7qDLlud?=
 =?us-ascii?Q?ABLB2MfHa8nA/GnWhlGTZ68s9LHSvegwDQYDyjkf4ifVPxK+Af0W7N0ov8Kc?=
 =?us-ascii?Q?vBQMv+NgR7FMJdMWM/a5cyV8XQVk7AVfWC6cHuEnO+GYIxs42PuD4P4QvUM+?=
 =?us-ascii?Q?kUW9vjQ8l6gefE7PGKmJG7Ybk8Kw000YtsUUy4/In6OhMNuZngdP7hsRjmgZ?=
 =?us-ascii?Q?wSlyVfVw05Ns8fRh2RJCqOy5kZkVYHiGZScH+Ur3E1RkDw/JG+vamajfmRlO?=
 =?us-ascii?Q?vXS9BZxX1ENMgMIWUU/9Ce6NVViYYKUNiEJ964hSmkwI9iQ13VWuUGTAsTHn?=
 =?us-ascii?Q?kq96/v3kRzZF5wy3UrY9oa8zBkHMoAdXA7uzmmE+Lv8Yd6q+xL5brPT1tvgo?=
 =?us-ascii?Q?rc37g+CViJTyCtJuFd4VblfQ6NCaTha9cPhtiNzctEvx+sajJao/FRqXAUl3?=
 =?us-ascii?Q?Mur8EGqCZNTKHvogZpXKx9HCki5eO2vGokqWarBFkEMmp34H+rHureniYhB6?=
 =?us-ascii?Q?phPTPCAaX3Bsutp77pcV+JBa5OyMEheRMW1zm99YJi1+hNTZwp6BJTRI+8vW?=
 =?us-ascii?Q?sHNFyys2T+eZUIZUgeobbHiWYUZDcH7iaOGluKvwDHRnu1Rkh/J9ghzbMGK/?=
 =?us-ascii?Q?SNYADiVTu54hH0DZZ53I8cHdgh0ymcQJez13tm6P9g7+esqvgzrxzUYNkk4D?=
 =?us-ascii?Q?rNvqUSKb0zJmbS5LRVBE1jFvcDIDTn9GKeYOG2xyAI1tBhkNE2k9BUSjeZ+v?=
 =?us-ascii?Q?phxlNsjAZtLw8kNgf+Z8M2Ll2+HNcI6uGipTwjPWCawGaVkIvMtkoytdrV2G?=
 =?us-ascii?Q?bT8BSrE5vBPW3RUHQ/AsO4chuH+ywuBDjrTjOQrZRxW6xgroIKi1A/FqoTAe?=
 =?us-ascii?Q?69ZKO3DBHPfV+bH5SVRohHPAB5xnl3O7Jh67EJP93RvJh+z2gtF/CBZgrC1H?=
 =?us-ascii?Q?gPLqt3hvAL2RcUEzdyYlJddJQ3wk/xKSonsCoWhHyyeXY7HDb82wYOOyGmu/?=
 =?us-ascii?Q?zx7neuBbpyLhLWsIE/Ho2G1tLgcMqE0CqtJsPjFAGJ1u0Y6BFtOWUv3Gbxrw?=
 =?us-ascii?Q?3pIHetSo3JXORcbAb0MbNRQXktqd6KMbwlch/TrwdkTgNENkSOBYTc074SnG?=
 =?us-ascii?Q?0wP15tPh2YXGgBw2Lax9Nou1r0yrRwpMe36lqggJyS0rNX6B8xbC?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ba64fe-ffe4-41c9-db81-08da4eade872
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:03:26.7509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Rfdniy5KGFaMAhJ+4b4luAEuSvLVta9oyVB75WaSHRIVkYygELBcElPEpPgQ616Sp7un9AzfphDi7mGKF2UFC1gYn7PHJCnVyxH3GIyL6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2666
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
Cc: Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add support the SSIF BMC driver which is to perform in-band
IPMI communication with their host in management (BMC) side.

SSIF BMC driver in this series is tested with Aspeed AST2500.

Discussion for v7: https://lkml.org/lkml/2022/4/22/4

v8:
  + Dropped ssif_bmc.h file and move its content to ssif_bmc.c   [Corey]
  + Add struct ipmi_ssif_msg to include/uapi/linux/ipmi_ssif_bmc.h
  header file                                                    [Corey]
  + Use unsigned int for len field in struct ipmi_ssif_msg       [Corey]
  + Avoid using packed structure                                 [Corey]
  + Add comment to clarify the logic flow                        [Corey]
  + Fix multipart read end with len=0 issue                      [Corey]
  + Refactor code handle the too big request message             [Corey]
  + Fix code indentation issue                                   [Corey]
  + Clean buffer before receiving request to avoid garbage        [Quan]
  + Fix the license to SPDX-License-Identifier: GPL-2.0-only      [Quan]

v7:
  + Remove unnecessary del_timer() in response_timeout()         [Corey]
  + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
  + Dropped the use of ssif_msg_len() macro, use the len directly [Quan]
  + Solve possible issue if both response timer and ssif_bmc_write()
  occurred at the same time                                      [Corey]
  + Fix wrong return type of ssif_bmc_poll()         [kernel robot test]
  + Refactor and introduce ssif_part_buffer struct to replace the
  response_buf to manage each send/receive part of ssif           [Quan]
  + Change SSIF_BAD_SMBUS state to SSIF_ABORTING state           [Corey]
  + Support abort feature to skip the current bad request/response and
  wait until next new request                                    [Corey]
  + Refactor the PEC calculation to avoid the re-calculate the PEC on
  each I2C_SLAVE_WRITE_RECEIVED event                             [Quan]
  + Fix the use of error-proned idx                              [Corey]
  + Defer the test for valid SMBus command until the read/write part
  is determined                                                   [Quan]
  + Change/split unsupported_smbus_cmd() to
  supported_[write|read]_cmd()                                   [Corey]
  + Abort the request if somehow its size exceeded 255 bytes      [Quan]

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
  + Return -EINVAL if userspace buffer too small, don't
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

Quan Nguyen (3):
  ipmi: ssif_bmc: Add SSIF BMC driver
  bindings: ipmi: Add binding for SSIF BMC driver
  i2c: aspeed: Assert NAK when slave is busy

 .../devicetree/bindings/ipmi/ssif-bmc.yaml    |  38 +
 drivers/char/ipmi/Kconfig                     |  11 +
 drivers/char/ipmi/Makefile                    |   1 +
 drivers/char/ipmi/ssif_bmc.c                  | 880 ++++++++++++++++++
 drivers/i2c/busses/i2c-aspeed.c               |   5 +-
 include/uapi/linux/ipmi_ssif_bmc.h            |  16 +
 6 files changed, 950 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 include/uapi/linux/ipmi_ssif_bmc.h

-- 
2.35.1

