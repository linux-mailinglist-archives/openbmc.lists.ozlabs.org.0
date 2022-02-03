Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164E4A882C
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 16:59:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqNfM6Hxnz3bTs
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 02:59:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mEoA2oO+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mEoA2oO+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqNdv6Fx6z2xvV
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 02:59:31 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213EWbkU018945; 
 Thu, 3 Feb 2022 15:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T+WWbVNnvGNRYHGt0OyEmCMHoSg61XGl1UOYvZrx/Lg=;
 b=mEoA2oO+eYTakkDHLhRqGstTaOW3i2ph6MckvCP5m5QhbpN/XOuzSIefHjDtR6VBYT27
 7WbnqLCHpqW0OBW14ymslAcuavDG0+oxt4JTP6fIczPwjGnTY0KcWxZvxhpWxyF3lzXf
 37qwZ0cDnGmCodg9w91M6/Gb56ukjckvEZs0B8/5opGIGWSYd84at/xCjIbezHTd+kKA
 Lkm4OcEWewdgX7PHJvqLAhQCMSMXv8YvLC/zkDVaeDXSYUOAVqNEL+q1x3hzCwz08lL4
 ytc3BFyJyxne2joBEOzlcShMBSySqU68R38Jn/lP0lCgEQKvAQFMnphi2OaoMbx15mao Eg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e03uqspxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 15:59:26 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213FwWlh029498;
 Thu, 3 Feb 2022 15:59:26 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3dvw7c7q70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 15:59:26 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213FxPGf28443036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 15:59:25 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79251AC06A;
 Thu,  3 Feb 2022 15:59:25 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 267F2AC05E;
 Thu,  3 Feb 2022 15:59:25 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 15:59:25 +0000 (GMT)
Message-ID: <44d92066-775d-64a7-c1e7-711b89868be3@linux.ibm.com>
Date: Thu, 3 Feb 2022 09:59:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 5/6] Add GPIO hogging
 support for AST2600 openbmc config
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-6-eajames@linux.ibm.com>
 <68e65de2-0047-4e81-8c97-67e9982f71d4@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <68e65de2-0047-4e81-8c97-67e9982f71d4@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fKEC0GPoyPZCGvxxHytEJ5rrMQvZhqtD
X-Proofpoint-GUID: fKEC0GPoyPZCGvxxHytEJ5rrMQvZhqtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030096
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


On 2/2/22 20:13, Andrew Jeffery wrote:
>
> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>> Enable GPIO support in the SPL and hog the GPIOs in the SPL only. Also
>> increase the size of the malloc size in the SPL to get the GPIO driver
>> loaded.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   configs/ast2600_openbmc_spl_emmc_defconfig | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig
>> b/configs/ast2600_openbmc_spl_emmc_defconfig
>> index 344a4d8f9c..5f50298a58 100644
>> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
>> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
>> @@ -11,6 +11,7 @@ CONFIG_SYS_TEXT_BASE=0x81000000
>>   CONFIG_ASPEED_AST2600=y
>>   # CONFIG_ASPEED_LOADERS is not set
>>   CONFIG_TARGET_EVB_AST2600A1=y
>> +CONFIG_SPL_GPIO_SUPPORT=y
>>   CONFIG_SPL_LIBCOMMON_SUPPORT=y
>>   CONFIG_SPL_LIBGENERIC_SUPPORT=y
>>   CONFIG_SYS_MALLOC_F_LEN=0x2000
>> @@ -19,7 +20,7 @@ CONFIG_SPL_SERIAL_SUPPORT=y
>>   CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
>>   CONFIG_ENV_SIZE=0x10000
>>   CONFIG_ENV_OFFSET=0x5000
>> -CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
>> +CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000
> How much capacity does this leave us with? Have you looked at the
> memory layout for the SPL (I haven't, so any legwork you do here is
> appreciated ;) )?


I'm not sure, I haven't looked into it that much. When I was debugging, 
trying to figure out why my SPL wouldn't load, we were right at capacity 
without the GPIO stuff - allocating like 0x7c0 or so. We should have 
plenty more room now. I guess I'm not sure where that memory comes from 
anyway.


Thanks,

Eddie


>
>>   CONFIG_SPL=y
>>   CONFIG_SPL_STACK_R_ADDR=0x90300000
>>   CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
>> @@ -94,6 +95,7 @@ CONFIG_CLK=y
>>   CONFIG_SPL_CLK=y
>>   CONFIG_ASPEED_HACE=y
>>   CONFIG_DM_GPIO=y
>> +CONFIG_SPL_GPIO_HOG=y
>>   CONFIG_ASPEED_GPIO=y
>>   CONFIG_DM_I2C=y
>>   CONFIG_SYS_I2C_ASPEED=y
>> -- 
>> 2.27.0
