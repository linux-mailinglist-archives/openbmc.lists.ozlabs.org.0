Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18615F3FC1
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 11:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhXY63C18z3bjW
	for <lists+openbmc@lfdr.de>; Tue,  4 Oct 2022 20:32:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ad361EP3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.243.120; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ad361EP3;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2120.outbound.protection.outlook.com [40.107.243.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhXXP724sz2xJ6;
	Tue,  4 Oct 2022 20:31:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWvmSKKUPZvnXIDdNdn37Qh3zkyhMA1hFGE1qlF8G5yPgUxqlheBIJjK8BL4xN92wQzv93DUcKNFmU1FX/RrWKpcK9knCjXsKJcXJfVDx1uB0FNDXcEs3St31ZoLXWUoW60tD6xsRGQM9TFyGX7LsdZ4hhF6NFbnFCc7nkA08ZzM4VLr25n1Mac+AQcRwIkrg2tYIlBkn+c3nseKnTzOhfyWbzhsPiSAQcocydCEj7n0B8idrRHMDC4kaUSbS4JWnVsjo8VfAyXHyeyFiyUwWKzepSIi22hYG6jn5K8mvkQjJnFOaUXPlux8Cw5MOso7tEK1hb16Jy+eEci9aIpeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am63Fe8q7Aij21E/U/CM921TijZX1smybMOX7KAJvVI=;
 b=L1uh2Pcn/NWlnVFPBZZ9EeXVoWSXYxhqLnOtHfPVsuzuhCNcPhuzEDlPNiuZBQ/fpYQ09A3l+mKuV0pwnCCkn0LRsb02MSPymvdLkvciMH5vxtAXo3GAI/hgGqGwDAW7AxqmBWHkN4+GyzmaFuqo6AzDmyInR//ZjiU1eJ7U5u2xFfgdSnryk0yIjKe6f/xo+GkYhvJ0fbMjQi08T0NVHWzaZ97kFHnxhSxwnJlKwuhhv3f6ozvsn+mpd3KcJ6ZRE0/3XJVTpzYa5xMjVeCBOcX1762LwQp5n9AVnPP+6joMUgZ+ln26Cvxa38QmsXlCCq0uAt75IJ4npFQdUv1vTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Am63Fe8q7Aij21E/U/CM921TijZX1smybMOX7KAJvVI=;
 b=ad361EP3/1/RCint8C/dnOmjC6PKEbAG5P+tHaPaPKfIdLXUEmRvbZYgtcSwBIn5ya3Ln2CHmW0eQreAYnYewdNt+O9Fat1/HzWkDUm6hQuaHhMl0uTF07MCSLcimr1Z65HYCOjqmyZR1xv2fXPxDgMu6NAe/GwoeoscUZM5U3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH7PR01MB7703.prod.exchangelabs.com (2603:10b6:510:1d6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Tue, 4 Oct 2022 09:31:28 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 09:31:28 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Wolfram Sang <wsa@kernel.org>,
	Corey Minyard <minyard@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH v10 0/3] Add SSIF BMC driver
Date: Tue,  4 Oct 2022 16:31:03 +0700
Message-Id: <20221004093106.1653317-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|PH7PR01MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f88014-3a2f-4066-58cc-08daa5eb36f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3N8rL/tVJuPb3g6698KVgnm9cnsTvAqw9uCPxGdCVFOudhkBOBETBRchbi4jcrE+dFlOYMAZpEUYIlmarmuPLWRqA/l0j5Gh10xNXhpASnRxQArBVALHKNuT6zfGdtuB74zDcpqxmTj8zTN/G05IGBvY67VFW58dwDDA+j++cZnXGfViiRva2UCagS7NIlK1hjRX1ZsoPafPDMac+W1vGz4g2XaUHX1Yqvl5lHicPkbXkobs0aw4RBHHGDbZAWupdMPUTM68QCjs8Q1l1hgvh2mzazsyJ9cXiftA8xdODUjsDJ0Slvi6EM65oLLwglcWzDuOzCpOV1wVWcDKeU0OwCAaXonU1xQ8oVgxOJ1SkemeK5djVS1lyV/mESRxu4D2+eRmJNFvu0TnMpEPVXnyWRoNsbh9m8a7RTGWDUsCXFjoOeRlhAWMDoKw0mPpg6MmQhfZc4s9nzA786n3xivs52kLPG1Ux6p2KkCiPKfUAPACOwWM0gm3+FCeLxaHOYrJcM77MsTlBuHb+Pd+nUEnIAXxjQpEi+ObgRnnnJssXp7AJ3neMBobVEk1OsMmLw8eMLvXn6jRxwX95meDzijgAL6Ea7dyY4Os9FbI94CUXv/bygpvuw/E1mHR5+XOVhyrDWX+RyzV6Z4i4cSJ+u4dPzHZVko92O/dtnTISRrowpLzvNA6XYpglyA0LJSciJ+OaytnXij1RkARG3jWdpN8xtnPkdZFfF5ClaflKIzJGXehWzDKAHBnt2sB+c4UvvRMLP3ZcMK3lnGGiH+dc5Bx24ZSYRr+qeUCEo1LIo+0g8T0vmgJJVugHSd6mXHxhmIC
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(451199015)(1076003)(966005)(110136005)(186003)(478600001)(6486002)(6506007)(83380400001)(6666004)(107886003)(52116002)(6512007)(2906002)(5660300002)(54906003)(2616005)(38350700002)(38100700002)(4326008)(8676002)(66556008)(66476007)(26005)(66946007)(316002)(921005)(41300700001)(7416002)(86362001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?z6suKRPMfFibscNIqQ0/ZHs4mRrRk1VsqWgTwa2g1hXnEs9Sxn21hraBQhsq?=
 =?us-ascii?Q?n39hb/8cvbiZI4/Px9aeMvBr8rmA7Z6K8BUe3Slf6F+klp5R3zrOnfeZKUSJ?=
 =?us-ascii?Q?5aHdBlPefOa+pt8mm1f+5BRcmb/zB1O+mAuo8wYLiBV6/Qwa7ZsB7derS7x/?=
 =?us-ascii?Q?0GZIg0Rb7q4E1FeI5rcm/Q0dzqPxtlCmhXXSYGxqLIgRhM23z3bs+GtiWkC4?=
 =?us-ascii?Q?Sgd5ywfC42L6TSy2F8YCtpmrLjDqkf/AjAIFWKfhLDPcYtiQO46DuiTcHkeX?=
 =?us-ascii?Q?ruKHovjQE8wBCAbx5ZJJwgo0Fa8pzeJxrTcY2soRzgHCWreV+ciqmktcQPed?=
 =?us-ascii?Q?BlR6Ud1jcW0kfL56QL5xqzT5MaJVXKoWKHP9Rv0+8Aja1pgeGT+KLvywTsNk?=
 =?us-ascii?Q?ZzWlppqB62NMaen/HVFTzD52loKWBXSlJP4wGA4Ld56dgDYtkvB6CYxrshI4?=
 =?us-ascii?Q?Vqv83kxGQnOEUgwNa2YUhxtTcJhvwDfaGDSgV2tFHXGcOcJd5CG+XEdMx9Vk?=
 =?us-ascii?Q?RTzFLAJKDKttq32wUru/jOihKlsgbB0+6X1reC0Am4UTt0p6xLZGqYBs4RYW?=
 =?us-ascii?Q?CImtoeDR3pjS/MB2BmSZmbaJPHCzme+SX+aDkOH8xlFHRXdoAFtoNgKc1N6I?=
 =?us-ascii?Q?cATUXkIwgqVkkx6OiFKzxSRiEcTA5p2numjWR6aZpN4ySOGzE5MFYIxMizvH?=
 =?us-ascii?Q?XVXowUWhgKzBZ+NmLTqkKWkloU8/RyVNm6pSOoiXvyVrmGgDRF3/tPCsP40V?=
 =?us-ascii?Q?f4l0p3ZNXbgoGx7lY5k6s0tbORSsjLLXL6kkY0+9Yig3dMxyhadDu4xQBXRB?=
 =?us-ascii?Q?bHGzHzdfUNarNz4quzg66WopAIVf/nnzWNIH6Yd3CAPZR6P2KUt/Mqjm061M?=
 =?us-ascii?Q?+wAw4BH4gE4bLpzffWzxXfwDr88ZoPv8+3EgV2ioajXrbUZ6D/erksYk+ets?=
 =?us-ascii?Q?kyBCii3wALVaGGoMegM3Zq79oE4ox0BlwNWU5w03i+a72roUHrhsn2PcI0/3?=
 =?us-ascii?Q?sgPpIZ7o3zrhrL03uRAdAuU87UZkysjRYEA75MKI/mJo1ypUl1RZZvV2AQM4?=
 =?us-ascii?Q?c906IFGTTD4lvc7amWAfB6VzLVsVOzrx1yQNi/Z0tIX94Kowon55+1dPUPLh?=
 =?us-ascii?Q?Qdz2wb+3UVG91V1y3p20/HAdKQeX232S1PNUDIlhTIXiJcg3ocLsnxT9hgSt?=
 =?us-ascii?Q?JcTdcCTQdpxAk0nL/gNUwB4QA2ErQJXBsNA60umWRGCNHOnaPNRzJ48UQmpy?=
 =?us-ascii?Q?nCdQeBIPNGKlawFzT8Qz2Hevy47SgXZ6JLFhIh3fNScPeFSh0+Ildyki9Ghn?=
 =?us-ascii?Q?iKwKWWtQoyY9rbKY4wVdYjN72LnDTS9tn6BF/SC5AdM/PV1QnqdQ7gOr0rSH?=
 =?us-ascii?Q?KQ5zCtf4ytY6KwX3+0lmeDYrf6+Axxp7B5pc8VRiOtIAKl4rVhSfHbNZRaa7?=
 =?us-ascii?Q?He46TeG2kEPyyyKeh+w2WhjZm5KrB3V9K20Q0VAjbX0ijcTusmeePsRWP4GZ?=
 =?us-ascii?Q?wFrQZEhjfVQGZWInFj+CKnSOggHihCufdmvf6Tq/2hN+d8WNO/7RAqxs2Xv1?=
 =?us-ascii?Q?iKVtILgBXSLi+VuqLC9n9Xl7nFhidhdrR9vuW+7xP/bTuSZ7IUpJSHummSCy?=
 =?us-ascii?Q?9chLTMZUzT88KMhRIA3WBec=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f88014-3a2f-4066-58cc-08daa5eb36f1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:31:28.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww9tZQsVJiA328Fnt6lZueThsPtp3iGDIwHK5bzanGUUqVe2GgMaq0H7o1G8aR2fvAW7xZmIZ24+FclmeWzChHwFHy1uSDgOglJORnhz710=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7703
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
Cc: thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series add support the SSIF BMC driver which is to perform in-band
IPMI communication with their host in management (BMC) side.

SSIF BMC driver in this series is tested with Aspeed AST2500 and AST2600

Discussion for v9:
https://lore.kernel.org/lkml/20220929080326.752907-1-quan@os.amperecomputing.com/

v10:
  + Issuing RxCmdLast command for all errnos                   [Wolfram]

v9:
  + Fix dependence with I2C subsystem                            [Randy]
  + Update missing Reviewed-by tag from v7                         [Rob]
  + Remove useless error handling path                              [CJ]
  + Update comment for SSIF_ABORTING state                          [CJ]
  + Fix "unknown type name --u8"                     [kernel test robot]
  + Update commit message and add comment to explain
    the effect of issuing RxCmdLast when Slave busy               [Quan]

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
 drivers/char/ipmi/Kconfig                     |  10 +
 drivers/char/ipmi/Makefile                    |   1 +
 drivers/char/ipmi/ssif_bmc.c                  | 873 ++++++++++++++++++
 drivers/i2c/busses/i2c-aspeed.c               |   9 +-
 include/uapi/linux/ipmi_ssif_bmc.h            |  18 +
 6 files changed, 948 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 include/uapi/linux/ipmi_ssif_bmc.h

-- 
2.35.1

