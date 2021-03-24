Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D77346F0F
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 02:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4rmD301Gz30C5
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 12:50:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BmM66b2v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BmM66b2v; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4rm03K12z2yQw
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 12:50:23 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id c6so16519533qtc.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 18:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYgmluPC9dm0uxk45HI8lFdpHExa/a1wL0gAE3Zk1ss=;
 b=BmM66b2vSMlxClWTk7KOLrfYzc2JdGvh7kFORfjOm3vcV0uUWahPndxbJt/8xwfwd8
 uoVOvJbBVfKFMmNmMBi4Mlnw8WqFflx5PhQJuvISW8nbiDOzMcdRSbOtZuZ/GX+9wpfO
 KWzG0JSyCS/3G8QtkBMC8aMT7LqWrNrgc+2qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYgmluPC9dm0uxk45HI8lFdpHExa/a1wL0gAE3Zk1ss=;
 b=F4P/+IegnVCVu5f4aQRR0RnNVIk0Q5oZB+4vPzrn82QZAA+JqAIBFT0i643Ip+IGcL
 +EMg54FR9v4p7iV0Cpkeo9C4Qu0ZrFL7SH1vlwhuH58XJyeSaAWe5WLLn/0UF9JthlrP
 RKymNQhdeZ9IdR2r+tbzIbQvEA6/GM+yvY/kJJ1zgAxDwf+zV+elve0ctW+uC8sYLyIQ
 SSErUaMy408NVb1oAgi33tY+IKg1vOgVbUbqmNA9LwJAUV252puAKE6Nzxu54Z6pUgzL
 Euo6YwNKO/lJNfpJOvfv+wFUFfB4p/9vX4fgvDMoqbaWBnioXYUFFoLpaifiBjZZb+tE
 tN9g==
X-Gm-Message-State: AOAM5317KTDGpnZJB+XOT4kMCUqGOQgjFUmJkoHPhgq4KatTJnz6eAjT
 CIAmyEsW7eU1XDiLSy0amMbJv/RW+XfJ+21d4Pk=
X-Google-Smtp-Source: ABdhPJzbPBLNUMudW0XNEe3iHIytqQQ9LiUSBtP8XHzMZ7SPE4PYrdm1MzJ9i7/vitmGZKr2p9gK6YEzFGtFum8JR+A=
X-Received: by 2002:aed:2ee7:: with SMTP id k94mr1050007qtd.135.1616550619643; 
 Tue, 23 Mar 2021 18:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <YErVxrB4afOz1ejt@packtop>
In-Reply-To: <YErVxrB4afOz1ejt@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Mar 2021 01:50:07 +0000
Message-ID: <CACPK8XfpdF7_Thsg-96nkneoQDYayTEznbR8HDCOePG4=YruVg@mail.gmail.com>
Subject: Re: RFC: ASRockRack E3C246D4I port
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Mar 2021 at 22:25, Zev Weiss <zweiss@equinix.com> wrote:
>
> Hello all,
>
> We (Equinix Metal, formerly known as Packet) having been working on a
> port of OpenBMC to the ASRockRack E3C246D4I board
> (https://www.asrockrack.com/general/productdetail.asp?Model=E3C246D4I-2T,
> an AST2500-equipped Xeon E-2100 mini-ITX board), and we're now looking to
> get some feedback from the community and hopefully start the process of
> getting it merged upstream.

Nice!

>
> It's currently sitting in a Github branch, since at the moment I'm
> mostly seeking fairly broad guidance on what sorts of things will need
> to happen to get it into a mergeable form (not sure if gerrit is the
> right tool for that).  Anyone who'd like to can take a look at:
> https://github.com/zevweiss/openbmc/tree/e3c246d4i
>
> Known issues, in approximate descending order of significance (by my
> estimate):
>
>   - The kernel situation is...kind of messy.  This mostly stems from
>     having a dependency on the PECI code, which is why the branch is
>     based on the 2.9.0 tag (the last one before the PECI patchset was
>     dropped from the openbmc kernel) instead of something more recent.
>     We've got some additional PECI patches on top of that to work around
>     some limitations in the PECI support on the particular CPU we're
>     working with, some of which is fairly gross hardcoding for that
>     specific SKU.  There are also a few non-PECI-related kernel patches
>     that I've posted upstream but not yet incorporated the resulting
>     review feedback on.

As you point out, it would be great if someone could take on the PECI
maintainership and get the code merged to mainline.

Out of interest, can you still boot the host without PECI support?

I recommend submitting your device tree now, and getting some level of
support in the openbmc tree. From there you can work to get the other
fixes into the tree.

Cheers,

Joel

>
>   - There are various hacks to get things like x86-power-control and
>     host-error-monitor compiling and working reasonably, and I'm sort of
>     skeptical that the approach I took there would be considered
>     desirable.
>
>   - The directory naming is currently meta-equinix/meta-e3c246d4i;
>     starting out I was a bit unsure whether to name based on the
>     maintainer/developer of the layer or the maker of the hardware and we
>     ended up with the former, though I see Ed's in-progress x570d4u port
>     has things under meta-asrock, so perhaps that should be renamed?
>
>   - There are some relatively generic patches for dbus-sensors and
>     entity-manager that should probably be merged independently.
>
>
> If anyone can give it a look and let me know what the best way forward
> would be for this we'd certainly appreciate it.
>
>
> Thanks,
> Zev Weiss
