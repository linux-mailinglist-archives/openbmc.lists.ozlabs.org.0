Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6734A87EE
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 16:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqNN70tY0z3bZL
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 02:47:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CvyL5oyq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CvyL5oyq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqNMg34DMz30Mj
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 02:47:10 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213EppgU022780; 
 Thu, 3 Feb 2022 15:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RVfOsPi/tquCb0fIcvGBaoFmn+sVlk9TSCnuj7Cf9B4=;
 b=CvyL5oyqniw/jl2bVKb1RNsTVuvwRFo9gdTybhdJaNDmXo7V02EaK/Mj7KZwyrSLCn5s
 j741i6uDMFgmkKfgmH9Rot1dXUIfPmU/o3ZLYU3EjEXZn5S+g16rA0fUszr140dE34ls
 ffFpIKr+kgpY8DOGkVOnR7S5gVw+kmE3WgRReq8MzOq9vbJ8Q9rVWIso4P7wWdQDHTBJ
 dcrHQ6YwNePmTVBAoHak3fFOfRC7RYk12RNeeJECx8ED9+2ItGa9gLpAQDhq9Jds9itO
 d94er8gxBM4XC7pS9yCOubYK4rS4ZYis5x2CzLqC1MMK2aA6H8WF2l6IniESdMnLP5aL wg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyvvfj2a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 15:47:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213FRIrC023822;
 Thu, 3 Feb 2022 15:47:04 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3dvw7byh66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 15:47:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Fl4sZ10158696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 15:47:04 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C783AC05B;
 Thu,  3 Feb 2022 15:47:04 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9131AC06C;
 Thu,  3 Feb 2022 15:47:03 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 15:47:03 +0000 (GMT)
Message-ID: <aa8e6d8c-bef7-6c8e-b0ba-2d644eaf0c27@linux.ibm.com>
Date: Thu, 3 Feb 2022 09:47:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 4/6] gpio: Enable hogging
 support in SPL
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-5-eajames@linux.ibm.com>
 <926eb042-991c-4794-9e72-84056b7f6473@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <926eb042-991c-4794-9e72-84056b7f6473@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1xjW9XT9Ok_hrxyXA30y4l7VRG_5iT52
X-Proofpoint-ORIG-GUID: 1xjW9XT9Ok_hrxyXA30y4l7VRG_5iT52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


On 2/2/22 20:11, Andrew Jeffery wrote:
>
> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>> Use the CONFIG macros to conditionally build the GPIO hogging support in
>> either the SPL or U-Boot, or both, depending on the configuration. Also
>> call the GPIO hog probe function in the common SPL board initialization
>> as an equivalent to adding it to the U-Boot init sequence functions.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   common/spl/spl.c           |  7 +++++++
>>   drivers/gpio/Kconfig       | 10 ++++++++++
>>   drivers/gpio/gpio-uclass.c | 12 +++++++-----
>>   3 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/common/spl/spl.c b/common/spl/spl.c
>> index a1d4514fd3..bbb7578463 100644
>> --- a/common/spl/spl.c
>> +++ b/common/spl/spl.c
>> @@ -12,6 +12,9 @@
>>   #include <dm.h>
>>   #include <handoff.h>
>>   #include <spl.h>
>> +#if defined(CONFIG_SPL_GPIO_HOG)
>> +#include <asm/gpio.h>
>> +#endif
>>   #include <asm/sections.h>
>>   #include <asm/u-boot.h>
>>   #include <nand.h>
>> @@ -652,6 +655,10 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
>>   	timer_init();
>>   #endif
>>
>> +#if defined(CONFIG_SPL_GPIO_HOG)
>> +	gpio_hog_probe_all();
>> +#endif
>> +
>>   #if CONFIG_IS_ENABLED(BOARD_INIT)
>>   	spl_board_init();
>>   #endif
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index a8dc16ca0e..8b8bf6822f 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -24,6 +24,16 @@ config GPIO_HOG
>>   	  is a mechanism providing automatic GPIO request and config-
>>   	  uration as part of the gpio-controller's driver probe function.
>>
>> +config SPL_GPIO_HOG
>> +	bool "Enable GPIO hog support in SPL"
>> +	depends on SPL_GPIO_SUPPORT
>> +	default n
>> +	help
>> +	  Enable gpio hog support
>> +	  The GPIO chip may contain GPIO hog definitions. GPIO hogging
>> +	  is a mechanism providing automatic GPIO request and config-
>> +	  uration as part of the gpio-controller's driver probe function.
>> +
>>   config ALTERA_PIO
>>   	bool "Altera PIO driver"
>>   	depends on DM_GPIO
>> diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
>> index 01cfa2f788..219caa651b 100644
>> --- a/drivers/gpio/gpio-uclass.c
>> +++ b/drivers/gpio/gpio-uclass.c
>> @@ -144,7 +144,7 @@ static int gpio_find_and_xlate(struct gpio_desc *desc,
>>   		return gpio_xlate_offs_flags(desc->dev, desc, args);
>>   }
>>
>> -#if defined(CONFIG_GPIO_HOG)
>> +#if CONFIG_IS_ENABLED(GPIO_HOG)
>>
>>   struct gpio_hog_priv {
>>   	struct gpio_desc gpiod;
>> @@ -1033,9 +1033,6 @@ int gpio_dev_request_index(struct udevice *dev,
>> const char *nodename,
>>
>>   static int gpio_post_bind(struct udevice *dev)
>>   {
>> -	struct udevice *child;
>> -	ofnode node;
>> -
>>   #if defined(CONFIG_NEEDS_MANUAL_RELOC)
>>   	struct dm_gpio_ops *ops = (struct dm_gpio_ops *)device_get_ops(dev);
>>   	static int reloc_done;
>> @@ -1066,7 +1063,11 @@ static int gpio_post_bind(struct udevice *dev)
>>   	}
>>   #endif
>>
>> -	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
>> +#if CONFIG_IS_ENABLED(GPIO_HOG)
> Why switch to a CPP conditional here?
>
> I mean, it's not clear why there was a choice for a C conditional
> originally, so I'm curious either way.


Well I just thought it should match the other conditionals for GPIO_HOG, 
and it's obviously more efficient at runtime. Other than that, no reason 
really.


Thanks!

Eddie


>
> Otherwise:
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
