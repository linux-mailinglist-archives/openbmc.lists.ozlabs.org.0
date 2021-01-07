Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E042ED5BA
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 18:35:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBYKV07KrzDqdM
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 04:35:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Beo8GgC5; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBYJZ2wjmzDqZW
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 04:34:29 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id n9so7541442ili.0
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 09:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9y/u3J5v0uCfJk3w1CLMpUmF1Z+5XttxqBici57qTLA=;
 b=Beo8GgC5zisCKr9eDMITHv8wKfxbeu76Q10FUb3nffg/2fl5mhUAlKNeVpXzQ5jidn
 hVe+z+x/HcOzTAiiHaOJHz7vt+hsLKvmsDyLlfTLBGuqVlSW4kpHJqj+06dH5nDNuZhP
 KNv5F9sjsfadRTwjJitHy6T9TkmbCbmS5s8+9a4mxzCRLzwhbsDmaCoz0/rWPOf7Afgc
 ddoWNUuZzNLLXzVHbhGR9caSCb/cV0TL7Kj93LoxBE0TUHR5kXtP9Nt+ES2FFhNBkJ5u
 Ffv/9KvEseVqxFF+w1UwZRPDZTVdz3gvh1GqXZqyKGsQFDzz0WD8rnY4l+GeEAFEQEnt
 qGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9y/u3J5v0uCfJk3w1CLMpUmF1Z+5XttxqBici57qTLA=;
 b=bdFGXaALmrBCxfTJ0F6BhMKR6mYMJq/7G2PhmXxXuZkqkcUabQc10IW2s3HpEHWaP2
 /vcHjVG8QcYoYrn5gSJb81R21rkVKWT+Rl3hdfzoh4EbgLj/AWTpOdpN4gC1ewPb65hm
 uUoWkkMEP8AzaTtcyvnnWunsfF5WUZzaH1z4cKbKCJ/kkvzxCxt6pwQwxhJBh0QnUBpr
 CKtylimwlsTq6EutxYw96t18Gr3yNOr1PCtP/ik+Oa8Z4W5OyLThE68lw1mIqNegp4GV
 42PoE5yrnPpnT7Nn6wxLYxsjd3ouc7q36DvjRgG5fxePx+wgPRKNe7cRTtek6+3tHQ1Y
 doqA==
X-Gm-Message-State: AOAM531GCPioM5XNQiD0QM8y7T+f4Bnbo/HZAdfgSyix9JQkCkUugyUk
 oHqcrd9DpDCpEvTE8ohtQP1AJ+dHEQRypR6R3thmTQ==
X-Google-Smtp-Source: ABdhPJwPoEE6JOaQDszvXite2pIbYUPVq/suis/233EgpalMhkszIHUqdNDkKQkGfChzLGDEdVOhJ+3duGd9rI2q0qs=
X-Received: by 2002:a92:6410:: with SMTP id y16mr10357265ilb.126.1610040865351; 
 Thu, 07 Jan 2021 09:34:25 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
In-Reply-To: <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 7 Jan 2021 09:33:48 -0800
Message-ID: <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Brandon Kim <brandonkim@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Brandon,
>
>
> Am 07.01.21 um 02:49 schrieb Brandon Kim:
>
> > We're exploring ways of upstreaming some of the downstream repositories
> > from Google to openbmc/* .
> >
> > Half, if not most of the downstream repositories are C++ daemons that are
> > specific to Google so we didn't want to create a bunch of new
> > openbmc/<repo> that no one would use.
> >
> > An idea that Ed gave me was having something like openbmc/google-misc
> > repository for all these repositories and if there are any that seem useful
> > to others, we can break it out into a different, separate repository in
> > openbmc/* layer.
> >
> > Please let me know if this seems like a good idea and I'm open to other
> > suggestions!
>
> Thank you very much for putting in the effort to make these repositories
> public.
>
> Using the openbmc/google-misc approach, how would the git history
> (commit log) be handled?
>
> Personally, I would prefer having small repositories as git makes that
> very easy to handle. Also it might save you time, as you do not have to
> think about what to do with the git history, and do not have to merge it.

We would most likely squash the history together, in case there's
something confidential or private in the earlier commits.

Many small repos would be easy to handle for us, but OpenBMC may not
want to have lots of small Google-specific repos in their org as this
may make it more cumbersome for others to find the relevant repos that
they're interested in. There's also overhead for the project
maintainers to create the relevant groups and permissions for each new
repo.

>
>
> Kind regards,
>
> Paul
