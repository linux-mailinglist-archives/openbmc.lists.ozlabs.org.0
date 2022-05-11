Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED3523E95
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 22:14:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz5j935Wmz3by9
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:14:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MnyROThf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MnyROThf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz5hj2bx1z3bq9
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 06:13:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BJs2Nt012451;
 Wed, 11 May 2022 20:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sGCKqnF2R866Hv21QkzJ1yaGVzTbmKmb7NjVDmHD9vA=;
 b=MnyROThfwpV5s3JncIU7ktds5Y4dvOUUrtA/4hmeNs316eQvCZfvOpaCddDb7RCJWjt3
 a+49X49a5bOcEEQU7vOTbqSXjS3vMgcu+wADxxR1arLcDSJwdLULa/2sZUINIqEzGaJt
 4z4hyku/jMPNBxhsMm29xQPe6foDa4vNUrirpD6+/zbPPnSl5C6ZLGdh1dHWAi362Kot
 zljnApWj9JNjGETNXcciS9eWNRXoL6Ecg3anatVACHl6ZOzZtVcnHBTE69fSAE1p13W7
 cRX0ZzBbHCG/6sm2YiPTInEa58kXm8i66IPrb3Y4Le3RQyCtInZi3dnGySWb9S7NExYd gw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0a704epk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 20:13:54 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BKBo2E023583;
 Wed, 11 May 2022 20:13:53 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3fwgdae6m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 20:13:53 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24BKDqNS27066634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 20:13:52 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D7FC78067;
 Wed, 11 May 2022 20:13:52 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7725D78063;
 Wed, 11 May 2022 20:13:52 +0000 (GMT)
Received: from [9.211.61.211] (unknown [9.211.61.211])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 May 2022 20:13:52 +0000 (GMT)
Message-ID: <8ec8e933-1116-a2bc-50fc-bc1d8629520b@linux.ibm.com>
Date: Wed, 11 May 2022 15:13:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 5/5] aspeed: Add
 board_late_init to write TPM
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220505202829.31466-1-eajames@linux.ibm.com>
 <20220505202829.31466-6-eajames@linux.ibm.com>
 <CACPK8XdNLATDZy1fjC2b8sn+xLqJE09sRpaTjdEnAx5GBt8Y6A@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XdNLATDZy1fjC2b8sn+xLqJE09sRpaTjdEnAx5GBt8Y6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tVaTuo-HxB7DTHh72shTspWRmBjJGeqE
X-Proofpoint-GUID: tVaTuo-HxB7DTHh72shTspWRmBjJGeqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110086
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/9/22 21:44, Joel Stanley wrote:
> On Thu, 5 May 2022 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>> If there is a TPM in the devicetree, use board_late_init to
>> extend PCR0 with some invalid digest. The purpose of this is to
>> prevent later undesired usage of the TPM.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> I think we will need a board_late_init for our platform, as others may
> use the TPM and not want to poison it.


Yea I'll give that a go. I tried it and I had a brief fight with the 
config and build and gave up :)


>
>> ---
>>   board/aspeed/evb_ast2600/evb_ast2600.c     | 34 ++++++++++++++++++++++
>>   configs/ast2600_openbmc_spl_emmc_defconfig |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/board/aspeed/evb_ast2600/evb_ast2600.c b/board/aspeed/evb_ast2600/evb_ast2600.c
>> index 72ecb18c15..e11fc6973d 100644
>> --- a/board/aspeed/evb_ast2600/evb_ast2600.c
>> +++ b/board/aspeed/evb_ast2600/evb_ast2600.c
>> @@ -3,6 +3,11 @@
>>    * Copyright (C) ASPEED Technology Inc.
>>    */
>>   #include <common.h>
>> +#if defined(CONFIG_TPM_V2)
>> +#include <dm/uclass.h>
>> +#include <tpm-common.h>
>> +#include <tpm-v2.h>
>> +#endif
>>   #include <asm/io.h>
>>
>>   #define SCU_BASE       0x1e6e2000
>> @@ -122,6 +127,35 @@ static void __maybe_unused espi_init(void)
>>          writel(reg, ESPI_BASE + 0x000);
>>   }
>>
>> +__weak int board_late_init(void)
>> +{
>> +#if defined(CONFIG_TPM_V2)
>> +       int rc;
>> +       struct udevice *dev;
>> +       unsigned char digest[32] = {
>> +               0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
>> +               0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
>> +               0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
>> +               0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
>> +       };
> Add a comment for how this was created.
>
>> +
>> +       rc = uclass_first_device_err(UCLASS_TPM, &dev);
>> +       if (rc)
>> +               return 0;
>> +
>> +       rc = tpm_init(dev);
>> +       if (rc)
>> +               return 0;
>> +
>> +       rc = tpm2_startup(dev, TPM2_SU_CLEAR);
>> +       if (rc)
>> +               return 0;
>> +
>> +       tpm2_pcr_extend(dev, 0, digest);
>> +#endif
>> +       return 0;
>> +}
>> +
>>   int board_early_init_f(void)
>>   {
>>   #if 0
>> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
>> index 3bb44280c7..b506bc5e55 100644
>> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
>> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
>> @@ -39,6 +39,7 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
>>   CONFIG_DISPLAY_BOARDINFO_LATE=y
>>   CONFIG_ARCH_EARLY_INIT_R=y
>>   CONFIG_BOARD_EARLY_INIT_F=y
>> +CONFIG_BOARD_LATE_INIT=y
>>   CONFIG_SPL_BOARD_INIT=y
>>   # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
>>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y
>> --
>> 2.27.0
>>
