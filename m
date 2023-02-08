Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C2468F1C0
	for <lists+openbmc@lfdr.de>; Wed,  8 Feb 2023 16:15:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBk8M4GbRz3cfJ
	for <lists+openbmc@lfdr.de>; Thu,  9 Feb 2023 02:15:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.32.125.2; helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 600 seconds by postgrey-1.36 at boromir; Thu, 09 Feb 2023 02:15:09 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBk7x33S1z3bT7
	for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2023 02:15:06 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 762462120A;
	Wed,  8 Feb 2023 14:58:10 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 8 Feb
 2023 15:58:10 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-98R002dcc80348-27c0-4bcc-b212-9329450ccf9c,
                    A22C17ADED4DD15D951BB0321C36BB078B12EEE4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <cd819d6d-1470-870d-c5b7-abced224e68d@kaod.org>
Date: Wed, 8 Feb 2023 15:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: rainier-bmc machine dumping core with latest qemu
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>, <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
References: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8bec3019-7170-4c61-8bbe-d78bffc4504a
X-Ovh-Tracer-Id: 13295189050785041190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudehuddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhevhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvjeeludetteevvedvgfefieduieegjefgtddttdejhfelheejueeffefhtdffveenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhophgvnhgsmhgtrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepnhhinhgrugeslhhinhhugidrvhhnvghtrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhjmhhssehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdhophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <jms@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Ninad,

On 2/8/23 15:26, Ninad Palsule wrote:
> Hello,
> 
> I am hitting core dump while running qemu with rainier-bmc machine. I started
> hitting it after I rebased to latest qemu from master.
> Can someone please help?
> 
> /home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
>    -kernel ./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
>    -dtb ./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb \
>    -initrd ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
>    -drive file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 \
>    -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'

Rainier systems usually boot from eMMC Are you using mainline QEMU or
a branch with eMMC support ?


C.

> 
> 
> [  OK  ] Started Journal Service.
>           Starting Flush Journal to Persistent Storage...
> [   45.873184] systemd-journald[156]: Received client request to flush runtime journal.
> [   45.932231] systemd-journald[156]: File /var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal corrupted or uncleanly shut down, renaming and replacing.
> qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43: bdrv_poll_co: Assertion `qemu_get_current_aio_context() == qemu_get_aio_context()' failed.
> 
> Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7ffff6896640 (LWP 3898452)]
> __pthread_kill_implementation (no_tid=0, signo=6, threadid=140737329587776) at ./nptl/pthread_kill.c:44
> 44  ./nptl/pthread_kill.c: No such file or directory.
> 
> 
> #6  0x00007ffff77e8e96 in __GI___assert_fail
>      (assertion=assertion@entry=0x55555603e798 "qemu_get_current_aio_context() ==
> qemu_get_aio_context()", file=file@entry=0x5555560aef28 "/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43, function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9> "bdrv_poll_co") at ./assert/assert.c:101
> #7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at /home/abc/dev/qemu/block/block-gen.h:43
> #8  bdrv_poll_co (s=0x7ffff68957f0) at /home/abc/dev/qemu/block/block-gen.h:38
> #9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
> #10 0x0000555555e3558e in handle_aiocb_write_zeroes (opaque=0x7fff419965f0) at ../block/file-posix.c:1741
> #11 0x0000555555ef80fd in worker_thread (opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
> #12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
> #13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
> #14 0x00007ffff78d5a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> (gdb) p qemu_aio_context
> $1 = (AioContext *) 0x5555568b13d0
> 
> ---------------------------------------
> 
> 
> Reproduction steps:
> 
> 1. Clone and build qemu from https://github.com/qemu/qemu
> 2. Download following eBMC images
> 
> BLD_VERSION=20230205025034
> LINUX_VERSION="6.0.19+git0+67c9407e1f"
> wget https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz
> 
> wget https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb
> 
> wget https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin
> 
> wget https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
> qemu-img resize obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G
> 
> 3. Run the qemu command as show at the start
> 
> 
> 

