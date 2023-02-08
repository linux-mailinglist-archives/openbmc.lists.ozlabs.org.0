Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83668F1E3
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 16:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBkGh5yL3z3cfW
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 02:21:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VNI38ff4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VNI38ff4;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBkG45qgWz3bVJ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 02:20:28 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318FChww018381
	for <openbmc@lists.ozlabs.org>; Wed, 8 Feb 2023 15:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KxABd046sgiuX8/d/lUlYCp1PMkHECzqnAeD4LwhzQU=;
 b=VNI38ff4ZhhnL9W9aeEQPXVk+PxlwNdI3p/+0wW0n1kPLpj6M7DkPn6G+wwj4YzFjm2u
 3kP9CF2I/hcHJ6Sq7ZyU8EI+d+hPlhnVKquVmwp0cxJVvRURGzF8If+UnRIb3L/bClz8
 +FQTbJOqNuoGfRe++I/VOfncO0K16Q0yo78anCPX+qKi1aR3Pg9pKNNsDX0weUv+bYzR
 GFYXzTbLuFlUkicRw0910uCARXgpFXxpuMtQTwNrXTvCrlBxvKvU5DrPouOhZkdH3vx2
 V2CAcmrRvzLqCpKCpszD4Fx4rS2TGm2cJmcU95l8IXwYkcFD8yOfbzt8OJ9x0z4Ph3TX kg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmd6dt0gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2023 15:20:23 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318F3rTH019698
	for <openbmc@lists.ozlabs.org>; Wed, 8 Feb 2023 15:20:23 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nhf083cjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2023 15:20:23 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318FKL3Z64881122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 8 Feb 2023 15:20:22 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E25475805D
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 15:20:21 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7C9A5804C
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 15:20:21 +0000 (GMT)
Received: from [9.163.39.56] (unknown [9.163.39.56])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2023 15:20:21 +0000 (GMT)
Message-ID: <32fc8e6d-d2e0-5ea4-c486-1939221de823@linux.vnet.ibm.com>
Date: Wed, 8 Feb 2023 09:20:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Subject: Re: rainier-bmc machine dumping core with latest qemu
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
 <cd819d6d-1470-870d-c5b7-abced224e68d@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <cd819d6d-1470-870d-c5b7-abced224e68d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g8enMn7_x0WOq7M8PYKXXSzj1DtHkNkt
X-Proofpoint-ORIG-GUID: g8enMn7_x0WOq7M8PYKXXSzj1DtHkNkt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080133
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

Hi Cedric

On 2/8/23 8:58 AM, Cédric Le Goater wrote:
> Hello Ninad,
>
> On 2/8/23 15:26, Ninad Palsule wrote:
>> Hello,
>>
>> I am hitting core dump while running qemu with rainier-bmc machine. I 
>> started
>> hitting it after I rebased to latest qemu from master.
>> Can someone please help?
>>
>> /home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
>>    -kernel 
>> ./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
>>    -dtb 
>> ./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb 
>> \
>>    -initrd 
>> ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
>>    -drive 
>> file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 
>> \
>>    -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'
>
> Rainier systems usually boot from eMMC Are you using mainline QEMU or
> a branch with eMMC support ?

I am using QEMU from the mainline with upstream BMC. I think eMMC is not 
supported in the mainline yet.


>
>
> C.
>
>>
>>
>> [  OK  ] Started Journal Service.
>>           Starting Flush Journal to Persistent Storage...
>> [   45.873184] systemd-journald[156]: Received client request to 
>> flush runtime journal.
>> [   45.932231] systemd-journald[156]: File 
>> /var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal 
>> corrupted or uncleanly shut down, renaming and replacing.
>> qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43: 
>> bdrv_poll_co: Assertion `qemu_get_current_aio_context() == 
>> qemu_get_aio_context()' failed.
>>
>> Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
>> [Switching to Thread 0x7ffff6896640 (LWP 3898452)]
>> __pthread_kill_implementation (no_tid=0, signo=6, 
>> threadid=140737329587776) at ./nptl/pthread_kill.c:44
>> 44  ./nptl/pthread_kill.c: No such file or directory.
>>
>>
>> #6  0x00007ffff77e8e96 in __GI___assert_fail
>>      (assertion=assertion@entry=0x55555603e798 
>> "qemu_get_current_aio_context() ==
>> qemu_get_aio_context()", file=file@entry=0x5555560aef28 
>> "/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43, 
>> function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9> 
>> "bdrv_poll_co") at ./assert/assert.c:101
>> #7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at 
>> /home/abc/dev/qemu/block/block-gen.h:43
>> #8  bdrv_poll_co (s=0x7ffff68957f0) at 
>> /home/abc/dev/qemu/block/block-gen.h:38
>> #9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
>> #10 0x0000555555e3558e in handle_aiocb_write_zeroes 
>> (opaque=0x7fff419965f0) at ../block/file-posix.c:1741
>> #11 0x0000555555ef80fd in worker_thread 
>> (opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
>> #12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at 
>> ../util/qemu-thread-posix.c:505
>> #13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at 
>> ./nptl/pthread_create.c:442
>> #14 0x00007ffff78d5a00 in clone3 () at 
>> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
>>
>> (gdb) p qemu_aio_context
>> $1 = (AioContext *) 0x5555568b13d0
>>
>> ---------------------------------------
>>
>>
>> Reproduction steps:
>>
>> 1. Clone and build qemu from https://github.com/qemu/qemu
>> 2. Download following eBMC images
>>
>> BLD_VERSION=20230205025034
>> LINUX_VERSION="6.0.19+git0+67c9407e1f"
>> wget 
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz
>>
>> wget 
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb
>>
>> wget 
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin
>>
>> wget 
>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
>> qemu-img resize 
>> obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G
>>
>> 3. Run the qemu command as show at the start
>>
>>
>>
>
