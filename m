Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA8328E1E
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 20:25:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq9G60sz4z3cQX
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 06:25:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kAt27xZk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kAt27xZk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq9Fr651sz3cGn
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 06:25:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121JDgAl065574; Mon, 1 Mar 2021 14:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=SuA/pl1cxt6H/MH/EP34XaziQMAX0qWhxOmtulk8K/U=;
 b=kAt27xZk8SXlo3NutphiUmKtrGsM1ENGzz+yORxsf9CFLo6YCtgh6XvFSUaMnlTS170u
 87chdJg5Twx4mQuBx2kgiIq3lvgnT+a5WXfNrhMXrPGZPAOjX/+yMcmaFOko8l8pfiXB
 HWG4+OdzXF9pna1R1/dtLHtYHZwl2nXgfy8DWWZdq0e6CTqBiwavL7Tp5sO4QZv7C1W4
 3pGyTQh9Cb/K83PchjZhC0A62nPV61foaxScvwfVBIRkbChjgot5ZEP4Q7DVosVBkxe/
 IIfyMSu/2H8cckafig/RHTmsgNn5wszChzmX00q0wfArJlR6J5jTPxY8jvYgCdOoTWBV hA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3714xm2gby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 14:25:07 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 121JMNkG031511;
 Mon, 1 Mar 2021 19:25:06 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 36ydq8wu0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 19:25:06 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 121JP5Pw29950338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Mar 2021 19:25:05 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F378112065;
 Mon,  1 Mar 2021 19:25:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAC9C112063;
 Mon,  1 Mar 2021 19:25:04 +0000 (GMT)
Received: from [9.85.157.151] (unknown [9.85.157.151])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Mar 2021 19:25:04 +0000 (GMT)
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Subject: (Aspeed2600) Booting with a SPL loading U-boot fitImage
Message-ID: <c893e22c-f552-afb7-d8c7-f75b15e7d2f8@linux.vnet.ibm.com>
Date: Mon, 1 Mar 2021 16:25:03 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_13:2021-03-01,
 2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103010151
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

Has anyone been able to successfully bring-up U-boot proper as a fitImage from the SPL, when using U-boot from the 2019.4 Aspeed SDK?

The current configuration for Rainier (ast2600_openbmc_spl_emmc_defconfig) has, among other things, CONFIG_SPL_LOAD_FIT=y which at the end of the build process should produce a spl/u-boot-spl.bin file (which is really the concatenation of u-boot-spl-nodtb.bin + u-boot-spl.dtb) and a u-boot.img file, which is a FIT image created with 'mkimage -f auto -A arm -T firmware -C none -O u-boot -a 0x10000 -e 0 -n "U-Boot 2019.04"" for evb_ast2600a1 board" -E  -d u-boot-nodtb.bin u-boot.img'

I tried loading this pair using qemu-system-arm (Aspeed 6.0 branch from Cedric Legoater), the SPL loads but fails to load the U-boot fit Image apparently:

----
$ dd of=mmc-image.img if=/dev/zero bs=1M count=128
$ dd of=mmc-image.img if=../uboot-build/spl/u-boot-spl.bin conv=notrunc
   54454 bytes (54 kB, 53 KiB) copied
$ dd of=mmc-image.img if=../uboot-build/u-boot.img conv=notrunc bs=1K seek=64
   429640 bytes (430 kB, 420 KiB) copied
$ xzdec tmp/deploy/images/rainier/obmc-phosphor-image-rainier.wic.xz | dd of=mmc-image.img conv=notrunc bs=1M seek=2
$ truncate --size 16G mmc-image.img
$ qemu-system-arm -M rainier-bmc -nographic -drive file=mmc-image.img,if=sd,format=raw,id=sd0,index=2 -nodefaults -serial mon:stdio
<..snip..>
aspeed_sdhci_probe: CLK 200000000
ofnode_read_u32: bus-width: x (4)
ofnode_read_u32: sdhci-drive-type: x (1)
clock is disabled (0Hz)
clock is enabled (400000Hz)
clock is enabled (25000000Hz)
blk_find_device: if_type=6, devnum=0: emmc_slot0@100.blk, 6, 0
Jumping to U-Boot
SPL malloc() used 0xf4 bytes (0 KB)
loaded - jumping to U-Boot...
image entry point: 0x81000000
-----

At this point it just sits there with no progress..

Another interesting point here is that if I use a legacy uboot image (the concatenation of u-boot-nodtb.bin + u-boot.dtb), I can bring-up u-boot proper and it will work just fine, even if the same defconfig has '# CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set'

----
clock is enabled (25000000Hz)
blk_find_device: if_type=6, devnum=0: emmc_slot0@100.blk, 6, 0
Jumping to U-Boot
SPL malloc() used 0xf4 bytes (0 KB)
loaded - jumping to U-Boot...
image entry point: 0x81000000


U-Boot 2019.04 (Feb 27 2021 - 15:21:29 +0000)

SOC: AST2600-A1
eSPI Mode: SIO:Enable : SuperIO-2e
Eth: MAC0: RMII/NCSI, MAC1: RMII/NCSI, MAC2: RMII/NCSI, MAC3: RMII/NCSI
Model: Rainier
DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:64 MiB), ECC off
MMC:   emmc_slot0@100: 0
Loading Environment from MMC... OK
In:    serial@1e784000
Out:   serial@1e784000
Err:   serial@1e784000
Model: Rainier
Net:   No MDIO found.
ftgmac100_probe - NCSI detected
----

That probably explains why we have been able to boot the rainier OpenBMC image (even if u-boot is configured to use SPL + U-Boot FIT, the kernel-fitimage.bbclass creates a "new" u-boot image by concatenating the aforementioned binaries).

I tried a few different settings for the .config and also tried debugging the SPL, but it's a very constrained environment and at this point I'm a bit out of ideas.

So has anyone been able to make this work?




-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
