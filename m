Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CF5F612A
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 08:45:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjhlW1vnPz3c2s
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 17:45:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=caeGs+wj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.102.90; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=caeGs+wj;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2090.outbound.protection.outlook.com [40.107.102.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjhkp0ZZTz3c1n;
	Thu,  6 Oct 2022 17:44:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkXRtl3dkUmixOf4jFXxbSRQQ5Vpd5FJgEclpwbCjGP2VjmAsDrCRnt8UQXYaNj4vMKAQN8Fh/quACrRIfx7yxv4yBrmJRvori/IxnMUTyw+DfddfgmAfHGp6eS1VsgLjPY9kV9WQ+R3BNJN/RvsxzeJREvF6rttU27sXwupEjh2BBAoSyqMNpTthMvZ38agnLTXlgOhE61FjgoWairOOYZw9/pPetVr5oYEJvvMyhaOx4eR5pJuR14QW/Bmu0GjzPWV24r7M5aFobOgWCwCU+IuDF9nyrMWD7LtICgmzIYqDMcJ8ioDdUS3rx0hoIWRaVILHhWPm5iCyAkeI4yZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwl/ZxiLawggk4l7vXgWAzg8wJsDlKvVU9K1tQXTcN4=;
 b=iPLi1DaDYs2BysD1SlMx8FigtAo/2ZrAdwna4DFbss6mEwjLcV676TrbLjDQzLrUcNYHRWl7b3ZK0gRmSuV6j7DLJeOeVSFSK5T0TynmR3IV922LZM6dbuylkd4TFj9SO3xMV9o3QsrZ4q/9zi5HP0CrRRFFuOjo/4z0UCY5mlGej9XyIgwFmdyynxp/w5PWC0//D87VBEYYYlULVhT3i1xcyIA4kOGyIjUsA752oig3UO+CUMo37rB5w03ohO0RYA/Tu1yvfQadvsFbStr+RD9R4wKepDy/egn/D583aGbfG2dRML2Ygh6rSzE9cX3oa3jTZLiO7+YQ9SqvwidXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwl/ZxiLawggk4l7vXgWAzg8wJsDlKvVU9K1tQXTcN4=;
 b=caeGs+wjgi2g1hUlAIHRLOvKQGA+YPWqCqKk9dwk9n8VHVII+EeLCCVzTNChX3dSuyBH9vBdLRxu9C1hS7LzHzjQqTmq3d0PoMgX0N7DtZeWcAU/PfDCQyyFjIwm/AhSCBHsdGNS/Mb0qxaxMNNC+qxVELYvdaako83LX1ue3Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MWHPR01MB2608.prod.exchangelabs.com (2603:10b6:300:f4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17; Thu, 6 Oct 2022 06:44:29 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 06:44:28 +0000
Message-ID: <c8c774c5-b274-a6f9-303b-e84c50800b5c@os.amperecomputing.com>
Date: Thu, 6 Oct 2022 13:44:18 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v10 3/3] i2c: aspeed: Assert NAK when slave is busy
Content-Language: en-CA
To: Wolfram Sang <wsa@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-4-quan@os.amperecomputing.com>
 <Yz3VmWCqdolKg5sm@shikoro>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Yz3VmWCqdolKg5sm@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|MWHPR01MB2608:EE_
X-MS-Office365-Filtering-Correlation-Id: b96fa78f-f395-4858-b973-08daa7663780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ibrn7eWr37fRYMmNH2RTBpWAJobBt4Gl+vD2AAII9bZWnlgr1lTNANoTcSHXaSxt743G5yAqJBRsHOuFH2pJf1RfIrsboW+znrczK0JfAVG7em1wUecr08lBD3SmMXuEruNxx1R0mHOXI82H05vu/xepLlwFoMxtkXPWMTRo3TRJwqBnwpfBnQEJgsNj0qpgP+hZZ98ihbUX2vdbZ1wjr3u3a1YB/uqWmPUyRo8OyU6nBVTQ7A7/9Q2dYLDMwQV+KFrOdm4dkTnlYAJzU1l7vv3FWl16v/2ObwBVGElDbsI005iUqH/ze+ccuXk5yU2Gjnp1X8awIcJDv1+0vj4/KZobC8amekhPACx/MAUik6oR9OXMWPsRo/FcXJ3tVKZXDz+qWbXAUtOLGvKhX54Dk9MVLhCUDBYSEuI0IZaQ634rcDLl/YaqYM4KfH8sr/7SoXU/GS2EURZxRxTC/ZpTxkwbFzFbkObWGIFvvmprVRQ0LHBTbprc3W+LJ28HO7QwiXSsrX8oXNb1JgEsgn7UqqI6/hke+Mjco2DjxXJr06RL7HMLfDl8lSAfnd6FZBp/vOMHEhgRPc3TPqLCTWxjIUffZapRSZviwhz4cl690r3QD7mAlPTXoYf72DqO4pOSkPwMehY3nqSXhnH8RbMlbq566bHc1EoUEGHWL7/CEJWFMIdtkgTLo2QfQe+cCRNonoY3u0dTwkYMCd0GtorEpC2mmABEe/9pi+DhZqzkC7Zi/COIOKmj4iiQrpxhhweiT9YUNdxe1ELEucCurvnV1pgvb3NyzzhLyHHDvZuCJPorae6mzh4LRaA9PT/eV8lH
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199015)(31686004)(8676002)(66556008)(66946007)(38350700002)(86362001)(38100700002)(66476007)(6636002)(110136005)(7416002)(4744005)(316002)(31696002)(921005)(6486002)(478600001)(53546011)(6506007)(52116002)(26005)(6512007)(6666004)(41300700001)(8936002)(5660300002)(2906002)(2616005)(83380400001)(186003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?TXl4ZE93cHZtQjd4eGlQbDdTa0xJeExoNE11Z1dRNUpkTzJ0M1RYZHBDclNM?=
 =?utf-8?B?WFRwWDBIN0JCc1dPVTc2ZkxYQzJZS29DVzZaRVllRXFuNmczYnJERFVOcVB4?=
 =?utf-8?B?aUFJTDRYeHdtNDNid3NMSVJqdDhxWC9KeXFmSTNXTUNBcCtKczNQZXd0b1k0?=
 =?utf-8?B?c1dIejhiZzRzZlYzeCtoRXhPTndjWUdwUzdVRW9qYTVRUzUzZElrNlU5U1Rt?=
 =?utf-8?B?RmttZmFIV0RQeGtiWWRuYXhDRzl2N1dhNFFCQVAxdWRUT2xpZXJZMWFLNWdU?=
 =?utf-8?B?Tjl6WCtXYjI5Y2dsUUVYaWdZVWY0TjNBS1NWNEI3UWl4VnBzWmFzQVdJTjNB?=
 =?utf-8?B?Y0srdGdJUUNWZUx3RCtQMTI3Q0k3OTVBcHE2bjVuTEF0Wnc0SUNpZmk0MUpv?=
 =?utf-8?B?SzFudytLcjVCMmNtYWs4b0dRbm5yMlZGSHNEamVyd0dsY20vbWZlYnVPdXJn?=
 =?utf-8?B?L3YwTVUzUjVzcTJuTE4zeGVIUlVwQXpIRHhQMjhQUUczZCttdGNadG9Zalhi?=
 =?utf-8?B?SnZxS0ErTGY2ZDlVcDlEZ294ckNNa3JHVFRLdjlkVVdlRUgxa1ZuaHpISWIw?=
 =?utf-8?B?VGJxM1AwQUdnOHVEODF6U3FySzFZVWhrQ3NpNElqMGJZUWFPelBtQURYYjd3?=
 =?utf-8?B?cHVwZm9NRG5Hb3QxTkFkNnllN05uQi85QlROdEZXbDh0YjJUWUVOVmdiRE1a?=
 =?utf-8?B?MVpEK2pLM09NWXFYbWNEZnVJelNiSzJlTjBLQUNtcEdIaVA1QVVMeE1SZkV5?=
 =?utf-8?B?T0Z2cklPcU5tb2pxM0VONXB6MlZUTXZreUhPZTM2UDFtVy9lMUZWaTg4cEd3?=
 =?utf-8?B?RWllSUFMQmpNbTVBd2hIYjRtRGtKNjJwWjNlQmpwL3JCWGl6amJBcG1vL0U1?=
 =?utf-8?B?SW0rUGoyY3RlT3J5aE1ueXY0MXc3di9TRTl4SHYrY0x3Z2k3bHdHN1RFT0hG?=
 =?utf-8?B?K3p2UzFsSlJhMEJPWjYzdVZhWjR6MFFuaW9wR3ZYYVp3UjhGN0FEcUxvbHZR?=
 =?utf-8?B?MEZUaVFjM1BGODN1amtnNjZMWVJtNGtnRzJYWFhBbjhHMUk2Z2FsMTJOMGNN?=
 =?utf-8?B?eisrVU4yaWI0ZlgvdGt3RVVFNDJXYzdEWHpKWnZjZEdtU3EwcjhDbm5LbjFG?=
 =?utf-8?B?NVMvMGY1aWRVdElvTG9WTGdRSDdERzZwVDd0SHYzczZmSVBKNzlvNGYxc0FI?=
 =?utf-8?B?U3o4dmZGUURwYWVNV2hqVi9rZFM3SVB5V241SDNPUFpEV3JIeWgrZXNmbjNF?=
 =?utf-8?B?TW1iT29xRVJ0RDQxemFObTZYZEFVeHh5V25ITC9pTjhST2NkMXZteHB0RkZo?=
 =?utf-8?B?RXV1Nys4QmVOUkZQNlZNdEZXZmE4WGI4RkswdTVXUG82UWdZeWV4VEo1QUFZ?=
 =?utf-8?B?Ry9TQ2pNUlZOZGtlWXk1cDNHMkh3dXk5SzE3U2ROL3RUVUs0ck1MWXg2YnJ3?=
 =?utf-8?B?ZkRJbURHNjBEdHNja1FCU2t1d3FORWZHZmJ3QWV2Qmpna3lXQnJ3Nk9obW5U?=
 =?utf-8?B?M0diYkNhZ3ZXRkQzSWhCcjBwRW5EcUZ3Nkpad2ZOQXFmSTZwLzZoeVVMRDEw?=
 =?utf-8?B?M2xMRno0cmdISk5ObmdUY1hMMXpWYWM5T2JSSXpsMDVLbThkNWJSOVRxbWhK?=
 =?utf-8?B?aGI0UWhhTC8xS0NSTUxPZmJnWkJ4RFdmUitvOXczNlAvSDR1dC90a3dpN1dJ?=
 =?utf-8?B?SVhWZ0tjYnhvUXZJL2JubW45VDJNQkFRNjAyRTdUSHRNMllNK1Nlb1o2cUg3?=
 =?utf-8?B?ajJPQks5MGkzN1c5cE41dmRoZjRRck9zSkVkQ1lrWC8zclljcHBucGNCOUV1?=
 =?utf-8?B?K3JoOW9mTDZhNWVwdENvTEhWZXdPdFJWVjU5UEZqYzZWZGhaK2N4WHdNMmRo?=
 =?utf-8?B?YTNweU14T0hNYmN1UHd3YUEvYisxRWo5MHhEdkFSbnRQSlZCMXVaK2w2QUcz?=
 =?utf-8?B?cVZ3MlA1bzJ3SWJucGtXMFF4L2VGeUdXT1N6WTd5YkxIMW16cUsrNlpCZmxo?=
 =?utf-8?B?cWVsMnFvVVFpckJ3Ynh6cEpnYUp1djBzYjl6U2w1K01INkFaVFhmaFl1U1Az?=
 =?utf-8?B?dENnZEQvVlp6UVl1enBWc2pQWWpyUzg0WnFDYXlJaGRyYjA4YngzV2h0SGhi?=
 =?utf-8?B?UG8vVVRWdHNNR2xOK1hHL2RadWZpQzU4MUh5NlRndit6THlVMDJiQy84dEdV?=
 =?utf-8?Q?n1BIiSgvKUH3uWrZ4PAUmhM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96fa78f-f395-4858-b973-08daa7663780
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 06:44:28.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5D8Z4A+5kf4W0HKWz3FYZKVfrsLdqF0G3R3ZOFXgdXEoXapsXI37OZ2UcxTaU8tHRzlxAdgarAOAM5RL5LiQ+WFMJxmTlTAMrheLKvVnUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2608
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Wolfram,

Thank you for your patience with me through many versions.

Best regards,
- Quan


On 06/10/2022 02:06, Wolfram Sang wrote:
> On Tue, Oct 04, 2022 at 04:31:06PM +0700, Quan Nguyen wrote:
>> On I2C_SLAVE_WRITE_REQUESTED event, Slave already ACK'ed on the address
>> phase. But as the backend driver is busy and unable to process any
>> request from Master, issue RxCmdLast for Slave to auto send NACK on
>> next incoming byte.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> 
> Applied to for-current, thanks!
> 
