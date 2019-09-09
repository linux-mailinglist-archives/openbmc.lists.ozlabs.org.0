Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C7BADE01
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 19:26:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rw773rFRzDqR1
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 03:26:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mBhCYX9Q"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rw6X2Zw1zDqLW
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:25:40 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f19so6809854plr.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5i0qbXNq/LE50tD4YNE1rL1HbHdbUiDtG/iqju0AAEg=;
 b=mBhCYX9QjCVEmIPwIwwjcQDo2S8Y1tSKzO4PiCWhN0vjO7Aj4cGzlB4tiKt/RlnSMA
 yeLExYYTo1pmyp22qC0moiqxVV9Mza8U8Klajad0C34KdxJy8XBotWTb7kKIj0rMomSj
 PUiY6/bx9j9K1em4LOeTtg/Fm0KFxM2wd3iti236YEwhfXmKE2xZN0UEsRZp3FH/iN1+
 WLRhdVrfIhnnBSGMu7kR1pxph2gEJiRKk6MLgUz0vQoPlqxnOggUbsgMFk7h3xZ4KZ8m
 Joj+62vLRY8E7767ELtEEietMnQM60R3NbLJ0EOcGUrRLncYc9rMpu8FdDDXIy1/PVGp
 CG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5i0qbXNq/LE50tD4YNE1rL1HbHdbUiDtG/iqju0AAEg=;
 b=EVpZedXyFFyfaBZq0DJz2oe8I5ArEj8BQd+mKGAG1UNZfU1jHygec2cdV3eU69Z9LI
 XZ7xTPA4PxfHfOsPJpozk7gpVbIXE60iaStl2OLTviX+VX51sWYeT561QNl73+t1kWXe
 NEKlnavj/8avD9K0SQQ3pNG9kMxwCiM7BBHQLChGLfrFJFFWM3C85QCy+g2Dz83BTfAb
 mbmdc3XzwLwPGV19ssbCrYw6Ff5zgYWwMI+CYEKTbPTwie5oW4OaNUqw2g1h09XgX/RD
 bajYtsRBR9cbCYBNOyBai5o/tr/sbZlQUSHQcYlZHt5cqGc/VkyhIIVMOoSLXeJ/mUF4
 WJQQ==
X-Gm-Message-State: APjAAAXG/9dI1lc1L+Uut9aOjJmre1INrqo8Vr7BTF0Yi/x0FlKKPuPS
 BkGJnG4q58IVOakoCdrpTdSOREFKgUugxjSd8FgCBqN4Y40=
X-Google-Smtp-Source: APXvYqwQC9TjopEHW753skb8mO0KD3LTind/gyRVbOogFtesjlFo/arHQSNuBNdDQaFL5gc/TrM7BgTh4g/+hnDpA1M=
X-Received: by 2002:a17:902:7296:: with SMTP id
 d22mr25151753pll.179.1568049936234; 
 Mon, 09 Sep 2019 10:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <907F7F17-6EC3-4F83-A2E4-3BBE764C72DD@fuzziesquirrel.com>
 <b6be6eda-703f-7daf-b0ee-e8ed5f778645@linux.intel.com>
 <CADKL2t6wCkJiZW+fy_UJeaYYR=Pb6-6wNFsX9Z5rU1ZoLkCYxA@mail.gmail.com>
In-Reply-To: <CADKL2t6wCkJiZW+fy_UJeaYYR=Pb6-6wNFsX9Z5rU1ZoLkCYxA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 10:25:25 -0700
Message-ID: <CAO=notwjCDRvd87S+UXRkhNAzpRb+raJYuv+G_adKQzJDWckvg@mail.gmail.com>
Subject: Re: phosphor-pid-control build failure with yocto head
To: Benjamin Fair <benjaminfair@google.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 3, 2019 at 9:40 PM Benjamin Fair <benjaminfair@google.com> wrote:
>
> On Tue, Sep 3, 2019 at 5:28 PM James Feist <james.feist@linux.intel.com> wrote:
> >
> > On 9/2/2019 1:15 AM, Brad Bishop wrote:
> > > Hi James, Patrick
> > >
> > > Updating our poky subtree to master HEAD exposes a build failure in
> > > phosphor-pid-control.
> >
> > Here's the bug, I've seen this before, it seems random when it happens
> > and changing a few lines can make it go away. Something to do with lto...
> >
> > main.o swampd-util.o  ./.libs/libswampd.a -lstdc++fs -lphosphor_logging
> > -lsdbusplus -lsystemd -lphosphor_dbus
> > 00:59:59 | lto1: internal compiler error: in add_symbol_to_partition_1,
> > at lto/lto-partition.c:154
> > 00:59:59 | Please submit a full bug report,
> > 00:59:59 | with preprocessed source if appropriate.
> > 00:59:59 | See <https://gcc.gnu.org/bugs/> for instructions.
> > 00:59:59 | lto-wrapper: fatal error: arm-openbmc-linux-gnueabi-g++
> > returned 1 exit status
> > 00:59:59 | compilation terminated.
> > 00:59:59 |
> > /tmp/openbmc/work/armv7a-openbmc-linux-gnueabi/phosphor-pid-control/0.1+gitAUTOINC+35906cc3d0-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/9.2.0/ld:
> > error: lto-wrapper failed
> > 00:59:59 | collect2: error: ld returned 1 exit status
> > 00:59:59 | Makefile:919: recipe for target 'swampd' failed
> > 00:59:59 | make[2]: *** [swampd] Error 1
> >
> > What platform is gsj? We're currently behind tip, and it'll probably
> > take me some time to catch up to be able to try anything this new.
>
> GSJ is a Quanta board with a Nuvoton NPCM7xx BMC.
>
> This could be showing up there since the CPU cores are ARMv7 unlike in Aspeed.

Will this build if we drop the lto stuff?  I have seen this issue
before, but I cannot recall the solution... but it did go-away at some
point.  So, I'm confident it can be addressed.  I'm going to try
building without lto and see if it's happy.

>
> >
> > >
> > > GCC is asking for a bug to be opened.  Could find someone to have a look
> > > at this so we can continue to pick up poky changes?
> > >
> > > If you would like an openbmc tree to pull give this a try:
> > >
> > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/24783
> > >
> > > thx - brad
