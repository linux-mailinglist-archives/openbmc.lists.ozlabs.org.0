Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06731261377
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 17:27:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm8DD1lC7zDqSR
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 01:27:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X3DNziOn; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm8Bw2yxgzDqLq
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 01:26:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088FP1o1061581
 for <openbmc@lists.ozlabs.org>; Tue, 8 Sep 2020 11:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oKHiz/OAHu2/9mWKfwPzFegnMyTvlnZL/jLnHemPStg=;
 b=X3DNziOnU03mtbB+DA9xtCzCLmya6mtjUb5SM+4yGxbjWoWb9nBrvI7RT5SUq6FZzhOR
 +FjYgiZhNH0Y49cwT2CNjk8/N9Vc2+CoSoebuZ9F0VwQeR4NH5cZowHBDYwCVxe4hquA
 HN3/MBHwZfw4mOuX5ABQa8UwrJot9WHK7YOmegGUUEogjm1f+/lEY6Wp47xIGZcYcfcP
 2UEuLA43b/y22+bUJo75+yoqt3+/kkmP+BIgF1f1ltBptZXU816oPx7JFcb/vmToVyI4
 zRAULmjCvqs+1JvnS4nVAyVi2HooW6T2eOeZWMXVlBxc9OGLqX5qvicPWd59aNCRCYVv zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ecjur1n6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2020 11:26:42 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 088FP9An061918
 for <openbmc@lists.ozlabs.org>; Tue, 8 Sep 2020 11:26:42 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ecjur1mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 11:26:41 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088FNEh1013093;
 Tue, 8 Sep 2020 15:26:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 33c2a8a6bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 15:26:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088FQbeE34537764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 15:26:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBA8F11C052;
 Tue,  8 Sep 2020 15:26:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31CD711C04A;
 Tue,  8 Sep 2020 15:26:37 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.228.150])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Sep 2020 15:26:36 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
Date: Tue, 8 Sep 2020 20:56:36 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_07:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080138
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

On 08/09/20 12:39 am, Kun Zhao wrote:
> 
> On 9/5/20 5:49 AM, Deepak Kodihalli wrote:
>> Hi Kun,
>>
>> On 05/09/20 5:32 am, Kun Zhao wrote:
>>> Hi Team,
>>>
>>> My platform is based on ast2500, and I’ve already been able to built out the ubi image. But when I tried to test it with qemu, it just stopped at u-boot because ‘can’t get kernel image,
>>>
>>> qemu-system-arm: Aspeed iBT has no chardev backend
>>>
>>> U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)
>>>
>>>          Watchdog enabled
>>>
>>> DRAM:  496 MiB
>>>
>>> Flash: 32 MiB
>>>
>>> *** Warning - bad CRC, using default environment
>>>
>>> In:    serial
>>>
>>> Out:   serial
>>>
>>> Err:   serial
>>>
>>> Net:   MAC0 : RGMII
>>>
>>> MAC1 : RGMII
>>>
>>> FTGMAC100#0
>>>
>>> Error: FTGMAC100#0 address not set.
>>>
>>> , FTGMAC100#1
>>>
>>> Error: FTGMAC100#1 address not set.
>>>
>>> Hit any key to stop autoboot:  0
>>>
>>> Wrong Image Format for bootm command
>>>
>>> ERROR: can't get kernel image!
>>>
>>> ast#
>>>
>>> And I found the bootargs is not right,
>>>
>>> ast# print
>>>
>>> baudrate=115200
>>>
>>> bootargs=console=ttyS4,115200n8 root=/dev/ram rw
>>>
>>> bootcmd=bootm 20080000
>>>
>>> bootdelay=2
>>>
>>> Checked in the build folder for tmp/work/myplatform-openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ and found the none of the following patches are there,
>>>
>>> 0002-config-ast-common-hack-bootopts.patch
>>>
>>> 0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
>>>
>>> 0004-config-ast-common-Add-conditional-factory-reset-comm.patch
>>>
>>> 0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch
>>>
>>> I think that’s why the bootargs is not correct.
>>>
>>> This is the details of how I enabled the ubi support in my platform recipes,
>>>
>>> 1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
>>>
>>> require conf/distro/include/phosphor-base.inc
>>>
>>> require conf/distro/include/phosphor-ubi.inc
>>
>> You should just need the one line above, plus a device tree change for your system. The default openbmc-flash-layout.dtsi doesn't make a ubifs partition. You can for eg look at witherspoon's dts, which uses ubifs.
> Hi Deepak, thank you for reply. I've tried to use the witherspoon's flash layout per your tips here. But it still stops at u-boot with "can't get kernel image!" error. Do I need to enable any kernel config options?


Hi Kun, I don't think you need additional kernel config updates. I 
suspect something wrong with the way the image is built. Are you able to 
see expected values for the u-boot environment variables and MTD 
partitions? For eg:

ast# mtdparts
device nor0 <bmc>, # parts = 3
  #: name		size		offset		mask_flags
  0: u-boot              0x00060000	0x00000000	0
  1: u-boot-env          0x00020000	0x00060000	0
  2: obmc-ubi            0x01f80000	0x00080000	0
active partition: nor0,0 - (u-boot) 0x00060000 @ 0x00000000


>> Does anyone know why the default is static partitions, and not ubifs?
>>
>> Regards,
>> Deepak
>>
>>> 2. In meta-myplatform/conf/machine/myplatform.conf, I added,
>>>
>>> IMAGE_FSTYPES += " mtd-ubi mtd-ubi-tar"
>>>
>>> OBMC_MACHINE_FEATURES += " obmc-ubi-fs"
>>>
>>> Do I miss anything?
>>>
>>> Thanks.
>>>
>>> Best regards,
>>>
>>> Kun Zhao
>>>
>>> /*
>>>
>>> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>>>
>>> */
>>>
>>
> Kun
> 

