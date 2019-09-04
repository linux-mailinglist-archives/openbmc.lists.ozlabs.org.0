Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6FA7A16
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 06:41:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NWNd1rtGzDqkw
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 14:41:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RXBvMnqA"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NWMz03jFzDqkq
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 14:40:30 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id h144so25915862iof.7
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 21:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkzMK/5cSgXFPqOyrMvVJhve12IYPRoXOQZqbk6cQ44=;
 b=RXBvMnqAEj4qNx5/87za9I+7QhUKPnJq67KJZTnpaXh9koiYbmC3DvFtGuec53UyB+
 CtZb6tEK03nASIjD9d0Y52ZGuFn7y4teLWfdqcfLTJ06bQGIoWA2K62ULLMlicKyS96g
 UOvmxbQXs5/l73thoMHMrXL9MJ+opmgX4Y2bF0xmpaAWDqwGGitfMg4XnfEB7QxWeKPk
 hq9vAhGFYmMo5Xyd37BHTk4GTSV567AEfo154pLWk0D9l3cVF+D/CzixJ7sVYCoMAnLq
 IijkDp61oWaTIQK+yIMgnPNjA8K6Qom/GN9ipJ7FIMaMp1AcUN8gc+MCd/34CSTxIN/L
 2fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkzMK/5cSgXFPqOyrMvVJhve12IYPRoXOQZqbk6cQ44=;
 b=gqredgxSqd3RA0W7FVknhWjTj9zH/PGqLqzZuCzQeohWS2QeFgdin8LWovCtaRd1XV
 gRqCxst6cjHxSztsXmLltKFuuJm5d11nQ7hu/VQA4jnFVtzQPAax5mwAUxGOU2LSqtw8
 o0wYZ7z+5O3mTXEKGF4v5gb0sE0w8vq10UkUZQnAbYBKgxl3J0ui/Z2EmX6ZvWrg3XtB
 l6X3R24wsw29KLdmcil8yTf/FePg7QC9n7CIw1243br0f+XlrEZtwilH28roEggIWbx9
 zP53/uWFyqlZzv0wDr3c5pvK5lEExi4AEgyMOxPip5Wc4Hk6Ooqushn5LiogpbZl0uG5
 OFxw==
X-Gm-Message-State: APjAAAVrPEwvBMhvlg0RVK229OBsMEBHl/ZQhHwuWdXt1VIQA+Qms2/S
 R+FN5ag0K8EIL9T6eBUH4cQIOAxLnZ7hM0kBGfcNxw==
X-Google-Smtp-Source: APXvYqxgTEteIgdIqAmmCbwqmxxL9Zju/UfeV17gGl4wP+P3EMpaPQ0MLI01ktnI9+0qp+V+24+nvYze5s1Vv6noSA8=
X-Received: by 2002:a5d:9746:: with SMTP id c6mr2909810ioo.235.1567572026222; 
 Tue, 03 Sep 2019 21:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <907F7F17-6EC3-4F83-A2E4-3BBE764C72DD@fuzziesquirrel.com>
 <b6be6eda-703f-7daf-b0ee-e8ed5f778645@linux.intel.com>
In-Reply-To: <b6be6eda-703f-7daf-b0ee-e8ed5f778645@linux.intel.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 3 Sep 2019 21:39:50 -0700
Message-ID: <CADKL2t6wCkJiZW+fy_UJeaYYR=Pb6-6wNFsX9Z5rU1ZoLkCYxA@mail.gmail.com>
Subject: Re: phosphor-pid-control build failure with yocto head
To: James Feist <james.feist@linux.intel.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 3, 2019 at 5:28 PM James Feist <james.feist@linux.intel.com> wrote:
>
> On 9/2/2019 1:15 AM, Brad Bishop wrote:
> > Hi James, Patrick
> >
> > Updating our poky subtree to master HEAD exposes a build failure in
> > phosphor-pid-control.
>
> Here's the bug, I've seen this before, it seems random when it happens
> and changing a few lines can make it go away. Something to do with lto...
>
> main.o swampd-util.o  ./.libs/libswampd.a -lstdc++fs -lphosphor_logging
> -lsdbusplus -lsystemd -lphosphor_dbus
> 00:59:59 | lto1: internal compiler error: in add_symbol_to_partition_1,
> at lto/lto-partition.c:154
> 00:59:59 | Please submit a full bug report,
> 00:59:59 | with preprocessed source if appropriate.
> 00:59:59 | See <https://gcc.gnu.org/bugs/> for instructions.
> 00:59:59 | lto-wrapper: fatal error: arm-openbmc-linux-gnueabi-g++
> returned 1 exit status
> 00:59:59 | compilation terminated.
> 00:59:59 |
> /tmp/openbmc/work/armv7a-openbmc-linux-gnueabi/phosphor-pid-control/0.1+gitAUTOINC+35906cc3d0-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/9.2.0/ld:
> error: lto-wrapper failed
> 00:59:59 | collect2: error: ld returned 1 exit status
> 00:59:59 | Makefile:919: recipe for target 'swampd' failed
> 00:59:59 | make[2]: *** [swampd] Error 1
>
> What platform is gsj? We're currently behind tip, and it'll probably
> take me some time to catch up to be able to try anything this new.

GSJ is a Quanta board with a Nuvoton NPCM7xx BMC.

This could be showing up there since the CPU cores are ARMv7 unlike in Aspeed.

>
> >
> > GCC is asking for a bug to be opened.  Could find someone to have a look
> > at this so we can continue to pick up poky changes?
> >
> > If you would like an openbmc tree to pull give this a try:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/24783
> >
> > thx - brad
