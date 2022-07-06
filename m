Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A9568B42
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 16:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdMRD1XN4z3c2G
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 00:31:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=xsPrkcF1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=xsPrkcF1;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdMQq3VRdz3btl
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 00:30:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657117843; x=1688653843;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hr2lV5FKjW3BhRjJza1IYx10xNdUA+47WWD5DhYf41U=;
  b=xsPrkcF1iChyULLEB6p3fqQcbmyCvjAJt9vdmY1ht8dQERdYa8utZqju
   EJmTs9bn5bxGVP7PPA0P8e0z8lw+sCNaFFc+oj0gdBiisuwscAmzSSQDO
   YZNxuIJBhAF5VWyOcaRUzXfubm7Pd39DkJRymq60Mc40tEGDBdI/JaD1v
   c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 Jul 2022 07:29:33 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 07:29:33 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 6 Jul 2022 07:29:33 -0700
Received: from [10.110.82.111] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Jul 2022
 07:29:32 -0700
Message-ID: <f5db80df-90b4-fa36-2f5d-71f33164e9d4@quicinc.com>
Date: Wed, 6 Jul 2022 07:29:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/3] board:
 ast2600_qualcomm: add initial version of Qualcomm DC-SCM V1 board
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-3-quic_jaehyoo@quicinc.com>
 <CACPK8Xf5KjQZMX=8NnVDGw=oXHB2OrhY-NY4=jDXMZU=0LMEAA@mail.gmail.com>
 <f3019478-1384-fb4c-3531-042dd123ca60@quicinc.com>
 <CACPK8XcUkLVzCpw2vVoBQ8nc8Uj9z1GOs30RJgzwy7nWATN_nw@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8XcUkLVzCpw2vVoBQ8nc8Uj9z1GOs30RJgzwy7nWATN_nw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/5/2022 5:58 PM, Joel Stanley wrote:
> On Tue, 5 Jul 2022 at 14:28, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Hello Joel,
>>
>> On 7/4/2022 11:51 PM, Joel Stanley wrote:
>>> On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>>>
>>>> Add initial version of Qualcomm DC-SCM V1 board to support Qualcomm
>>>> specific options.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>>>> ---
>>>>    arch/arm/mach-aspeed/ast2600/Kconfig      |  8 ++++++
>>>>    board/aspeed/ast2600_qualcomm/Kconfig     | 15 +++++++++++
>>>>    board/aspeed/ast2600_qualcomm/Makefile    |  1 +
>>>>    board/aspeed/ast2600_qualcomm/dc-scm-v1.c | 33 +++++++++++++++++++++++
>>>>    4 files changed, 57 insertions(+)
>>>>    create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
>>>>    create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
>>>>    create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c
>>>>
>>>> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
>>>> index 46cc1ad1dbd9..252458846a84 100644
>>>> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
>>>> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
>>>> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
>>>>             AST2600-INTEL is an Intel Eagle Stream CRB with
>>>>             AST2600 as the BMC.
>>>>
>>>> +config TARGET_AST2600_QUALCOMM_DC_SCM_V1
>>>> +       bool "AST2600_QUALCOMM_DC_SCM_V1"
>>>> +       depends on ASPEED_AST2600
>>>> +       help
>>>> +         AST2600-QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
>>>> +         equipped with AST2600.
>>>> +
>>>>    endchoice
>>>>
>>>>    source "board/aspeed/evb_ast2600/Kconfig"
>>>> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
>>>>    source "board/aspeed/slt_ast2600/Kconfig"
>>>>    source "board/aspeed/ast2600_ibm/Kconfig"
>>>>    source "board/aspeed/ast2600_intel/Kconfig"
>>>> +source "board/aspeed/ast2600_qualcomm/Kconfig"
>>>>
>>>>    endif
>>>> diff --git a/board/aspeed/ast2600_qualcomm/Kconfig b/board/aspeed/ast2600_qualcomm/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..3ede24c34dee
>>>> --- /dev/null
>>>> +++ b/board/aspeed/ast2600_qualcomm/Kconfig
>>>> @@ -0,0 +1,15 @@
>>>> +if TARGET_AST2600_QUALCOMM_DC_SCM_V1
>>>> +
>>>> +config SYS_BOARD
>>>> +       default "ast2600_qualcomm"
>>>> +
>>>> +config SYS_VENDOR
>>>> +       default "aspeed"
>>>
>>> Out of interest, how does u-boot handle this upstream? Does a board
>>> made by company Y with a chip made by company X considered vendor X,
>>> or vendor Y?
>>
>> This code is added into a sub-directory of 'board/aspeed' so the
>> SYS_VENDOR must be set to 'aspeed'. If I set that to 'qcom', then
>> builder will look for an Makefile under 'board/qcom' instead and it
>> makes a failure. The same pattern is already used for ast2600_ibm and
>> ast2600_intel.
> 
> Yes, that is true, but it's not what I'm asking. There's momentum to
> use the upstream tree for u-boot and I want to ensure any patches that
> go in from now on are applicable upstream.
> 
> Can you do a survey of the upstream tree and see what the pattern is?
> 
> If it's to use the manufacturer

Investigated the latest u-boot upstream that it uses manufacturer's sub
folder instead of SoC vendor folder. For an example, RK3399 based Google
'gru' board was added to 'board/google' folder instead of
'board/rockchip'. Means that the current manufacturer board folders in
'board/aspeed' in openbmc u-boot tree also need to be refactored.

I'll submit this change to 'board/qualcomm' in v2.

>>>> +int board_late_init(void)
>>>
>>> Do you need to include this if it's doing nothing?
>>
>> The defconfig has 'CONFIG_BOARD_LATE_INIT=y' so this function should be
>> added as a dummy function otherwise it meets a build failure. This
>> function will be filled by following commits later.
> 
> Doesn't it make sense to not set CONFIG_BOARD_LATE_INIT=y if you don't need it?
> 
> You can introduce it when you need it (or add the code that uses it
> with this commit).

Agree with you. I'll remove the config if it's not needed at this
moment.

>>>> Is there a reason you don't use the gpio driver?
>>
>> Forgot to reply on this comment. This function is called from
>> board_early_init_f and gpio driver is not ready at that timing so
>> it uses direct register access.
> 
> Why not call it at a later boot stage, so the gpio driver is ready?

To set the GPIO output as early as possible but the timing wouldn't much
different so yes, I'll move the gpio init call to board_late_init using
the gpio driver in v2.

Thanks,
Jae

> Cheers,
> 
> Joel
