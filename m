Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DE28B68F
	for <lists+openbmc@lfdr.de>; Mon, 12 Oct 2020 15:37:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C908y0HW8zDqWR
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 00:37:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JMYtA/iK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C905V2jh1zDqWT
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 00:34:20 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CDWvZX071792; Mon, 12 Oct 2020 09:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wbQRckYAzlCX4k2ve4E0OtVGtLHLwl/HLnjlAha/tqw=;
 b=JMYtA/iKqNo/GHY4d9yd9RLRDjnIKORUNeBhWrT551M50vl6FnAmXLBdKwTIoLXdhuB3
 grqyFTksuc130Pn8IiqgpQJG36BxE8aun3CoDn9Nnt6YD4aVhLzKbMapMsLGlAOS5QP+
 aMg7fFvXMKtDiFyI5Y/T8gvRPs9VlkIcrOPEVK6d47Qz7juO7WFhICNNIZ8iTQBBpHnb
 X9zeuUN2c1TPrtkp3xjDPtO3SHdf52b+wYqgOdKGCLE1XPX2NqdR9LXVzJKdAyWj44Rq
 Dpw5wQWUZ/mwReXTZ4ICBtGinYP7bwpeabK2qze/oV+1lZU/dsmco8I+nKVeVfgjz2gA GA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 344r2h03vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 09:34:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09CDXmHe000914;
 Mon, 12 Oct 2020 13:34:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3434k93wf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 13:34:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09CDYDrc15926156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Oct 2020 13:34:13 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD0C6AC059;
 Mon, 12 Oct 2020 13:34:13 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98DC9AC05F;
 Mon, 12 Oct 2020 13:34:13 +0000 (GMT)
Received: from [9.85.207.95] (unknown [9.85.207.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 12 Oct 2020 13:34:13 +0000 (GMT)
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 2/3] arch: ARM: Aspeed: Add
 SPL eMMC partition boot support
To: Joel Stanley <joel@jms.id.au>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-3-eajames@linux.ibm.com>
 <CACPK8XcSTJ6tYSqUv=SX+x6uT7O59MBGoyxmbHn1ddCcqO6u6w@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <6acea8b3-64ad-e377-0c93-9a1738a56119@linux.ibm.com>
Date: Mon, 12 Oct 2020 08:34:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcSTJ6tYSqUv=SX+x6uT7O59MBGoyxmbHn1ddCcqO6u6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-12_09:2020-10-12,
 2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120109
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


On 10/8/20 10:41 PM, Joel Stanley wrote:
> On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>> Support loading U-Boot from a specific partition on the eMMC
>> device.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/mach-aspeed/Kconfig            | 7 +++++++
>>   arch/arm/mach-aspeed/ast2600/spl_boot.c | 9 ++++++++-
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
>> index 06f14f4f55..0e3bb841d0 100644
>> --- a/arch/arm/mach-aspeed/Kconfig
>> +++ b/arch/arm/mach-aspeed/Kconfig
>> @@ -90,6 +90,13 @@ config ASPEED_UBOOT_MMC_BASE
>>            The base block number of the U-Boot
>>            image in the eMMC device
>>
>> +config ASPEED_UBOOT_MMC_PART
>> +       int "U-Boot eMMC partition"
>> +       default 0
>> +       help
>> +         The partition number of the U-Boot
>> +         image in the eMMC device
> To clarify, it's the partition number in the user area of the eMMC
> device? (and not the eMMC partition).


Ah, no it is the eMMC partition, where 0 is user data, 1 is boot 
partition 0, and 2 is boot partition 1.


Thanks,

Eddie


>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>> +
>>   config ASPEED_UBOOT_MMC_SIZE
>>          hex "U-Boot eMMC size in blocks"
>>          default 0x0
>> diff --git a/arch/arm/mach-aspeed/ast2600/spl_boot.c b/arch/arm/mach-aspeed/ast2600/spl_boot.c
>> index b08c49d204..58a22f646e 100644
>> --- a/arch/arm/mach-aspeed/ast2600/spl_boot.c
>> +++ b/arch/arm/mach-aspeed/ast2600/spl_boot.c
>> @@ -46,8 +46,8 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
>>                                        struct spl_boot_device *bootdev)
>>   {
>>          int err;
>> +       int part = CONFIG_ASPEED_UBOOT_MMC_PART;
>>          u32 count;
>> -
>>          struct mmc *mmc = NULL;
>>          struct udevice *dev;
>>          struct blk_desc *bd;
>> @@ -78,6 +78,13 @@ static int aspeed_spl_mmc_load_image(struct spl_image_info *spl_image,
>>
>>          bd = mmc_get_blk_desc(mmc);
>>
>> +       if (part) {
>> +               if (CONFIG_IS_ENABLED(MMC_TINY))
>> +                       err = mmc_switch_part(mmc, part);
>> +               else
>> +                       err = blk_dselect_hwpart(bd, part);
>> +       }
>> +
>>          count = blk_dread(bd, CONFIG_ASPEED_UBOOT_MMC_BASE, CONFIG_ASPEED_UBOOT_MMC_SIZE,
>>                          (void *)CONFIG_ASPEED_UBOOT_DRAM_BASE);
>>          if (count != CONFIG_ASPEED_UBOOT_MMC_SIZE) {
>> --
>> 2.26.2
>>
