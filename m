Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB25567119
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 16:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LclXW2VWBz3c1m
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 00:33:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=G7YhjLlk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=G7YhjLlk;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LclX65Ry6z3brF
	for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2022 00:33:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657031591; x=1688567591;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mIvZClP5Iy7mbAgJwbPE7JO+NCvCxZM7y8lBoMytJu0=;
  b=G7YhjLlkEOccg5PBL+y98o6mZ2VFiSxQJOlYSCsYHMDkxK/x1S07nsQN
   6yw5btjE9LWHB5e0gTq0gJuCgvxiahhk61dpPnFfgTSNVtUHnSHBXcoHn
   aIZKSo13k6qqyl8I3vYUjy/0cc4oZ4emeSMiJyoVRZ7BM3a6QmTtHyrHF
   s=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 05 Jul 2022 07:32:09 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 07:32:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 07:32:08 -0700
Received: from [10.110.98.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 5 Jul 2022
 07:32:07 -0700
Message-ID: <5a0c4a0b-12b7-5ab8-08ff-c0345d403299@quicinc.com>
Date: Tue, 5 Jul 2022 07:32:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/3] board:
 ast2600_qualcomm: add env default
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-4-quic_jaehyoo@quicinc.com>
 <CACPK8Xd40ruWBoMhC6fZO7VDRX=fchVf22k+Vemce7AxkRN8nw@mail.gmail.com>
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <CACPK8Xd40ruWBoMhC6fZO7VDRX=fchVf22k+Vemce7AxkRN8nw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Hello Joel,

On 7/4/2022 11:52 PM, Joel Stanley wrote:
> On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>>
>> Add env default to dc-scm-v1 board configuration.
>>
>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
>> ---
>>   .../aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt  | 4 ++++
>>   configs/ast2600_qcom_dc_scm_v1_defconfig                      | 2 ++
>>   2 files changed, 6 insertions(+)
>>   create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
>>
>> diff --git a/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
>> new file mode 100644
>> index 000000000000..9aebd38424ef
>> --- /dev/null
>> +++ b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
>> @@ -0,0 +1,4 @@
>> +bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>> +bootcmd=bootm 20100000
>> +bootdelay=2
>> +loadaddr=0x83000000
> 
> This looks standard for a SPI boot. Do you really require it?

Ah, you are right. I realized that these are default for SPI boot and
can be configured by defconfig via CONFIG_BOOTARGS and
CONFIG_BOOTCOMMAND. I'll drop this change in v2.

Thanks,
Jae

>> diff --git a/configs/ast2600_qcom_dc_scm_v1_defconfig b/configs/ast2600_qcom_dc_scm_v1_defconfig
>> index 353882deed26..e602163e1caf 100644
>> --- a/configs/ast2600_qcom_dc_scm_v1_defconfig
>> +++ b/configs/ast2600_qcom_dc_scm_v1_defconfig
>> @@ -67,6 +67,8 @@ CONFIG_USE_ENV_SPI_CS=y
>>   CONFIG_ENV_SPI_CS=0
>>   CONFIG_USE_ENV_SPI_MAX_HZ=y
>>   CONFIG_ENV_SPI_MAX_HZ=100000000
>> +CONFIG_USE_DEFAULT_ENV_FILE=y
>> +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt"
>>   CONFIG_NET_RANDOM_ETHADDR=y
>>   CONFIG_REGMAP=y
>>   CONFIG_SYSCON=y
>> --
>> 2.25.1
>>
