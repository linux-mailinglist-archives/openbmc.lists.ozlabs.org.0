Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC565ED383
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 05:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mchpy2BJfz3bkP
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 13:31:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=P4RSZotO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.101; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=P4RSZotO;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2101.outbound.protection.outlook.com [40.107.94.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MchpR05NJz2xyB;
	Wed, 28 Sep 2022 13:30:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXjIJC84CxykGpYbq56tZzdA6L/l+a0cqdmvojYGtMPMr0Nyp39XLrSJOjPjk7jSN7LHq7ChiJZn67seK8l5FzKc1N1xVCQ/XzstkjBeIAfylGXlrhY2PLx6ZmQOFJTzQC+LDBIYkhTMvKw8f8ckW46Hrzv5723cL+4Px8L/JcXhNu7OAPWKJY5xlXDInKIvEQeIV6Gmfh7Ob15ARH9XQqHx/CPTwH8X9H5yNP47gydDAKXZvjMirRxmQJpGe59Zf8EY/VmY/BfmiyoNGP+z5lDBGhbmyt8jbUyBVZ//14Cxe4DIbV9jrJ/+L6rbWtUcfWi+h6SSKtTWqVpfYeCRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AQ64StQq8gqq7EbCMn05/J/8dIuL+T3I0FpV4/6LsM=;
 b=mJRnN3xM6IByhAS+dhzpR0StDQsLn8jEKumEdTZ1elIKlSGFkuJtyBKCfzdmGAkZ2ewwp+pTEjborsMUy92dcoFgp43T65eXrOLppwnud7feJ2P6zU+FQ8ZaYbs4mdNySM4hfbGlDAW1m+hp+dWJRQw9MixvrOWU/EHoGnYhThl1a19InKao6kMTBnm5TNftMjYR50Cd43jtMdAqK1YqnbJR1cIZFZ7O44dJ8y/ZDk47hjqS1d1RWSEU0wxyPvjg1EHYWRuViP3yjrKwiFI1Nq+nB3ZFr/BPS3kI2ACb9+1sM7Cg16oUZd1wNjjNkMf5aMdzwFZPximzHoxr9UgWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AQ64StQq8gqq7EbCMn05/J/8dIuL+T3I0FpV4/6LsM=;
 b=P4RSZotOy81gEhOxkmH9OmmWCzKa48ZBStWPC7AMenyagfoRD63OKcn1HD6X2LALK/6qXwYwUZ9kRDQrIuqfstZY6Db3zfg1jOeStaD2XcL3Ibfl23y4SlxsMPvk4entzirqxM4YeLBx+wSih1IYpZ1WeTW6ksspb8J5Dh9hjFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BN0PR01MB6911.prod.exchangelabs.com (2603:10b6:408:169::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.16; Wed, 28 Sep 2022 03:30:17 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7d50:e907:8e2e:1ff0%3]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 03:30:17 +0000
Message-ID: <6ec59a82-8d48-2b72-867b-ba465f655810@os.amperecomputing.com>
Date: Wed, 28 Sep 2022 10:30:06 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH] ARM: dts: aspeed: mtjade: Remove gpio-keys entries
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20220915080828.2894070-1-quan@os.amperecomputing.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220915080828.2894070-1-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR01MB7282:EE_|BN0PR01MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: c81b0682-11cc-4357-a4a2-08daa101c33d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eQ+ONPaS2LlB1jt7Qmk5J1eIX0+BhvSIykw8R1VzDoED7+cpMjst6uczR6pg77LqN1iCRu0bODOLUPLFnZwTGLZkMwtvxdUJU7QQhtVF+3bVEJXBA1NcmZ7qAE6OAj2psG/SoKHYpzfQaX1bM47IW++ZZQXa/VHgZkmFevXY9KE8exggYnxrijdrolZqmY6ww1U4pNLaxCw3TariU3ycFp2RKyRRNEzZ3TxI9Sbw0aB7iQ5SnH4UdWNFOyoQ4xG9rZ90y3jtQew8EowubPFSp9GpMSm9WpWALYHFfjnj5MPWhNXslrSel8TB0QGXpYozbwfrnxhy0e6AxB+ECqVaveCJyk9nFvRUV4grvWmXM9Ysm07qyfouqEhvzP6kzpLkK1PiXZITdPIMEEQHh+iCf259TT9Tafpw7JMokVKiDaNTs97ICE+cl9zkgKEwU1IiLrrNQfd/LHE83ETUamKtLvMoNiYxVGhINjws/iC5iJ0Z/JtKwkba1mjmYpUBpBPVGVdkJpEqr7ZQSECQ5izQko6WY5j7qA5ovEeOI1q0VOo7aV2wdy84qidRkQPKnVHDpjliwnM3rAudZ8jk5JYyq58wOyguptg005V8CNSgTSWld/sj8tPo3142AW0qTK382i3ZgB0ivwDSh73gyfmxN511qIatgKssBpgAImBxnC5p0mTs4RUZeb9/5WIu7CQO/+A9JZDMY36rXvT9UMnGjH0X+gmuUpb/vbGBs7Qyo1igJs75vbcB1Dy1rysDz+SzHoYB3FqGoiPSXhMsu8Ay/7Mxy+wxShULP9z+TTAJMpo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199015)(31686004)(6486002)(186003)(2616005)(38100700002)(83380400001)(31696002)(86362001)(38350700002)(6506007)(6666004)(8676002)(54906003)(478600001)(52116002)(26005)(53546011)(6512007)(6916009)(316002)(41300700001)(66476007)(5660300002)(8936002)(66946007)(66556008)(2906002)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aUp5WWVWbUhUTkFxRS9uQlNZc0Nkc1ErK0JOYldaKzQ5UktpYTRWV3VWOWls?=
 =?utf-8?B?L0hFMktwZXFaSlRwRUtPRUgxNWNpTHFRWUVUN0FDVGtDWDJXYXZwTjMwT2J3?=
 =?utf-8?B?Sk1SRW13dzMvenJ1SjFkUmFJSkdVWDE5L0pxMzFZaUk2Qzk2aGdvSXRDV2o5?=
 =?utf-8?B?Zk1JNTBLT1hkVzVxZmV0aE9VZCtYanVQbU4zOE1DVHZwYTR2ek5Zc1U2Mnl5?=
 =?utf-8?B?cDZjUkhTNTVobzk5UWpvNUYveVE1YTJLeU9oMUpjVVZVSTd1eFZuQ1dtTm84?=
 =?utf-8?B?anczei9QWStpbEpqckozNSt4WTFaWlV0TWxaWXVMYTRxckZUMDFiVWdHcGxG?=
 =?utf-8?B?MnhQbGhkNXNDNXQzM3pleGFRWU1SZDcvT0NKSkl3eFRvOFY1MW9BVmRCNmly?=
 =?utf-8?B?azE4d0M0V3NxN1FXb29xRWk0UUxTalpzaFRFNEZvVW9lQUp1UlZpcmtZOEVG?=
 =?utf-8?B?YStSMjNkY1lkZEJ5S0EyWSsyUUcrSVBYNStDTkRVYUFWQkhOOUZPVHVYVEll?=
 =?utf-8?B?YS9CUThMSW1DSHNtNnJWdjRlWkRsNjFpYWpQSXFZYUlSY3NFY2lxbEZwb09s?=
 =?utf-8?B?KzdXVWxpbGtZWEJBVmtXUmJSM0lFUm8yRnJ6b3ZCOUZJd2VISHk1MGdldFdq?=
 =?utf-8?B?dGhCaE1hMzhaalhzem9XQXRaeHUyeXpTUUpQbFJwRXZla1Bwc09FRVlsdzVX?=
 =?utf-8?B?cjIrOVp2S1NhdHVhV3VENGNUTFB2MXdVYjVIU0t2YnpaRmhaVFBZbU1VZWhB?=
 =?utf-8?B?SlV2RDdLWkp1aWFBOUV6aDlvVDhiT3pPNmlnUXlQQmxIQTYwVUIwdGNpVk0y?=
 =?utf-8?B?RFJuRE1JRWdxNHFaUXlJT2dIbVIyOWszZTNSL1Y3eDhucWlJcmdHUXNYQUtI?=
 =?utf-8?B?ckFMZHc1cmRBTTdyK3llNEExUk81QVlGd1B3THU1UUxBeWZ0SFdET0hYNEFZ?=
 =?utf-8?B?UjJBY3hkSklONjhxNWlTWjJuOUxVbi8xbmlvSjRCbGpock5SRTdpZ0RSSmlw?=
 =?utf-8?B?S285ZkpnWTlmRC9OZkdDcGxDSi9aMTdVamI1VXQ4VTVmaWdJS2tYd1pGWmVW?=
 =?utf-8?B?TDBJYUhGYWFPaHNtcUszTUVHNnUxNml4aitkNjl4K2NtclFVVENWdzVYWVpS?=
 =?utf-8?B?U3VJdFowZWFGK1BuTXNxZjNPaE41V01XdEZjZzlaeXFwOWc3YXUxaTF0Z0w1?=
 =?utf-8?B?Q3dGaDFXZml4NWhqVVdYcWIzcjdEVUplTTVlTVFRN0JUS3FzR092TTMwUHdl?=
 =?utf-8?B?NjFTeUwyZ3RiYWFpK2pkTlgyZU9pWkpvVURSR2lMUzcwUmNmT2Nna2ZZVGJB?=
 =?utf-8?B?VkxRaFVtYlh3eHdBSlRDY2Y2YUtBNU9GNzV0UzJTME5JdWhIaTR6YTNwV1R4?=
 =?utf-8?B?amJQTnV4T2d3OHpHMGVGeUgvRE1zc1BUU1ZEbGRxMWtxRHpVeGFVcDY5ZGFq?=
 =?utf-8?B?cGxLU0dSQk53U0k1U0VZQWhXL3ZDangxcjZvR08xZk11ZzlVQVhFKzk4VWwx?=
 =?utf-8?B?cDhBditzTWFFQkZkRC9yTEw3UStSSzM3UklHT28ydzNJcC8ydHdxSTRKZk1i?=
 =?utf-8?B?NyszTXYxeWxrZWtrZ1BBOUhwL2ZIcFI5T2YvQmhqQ2ZrNGVYVHQ4cVlLRVdP?=
 =?utf-8?B?czg2VUpvTWJocEN1VXRvbFN1Q2dvdWo5b3hyTURwSnRPcG8wU2RWSUZCTXEx?=
 =?utf-8?B?Z2lNYWJScVZLd0lld1UzZUgwbVV5aG52ZWk3RmlHQnNBZ1hxM1B3OWNPR2xI?=
 =?utf-8?B?eVJHWFhEUzl0dnA4andzY0R1di91cUNnbk1MRjhJdjhKMjVCTUJLcm9RNUwy?=
 =?utf-8?B?NlM5M2VYUS9ad1VEN25Hbkt2R2xQTURmV3FuTFRTSmUxVHhxZmhYU1Jnenpv?=
 =?utf-8?B?UDU2NGg2NWpJQVJCNnBQTzUwc1d6YW0xQ2xhRE1GV1A4MkxrK0dIeGRuNUpZ?=
 =?utf-8?B?T0laYjNhWkEzMTdPUG5yUWNvektZWUZKQ2M1bnF1YWJ2Mkc4WENjemRkS3ZG?=
 =?utf-8?B?TW85WlE1YUZqSzZueXRvVzVnQU9aWVZhcElGMGFpM0xhU1lWczNKdit1V3RB?=
 =?utf-8?B?M2t5ZTdYSUIzUFlVYUV3Vy9heDNuOFBDTkFnZWpGODJUN0Z5OWVkdEVEZXcr?=
 =?utf-8?B?UTlJZUNOUlRsZWxLUGZROWFmZmFFN1N1UWJFMy9CQlA5NjVzK2toS1VJNVhp?=
 =?utf-8?Q?2UUABpnwTHLmOT7eN2+a0sI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81b0682-11cc-4357-a4a2-08daa101c33d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 03:30:17.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rxqVoWqlZqotU6N8SKCmgcaSUIkMFa20p1vEwn/nfPWHb6K9mktq6huJTD0+PvR4xjwnnMD6aSMUuvmqKnHSge/22vLxOWSM8MapHTBwAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB6911
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Thanks Joel,
Would you mind picking the patch to openbmc dev-5.15 branch ?

Thank you,
- Quan

On 15/09/2022 15:08, Quan Nguyen wrote:
> Remove the gpio-keys entries from the Ampere's Mt. Jade BMC device
> tree. The user space applications are going to change from using
> libevdev to libgpiod.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 95 -------------------
>   1 file changed, 95 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 82a6f14a45f0..d127cbcc7998 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -97,101 +97,6 @@ identify {
>   		};
>   	};
>   
> -	gpio-keys {
> -		compatible = "gpio-keys";
> -
> -		event-shutdown-ack {
> -			label = "SHUTDOWN_ACK";
> -			gpios = <&gpio ASPEED_GPIO(G, 2) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(G, 2)>;
> -		};
> -
> -		event-reboot-ack {
> -			label = "REBOOT_ACK";
> -			gpios = <&gpio ASPEED_GPIO(J, 3) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(J, 3)>;
> -		};
> -
> -		event-s0-overtemp {
> -			label = "S0_OVERTEMP";
> -			gpios = <&gpio ASPEED_GPIO(G, 3) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(G, 3)>;
> -		};
> -
> -		event-s0-hightemp {
> -			label = "S0_HIGHTEMP";
> -			gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(J, 0)>;
> -		};
> -
> -		event-s0-cpu-fault {
> -			label = "S0_CPU_FAULT";
> -			gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> -			linux,code = <ASPEED_GPIO(J, 1)>;
> -		};
> -
> -		event-s0-scp-auth-fail {
> -			label = "S0_SCP_AUTH_FAIL";
> -			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(J, 2)>;
> -		};
> -
> -		event-s1-scp-auth-fail {
> -			label = "S1_SCP_AUTH_FAIL";
> -			gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(Z, 5)>;
> -		};
> -
> -		event-s1-overtemp {
> -			label = "S1_OVERTEMP";
> -			gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(Z, 6)>;
> -		};
> -
> -		event-s1-hightemp {
> -			label = "S1_HIGHTEMP";
> -			gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(AB, 0)>;
> -		};
> -
> -		event-s1-cpu-fault {
> -			label = "S1_CPU_FAULT";
> -			gpios = <&gpio ASPEED_GPIO(Z, 1) GPIO_ACTIVE_HIGH>;
> -			linux,code = <ASPEED_GPIO(Z, 1)>;
> -		};
> -
> -		event-id {
> -			label = "ID_BUTTON";
> -			gpios = <&gpio ASPEED_GPIO(Q, 5) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(Q, 5)>;
> -		};
> -
> -		event-psu1-vin-good {
> -			label = "PSU1_VIN_GOOD";
> -			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(H, 4)>;
> -		};
> -
> -		event-psu2-vin-good {
> -			label = "PSU2_VIN_GOOD";
> -			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(H, 5)>;
> -		};
> -
> -		event-psu1-present {
> -			label = "PSU1_PRESENT";
> -			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(I, 0)>;
> -		};
> -
> -		event-psu2-present {
> -			label = "PSU2_PRESENT";
> -			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
> -			linux,code = <ASPEED_GPIO(I, 1)>;
> -		};
> -
> -	};
> -
>   	gpioA0mux: mux-controller {
>   		compatible = "gpio-mux";
>   		#mux-control-cells = <0>;
