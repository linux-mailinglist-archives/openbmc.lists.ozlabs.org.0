Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8745F4E0F
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 05:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj0BY1GQyz3bj7
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 14:17:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f9GOu71B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=bruce.ashfield@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f9GOu71B;
	dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhzvg3mhZz2xHW
	for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2022 14:05:02 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id m81so16361395oia.1
        for <openbmc@lists.ozlabs.org>; Tue, 04 Oct 2022 20:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VhiNxRf6DQwXW9ch5sIbd3YFDJl0Ew4BTh5cqeOodVc=;
        b=f9GOu71BPzy0qQioofjwxLM/JmDjxarqQUq6Eu4y3E9jD/dKzO8JDc+l99+6PWdjKG
         9eLigJspq4JQUedveVhWFDvJUfUFVB+gG9VXYk9T84B28obW67G0zST5FA+k/FhXEobu
         Yc6FNewCFMByHAWb2DE2ymlOIoosYbvyY+2QCAiTmNWt+sWY01Ju6u6jUbL6vydkw6dF
         dOkzrLyygGy9dBu+KzQai17YEuvsJRVrDWrbUmKgncyAwVuV7/hdEpCLjRsUQg0U55B2
         Q8UscoK9ZFm7c1nU2xPFia8rvwb4Wnoc285HrdDYMy8xL3C0oXK5FXW+dTDUKFRCtc7Y
         DU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VhiNxRf6DQwXW9ch5sIbd3YFDJl0Ew4BTh5cqeOodVc=;
        b=BtOPfhxKW9d+McAWR7rp5WjuMyC/rKrSl+kL2woKcHjbYHErDiezoyvn48eUChJkam
         lcSXLgp/fO6xYFxK4KKNklTyk/yAZ3vf1QBSsS3ZpFR3Z+Y7SYkbPYWCnjW66gqtO/LZ
         M1HDpP4tf/urByFlap3HaYFTtBaw7b5v4MmU+KLyyQtstulroXYIVTvNfZroSHd3Glsb
         SKre68wK/iP/jkbgAe7v3Lg9zBhlbi82nDuZ7e6xElUAK26FZmC/08ZINlVx7UgjMjLL
         RsTRT+PSr6z0VUrpu+36S/ZnY5T+nc+FoeL7X3o5IlldNjI5H7LrUVitqCNi7tALiV1r
         xFbw==
X-Gm-Message-State: ACrzQf1qZIGZTzL+I0PXE32GwEeHWoZcerPzcf6Om81YOmy5Th4uhgRH
	yPqVk4lwELEZrM8r0JPmxKjncJpM84I/cbvLGM0=
X-Google-Smtp-Source: AMsMyM4J0gjSwSAR1ye0EBcVw6ij90sehExHcQt0+rH3hsDITYCDCNM3spZne8HjrrwgqGd8s554PHRVC1oQjyumu0M=
X-Received: by 2002:aca:1b0f:0:b0:353:f306:198b with SMTP id
 b15-20020aca1b0f000000b00353f306198bmr951589oib.96.1664939099377; Tue, 04 Oct
 2022 20:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221005025625.64000-1-joel@jms.id.au>
In-Reply-To: <20221005025625.64000-1-joel@jms.id.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Oct 2022 23:04:48 -0400
Message-ID: <CADkTA4O+S5yOgz+gbpnGP5pkPL-ZoTdcDLJqn-_388SHnuVqkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Depend on setuptools
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 Oct 2022 14:16:32 +1100
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
Cc: openbmc@lists.ozlabs.org, openembedded-core@lists.openembedded.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I sent this change a few hours ago, along with lttng fixes for 6.x.

Cheers,

Bruce

On Tue, Oct 4, 2022 at 10:56 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Linux 6.0 requires setuptools for building the perf Python bindings.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index edb133515423..c87880b2c14c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
>  inherit linux-kernel-base kernel-arch manpages
>
>  # needed for building the tools/perf Python bindings
> -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native setuptools3', '', d)}
>  inherit python3-dir
>  export PYTHON_SITEPACKAGES_DIR
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171437): https://lists.openembedded.org/g/openembedded-core/message/171437
> Mute This Topic: https://lists.openembedded.org/mt/94128875/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
