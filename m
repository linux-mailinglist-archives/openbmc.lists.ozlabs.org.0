Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3347ADF71
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 21:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ryrt2sZ6zDqQh
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 05:29:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rAPVc5WC"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RyrN37JVzDqPN
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 05:28:36 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w22so9819002pfi.9
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 12:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cPOqARZ+q8lgSEArjwB8zYemXOW5G5k51qSfAePKVBI=;
 b=rAPVc5WC0kRU564rjTJsyDrNEgclETOnW0rDsEXnwuIZgjg3gxNRTcYoUxq7wI8z8r
 oS9USeu8CoL4Z5aWtnCXR4lOsP5jvC5z6lB6znx/K0LPzvFG/MvtaaV4UlAxTjThu7Cn
 VdmPvvul1vxfUj5TvrkxWdtn7BjY4ZsCbK3pSAAoUNlF+B2sxXonztnzDn92fEDpN5om
 WuvtN8sKqqA9KrHLxsXyFUi03V2GF2nbqdHOwmjjXZD5K2OwtovkmMtjhcodAL1Y0cFS
 CnebDFtiX8gtK8XazTwlXsxrmy4P1pQ942yXOYgW5OsxOvLG1nfjq+aeJLXM41wjYoda
 kP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cPOqARZ+q8lgSEArjwB8zYemXOW5G5k51qSfAePKVBI=;
 b=rIuxepRWoIGLH79JBiCqm4jL6fBimIrS6uNItwEFYjwXRAOhzeTQZ0d0/zd43FGVC8
 T6HMtP86GyVmIW9FBIVKFUSlWLsTCaR/emVBqS1pfW6jqOZDRrE/rfziHVvTUp43RC3H
 C5xbX1I3SpJLQpMYo3vhMR+vwSkQsIJlb36t6I9Wj/y4nzdMOIyoqxJ95jLdxxL9NjhY
 DWe/WbO+QjD4zHS8/o7JaICRPihvHtzTv/ln1nN7FoXzHMs8Rl2tlqdlniNDQcdjtBmR
 i2zF38AYhtZ/36qaI9jGTztyYmBD11uDFitkx3E+enqv4PwW+EupEj6q4FxPblYDysz6
 ROLA==
X-Gm-Message-State: APjAAAUvVptAl0X0tQbpFACSwiSNwuYMTZApCml1W1w5j7maryYThYv7
 f5rT6wJWbRQuIU623zKfgSUct5Ttul/2sKtV7bcbhQ==
X-Google-Smtp-Source: APXvYqzhKbaPQyOkZgLfvq3B2jIQoZQKghmc2FycWDOuOdNpG+ambNtlSlLZOGyLMaQPNzx5AoV9vlrpkAd/OyZqGM8=
X-Received: by 2002:aa7:9202:: with SMTP id 2mr29526473pfo.81.1568057313880;
 Mon, 09 Sep 2019 12:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <907F7F17-6EC3-4F83-A2E4-3BBE764C72DD@fuzziesquirrel.com>
 <b6be6eda-703f-7daf-b0ee-e8ed5f778645@linux.intel.com>
 <CADKL2t6wCkJiZW+fy_UJeaYYR=Pb6-6wNFsX9Z5rU1ZoLkCYxA@mail.gmail.com>
 <CAO=notwjCDRvd87S+UXRkhNAzpRb+raJYuv+G_adKQzJDWckvg@mail.gmail.com>
 <CAO=notyaDwCjWe5QUh3eT5QFX757t8qYrFEvea7FK_45hZ4_=w@mail.gmail.com>
In-Reply-To: <CAO=notyaDwCjWe5QUh3eT5QFX757t8qYrFEvea7FK_45hZ4_=w@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 12:28:22 -0700
Message-ID: <CAO=notxsoU=1dvDMuaQd0_iLindkLFaWyrnTxQ9q=jeQLskU2g@mail.gmail.com>
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

On Mon, Sep 9, 2019 at 12:26 PM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Sep 9, 2019 at 10:25 AM Patrick Venture <venture@google.com> wrote:
> >
> > On Tue, Sep 3, 2019 at 9:40 PM Benjamin Fair <benjaminfair@google.com> wrote:
> > >
> > > On Tue, Sep 3, 2019 at 5:28 PM James Feist <james.feist@linux.intel.com> wrote:
> > > >
> > > > On 9/2/2019 1:15 AM, Brad Bishop wrote:
> > > > > Hi James, Patrick
> > > > >
> > > > > Updating our poky subtree to master HEAD exposes a build failure in
> > > > > phosphor-pid-control.
> > > >
> > > > Here's the bug, I've seen this before, it seems random when it happens
> > > > and changing a few lines can make it go away. Something to do with lto...
> > > >
> > > > main.o swampd-util.o  ./.libs/libswampd.a -lstdc++fs -lphosphor_logging
> > > > -lsdbusplus -lsystemd -lphosphor_dbus
> > > > 00:59:59 | lto1: internal compiler error: in add_symbol_to_partition_1,
> > > > at lto/lto-partition.c:154
> > > > 00:59:59 | Please submit a full bug report,
> > > > 00:59:59 | with preprocessed source if appropriate.
> > > > 00:59:59 | See <https://gcc.gnu.org/bugs/> for instructions.
> > > > 00:59:59 | lto-wrapper: fatal error: arm-openbmc-linux-gnueabi-g++
> > > > returned 1 exit status
> > > > 00:59:59 | compilation terminated.
> > > > 00:59:59 |
> > > > /tmp/openbmc/work/armv7a-openbmc-linux-gnueabi/phosphor-pid-control/0.1+gitAUTOINC+35906cc3d0-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/9.2.0/ld:
> > > > error: lto-wrapper failed
> > > > 00:59:59 | collect2: error: ld returned 1 exit status
> > > > 00:59:59 | Makefile:919: recipe for target 'swampd' failed
> > > > 00:59:59 | make[2]: *** [swampd] Error 1
> > > >
> > > > What platform is gsj? We're currently behind tip, and it'll probably
> > > > take me some time to catch up to be able to try anything this new.
> > >
> > > GSJ is a Quanta board with a Nuvoton NPCM7xx BMC.
> > >
> > > This could be showing up there since the CPU cores are ARMv7 unlike in Aspeed.
> >
> > Will this build if we drop the lto stuff?  I have seen this issue
> > before, but I cannot recall the solution... but it did go-away at some
> > point.  So, I'm confident it can be addressed.  I'm going to try
> > building without lto and see if it's happy.
>
> I tested the patch without the flto option enabled and it started
> building again.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-pid-control/+/25048
>
> >
> > >
> > > >
> > > > >
> > > > > GCC is asking for a bug to be opened.  Could find someone to have a look
> > > > > at this so we can continue to pick up poky changes?
> > > > >
> > > > > If you would like an openbmc tree to pull give this a try:
> > > > >
> > > > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/24783
> > > > >
> > > > > thx - brad
