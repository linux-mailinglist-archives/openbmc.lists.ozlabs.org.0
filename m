Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC880C04D
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 05:09:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bgcLN+Qd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpStR4PQGz3vYY
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 15:09:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=bgcLN+Qd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::723; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpSqf4FXCz30gs;
	Mon, 11 Dec 2023 15:06:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxkDfQoq8bPOl2LOM8g8IWoR9fwy80r9x3j2IEaCAg5CFBU7rtqV9fhe9ssOmcq9PfnvI5pFr3aAYFHOJgKb52LZ2BfxGJ8SdVQJqX4OqL/mnBHzviIO3ruLPztS3TXAlYiZqHNHr7AR6kdBq6J+Msrj2JnNdPuScR+OiPJvYgg0lHPigGotQemM4fiuYC19dIguNtxLVivKs6oZ0cyI+blRIt5KBQEcQ2SN2Uy6A9h+1POxfpSFFFDr3So7Ejj3p0mpA9KbSRAld7vJ9E5IZ8jUZVpj1kiUJRLyX+fxcWM/gHltkXvTC/mLWdg8KOmbH1Ow26tfAF4BegdxExKUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9PZ8wLdI/tjCZz3SSEumfZLJ8UAhLIqL6Kpcg65CFM=;
 b=gCJ07dhR/9VZRmB5PcH/ypqzr7hY5dFDWhRcLz72ulS0dxLneOfdQr60qH3kDwOAvGKOlvvivy1PMHX9VXl5em2W0kMOYPzODESbf/XnkRxh0woyQ+ocxNJdJqzqm18OmDAq6BISvL1S57GMAZ/5eSYY+3iP4JafwkQmdTaPU5/vccjOeISbvrbQi1p5rhZbfRj18C4S/4Byn/qsimpYdKg1YxwdvM4dzurcvW+o7t3NOqbQurtY74axrgmrBaQHoVx3NARxJnfnSA+iYRT0gPOD+yoYSwfPEjjX/R3ERYDSzLf79LRJ5Z14goS3keyg0jeWKJq6BEcc2cQhegtHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9PZ8wLdI/tjCZz3SSEumfZLJ8UAhLIqL6Kpcg65CFM=;
 b=bgcLN+QdSfDPMUdcqTLSEDvhBXC8e2FG0AyVd3sWIXvnAbin9VpocBDGb+3UBLtk7z2R68yRJyKjAZ6shRRZ3xyabrynU6eP6g54e8AfgHR7UmngFas94K2SMlZBGI5TKGzrMNzjecWJ6fpgvWAfoHDADuHrfxb9M/rgIGST+HM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH7PR01MB7821.prod.exchangelabs.com (2603:10b6:510:1d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 04:06:52 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 04:06:51 +0000
Message-ID: <8822a211-678f-49e5-8e6b-50b46dfc61b3@os.amperecomputing.com>
Date: Mon, 11 Dec 2023 11:06:45 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
Content-Language: en-CA
To: Andi Shyti <andi.shyti@kernel.org>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-3-quan@os.amperecomputing.com>
 <20231209204455.jxize3muvx7hhpos@zenone.zhora.eu>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231209204455.jxize3muvx7hhpos@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::22) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH7PR01MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 60100480-8bac-4dbf-ecea-08dbf9fe9aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zLq2XrWTGEtZO38X6CxnWuJgSUuobT3DF8K7ft+EgCGA3kCg4vdeXgTXvW4yMcDwKrpMXg1k/e0EawGlfmBxs8jrswrpSkeJMu4d5l4JqeVX8FH74HMF/gBrWdQ3LiggxZZG0ZVGVMKCeqm+Zl7XQzJrzZxJygFHPdT1B+OgfX5rEsqRe3/1o8sTDVWPEUzcxPcy14Dlrmfr5uGwP/KUWznWXRWDbPpfWq+bls5inJ2OqDFUPo5pDkN4wTzktefwKCGmY3vRNKrZdCXDQ993nAc1CkW67LXePkrnsyI2Tr75D12X6ihVsibteOqU9PWWcYEzOnYvO4WiSoI7oaEbQgQvYAaCScmVYTvDTNuABqoAKdDfT8XuBt8EhRGh7qUwIxUDG1IxUmpWjXk44Ap+adV40xQiteip1xleVhV1Iixj5FCON0L3PisYkZtognI+/vy5lHFYcLo4nRyhdsXvZQAV4R03Bryy9z29pHIKXW6wVADKiVhu5AHy/HV0XUcCM/cNHUbs9g51YnYao5anwmvM5n0qj1A8p4AzFfeupGAtKiDTVFLByKXZuaVPuBkvEezLMfdMV+j78iAXDV1wXl793YYMt7Wne3vYbsfiZK+A9CoSExMYbhiS4Fai6dnO
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(7416002)(6916009)(54906003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(31686004)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(316002)(38100700002)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UGtYbEIrVjE1MVZhQ0s0dHRTejhnck8rOVNhdWg4aGVNdzRVVDk2TjhKM2Z3?=
 =?utf-8?B?ZFIveW5UTUNORVpuQTQ4ZHNXMGJWK09GNERRUE41NTFSeHdLQS8wbzhSNUFG?=
 =?utf-8?B?U1dscUFDcmlNKzdqSTRPYjNLSkRXR1VKRFlqcXlwUWFBdi9qWmhtUGVEM3dN?=
 =?utf-8?B?NkJrUWZSME5Da0k2cXJzcXlWQlc2ZFdFT0NCR0tXN3lBTU1EVTJoNVpZeEN0?=
 =?utf-8?B?c2NDSEcyZGpTMnR1dzg5RU4rU1ArbTBUWUtkWCtwMUxDMENSd0J0dXRnbWlJ?=
 =?utf-8?B?c01IOGt3NTRoZkN5RHQ1aGQ4dGlFWkgrbjZxY3NYZTdJTjhLZTJ2SFFGOWVG?=
 =?utf-8?B?bHN4ZDRTV2gxeHJqTm1YREdsZG5xMDdOS2thallZeUFUWGU0N0tDbVJrSXYy?=
 =?utf-8?B?VWZIRm1rbmJpZFJwRHBhUW9KaEl1bVFsN1F1a1A5UkRDblVLQ3h1TDRYeTNo?=
 =?utf-8?B?eHR3a2VGdmhjem9GUW11KzRNeW9ZYTdhT0t0WDZVajhMU0s5K1RPQjA2Mzcv?=
 =?utf-8?B?OGZKTkIwNkxCME96VVZWZU1UWjhVR1JqM3VQS0I5MHVFODRKRm9ZWkIzb0Jn?=
 =?utf-8?B?YmtSb2ZzREdlbjdMeDVoRlBseGQxY1lJTTRKbFBUbDFTWlNyMkVHTlhiWFhI?=
 =?utf-8?B?Tlk5WjdyRUVSME1SNzZ0K09BZFZxU21LOENoTHRSTHBnZEg2WnVUaFZDRmVp?=
 =?utf-8?B?TFBCSUlSeWtHU1FIUnNwaEQxL2RFeW12ZWdHbTMyUE02Q2QxdjZuWXF2TlQ3?=
 =?utf-8?B?TXZuaGE2MzZSbkN3YzA2UEpoQURlZ2FxeEFaZk9adlFyNDY4dWNlS1dnY2VR?=
 =?utf-8?B?QUFWWlFheTRQbmpGcXhpN2JGVzF1b1BDRUJGNHpmRmZkOTFNbEN3QWdJQTBo?=
 =?utf-8?B?anhmSHhZVVNlc01YNWYvcy9sZTRFMTNwVENYQWthVXBFSVJyd2czTzNtTDd2?=
 =?utf-8?B?ZEdMTDQ0SkJCMEk3Z1VhaHl6MHdqOVFpdElBeHpoMm1IL2huRHozQjdkL2lu?=
 =?utf-8?B?Ny9uUW55aUU0S3pxM09qMFZoSytJMkQzd2lyampZajJkSGR1M1U5K3Btc2x4?=
 =?utf-8?B?SmsxWnRHTjRwd24zN04zQ0l0NnVXNCtpKzZIUWFBTHg5NG1SejVEc0VteTRx?=
 =?utf-8?B?dzhVZGlwS29vWUJ4S25CS0VvU2c1R05rV2wrN1BJQlNxUVp2K0JCQ1c0YXpp?=
 =?utf-8?B?ZmZ6NXhnWm9lYVR4VGpRLzM3ZGNQSVh1SWx1dmdnbU5OVnlDaGhsUHdvYjh4?=
 =?utf-8?B?Z2NieUdGaUxLVFdlaUU5d3JyWWlWa3VsaVRZQmtaNTdrRkNOV1lFWHJCWXpZ?=
 =?utf-8?B?bUg1UmdEenNlSDlHck9SUDVPWXBsL1lNUURsYXoyMG01aStFVTB1L0Z6c09q?=
 =?utf-8?B?ekZKemNNZDlITFFaUG0zcVhyOCs5a2ZmTW9xaFhCMjNCc1pTczFsTk9Fblo3?=
 =?utf-8?B?eDI2UHVRY3lUZ29WSGlYN1ltanNGSlJlUVhtdXNHaFI3TkY2bkVwcWJaamxp?=
 =?utf-8?B?RGJUUjNDYXJ3ZFJYWFp5S1dlK3d4TVQ5bjlDMzFlT3BOeEJyd0NkZEplQnVI?=
 =?utf-8?B?cXJJOURrYXF3b0hQUHBnUVdUR1ZYRXI5cks2d1Bpb1NhUDJXakVIVjMvNFd4?=
 =?utf-8?B?eUVEbWdod3VLUXo5TGRzN0lJUGo0SkFFa21BSy83S25GM1BZM3hVd0VTVGc4?=
 =?utf-8?B?cXp3WnB1WDViNEN1dE9lV1IvMWM2RzVJcnJjRjF5WU9YQTM3ODU2WGl2THZW?=
 =?utf-8?B?clB1L2dUSXFoWEdya1FPUVVZaW9xcXhubmZTK2NnUzdsTUphQitkbFpFM0tB?=
 =?utf-8?B?aDNseVlPa0FCaTRHVFJwbzJsN1pnNGgzTFFmdmdtb3RSbWs5SzUvNG95ZXI3?=
 =?utf-8?B?WGxraGJ6N0F0NFY3OE0rS1pYSkFyNEdGZU5mV2hGRnFPcUZneUV6U0NCb0ls?=
 =?utf-8?B?MFYxMXduVnlyT2xSN0VoaENnc3hPZ01ESTdiczAwaTliSnVsejBDRGRKYU1x?=
 =?utf-8?B?MUJwSW1pL3EvTWQ3elBYTUg1R3hWd29HSVA4bWcwVUo4UnlmY2VTdUZlYmJL?=
 =?utf-8?B?MTV1R2ZHeFFIaHRSVnUxeVR3Z25NdlYwcHJwTzAzd2NrL0Y1QnRsMGVieXIz?=
 =?utf-8?B?YitKSVVzMFllR1V0b2MxZ21abWFXdUxKM0JXdzVlMkx3MUxxaDdVMHFqM3lJ?=
 =?utf-8?Q?KHvCfwAbU3a32V/5UsDqdD8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60100480-8bac-4dbf-ecea-08dbf9fe9aca
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 04:06:51.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nlGCZmGEW7+CN54hVieLI3Hr5t4zqOvk+qNR0K5FtG49ig1eXdNVlvWKzqH2nZvzU+fCL976A0epgfu/Ler1icknDY7XkNhAWFVDe5FCFzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7821
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/12/2023 03:44, Andi Shyti wrote:
> Hi Quan,
> 
> [...]
> 
>> -	/* Ack all interrupts except for Rx done */
>> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>> -	       bus->base + ASPEED_I2C_INTR_STS_REG);
>> +
>> +	/*
>> +	 * Early acking of INTR_RX_DONE and INTR_TX_[ACK|NAK] would indicate HW to
>> +	 * start receiving or sending new data, and this may cause a race condition
>> +	 * as the irq handler has not yet handled these irqs but is being acked.
>> +	 * Let's ack them late at the end of the irq handler when those are truly processed.
>> +	 */
>> +	irq_ack_last = ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK;
>> +	writel(irq_received & ~irq_ack_last, bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> I like Andrews suggestion of having irq_ack_last as a define that
> is already negated, instead of negating it in the writel, which
> makes it a bit difficult to read.
> 

Yes, but the it still need to negate again when do the write to late ack 
them later in the end of irq handler. So I'll keep the define as below 
in my v4:

+#define ASPEED_I2CD_INTR_ACK_RX_TX	    \
+		(ASPEED_I2CD_INTR_RX_DONE | \
+		 ASPEED_I2CD_INTR_TX_ACK |  \
+		 ASPEED_I2CD_INTR_TX_NAK)

The early ack will look like this:

+		writel(irq_received & ~ASPEED_I2CD_INTR_ACK_RX_TX,
+		       bus->base + ASPEED_I2C_INTR_STS_REG);
+		readl(bus->base + ASPEED_I2C_INTR_STS_REG);

And the late ack:

-	/* Ack Rx done */
-	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
-		writel(ASPEED_I2CD_INTR_RX_DONE,
+	if (irq_received & ASPEED_I2CD_INTR_ACK_RX_TX) {
+		writel(irq_received & ASPEED_I2CD_INTR_ACK_RX_TX,
  		       bus->base + ASPEED_I2C_INTR_STS_REG);
  		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
  	}

> Besides, ack_last, as a name is not very meaningful, I'd rather
> call it irq_ack_rx_tx (or something similar).
> 
> But I'm not going to block it for this, up to you if you want to
> send a new version.
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> 

Thanks, Andi for the comments.

I will send out v4 to address those.

- Quan
