Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DB7FB34C
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 08:53:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ai0FHtEi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfZTb4YH0z3cV6
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 18:53:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Ai0FHtEi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::71e; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfZSx5m3Xz3bPM;
	Tue, 28 Nov 2023 18:53:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+kr8gDrY7qUeyVN5W6kx/WjHkk63Y+2bc7iL1yxxeVyG+Qm7YTyXe98H/6cDw6VNyxE7qYtg4qzIUCt3j5QQ4n9r4053LWoVFHmhWfWcGpebJfZhqLavkhB/E5exPo9APDD8atUOGwuXOj5QxBgGq45xkFUUdlmteg1dcMpTaTiij64v8gS4iC2lSHwLzqOR1xz6hUETCX11fGdh9eagSxIPoFiJfVcxB+HCR8ybUzAb5yUHfx2KGDYwGOBTILpjukrHDiOpjdTofXU7UDqyjvtJh+zEIkgMgUHiYK2JUAWw/owhFX77ulf4EI1dGTjFoADxnSmb8ICqbYIsI46iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANZo0Yh6FASvCQick53ES7L5DfKDyCL1c9XKLCL5jPA=;
 b=FXfc/7QPgdqhjqHdf3R3IMbKterScAq0c53tFWcfI2a8FEWrVjr3bptJ14iTylyG+peou3x4oK7E7RBvRcaRkBbfKSoNXJtlcnKXWkvPxYEqZfeyzPTtc/wmdUyZbA1hHvOJl5+zL46prj7X6ACtIHOqENeOErbDzGxQdxzcuiRhCiPsczL7IvCkNdsP8HEld8++nAGoqXz7vIa2/phmyWxg1Q1TYYe466uULtyq3IAqjW6YMtQKCc57yWXFn6G+r3HMs9lFYNZitjt1eCd7u4RZqp0e9sfK5lfjaYjaDu772oukLctIGeJVi6UQSrMV0eC0/ghXF0Z7ckyHTgJkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANZo0Yh6FASvCQick53ES7L5DfKDyCL1c9XKLCL5jPA=;
 b=Ai0FHtEizM4aujCmScGJcA3B410IdKTdZsdkr2EeSHQlbqBjT7dM99lq7oIjMBf66J1jz5xmbcXXagO0N0nyImWdC5AUUmHfSktYzmDgHaZCTAGgF6Q63hOmzC8QOjL6XSWx32w5GYlQpJzqWmXR8iI/90hCChcj8CFQ0YGj0uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH0PR01MB7895.prod.exchangelabs.com (2603:10b6:510:28a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 07:52:58 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 07:52:58 +0000
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
Subject: [PATCH v2 RESEND 0/2] i2c: aspeed: Late ack Tx done irqs and fix unhandled Tx done with NAK
Date: Tue, 28 Nov 2023 14:52:34 +0700
Message-Id: <20231128075236.2724038-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH0PR01MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a1de63-5b15-4a90-f891-08dbefe70950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	I5BRHLogMh87+oXHmGN+BtXxNKltwX6IXz4CEMy8AcKjCGo78sc27awMku0kuiY8GDpICtZC6WnvdThH9z552SrF2+LkmNsKonnStuosokVAhmMCQRQhdmtsKeVFG3lo+jRyyEnHA1eJSOgpHB1FcZ8xIGAUmIGeVxDQlVK8bQZRBDSIPEg3TS/GqW2fTGTNod7HbcUCKIKGs10soe39KdT+45bDIaC9JJLZ1m89gTPNtgkCuRZgxpoMQT5s/0nQxjg8fGrkLIk5UBGxCs3siwS59oOBLnBBI3sTCyZaWaXmqI2i6Bju77UFWgKCpCRPM0q+5AHOGjthT0JhHl5AzJVp8Ps9r5EtwGbRpYMFNrpxbKwoAyvcAjKHQWxLMw8x5hE1sdtCRGOs8LQTTFOENi1kDcFe13BKp2cq7wRqTUIZ2FpzFdUAi/N55wSwAvRNJrs9jgaxBT2760xtzFFSqioWZVK4rup9lOdqnWpvNCUIIPiterGNjcq8Aimh2eZGFSyxv1+MBC44jFp5Pa0ENAJCP3PCiDLCOO+RNrpGBl+7Hp8eBLffFomXjtScnA8V3sqfTGG1Xz30lzIO/W+b6BJGA/Ot7VeKqxNj1IpF+NJLijx/5Ct93Ro9Vw+2x4Jj
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39850400004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(4326008)(41300700001)(8936002)(2906002)(8676002)(6512007)(2616005)(6506007)(52116002)(86362001)(107886003)(316002)(66556008)(66476007)(921008)(66946007)(38350700005)(7416002)(54906003)(5660300002)(1076003)(478600001)(6666004)(26005)(6486002)(110136005)(966005)(83380400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eHFQVTF0TXlzMkVRTHhjYmIzMTZWVWlISFNGMlFrZ1dIN2JMYllBcmw3QUhK?=
 =?utf-8?B?Z3NQbVFFVE5Oazh6cU84cWlwSERWSVl1RDFva3NpSEZWb3NkY0tBSCs1MEgr?=
 =?utf-8?B?OFdHTHByaW1hVENVd29vK1FvT2JSNkd5OXNjVGx6ekNTa0lyRDQxcERBQUNz?=
 =?utf-8?B?SytIdkJrVmducisvTTQ3OUliZ2ZKRjdjMkhyQ2JPellIRjRWL2xsVWV0a1h4?=
 =?utf-8?B?Z0haNkhtS25RODFGOXFyd1A4Zmk2a0FCbjBMNEJPWnJJdVpJNEZZc25ySHZt?=
 =?utf-8?B?azcwZGJKV3dWdXYyZllvRk41bWFxcCt5NWx6Yng3QTdqQndETm03NUNBQURr?=
 =?utf-8?B?REg3TFRESUpnTmRDbW9vM2FMWlRRRUpGQUQ4RmUxOTVTU3BDL0JldFpWb0xq?=
 =?utf-8?B?QVJyblBCMEdnOFA1WmdMR0t2ZWRoZ3h4NUN4MmpkaHdSUiswbXF0WXovQ2Y2?=
 =?utf-8?B?dVM2TjhheHBsSURoeUlRUThCYzdxL3FzcVVFT2RjRmxJczJXZXlKUGdPbmY0?=
 =?utf-8?B?dTU4TkV0a1FrbitqaDNDWGZ5NVJISG5ydEtSSjhxaWs3WnhSWmlFdGFIK2N6?=
 =?utf-8?B?OEYwNjJQRjN4L2NCdVVQQlpkbDJocGpuZjFNRm1OWTQwS1ZyOGtOSW9LNGk4?=
 =?utf-8?B?VEtsREJNL3ZxbVM3Nm04NFN3UTVjdXhyblJZekwrNE80Ri81MWdqaisxcUVZ?=
 =?utf-8?B?a3hVYnIzdDNLU3lMQ1JkdFNySXFubE1Eem5Ja0MxWmQ2blFGclZRVlJWMjI5?=
 =?utf-8?B?QWVsZEd3UzdWbG1VMmlUcGZkd0lCdnpEOEJ3YkhLaTFCbWxEcTd0cGxxODJL?=
 =?utf-8?B?UlU3VVlEOG5ZSjNLOEw4eEU0TmVkbXozdWFzRjk4QytpdFhCL0hqMGdyREpz?=
 =?utf-8?B?Z1BTdnZuaGlOeTFRS3I3bmxycnN4SERsaXl4NUZqQmdSRE1tRWFpZEU4T0xs?=
 =?utf-8?B?dWVzV2l1Qk9XMVRaL2hGT3BZNkZJRmpzMUZteXRWQy9UNEVXeExWaEZmYVkw?=
 =?utf-8?B?ZTcraXh4cDQyc3V5NG1ramxiYUdTeTJPU051OUJHWCtYQ0tZUk92UUZ6MUdK?=
 =?utf-8?B?a0FaczRwc05tSDNBMzZJRW12WDh5ak41UXVTVHlDV0VqMlU1OVQ1SVRDazFr?=
 =?utf-8?B?R0ladDRyQUFxc216aDhncGw2ek5nNlhQOVRCdE15WEtHQ2pMc1ZOVXMwaDBH?=
 =?utf-8?B?Tmt4RUZrT0NkQm9lN3VuUUxPWkZMSUlrOG1RVS9Telprd0JtOVNMRG9uNEZE?=
 =?utf-8?B?R0lWK2V6VmRubFdveGMrbEtTUmIxbXpxbW56cVpkRXk1WEt6SWxjT0dHM1Ja?=
 =?utf-8?B?QldSdG5iK1o2c25DYm1GZzY3cjE5NkYrN0c5bXJReFBnWEJzK3RaRCtma0ZW?=
 =?utf-8?B?WkxlR1hYZmE3MHNEL2ZnTVZ4VjBsbjJVV2lMRE1sbWU4ajNNbERRcWVISUFP?=
 =?utf-8?B?bENpVkl4clByM1FXQUJzVFEzYzlieC9aZWpuVnh2cDZBcFBSRHpaTUNxM01R?=
 =?utf-8?B?MTlLVTBuakNVM3lrUWZlMG52WmptQW9NdElySExCYklzQVcyKzluQk1JbWlq?=
 =?utf-8?B?SnRTVXVZaWd0OGFuUHQvN2tuZlgybUJRM0VtTEZwY2hEZzhJK3c1WEltdSs4?=
 =?utf-8?B?V3doeVlyTUE1T256andjUHJaT3VhQk0yYnp5ZFZxUE9rRVZOTW9Rdy9QcFh6?=
 =?utf-8?B?M1c1c0hRdklESEJ5MTN3czNBWk1qalR4dUdPbW1sb2pSa3pmQU96ODdNK1lE?=
 =?utf-8?B?bzFySWkwcGprWUZHSm5ONUJtc1g1T0pCWXI5UkYySThwSFd3dDUrbVAwTGdh?=
 =?utf-8?B?K2tCbFErT0FyUlY0MVJyZmp5d2NsNDlNMC9TZE9ZdDJYYTJkTGhhZlZwZDNw?=
 =?utf-8?B?MnpKZEtPU2lIVU9hUTEzK25JcDIrZnB3dW4wTS9RWmhqQ2huNzFiTGVjOFV5?=
 =?utf-8?B?SmpsY0NibWYxb3N5YW12dllJWnNIVEZWT0hZSkZ0cGdDSmVMY254eTl6WG05?=
 =?utf-8?B?ckFwKzFtb2lOOEJTMHZKL0Y4RTYxS2FFSGFRSTdZOEdRQWRCTTlRQ05xZEpz?=
 =?utf-8?B?MFFyWlBINkpORlVVNnpJSCtPYWM4L0lIbmtUSW9BQy9PTVVzTVlWUkVqMTBj?=
 =?utf-8?B?Ky9DLzkrNnZLOTBzNy9uNDY5a0ZuUHhNSUlSUHBBOWxUUy9iZ05TM1RtWGVr?=
 =?utf-8?Q?xoNJuPI0PObz8XFTbt0s7HE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a1de63-5b15-4a90-f891-08dbefe70950
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:52:58.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXWCxb/6gOoZy7TCGE+RliTSmEbv2+paS6ikLgBY2O/rmYGuufU7+hkcvsMxRx0OYZq6LBcZjUk8UsK2UT++hme76QPEfJchVucpnqZeBdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB7895
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rebase on the v6.7-rc3 and resend the series as per discussion at
https://lore.kernel.org/all/d0773df55a6fe8a5c9b1a3d7c8dd2e1343643272.camel@codeconstruct.com.au/

The prior discussion could be found at
https://lore.kernel.org/all/20210616031046.2317-1-quan@os.amperecomputing.com/

This series consists of two patches to fix the below issues observed
when testing with slave mode:
  + Unhandled Tx done with NAK
  + Early ack'ed of Tx done (ACK and NAK) causing "Unexpected Ack on
  read request".

v2:
  + Split these patches to separate series [Joel]
  + Added the Fixes lines [Joel]
  + Fixed multiline comment [Joel]
  + Refactor irq clearing code [Joel, Guenter]
  + Revised commit message [Joel, Quan]

v1:
  + These patches are first introduced from this disscusstion
https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/

Quan Nguyen (2):
  i2c: aspeed: Fix unhandled Tx done with NAK
  i2c: aspeed: Acknowledge Tx done with and without ACK irq late

 drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.35.1

