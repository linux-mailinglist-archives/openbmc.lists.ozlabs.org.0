Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9128260A90
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 08:06:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blvlr5xl4zDqJm
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 16:06:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b43; helo=mail-yb1-xb43.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=A1eZBhSr; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Blvkf0bfmzDq97
 for <openbmc@lists.ozlabs.org>; Tue,  8 Sep 2020 16:04:57 +1000 (AEST)
Received: by mail-yb1-xb43.google.com with SMTP id 195so10558829ybl.9
 for <openbmc@lists.ozlabs.org>; Mon, 07 Sep 2020 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkJapm56IOvF/hrkVtqUFyBrRRTfD0wlt0Qjx7mH1zM=;
 b=A1eZBhSrRbHwz2JKPlj7SbTAKwVKE+KtQzpJ14BqpmLdIHI7r7K8AYh4OXUu1whdgX
 0D/BLBgavNTrf/MPlCnVt32d+mqr4K7LvXy5zDJZVUqelSLY9A517rOi6br+Bwb2xiyW
 v71QJDnQg6MhEj3BdHuWdZh+pGGvIrnfRW8eYcT60RTTALyRphutWAvRkXR5yjNhKyDf
 GJ4KwpVPipY4X5m/7BmA6RXJt5SjV255eR+JLItgS4jPCPfBsOvY0L0veuHgEBRmjsrE
 ECb40C4E5nWUutR/2+eWo9RXpJhPKhxCfVlTFbXL6MQS5NS8fFNTltZvws/weF+PvCPD
 iUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkJapm56IOvF/hrkVtqUFyBrRRTfD0wlt0Qjx7mH1zM=;
 b=CEjmTO/hOLkMlTP/etUYmZNCkcO7WYEZ6+nD6eiU23H8XhMXFiZgFMueKjowycS8lg
 Ayt6WuVdRvtMGYJ++XMMV1gjsHmzsUJ2CQti6GoL8uiuLBBZQNJvByrKmhAHtnWqa83D
 E1UNgP9v2S8IrOuvvJJlALRNYj2FZfEPJenavuvhSmeifuSTnJDMGHq8cpqttvDS0jTF
 7aJ1gWOQ/gZ3T11IfWKOBwRqZvSC3d8mIR3n+gbu0H0A7CpFAndAYHxxb+lWopFSxfkr
 7TjJDzTQAEFxaFcSI4B7HVfHd5ykrikaXBXea7NTnyI7oBMk1Fmb2+5EdElL/dNxq2th
 MdLA==
X-Gm-Message-State: AOAM531LhyosCrvzrS6CLKgOVywY9U1AsfNDhl0SQYnH3bqytfObRN7J
 JAcauPX+egVgsou1Gudmmf8IOHg9IGVn69+22/fX5g==
X-Google-Smtp-Source: ABdhPJwmtuW0kY5UBzGyH4SRmmOUfiLmisVFYyKPpcMRh+MA3C3J4i7b6k0VQWHDUtkjsa2i60MbyPigfxxw5W2/9HM=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr29376852ybn.480.1599545093919; 
 Mon, 07 Sep 2020 23:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com>
 <20200904163430.GA3532@heinlein>
In-Reply-To: <20200904163430.GA3532@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 7 Sep 2020 23:04:42 -0700
Message-ID: <CACWQX80H28pcadEj0mnE8Qs=hJ3k5Bj0MdvS8oq2pcBJtrAxkQ@mail.gmail.com>
Subject: Re: PECI patchset status
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 4, 2020 at 9:36 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Sep 03, 2020 at 10:15:56AM -0700, Vernon Mauery wrote:
> > On 03-Sep-2020 10:27 AM, Patrick Williams wrote:
> > >On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
> > >Rather than create a separate fork of the kernel, is there something
> > >that could be done here to have someone from Intel work with Joel on
> > >preparing the patches?  When a new kernel comes out, Joel can ensure it
> > >works on the base AST2xxx system design and before we move all the
> > >systems to it, someone from Intel can rebase the non-upstreamed patches
> > >they are carrying?  This hopefully reduces some of the burden on Joel
> > >and stops us from further fragmenting the community.
> >
> > Keep in mind that Intel does not plan to keep the fork around
> > indefinitely. The hope is to fully upstream all of the patches that we
> > have outstanding. Our intention is not to fragment the community, but to
> > provide a mechanism to continue to move forward while still providing a
> > way for other users to build the intel-platforms target.
> >
> > As an added feature, having our full kernel source in a publicly
> > available tree will allow us to upstream more features that depend on
> > kernel support that is not currently available.
>
> I'm not really following this last paragraph.  I suppose you're saying
> that you have kernel changes that are not in openbmc/linux that add
> additional features?  Why aren't they in openbmc/linux?  I thought there
> was a process for getting code in that isn't quite ready for
> upstreaming, as long as there is progress towards that?  Is there some
> list of what these features are and what the upstreaming state is,
> because this original thread was about PECI, but you're implying there
> is much more.

I pulled down the tree the other day and counted 84 independent
patches.  How many of these have been submitted to upstream?

>
> If the process isn't working for the community shouldn't we discuss
> improving that to something that does work?  It seems like your team has
> decided to go to the nuclear option of forking after Joel has proposed
> dropping a patchset that he's been carrying for three months short of
> three years.
>
> Joel does great work of keeping the kernel up to date, both on a major
> release and picking up supplemental fixes.  Is Intel committing to this
> same level of support that Joel is currently providing for your own
> fork?
>
> Past performance doesn't really give me a lot of confidence that this
> will be a short-term fork.  In December 2019, Joel raised this exact
> same problem with the PECI driver[1] and it was promised that there
> would be forward progress "within a week"[2].  One week later, there was
> a v11 of the patches posted[3] and we got some good comments from a
> variety of upstream maintainers.  Since then, there has been zero
> activity.  Shouldn't we have seen a v12 pretty quickly after that?

+1.  I'm really wondering what's holding this up.

>
> 1. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019684.html
> 2. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019728.html
> 3. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019823.html
>
> --
> Patrick Williams
