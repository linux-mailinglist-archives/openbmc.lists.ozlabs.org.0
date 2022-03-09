Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7C64D261B
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 02:59:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCwP505xYz3bVC
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 12:59:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4NxnHUyQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4NxnHUyQ; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCwNc5tnMz2yLg
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 12:59:09 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id k2so1258696oia.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2022 17:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgbeCWvvhDFNSJz7pSOa/xx4S5sRsVJG1ttrlmomaGc=;
 b=4NxnHUyQT8i87q54boMbER6fBeFJ4Jd2Wm5YqFYYJpCTrCEUiBHNgmEAH76vWheq7I
 /hNpZxuudKM7OAHpG+RS9u6+kDkfF+kQz/eDuRhnFyT6hlFtCOKbqSL09sI8p2f5dqUj
 DTp5Jix5rVwcz9+VDfxqo91sZHm61gYbr8oWDUstXN4MAS2m6Zgzl7Woozz6FnLesKxA
 L7upFiHSATiHZPpFnXX6w0pIYLvwzOyg+3uQIiALMafjpwd6J0dm0XhE8We721m59XSn
 TxgaEqciHU1Z+83YGLnoYWkAKGUdMadkB/DofQbTEkOte5fsvA4AmxujHY8dy/A5K6A9
 /eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgbeCWvvhDFNSJz7pSOa/xx4S5sRsVJG1ttrlmomaGc=;
 b=mMXrUoXyGyEgyKUcWbb6TQ+fUbgYcirwXlCDRyk1X/sWH4Ybjv21LqdwYZH6r8/ICI
 V1gy9wR/E1Spr8vdjPXU8RaxNrAaknTdQvdKEemiQ+MUr3bwDf8fjEGbNfo/EEwcs+4p
 kl0UTqxuK883xFHzG4AvLoA05m9tLFd9bt2EF0Yi2FZ2xRBSburXzW2jI85Idjh8ymgX
 jXnDSGJZ/7vlACXfnWkVihZPfaspnXWjJ/tNfU7p3pYOF3c5bslFtiKrEXR2Uxw+6eRf
 Hiw5L89ZddUufMg/3ww5RcMwWcEo9jRv3dheZ3EXUBoESGVzcjJs9AwWXxNNcqf8NYuj
 GewQ==
X-Gm-Message-State: AOAM533rVTL0RkmAtKWZp8xiPpGoiC2KnL7ua9xVaA3bMzPRHRnyzyAp
 6HpY6TyqWBYYTfxjfm1QFTGPA8NqzxQJHiEMEtfJZw==
X-Google-Smtp-Source: ABdhPJxknC0cijyK49gYVSXJBOedwn228zdxt898cMP5YawCxmO3O/E405Nm70xZmiYJJu9hR0BJPLYf9r4GubVEVuo=
X-Received: by 2002:a05:6808:19a3:b0:2d4:522a:3188 with SMTP id
 bj35-20020a05680819a300b002d4522a3188mr4576179oib.8.1646791148621; Tue, 08
 Mar 2022 17:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
 <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
 <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
 <CAGm54UHUC_7W9xGT49Ge3oO8Xf4-gDiq3Buvm-_D9K+3QX8M3w@mail.gmail.com>
 <b6fb257d-0fdd-bdf0-a18b-cb8f1db25195@kaod.org>
 <CAGm54UHZGhaBYqpaquaqGMFH16d1JqSt=PGnXhsd8TCD8-B92w@mail.gmail.com>
 <6be0165e-2a1a-4399-4c7a-b2c15b02681f@kaod.org>
In-Reply-To: <6be0165e-2a1a-4399-4c7a-b2c15b02681f@kaod.org>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 9 Mar 2022 09:58:57 +0800
Message-ID: <CAGm54UHibLN2H01+d39R=cw7q-7KtgFwp6Ebud-52LfF+Uez6g@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> >>>>
> >>>> I don't see why. Is that the same kernel version and config ?
> >>>>
> >>>> May be check the allocations in
> >>>>
> >>>>      /proc/vmallocinfo
> >>>
> >>> It shows a large area as below:
> >>>
> >>>    0xc1d30472-0x406b4a0c 268439552 __devm_ioremap_resource+0x178/0x1f0
> >>> phys=0x20000000 ioremap
> >>
> >> Is CONFIG_VMSPLIT_2G set ?
> >
> > Yes, it's enabled in aspeed-g6/defconfig
>
> The OpenBMC tree only has a aspeed_g5_defconfig.

It does have aspeed-g6/defconfig and CONFIG_VMSPLIT_2G is enabled:
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-kernel/linux/linux-aspeed/aspeed-g6/defconfig#L33

>
> How much RAM do you have ? Could check the totals in meminfo ?

Our system (and QEMU model) has 2GiB.

Boot with `vmalloc=500M`:
# cat /proc/meminfo
MemTotal:        1984880 kB
MemFree:         1860700 kB
MemAvailable:    1882116 kB
Buffers:               0 kB
Cached:            63796 kB
SwapCached:            0 kB
Active:            13728 kB
Inactive:          71988 kB
Active(anon):        340 kB
Inactive(anon):    37012 kB
Active(file):      13388 kB
Inactive(file):    34976 kB
Unevictable:        3624 kB
Mlocked:               0 kB
HighTotal:        446464 kB
HighFree:         353148 kB
LowTotal:        1538416 kB
LowFree:         1507552 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:         25600 kB
Mapped:            40356 kB
Shmem:             11804 kB
KReclaimable:       7712 kB
Slab:              17944 kB
SReclaimable:       7712 kB
SUnreclaim:        10232 kB
KernelStack:         872 kB
PageTables:         2080 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:      992440 kB
Committed_AS:     105768 kB
VmallocTotal:     516096 kB
VmallocUsed:        2436 kB
VmallocChunk:          0 kB
Percpu:              232 kB
CmaTotal:          65536 kB
CmaFree:           65052 kB
