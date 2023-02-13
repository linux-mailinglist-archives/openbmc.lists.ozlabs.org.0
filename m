Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA282693F0C
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 08:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFbvM2pv0z3c6q
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 18:44:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hEPy975X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::724; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=hEPy975X;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20724.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFbtg3Dzlz3bhH
	for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2023 18:43:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJKwk5CeR6cvyqivTaKKvk+gZ2qE2lDLKnn0JcJUcv6ksEyfe6oa+6ptExNunr4pqRDsJ6N+wCAL066B0GMEDG1m+MQoBNT8RPY0SfGKzdXH/gsFIMH4FX+7C5Z9NdjQUZOiFDMRN3JLwvjKZpeyhNG5cPgsiVqcSeH47AzhrEK5vIT0J5nCDUqWf7exi05cXWI8QFmtKD3Mln9SrDJsNtdbiInQLvVE503ayTYJtAm5QbrWZvc2J6GXDQof/10LiG2nnZwAbAnaYl7N6xKWxkPRkRtRD3NqHkjwIMjMR2qfKp8etgeSTnYnGvPjGNiWw/v7qcvEm6MGcMYJhu9sXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrXMPjHDdbB2G/GsXNjAB1nDE+NjlDrfQFLpXnOciGM=;
 b=XAKL4QXknOggNt/rZU44vqp0+ru14ySQrCa2U7Fdiwn84UDLozAF/dzA6T4Gq2VTXfIUNVu8eTu5XCDoToSQrQxR1Vs7zKqi8XMPSgvSHZKXYug4yw/gsbmS5UpwhlTFyo4fcBXyusVnbobg9RcRg8Okq0s7/h23OQTVKPLcw4p2pWGq+9FrzLft2erwm+US7Wu6n09fVHokmArNcs58S7WSiNqbviMxOVsNBb+9xCPmdKRmauSKrPvDgrCBNO4BoOtoeVebs3/tjwxDBpcT1pkASU1MjMryDeEuHlkmq051mL/L30uab3ZyIzehYamm086wuyxt8LsNF5vaAJC4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrXMPjHDdbB2G/GsXNjAB1nDE+NjlDrfQFLpXnOciGM=;
 b=hEPy975X9qS30VQvAGmTj7vpUv3dU+WhqsKpnD7crSjJlnVKoX8c7YMKrfpvQiJDZtx1MJK323VNIdbe8mWxHKZAJl6HLaY3Lf6NxEUK8HEXzWXYB6tBm/+e40BoSdBjp4/h8ElG8+z3IRJTYvJx/dOQKVldpGXpSk8zRbR90J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BYAPR01MB4245.prod.exchangelabs.com (2603:10b6:a03:5d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.23; Mon, 13 Feb 2023 07:43:12 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 07:43:12 +0000
Message-ID: <46a56ab4-fda5-0125-1148-d7f8d7726cdc@os.amperecomputing.com>
Date: Mon, 13 Feb 2023 14:42:26 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Add SMPro nodes
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20221118065109.2339066-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20221118065109.2339066-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BYAPR01MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8929b1-7d97-42a3-b89d-08db0d95f559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mBCVen6KmWiUKZb+9Pa6bj2S2FYU7O4IsjUvrFFSd/dzJ/dyBttRYgcoW9as58ImRa4Xuw75/IpXsyJgd2d5LfWE7LFF5AEF0SkzJcVwK7El+VImB/P5zjX+l6sGd3L5deaKZklWbmRdwDsYSbA1HNArcTLbUs5dktspKDwP05PnJShEBvLRHwekqaKnfpiMr7BahT9hNdfpnBaBlzPXg+RnFJHNOgyHOrSwZvxysbft1wJ2B/zYGDZ+vG6gyXuH5aNE4WQA7pbrDjYHnv04qr+AkkwcP65uTlQpI1qBRZ+WT3hW4Dcmg5nwtKQQOOtIRWJ/vSZVvmNXb5da9vRLbHfPj+DHyZlvnz2x5MQO3wjDqUUXqoP6GbdGghV4+B3WQJYeXeoX7XoDMlV7dwYmFM+IReZJdogLfOgw8NmWSSL75JIXSCiXopYSpUifIlANFmhbBXUFaUPy5Jidai9YRp0ASExvV15cGfJnvKHawO+h+085ogHszLukIqR4WlTNGkWxJdw0gBVka0JJt24JTbZEe1f+s/ySJ4USWBUmpMVjinkBRNPLe4UZjDHMHcVLJo+bQn247MgK/+LxuIneNLgmU1QlUtdYaMqcm9GsN5eM9z2FvhBgpYwKK6YEZSycVogRU7/iel/xObBk15YmkMCsZfJySvuTRdGF5abHynl+t1LFNt6alXa9iOAzOwx1Ls+94tR33wFMRqInp6ekmdEptfBdXClyybi7wK4PpsE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39840400004)(366004)(376002)(396003)(136003)(346002)(451199018)(316002)(66556008)(8676002)(4326008)(6916009)(66946007)(66476007)(41300700001)(107886003)(6666004)(6506007)(8936002)(4744005)(5660300002)(31686004)(2906002)(6486002)(478600001)(2616005)(26005)(186003)(52116002)(6512007)(53546011)(83380400001)(38100700002)(38350700002)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WFFERE9SMlRMbEs5dmF6SnBSbW1vMnVqWlhDcWs2QkpUNEdoOHNUR1BiSVpv?=
 =?utf-8?B?T0l5STBBZ2dteFp4WlhXdWNEdmVQYW5rOVJhSEFkSEhmaW9tbXJUYUFIdVA4?=
 =?utf-8?B?Yytrd1FXdFpVNzI0UDV3L2xwWER1Mk1IQnd4aTVSLzVDZkN6RlVPdlNwL0Vo?=
 =?utf-8?B?Y0QySk1mRVNqWmo1dkFucmtuajBJeWtBTWMxRHo2NkNoTXp2dHhWVHNEVWE3?=
 =?utf-8?B?MEVhQ2NMRDRlMldiK2RTTDJFem1yV1NRZk5PeTg5Z1I2T2VYc21RM1ZvR1J4?=
 =?utf-8?B?YWdMb0xVYk1GaVZINVdJSEpPWTkwQ3dNdmNMVENzYmxqWmw3Ynd3NWhoUldF?=
 =?utf-8?B?YjhSZDFBVm55V0NRYklDT3RwTGkzQTMwVjJVTnJtemtZdGtzMG1aa3IwVTVi?=
 =?utf-8?B?Y3ZxdmY5KzNWTitYUzlZZjY5dVlJYnl0NWZpemxhcmVEYU9nUnVDdGRJYkcv?=
 =?utf-8?B?MGc0MEFBeE95N2E2MWF0TjVYd0RuZkdXWWZOb3Q3MHE5TnV4eVlaOUk2aWxV?=
 =?utf-8?B?b0NtMzFGN0FXdmx1YXlPam1qTFlsYzd0SjluODdvaG1VNGF3V3lQTHNwVHdu?=
 =?utf-8?B?QkV0b3hlSnc1YmQ5L2lsMHhYU1J1bVd6Q2NvZEpQdDY3ZzlLNzhoaU8vVnFH?=
 =?utf-8?B?NkNwVXdVRTRBR3RSZHIwTmpFSDg0UDhkQ1owbk9iNGdLNmtqYjBDZURFV2Fu?=
 =?utf-8?B?TnViMG9UNldtYkVVZ3V5YVhpTUtOOW5DV011S3ludzh0OFFwR0lWcDNURHZC?=
 =?utf-8?B?TDFSVGFSV1ZGUElNak9rOVFZS3kzSWx5bjRDR0cwR1g3YTZXaDRjczhpUTli?=
 =?utf-8?B?RDZDMGY5ODJ3aUxXeklLc1d3MktHZnNFbWM1VkZpdi80a2tZUUg0RVR0QWg2?=
 =?utf-8?B?bk54bWxqZnIvcUo0alJDbjZpTzZ1YVdMK1VZdzF5ZEpBMHMyUTAwUHk5dEZk?=
 =?utf-8?B?SkNZNk85d0czSUVKNkpSWmRDL0I0Rkl1OTBlNmhaMXBQWVg0R3ErQzZ5OEM5?=
 =?utf-8?B?UE90WnQ0c0x1eXB1VCsvUWQ0Mm1XNDNoeXZoTVZ0a1A1dklJMWR5YXhUY3lj?=
 =?utf-8?B?ZjlXR29rK1RWZEQxUkhQVitKZVhXU2V0UjRCemxseUtzM093ZE15OVNKYmd3?=
 =?utf-8?B?WFMvZlh3dEVMbWZ0N1lOTWJtcEhtbHJlbEhpbkZCZVF0ZnZ6MlZ5OVZmai96?=
 =?utf-8?B?MndjbHQ0U3V6SkpsRUZkNC94emR0VzcxZnE0dDQ4V2V3bkcrZlZPc2cyaU9h?=
 =?utf-8?B?V2hlQ0FOSUEzNjFlZ2dmdzN6VXNSUWRRcmxOaHVzdHh4Tkgwa1pmT0ZNSjFR?=
 =?utf-8?B?RTZVVHlhZEtwVExIcHNxSnkxZG96eEZ4QzV2azlGaEc2bG1RSWJnYWNmK0Y0?=
 =?utf-8?B?MGd6VWlNcFcyOXllVWVFT3RGc0pXbFZoczhrd1ZJTzYwQ2M5M3hDcHVzUjVq?=
 =?utf-8?B?MVlub05GYUpGelVpOENLa1ZCelRQYzQ2YTFhbjNEc3ovOWVvQWVEcnorQzZx?=
 =?utf-8?B?clBNZllXZ0RudHFMYUFiNkpNakxSQ0NsK2ZPeWdMaVdMQkFJaGlVRXVFbHlj?=
 =?utf-8?B?cml2VUkyRWVjL2pJTklDVXNXN2Voc2V0UU9CWmVlZGJvcVM0eE9iT0QrUFVp?=
 =?utf-8?B?NVdnY0IzWmZjY0hUVmVKVS9XT2gxZUJpMWxYWmJwM1M2MHBSb0ZqT1Y4SGtJ?=
 =?utf-8?B?TUpsWjB4eThtbnVhazBHbm1PUy9aYU41VUpXaG5vVjdJTGYvaUpJRko0aTFP?=
 =?utf-8?B?ZW9JUXBLMTNldytPQXdkTkpuTXV4aFRvdHZ2NFJZL1dFMnJkZDRydTV2Ry9H?=
 =?utf-8?B?OW83ZDVET3dsNUVDS2lmNXVQV2JVZTBIMGpGV1VvL2lNNE9WbTYvSDduLzB1?=
 =?utf-8?B?S3B1WG0zTjNsclRkVVJva2FodUxtaFFOOUxBc01RU0tySHNoMXl6dGxRUHla?=
 =?utf-8?B?UytTTjJnd2J5K3MvdkM3dW1oSDE3SVpBMmJpL2cxd281VU9hNVhwZFFHQjBY?=
 =?utf-8?B?UzZaUTJTOEFVM0dmR3JIRmQzcmdCQzJJckRGR0l4ZEpPUUVqQmVkaWdTTGRl?=
 =?utf-8?B?MmRuMDJNYUVXc1VWc2Z4djdRWlhRNHo4bjA4cktxNmdUaWJEQVRTZURXYXQw?=
 =?utf-8?B?YU5ybWh2SkJNNjdvaEdyRG9NUWZjTFY5Rno1SzJHUmtFOEN4M2xNeXRPVkp4?=
 =?utf-8?Q?Oz1p3cbM/snfpO5FvxaO8JY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8929b1-7d97-42a3-b89d-08db0d95f559
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 07:43:12.4454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xyt2x0iU3DaSY36XpPU9fLKo4LgH9ppsxnWLxdIV3VyeIiMdcc7npeYB/W57Gt5st7pNQDi+3IYe7qCDEmazKZVt+p2wFkVSwJG8BUayINg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4245
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
Cc: openbmc@lists.ozlabs.org, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

Can I ask you for help to pick this patch to openbmc/linux dev-6.0 
branch? This was accepted in linux-next but not yet picked to openbmc repo.

Thank you for the help.
- Quan

On 18/11/2022 13:51, Quan Nguyen wrote:
> Add SMPro nodes to Mt. Jade BMC.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 353359822d7b..0a51d2e32fab 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -354,6 +354,14 @@ &i2c1 {
>   
>   &i2c2 {
>   	status = "okay";
> +	smpro@4f {
> +		compatible = "ampere,smpro";
> +		reg = <0x4f>;
> +	};
> +	smpro@4e {
> +		compatible = "ampere,smpro";
> +		reg = <0x4e>;
> +	};
>   };
>   
>   &i2c3 {
