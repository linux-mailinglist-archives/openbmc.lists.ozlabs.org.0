Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578BD35FCF0
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 23:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLFLz1mm7z30KF
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 07:03:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QTVLeBrC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QTVLeBrC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLFLk4RR4z2yxS
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 07:03:25 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EKXsEn002792; Wed, 14 Apr 2021 17:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=P0LI562wtlrO3gXcD0BXLqm113rPwDxlpo0MmEUSFh4=;
 b=QTVLeBrCFaYbHLzQto/Snn4cvbbOR3/l/V6nSWCUqmmu+QL2g6/8Cd5gVDDB+fdWK163
 7QhnVSZbgIm7O0E9xZYVVYjjG6GQImASwNxcp8dTeY1T8cPGHBF56kPtTbDe8oNqONV2
 M5UxWY+iONg5c0D6+nwmW8sAr2bSCo22SGIRoc3t03OtK3osjyopSXd6FCRUCEGAScgH
 QNsMhO/bkB00noCs2n3Q/LuY/oHp00EKeiVy72Z9TdMoIJ5B8uR+mpc8y7w0P/o6RvTL
 9aJeLWqLaPJpnVADEjZp1/xGBntFU9J7r8EC+7+TVTNBeYbEVxrLdg4BMD8dPMLqf+Dc 6Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37x2hg0x9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 17:03:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EKwLOd030745;
 Wed, 14 Apr 2021 21:03:17 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 37u3na571h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 21:03:17 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EL3Gpn27197898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 21:03:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD207AE064;
 Wed, 14 Apr 2021 21:03:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE052AE062;
 Wed, 14 Apr 2021 21:03:15 +0000 (GMT)
Received: from [9.85.205.211] (unknown [9.85.205.211])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 21:03:15 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 11/11] configs/openbmc:
 Enable hw accelerated sha
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-12-joel@jms.id.au>
 <370a4d0b-d9ff-ebbd-6034-1e88f64c1f80@linux.vnet.ibm.com>
Message-ID: <042bab19-4489-39c4-67f5-44214d9d1657@linux.vnet.ibm.com>
Date: Wed, 14 Apr 2021 18:03:14 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <370a4d0b-d9ff-ebbd-6034-1e88f64c1f80@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MEPFDJpkBQEM_pGq8nSueuj3u0XHaGia
X-Proofpoint-ORIG-GUID: MEPFDJpkBQEM_pGq8nSueuj3u0XHaGia
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_12:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140132
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/13/2021 5:42 PM, Klaus Heinrich Kiwi wrote:
> 
> 
> On 4/13/2021 5:07 AM, Joel Stanley wrote:
>> SHA512 will be used by the openbmc secure boot implementation when
>> verifying FIT images of both u-boot proper and the kernel.
>>
>> The hash command is useful, and adds only a small amount of binary size
>> given the algorithms are already included in the image.
>>
>> Using hardware acceleration instead of a software implementation saves a
>> significant amount of binary size (approx. 12KB for the SPL).
>>
>> Note that the hardware implementation is only useful when booting from a
>> payload in memory, as is the case with MMC or network boot. It cannot be
>> used when booting from SPI NOR.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
>> ---
>>   configs/ast2600_openbmc_spl_emmc_defconfig | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
>> index e59d3595ebf0..05069084cbc5 100644
>> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
>> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
>> @@ -36,6 +36,7 @@ CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
>>   CONFIG_ARMV7_PSCI_NR_CPUS=2
>>   CONFIG_NR_DRAM_BANKS=1
>>   CONFIG_FIT=y
>> +CONFIG_FIT_ENABLE_SHA512_SUPPORT=y
>>   CONFIG_FIT_SIGNATURE=y
>>   CONFIG_SPL_FIT_SIGNATURE=y
>>   CONFIG_SPL_LOAD_FIT=y
>> @@ -53,6 +54,8 @@ CONFIG_SPL_STACK_R=y
>>   CONFIG_SPL_SEPARATE_BSS=y
>>   CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
>>   CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x80
>> +CONFIG_SPL_SHA256_SUPPORT=y
>> +CONFIG_SPL_SHA512_SUPPORT=y
>>   CONFIG_SPL_FIT_IMAGE_TINY=y
>>   CONFIG_SPL_DM_RESET=y
>>   CONFIG_SPL_RAM_SUPPORT=y
>> @@ -80,6 +83,7 @@ CONFIG_CMD_DHCP=y
>>   CONFIG_CMD_MII=y
>>   CONFIG_CMD_PING=y
>>   CONFIG_CMD_NCSI=y
>> +CONFIG_CMD_HASH=y
>>   CONFIG_CMD_EXT2=y
>>   CONFIG_CMD_EXT4=y
>>   CONFIG_CMD_EXT4_WRITE=y
>> @@ -97,6 +101,7 @@ CONFIG_SYSCON=y
>>   CONFIG_SPL_OF_TRANSLATE=y
>>   CONFIG_CLK=y
>>   CONFIG_SPL_CLK=y
>> +CONFIG_ASPEED_HACE=y
>>   CONFIG_DM_GPIO=y
>>   CONFIG_ASPEED_GPIO=y
>>   CONFIG_DM_I2C=y
>> @@ -135,4 +140,6 @@ CONFIG_USE_TINY_PRINTF=y
>>   CONFIG_SPL_TINY_MEMSET=y
>>   CONFIG_TPM=y
>>   CONFIG_SPL_TPM=y
>> +CONFIG_SHA_HW_ACCEL=y
>> +CONFIG_SHA_PROG_HW_ACCEL=y

Doesn't invalidate my reviewed-by-tag, but I just noted that these are redundant
due to CONFIG_ASPEED_HACE=y.

But I'm fine if you want yo keep them explicit as well.

  -Klaus

>>   # CONFIG_EFI_LOADER is not set
>>
> 

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
