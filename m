Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7D4FCF30
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 07:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcw6951Nmz3bZX
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 15:59:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kcw5v5511z2xZp
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 15:59:10 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=2; SR=0; TI=SMTPD_---0V9tSQ9h_1649743131; 
Received: from 30.225.140.31(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V9tSQ9h_1649743131) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 12 Apr 2022 13:58:52 +0800
Message-ID: <090d3636-b796-3737-7814-eaf5c3486619@linux.alibaba.com>
Date: Tue, 12 Apr 2022 13:58:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: boot failure when read-write fs is full
Content-Language: en-US
To: Rohit Pai <ropai@nvidia.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <LV2PR12MB6014F744D07F3385DC934A38CDEA9@LV2PR12MB6014.namprd12.prod.outlook.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <LV2PR12MB6014F744D07F3385DC934A38CDEA9@LV2PR12MB6014.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Rohit,

We also got similar issue, and it should be directly caused by the 
failure of "mkdir -p $upper $work" in obmc-init.sh. Our work around is 
done by below patch, i.e. avoid to remove the directory 
/run/initramfs/rw/work and recreate it, but only removing its contents.

This may cause rwfs to become read only when it is full, but it won't 
trigger kernel panic and we still have chance to repair it. We are 
planing to send a patch to OBMC gerrit, but not yet.

diff --git 
a/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh 
b/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh
index e61ede9111..d4425b56b1 100644
--- a/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh
+++ b/meta-phosphor/recipes-phosphor/initrdscripts/files/obmc-init.sh
@@ -411,7 +411,15 @@ HERE
         debug_takeover "$msg"
  fi

-rm -rf $work
+# Empty workdir; do not remove workdir itself for it will fail to 
recreate it if
+# RWFS is full
+if [ -d $work ]
+then
+    cd $work
+    ls -a | grep -v -E '^\.$|^\.\.$' | xargs rm -rf
+    cd -
+fi
+
  mkdir -p $upper $work

  mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow 
/root

Heyi


在 2022/4/12 上午1:51, Rohit Pai 写道:
> Hello All,
>
> Currently I am investigating the bootup failures which I see on our 0penBmc based boards when the rw-fs is full.
> The rw-fs can become full because of many reasons. One example being too frequent bmc dump creation which are stored in rw-fs.
>
> I have allocated 16MB for the read-write fs and part of the init sequence there is overlay file system which is being mounted as the root-fs which combines the ro-fs and the rw-fs.
>
>
> mount<https://grok.openbmc.org/s?defs=mount&project=openbmc> -t overlay<https://grok.openbmc.org/s?defs=overlay&project=openbmc> -o lowerdir<https://grok.openbmc.org/s?defs=lowerdir&project=openbmc>=$rodir<https://grok.openbmc.org/s?defs=%24rodir&project=openbmc>,upperdir<https://grok.openbmc.org/s?defs=upperdir&project=openbmc>=$upper<https://grok.openbmc.org/s?defs=%24upper&project=openbmc>,workdir<https://grok.openbmc.org/s?defs=workdir&project=openbmc>=$work<https://grok.openbmc.org/s?defs=%24work&project=openbmc> cow<https://grok.openbmc.org/s?defs=cow&project=openbmc> /root<https://grok.openbmc.org/s?defs=root&project=openbmc>
>
> Above 'mount overlay' command fails with the below error when the upperdir which the rw-fs is full.
>
>
> chroot: can't execute '/bin/sh': No such file or directory
>
> Unable to confirm /sbin/init is an executable non-empty file
>
> in merged file system mounted at /root.
>
> Change Root test failed!
>
> Fatal error, triggering kernel panic!
>
> Basically, when the 'overlayfs' fails there is no rootfs mounted on the /. So, I am thinking the subsequent init sequence fails.
>
> I am very much interested in knowing if anyone has any thoughts on solving this issue or has encountered and already found some existing solutions.
> One solution which is in my mind is to capture the failure of mount overlay command and do a self-clean-up procedure on the rw-fs with a white-list policy.
> Thanks for any kind input.
>
> Regards,
> Rohit PAI
>
>
>
>
