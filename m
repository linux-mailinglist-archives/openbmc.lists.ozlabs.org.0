Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DB75EEFF7
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 10:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdQr76WGsz3c2N
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 18:04:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=olAe0QxR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.115; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=olAe0QxR;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2115.outbound.protection.outlook.com [40.107.92.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdQqh4M5dz307C;
	Thu, 29 Sep 2022 18:04:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLdYujNHXOeu+VaUFaC7ZfttvG1RGLniR7GgmfIRNwbzclTMXlLcc5HncWctqMwUj+byaAKHCeaOekXq5xXV2uZFcyJpH2D5nQE1q4y0+JZu9H0SgynXhvC5mkmpB20+YtWI3xPzcD/AasSU/IaVmbNnI9nmJhJB9HKZwjyGVY5MUkpeHGUSO4x0nfV8EdF1eegZt9Y9bpWDMwxcebAqanCIrbpTzjxZehp08P7owW2ZyfnMvvzuuRPdMd8FtDv+eNA/8UQvj/mDo96VDsKAx3oSZJjxzsWFTWugGZ99AQNZ45oXqOED46z8I25sBsOetl8fGZ8ar3QHD/SVZhgVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6ZMh9KCpzuI2KORlqz1r78LTRvAlXZoc1HYBSzNhq0=;
 b=UCQ9ckHtT3gnPiB4MG9E+4k4bE62eLm1iJKlNZTwx2g0vCsSiyC8KkIVGXsgWBiM1vwEFm7cJQje9gbY3C2A1ILotBGjvbdB7vKgQZK7vyK7IChknnwJPjom+AKB0ejaceEC60XC1K25fUjnYb8CdTUtJ8uWNPlX6qn8jgI7ACiu/QWzj0gQKgos6UhdtEbdvGB6XUB/UeGAXTm5Jar7/mA59JadOj5rxs/9IEpp6e88bqE1hI+LibFp/mvgwcssdq73CcI8AyZ24O9+bHUy3yUdn01kNCAzWvgqw3Ps+ydcZLydbGz5FeYp4SmOUegw7Me3ybXUN+aT5X7A5oKGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6ZMh9KCpzuI2KORlqz1r78LTRvAlXZoc1HYBSzNhq0=;
 b=olAe0QxRRC5GuUy3Petu2sC1Z1LFIJxKmctCUkMylhAEqqmJPqy+NKHyo+8GWZBB1VXFnBPGcU/uQ3GNyur/66on5UMsb8x9qzuLWaoQWwonH117XJg/BwiACvYFvewjTid0HreL2VCd1lZ07eQR39y9RMV0NdnrTZ9LKJLlZuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3497.prod.exchangelabs.com (2603:10b6:302:2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Thu, 29 Sep 2022 08:03:52 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 08:03:51 +0000
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
Subject: [PATCH v9 0/3] Add SSIF BMC driver
Date: Thu, 29 Sep 2022 15:03:23 +0700
Message-Id: <20220929080326.752907-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MW2PR0102MB3497:EE_
X-MS-Office365-Filtering-Correlation-Id: 894cb486-c656-4b89-1eef-08daa1f1258b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rMMBkW8beUVb+vTSEkWaLBfyB6Q1NrMl+Flea91m2ckZgJMd7Yo6JUyGTUYrUXctZl167JMv+RT+Xu9xQi5eGiDojCDRZjQete/mosPXTlD9TQkENVy9ZQ9luCHYpEtsanP9e48ch/MUU14hy5A0434MgWEWskYbD/k+5iorzDNPhZzjJZB+OEftbNXPbPUobu1C6kP4CytUOTLcaJH/+BFfy+ZGWBJ6Ie/SYo/DXmlEhpqk0/Bj8MBe8EEMb//vdKo8eKMxKkafwTrGa15uZuuAkzEhKc1W7SuiU9cY1GW9cPXdvymoey9BkMh4J5qtWx2cFd4RvFkl3Wthy3X/hD9Y0cv1KxeqiePZAo2bTwFfLzODZ9nGnWw+Uzyq9rxa6w/p499IlTqA+MeIxDYdwDfodVwhy7o0HEn6OIeDlvdLKF4QrImms8/IsqYp5KF8F0JdRo4Va7OJlZ1xPb7eL1vI3xpzaqZdWZmCoQ2uzYiqI7AYEEFIsQL4ob236SKKTKUgi5yS0lGgJv1BzHzWVasr6CjwbPFhDLe+aps98/BvM2i3lyk6zDD8O2kEnQ2vPeu7LIf79qhTSkFMKEh+UMD31b/UXXfpLZ+iGg27dtcVQFlBz1/vjk48ujKYRklwVoU8+EasbFTouWDv4fVACkv3atprFfucLG46qEREQhnRiLQVD0dstgk19sUUGonxwVkCiZ2ugxkQk7H4bocdTPLW/aZeA3MdJ0W9764CeAIMPLXLvYyLruJ+bsIyJXau9FgPTob8T1CduAM6Oxv/9NW46fOaTVpzUP7RGzbhWhlPrjpZTByZkhl6dOGeJd5h
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(451199015)(2906002)(966005)(6486002)(6666004)(107886003)(6506007)(52116002)(54906003)(83380400001)(478600001)(38100700002)(38350700002)(316002)(66946007)(8676002)(921005)(4326008)(66556008)(86362001)(41300700001)(8936002)(110136005)(7416002)(5660300002)(2616005)(186003)(1076003)(66476007)(6512007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yf2SmzLeUqWHlJldXs0PWu/oCn2XLqCmbtBf/drLDefViauFUEoizws3MPuo?=
 =?us-ascii?Q?ELdLDOA3DMMapRosNnvTE7iU/UTw7yIzX77NJkHNloKlkusBERVdO9Rn16UR?=
 =?us-ascii?Q?bPz3dKJcpjBJTNdtPwkuLMtXUgVPjdcmOlhltmn53G1BnrUIKpKWf+KO4tAt?=
 =?us-ascii?Q?cY/n5X+HNmGlAFb4uqPJVV07MBY2TxJ6rgnLOkk/Ln+wVwHGLe0TgX1RCo6S?=
 =?us-ascii?Q?XK6EiTxEEZtxBxwsI2gKTMwEOGetJqih78QV8rPe9k8IH4fwBQmGB2PvHTCQ?=
 =?us-ascii?Q?/4iAOUMPWygd/l5rAEDD9kcV8Q3k77Fn5jF0zZ1j92CeOcItd71VFgC9zUFM?=
 =?us-ascii?Q?NdMBhvbxDsVjxUaQn1cMilmiW+8S6on89emy0N7fILHGePpOWDefn1/tFJN7?=
 =?us-ascii?Q?U7zsPL8All+Dva5D7bzUhY+15ATJV9taUFTRBqzvbNFxTn2tnga3UY0gocE7?=
 =?us-ascii?Q?baAHPHDbSgdKr2ITU+we5uwXwEy3a20BxVLJ1VcmqfV0W7cuqyndWNAftTs0?=
 =?us-ascii?Q?6s/zjVERu2g3GUYNB23tg9fMaLx5fF2pek9as80kGtdjRhB/m1hGFATcjSqH?=
 =?us-ascii?Q?f/j+B96ZOD2EAIRUcSfezz65OHgAcZm8GR5SR3gpyCKgpoNR2UYyV/g4CTak?=
 =?us-ascii?Q?5zgcdu/OIRGNT7Uf2yqriQR8LpPO7FanzjTm+3loZ4wVKamwJYFqPmU/1uN2?=
 =?us-ascii?Q?xCHPBDkyZh9Vb0Kak3CNUvyGTSSDKwW5dOHqrPG6YxMCGQI746nfHptdxRA5?=
 =?us-ascii?Q?Pi7Gjec/CIOYSq1470jJ64WGOC8UYCIsXDHMCE82HiiNJXQHGE2SirutQM5R?=
 =?us-ascii?Q?MDZCQUc/LzbDPbhDk0lLmBikgOTSBa+nP2K/r3x4zVeIb5YzPAhDCfthX//f?=
 =?us-ascii?Q?C0c8OneyePOXRdsUJ1c92dBqWv2DLnflMzt42+iQ18SPSinEY2rHnjx6fWHO?=
 =?us-ascii?Q?zijEGPWckVSxem4PFaWaEm+OuBQli3ThVIBd7Agyuj2q/wiwAvMeUQhrh0s8?=
 =?us-ascii?Q?dZDbYXBflwC239nVD2mH8EyZHujSyn9VFGR5cN0tiv/BLDjZRYh8DueRpdac?=
 =?us-ascii?Q?ALv/Jj/h87swb3xAAHtSrIg4cG3UEW8pGPYS/y16FfcF45UkNSKUS+L2D4Ij?=
 =?us-ascii?Q?9sZlwv4QBD8CZsJITim46l1zYGIl3hCI4/oX3UPZVkUsWcgJ1fd4UxBQBMfi?=
 =?us-ascii?Q?NSxUm215sv7k99AuKiYQYbdJPp/2rUU4w63Lwi09GoUAKoTfwP6nr17uvg+u?=
 =?us-ascii?Q?Srd2LWeA+DeeS+3aMiXywyu+fpOWWoVabQbXcYlb7fPgVWcqsEgbwZN46n/J?=
 =?us-ascii?Q?US+5p1mv9gY0ELcRm1Y6eY+n+ZgfRrwEZwHC3vzM40q2Fl4lIuApJHJ9A3ap?=
 =?us-ascii?Q?96Edwbod+ap3nNYRjylJXBZagBleBWLzqUWlLfF2E2CJ/8A3oQC5n3oMcF02?=
 =?us-ascii?Q?8kKl48EvX4fjCu4PHOMl30EFxDj4ZLn3smju2+1Y3Doy26h9ncyD588+mfF6?=
 =?us-ascii?Q?TxTGWvKetfWcN+1iRYB+iBUQteZIBXB1UFf5mP14NHbjJ8wlYcJr9InZrbEA?=
 =?us-ascii?Q?IWa/S30+C4IzYMdE5g0K3YwOVT0i1CfIgxsh52282jx5T5pnyTlJmzhdxfRd?=
 =?us-ascii?Q?qZB/PGw2stlN2wdBUrmmCCE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894cb486-c656-4b89-1eef-08daa1f1258b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:03:51.8691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0HxkkH3PPiqvbspb1yzEPPeMVN8Bk8KY8l0X8u0r890Hdi5zPEf2cBgQQsdoTu0Va0JWihTcv8lxIbWKf7nJbMhdZbvSpyh+W/vLMgCYxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3497
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

Discussion for v8:
https://lore.kernel.org/linux-arm-kernel/20220615090259.1121405-1-quan@os.amperecomputing.com/

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

