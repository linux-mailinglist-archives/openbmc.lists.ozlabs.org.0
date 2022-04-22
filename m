Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF550AEBB
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 06:09:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl1BP5xh6z3bbQ
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 14:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DXSi+Bi7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e88::712;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DXSi+Bi7; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::712])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl19w4swfz2yHp;
 Fri, 22 Apr 2022 14:08:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gz0CYriW93Ue3N015i06ThebS+dOha+wpgdkB4h+BIv1n8p1WGV+u6vhixbUIoCjQuyB2kR0kc4HElVIyn5/xIVLtu1kR3AUNqWk6KVGA+kh9dDiugjDI1IHA0om1zNLV3DkJ2IwJeEp/U2A36TMiCfbs4x96vPi/WmXFDQ1IQRwvjFl2Mzdtrj+PTZkmeUADp0srsr1RJGi087/QK3SX3vVlCwkuIaniOmjcrx6K3kF/Fxe5NSsyHZA6s/G8mxFc8zX8Rauw7bkJYNuNe0AnKw0SAZcDIxsBASY2fSutg1uAEj7iRS9yLVc9nTFCFBK1Uv492kJt+wYPrhWybduMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57XlQW3r5Ws5SYh1U+nJdq86xcDgkdo9lwML0jQEA98=;
 b=aPgD1Q8IuKXnBgV0HJnYCaVdbHqkrCBB3Ch8hTd3nM3ck8rIpqnGcTb7FBWwwayXZXUHpU1pRQvA/G2hNazb1PnmGw+wpmAEZgBIS90/jAAtyozBKe+PuMtLvE7d/ssHqWytnv6/Dov/9mMT2R7+aFx/OaFTl2Lw8Y9VEpnzoRgDIRpwIez06xom3GifsgvmGLqlqMY8mYf9qQKnyTS3lDWwo2dQBbbx0uf38fCZXGy8otOndkk92WV92YkabWp1azwWlyDZbF5xB8aFWXKXdFE+ORl4/bZSaqEZXOsYOg0e8P+efNsAiK22Lk70vjUVHGuRXDISyPLQwBxy6YrkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57XlQW3r5Ws5SYh1U+nJdq86xcDgkdo9lwML0jQEA98=;
 b=DXSi+Bi7vjtCVxVOysaaikLQCHXtADfFhwl2eWNbB6pOcDeMATZUvCJm2lUr4niJbd1YYx6hkOOO8FbkvUGXIWXz05RfluqYqtNEWKoPPzEatmKbFzDEoJw6k4Pp3jWhID5UD357CJxf4WIcQQshBIodB68J5E231IW5sb0wwOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3587.prod.exchangelabs.com (2603:10b6:207:38::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.25; Fri, 22 Apr 2022 04:08:25 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 04:08:25 +0000
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
Subject: [PATCH v7 0/3] Add SSIF BMC driver
Date: Fri, 22 Apr 2022 11:08:00 +0700
Message-Id: <20220422040803.2524940-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee23ee7-1b09-4240-0e50-08da2415bfa3
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3587:EE_
X-Microsoft-Antispam-PRVS: <BL0PR0102MB35876EF8ACE87185C5FDA092F2F79@BL0PR0102MB3587.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrHlCjn75tlLonMQyhawkssGUqfd/4RB4R7QO1dxjxkPh6ZBrKTrsfBpVSovjqPogOvcmmARlBNASoO9jP0CHu5FVVkIX8WADbWS3RNo81GWKEtVf6Qix9gsMdJD6JqOpGZAEgGxPRBmNllVpm/MiWSrG5J7xB0dLpVy38zdvIe2TigbPlB1T+oPa+qjlztgwcjOYrNotQ/bco4QEzTGP6k7hQDALG5gZXk2XuOpK9ce2qa8uU04bJ53VfYWq8FlXfKC7dCjCrfLlcj7dFZC3SMJPbwj/nCCt/BRKhcs/gsNACw2qhkLQCvFEntQjjnX0aTYGb9QRKOt/7pc5IbP8t8hVJ5Qt5btqWxwHxXe0Odh4qn0Eds61o43z8tWqXlmrtJPfAvETb2RP6AXJgTOjfcNS3IMGnt0B1oqSfuN5KHrpehkXPHLVWl+lBNVqoZRuDn9yMtJy4bo3Lp8g6q4XEJxLl40F5mYk1zbYX8FopK4iVUgbdyBrJVqYfPMCaT+Np83eueEDfEyZ81GBQga6FPMlavhdy2i6X5wSTmTuiNQel/ASuZwXGGzQOHFNNIJrc+4G0I0OD01qqTR+B3HdoczpQbDIphLyzDEHEoKT3P3dAl978RnX5HP3i+h+avbWhr1+sCWJMR5cxB8Uy8ghJ38Dq5oZJlcs2qBI7uWnOHaaI1lGk7EVEOQA31EnzKw0kHYbwWhOaUYo737b9x2StM9IpVAKYlGrwNvG1k1twTKnGyYFltcg3JcUcUPExXBAe0ssmZk0/AjwFWy9um/kDPcKgh6XTMqqszuWC2nDAYhNAmN4b/aut3h70CqDa/+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(186003)(4326008)(921005)(38100700002)(54906003)(66946007)(7416002)(86362001)(110136005)(8676002)(6486002)(38350700002)(8936002)(966005)(83380400001)(52116002)(2906002)(66476007)(66556008)(5660300002)(508600001)(1076003)(6512007)(6506007)(2616005)(26005)(6666004)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVsDEcxFy89PSbahCmJSW0FE/k8fJFOQV8CHgt7JsScKZV1Rj91eSbJZfwwE?=
 =?us-ascii?Q?5cgrU0S8t25Bmyg6v4awzjvxrx8gef4TNvsghbqtJm9jaltc8NXPYNWSN+ra?=
 =?us-ascii?Q?GUpXZdINSkhqV7J5Fwu8UigFpHfABTVClUAzC8VavZfh4RNt2jboKh5L91eW?=
 =?us-ascii?Q?tBMUl6NnsDToTZtf3OpOc0lc5GqzAs09sRzxstf0cQ6lQED9lFxFiWGMoBB2?=
 =?us-ascii?Q?oBJi/syu4Uevluzm776PBdlKvs8eI+EcvH+qbWoqbL9yvSo6KFdH4+zCDoBW?=
 =?us-ascii?Q?r09w3h6OWEG1aUlzOkOqM6zim9g3tIGxwKCPJVB3dO75qLxFHsvOYIGXBZ8q?=
 =?us-ascii?Q?0vzPitkqKD+lZ1fabgeL6FlzvYwHN6mb8/Nalw5drlhrUUwWTH9Y6mD/fONz?=
 =?us-ascii?Q?RZQJi2GCTrtJ0KiL/6G7ZBjGUbx6hixYX3ucW3VHc1+xUzghWb0Jk175prcP?=
 =?us-ascii?Q?+RQyE2unBqz3cF+bnaHz1bKBtaItOihBmt/yKsJU/y8+pT/awxTk7FEtKxlm?=
 =?us-ascii?Q?dIqS4ovDRxrS5R4AzdhL2t3dPOo3IRlUsLgKlDgH3z9U4pcfytMQutVmUd70?=
 =?us-ascii?Q?kCuXgEGJEt0yBWymQbgjdBhgggQ2O/jGU4HgMFtPyir2PUEJ6DsgaYs44Ceu?=
 =?us-ascii?Q?SdSNUbkKHFBPc4B6FASPiRw005POH0uKPVm5wPaUsY3uv2ACRA/dTL6y4uOl?=
 =?us-ascii?Q?DAxcranu5B0g1vWMfFRK6x6O4B4Pa8IG17e0fstsvTQAcuyFk3r2u6JIEoRO?=
 =?us-ascii?Q?t+3p5/BHCUVVxYxXWSPNfq0Dhs4TYbxFkvMyyEKNjxGdR4m2diXtnV/R5fpb?=
 =?us-ascii?Q?rZGjrUh/ICHNDmIK9XWYdLrm33t+Ws0UuTHokDurX4w3M/GWCBle2Vqq8c15?=
 =?us-ascii?Q?cVjok1SEslKtU3/HKctzfjWaatlYAs48V2lmNLTDfU7Tkw11O01xFytTOlmu?=
 =?us-ascii?Q?l6QN4EOz3gLxPYCRZ3IDCKT4vfgyQPZFN+iBXsw4j1ZDv+A4fzDAM2ONF874?=
 =?us-ascii?Q?bcpu8oS09qbsTWxp3DaixeBZUfyEuMYO9vNlw+fFbCKo5vXsr0ZJOczfSZuk?=
 =?us-ascii?Q?InL+tUJk4xmHcBpHmH+BVZ15m9Zc3Lm5JbpIrbhM6KA9DN9FpFxN/0/N+FdM?=
 =?us-ascii?Q?k5Q+/xTr7G1O+kyZKqxzRXAPIlsdTv5KMHhRNjXft8AVUYHm8cdRRU02JGaL?=
 =?us-ascii?Q?AMQCk1I2lcsxofFgu+bWpdToYF22BxrmSQhUNcFHKR6nV52j1Zdd18bYAr8Z?=
 =?us-ascii?Q?K83UVwYcJBoV/20wwb4g4ci+hGlRLExUSQjlG7X1NSdmxB+u2FjMEc7z+rGe?=
 =?us-ascii?Q?GOxc+rJPQtnNLzQSoOXzf/VaeLbAh0tzhba7xGr3RVVpGBR9OcXW7tMdix64?=
 =?us-ascii?Q?ia9HnJ4VVbFv4SQXZWoICH+2ec4nyxh+YGfYpkcor/58JZ1L2iJvyWUU2xJI?=
 =?us-ascii?Q?YdQSqm4BJlF0M2uB7jbe+2kS9kDj/3vepJ9WzcxvF497PSc+LBfKP7PbAUco?=
 =?us-ascii?Q?NlGX+QP8xnAuflamkfoodznbG/WHkEfRfClX42d6CCnBJfUnjZpvdH1SFt5a?=
 =?us-ascii?Q?FdLILJV9bloON/FGiq7AnCucAMWKOn4UbtiyoqDFF1t8YWZw3IKhDbQtEZ9E?=
 =?us-ascii?Q?/5QLw6W41WroSiTFra1eltzxNwPEuXMP0jIKGz43U/wXuBidT/+TYj9pKBIv?=
 =?us-ascii?Q?On8rJXbvxUb+e8tEAoUMKs0ECS1JHDKp/V+MSxM8nmLq1nzWOxpnd7aONRYa?=
 =?us-ascii?Q?sLAFSnwMSSXtYX+pbuxB3bv7ToZPKI0S2k4EQUm6+QVQokvHaohG?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee23ee7-1b09-4240-0e50-08da2415bfa3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 04:08:25.6893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LsjpFsLA/GQTD9yiDl3Q6p5oFHgXzFJf4OQnzJ7ytzHJnc0NhaNw1IS7D5+SaZD7Hfih1VCIdWhPiXS1/N3ZzNxYjX3oN8mXfmdUamPBdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3587
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

Discussion for v6: https://lkml.org/lkml/2022/3/10/340

v7:
  + Remove unnecessary del_timer() in response_timeout()        [Corey]
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
 drivers/char/ipmi/ssif_bmc.c                  | 780 ++++++++++++++++++
 drivers/char/ipmi/ssif_bmc.h                  | 107 +++
 drivers/i2c/busses/i2c-aspeed.c               |   5 +-
 6 files changed, 941 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml
 create mode 100644 drivers/char/ipmi/ssif_bmc.c
 create mode 100644 drivers/char/ipmi/ssif_bmc.h

-- 
2.35.1

