Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAB81395
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 09:39:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4628mB4gWxzDqjZ
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 17:39:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cTEVYMhB"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4628ld1NwqzDqdk
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 17:38:52 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id k8so165355293iot.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Aug 2019 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UJhSU3krrVUol3h6MTLMSrpYHZ9aAz22f54JyyZ39dk=;
 b=cTEVYMhBnVOpeBJgHzYKfOToVpJGnWkGGG/DJfApwmVvfkDjakhqHW2XfPZW0SFP+q
 5e0bLzO/1mn2H9l5Q1H4rbgUwikDLk0c9B5ztkRGYRkHYHdcP2XJdynjKIn3Egv/hvOC
 mypHGfoHaQaHUvzz9UTbor+T39sjv0Ih1a174KWDvinKstB8auBEcYgJCTMchFSoe075
 6Ad+gzS7uqqvvBxU9hCUw0GxmYPyZScmW3YjTdJzq8jue6d25q0axu9cgY7X+m+RLRtR
 KEZyvZg5u/qnw20GERdVYRWEnqdv256jZxsJWCGnm+1hnDqlkvFYfu1VkQAepav6DryZ
 prdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UJhSU3krrVUol3h6MTLMSrpYHZ9aAz22f54JyyZ39dk=;
 b=sosL4DpBCwosJHncriR8vObXsLpltu/sHiYyExg1K0Qq8z0ooNFaxyh/JaqHv0aj+I
 1TgM0X8L6L3ZcFHaly8GDG088dIrri0RznBoc5U/UC8/GmutyS+HTkGKIO6/z/y755MB
 uzxu9J+LH9inejdaQb6Nw0XjDiaWYve0oub8IhZs7oY6mqeAgxUfCY5daw2n4adAgcwQ
 gJLKLKJJrpB+hGroRnP7wNcxxGZoA+DuNmOkhgO2wy1RG2Z2Q01EcAYUiexF+HTWDuft
 YYEIbJKdWDG8TBkr41xzzIPqrChM9CvXmYVSYVoAvjywTpzeUvtH1blL/vRsXxAiBEPD
 8z7Q==
X-Gm-Message-State: APjAAAULO1XumZZ0egiu2QkzPSwHHcSm5UArPRaHso+A5rzGAAgsLGza
 0aXweOU3UB4bVkHSYr4hWaVvohCZ+2e6Qi5CNX4=
X-Google-Smtp-Source: APXvYqyYiy3I86RC4X/bQpUUsjVjFYNmWvpSzk5aQ2qNFf1PJ7u6/YuOo84QiK2SoUFQCs82RXCzbrm9Ac6acXVyMaI=
X-Received: by 2002:a6b:b985:: with SMTP id
 j127mr19985600iof.186.1564990729482; 
 Mon, 05 Aug 2019 00:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <29CA6B5F-505E-462F-A1DA-9146B97E01EC@hyvedesignsolutions.com>
In-Reply-To: <29CA6B5F-505E-462F-A1DA-9146B97E01EC@hyvedesignsolutions.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 5 Aug 2019 15:38:38 +0800
Message-ID: <CAARXrtnOwXtOS_y9Wj3RkjhwFG9ReKvjfG7XNaKpEV=H-4cqMg@mail.gmail.com>
Subject: Re: Nothing RPROVIDES 'virtual-p9-vcs-workaround' when creating
 romulus-prime machne
To: Brad Chou <bradc@hyvedesignsolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If you grep p9-vcs-workaround you will see below:

    meta-romulus/conf/machine/romulus.conf:PREFERRED_PROVIDER_virtual/p9-vc=
s-workaround
=3D ''

which defines it as empty.

On Mon, Aug 5, 2019 at 3:07 PM Brad Chou <bradc@hyvedesignsolutions.com> wr=
ote:
>
> Hi All,
> I followed the exact steps in Add a New System to OpenBMC.
> https://github.com/openbmc/docs/blob/master/development/add-new-system.md
>
> Unfortunately, I got this error as "ERROR: Nothing RPROVIDES 'virtual-p9-=
vcs-workaround' (but /home/bradc/Documents/openbmc/meta-openpower/recipes-p=
hosphor/host/p9-vcs-workaround.bb RDEPENDS on or otherwise requires it)=E2=
=80=9D.
>
> I need to delete one line in romulus-prine.conf to fix this error.
> # require conf/machine/include/p9.inc
>
> Is anyone have idea why it only happens when create a new machine ?
> Thanks.
>
> The detail error messages are :
>
> [bradc@hyve-taipei-fw-lab build]$ bitbake obmc-phosphor-image
> Loading cache: 100% |####################################################=
###########################################################################=
######################################################| Time: 0:00:00
> Loaded 3596 entries from dependency cache.
> Parsing recipes: 100% |##################################################=
###########################################################################=
######################################################| Time: 0:00:02
> Parsing of 2442 .bb files complete (2441 cached, 1 parsed). 3597 targets,=
 351 skipped, 0 masked, 0 errors.
> Removing 1 recipes from the armv6 sysroot: 100% |########################=
###########################################################################=
######################################################| Time: 0:00:00
> Removing 1 recipes from the romulus_prime sysroot: 100% |################=
###########################################################################=
######################################################| Time: 0:00:00
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'virtual-p9-vcs-workaround' (but /home/bradc/Doc=
uments/openbmc/meta-openpower/recipes-phosphor/host/p9-vcs-workaround.bb RD=
EPENDS on or otherwise requires it)
> NOTE: Runtime target 'virtual-p9-vcs-workaround' is unbuildable, removing=
...
> Missing or unbuildable dependency chain was: ['virtual-p9-vcs-workaround'=
]
> NOTE: Runtime target 'p9-vcs-workaround' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['p9-vcs-workaround', 'virtu=
al-p9-vcs-workaround']
> NOTE: Runtime target 'virtual-obmc-host-ctl' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual-obmc-host-ctl', 'p=
9-vcs-workaround', 'virtual-p9-vcs-workaround']
> ERROR: Required build target 'obmc-phosphor-image' has no buildable provi=
ders.
> Missing or unbuildable dependency chain was: ['obmc-phosphor-image', 'vir=
tual-obmc-host-ctl', 'p9-vcs-workaround', 'virtual-p9-vcs-workaround']
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
