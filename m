Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1697B26FE16
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 15:19:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtDvZ4LWHzDqkX
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 23:19:38 +1000 (AEST)
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
 header.s=pp1 header.b=HSNE71qM; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtDcp1x4MzDqCG
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 23:06:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08ID4Q7T156989
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 09:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VKyIaDba/+RhBznr1Kebysu28n9OuSPt60wK+mHHb9k=;
 b=HSNE71qMidx2/ujUouHiSLScF6pgtAqRfsGEj5Nl+mLXF36BDI7YaAbmlrtEdt5UMboV
 Wo+j78iC2rLav9xb1XTht7cbXfjYiW+adrvGWOwvpqNIuGrB3X1EdUPjRbiH36FvuRvu
 viiiAYoW001Zt/LJWDNn9AIPzMSKVMxK4vQD26DVjfv+lWTJQKR4lyZ6tTrwW90ThPc9
 GoVL7TYMN9v/3PmfEUTjwt5oINZBQ4N5/XP3dscYcRDFqpkTSiF0jSAVF/csmJkOgNIL
 VCcw7XjSoJwvsefdqW7w16j0AmZAS6CzCZA+LY3sWwuPzrPAd7mHwzsJfyFj/4sK2ZTy ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mvq3sbdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 09:06:45 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08ID4vWC158073
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 09:06:45 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33mvq3sbd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 09:06:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08ID6hED001082;
 Fri, 18 Sep 2020 13:06:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 33k6esk6f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Sep 2020 13:06:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08ID6eOT27197896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Sep 2020 13:06:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A92A24C046;
 Fri, 18 Sep 2020 13:06:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BAFA4C044;
 Fri, 18 Sep 2020 13:06:39 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.240.231])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 18 Sep 2020 13:06:39 +0000 (GMT)
Subject: Re: Enable UBI support for a platform
To: Kun Zhao <zkxz@hotmail.com>, Adriana Kobylak <anoo@linux.ibm.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
 <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
 <07d8dc67fb6a451151d77c035313c936@linux.vnet.ibm.com>
 <BYAPR14MB234246D31202193B89B1E713DC3F0@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <1cdecd8a-4382-45ad-7932-a604001d7ed8@linux.vnet.ibm.com>
Date: Fri, 18 Sep 2020 18:36:38 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB234246D31202193B89B1E713DC3F0@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_14:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009180105
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/09/20 12:07 pm, Kun Zhao wrote:
> Hi Adriana, Deepak,
> 
> 
> On 9/16/20 1:05 PM, Adriana Kobylak wrote:
>>
>>>> |
>>>> . done
>>>> UBI init error 12
>>>> Error, no UBI device/partition selected!
>>>> Wrong Image Format for bootm command
>>>> ERROR: can't get kernel image!
>>>>
>>>> Any thought?
>>>
>>> Some thoughts:
>>>
>>> - Have you validated your recipe and device tree changes by trying to
>>> boot on QEMU an existing supported platform (for eg
>>> Romulus/Tiogapass)?
> 
> Hi Deepak,
> 
> I've tried qemu with romuslus/tiogapass machine type, but still has the same problem. I'm using 2.9-dev branch latest code, does it matter?

Hi Kun,

That could matter. Is there a reason you're on that branch? There are 
800+ commits to master since that branch. In general what we follow is 
"live at head" of the master branch.

Also, I was able to boot Tiogapass QEMU with the UBIFS layout with the 
following changes (I'm based off of the latest master) :

diff --git a/meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf 
b/meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf
index 1e6ee08..6b2bf83 100644
--- a/meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf
+++ b/meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf
@@ -1,3 +1,5 @@
+require conf/distro/include/phosphor-ubi.inc
+
  KMACHINE = "aspeed"
  KERNEL_DEVICETREE = "${KMACHINE}-bmc-facebook-${MACHINE}.dtb"

diff --git 
a/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed/tp_ubi.patch 
b/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed/tp_ubi.patch
new file mode 100644
index 0000000..b31bdaa
--- /dev/null
+++ 
b/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed/tp_ubi.patch
@@ -0,0 +1,30 @@
+diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts 
b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+index 2d44d9a..e4183fd 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+@@ -57,7 +57,24 @@
+       flash@0 {
+               status = "okay";
+               m25p,fast-read;
+-#include "openbmc-flash-layout.dtsi"
++
++                partitions {
++                        #address-cells = < 1 >;
++                        #size-cells = < 1 >;
++                        compatible = "fixed-partitions";
++                        u-boot@0 {
++                                reg = < 0 0x60000 >;
++                                label = "u-boot";
++                        };
++                        u-boot-env@60000 {
++                                reg = < 0x60000 0x20000 >;
++                                label = "u-boot-env";
++                        };
++                        obmc-ubi@80000 {
++                                reg = < 0x80000 0x1F80000 >;
++                                label = "obmc-ubi";
++                        };
++                };
+       };
+ };
+
diff --git 
a/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed_%.bbappend 
b/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed_%.bbappend
index 0eb0884..5b58d8b 100644
--- 
a/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed_%.bbappend
+++ 
b/meta-facebook/meta-tiogapass/recipes-kernel/linux/linux-aspeed_%.bbappend
@@ -1,2 +1,3 @@
  FILESEXTRAPATHS_prepend := "${THISDIR}/linux-aspeed:"
-SRC_URI += "file://tiogapass.cfg"
+SRC_URI += "file://tiogapass.cfg \
+            file://tp_ubi.patch



And then on QEMU :

root@tiogapass:~# ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:57
Present UBI devices:            ubi0

ubi0
Volumes count:                           3
Logical eraseblock size:                 65408 bytes, 63.8 KiB
Total amount of logical eraseblocks:     504 (32965632 bytes, 31.4 MiB)
Amount of available logical eraseblocks: 56 (3662848 bytes, 3.4 MiB)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     2
Minimum input/output unit size:          1 byte
Character device major/minor:            246:0
Present volumes:                         0, 1, 2

Volume ID:   0 (on ubi0)
Type:        static
Alignment:   1
Size:        46 LEBs (3008768 bytes, 2.8 MiB)
Data bytes:  2992192 bytes (2.8 MiB)
State:       OK
Name:        kernel-e537a16b
Character device major/minor: 246:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        static
Alignment:   1
Size:        299 LEBs (19556992 bytes, 18.6 MiB)
Data bytes:  19550208 bytes (18.6 MiB)
State:       OK
Name:        rofs-e537a16b
Character device major/minor: 246:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        97 LEBs (6344576 bytes, 6.0 MiB)
State:       OK
Name:        rwfs
Character device major/minor: 246:3

Regards,
Deepak

>>>
>>> - I don't think not having the partitions for the alt side in your
>>> devicetree should be a problem, unless the BMC is actually switching
>>> to the secondary flash. 'md.l 0x1e785030 1' at the u-boot prompt can
>>> tell us the boot side.
>>>
>>> Adriana - do you have any thoughts on this problem?
>>>
>>
>> Check if you can list the ubi partitions from u-boot:
>>
>> ast# ubi part obmc-ubi
>> ast# ubi info layout
>>
>> It should print some output like this:
>>
>> Volume information dump:
>>          vol_id          0
>> ...
>>          name            kernel-3a859116
>> Volume information dump:
>>          vol_id          1
>> ...
>>          name            rofs-3a859116
>>
>>
>> Check that the kernel name on that output is "kernel-3a859116" which is the value that your kernelname variable is set to,
> 
> Hi Adriana,
> 
> Here is the output,
> 
> ast# ubi part obmc-ubi
> ubi0: attaching mtd1
> ubi0: scanning is finished
> UBI init error 12
> ast# ubi info layout
> Error, no UBI device/partition selected!
> ast# print kernelname
> kernelname=kernel-a39b2d07
> ast#
> 
> Seems ubi can't find any valid ubi partitions. What's the error 12?
> 
>> and also check that the rofs volume is in volume 1 since the root and ubiblock variables are set to (primary chip (0) volume 1 (ubiblock=0,1)).
> 
> And how to check rofs volume index?
> 
> 
> BTW, Adriana, could you also take a look at this email thread https://lists.ozlabs.org/pipermail/openbmc/2020-September/022834.html? It was why I was going to enable ubifs but I'm not sure if ubifs can solve that problem.
> 
> 
> Kun
> 

