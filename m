Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB955205B0
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 22:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxsjz0kjvz3c7x
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 06:10:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hUFrhR3r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=hUFrhR3r; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxsjX31VKz2xgX
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 06:10:24 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id e2so20938341wrh.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJT0NK3A+xjd+DLua8rlkmQdZyoNgunI/I+a2WA0gUY=;
 b=hUFrhR3raVPUkq1GLPE7Kl5VxsmyfvlKPtlLBv5hu1UP8s3oUtkdRNDseS+Ecs6cFN
 k08xJKXxag5fEE/hs+sy7L3tuXuchTyPm2rNN3Htx8zh2XV1B7nqjeAdvKBiDHbZsc0B
 1WzA3W8qLS+fYFzV9G+ggGe7QTElhIYK26VERUN7ozFTQGl3WLBS82FFCvqGUD/8Cpwq
 SaHlUYI/pmDnIT/d1kwEf4lLhFBTaD8+x6XWaxrBLbyAc76Zzxr9+qjH1G/+ppX0M98y
 THOldn87QHJ1RIDNe2xUtiIYch8d36vlj6OBR9Qf+bAMdoGCslYJNBOjrMwaqCjrELt2
 N02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJT0NK3A+xjd+DLua8rlkmQdZyoNgunI/I+a2WA0gUY=;
 b=Bll9YIbMlyVXQUQL0luqPmqrP6VEZyGXBwj5Azh+XiSJWxLjwiW1FOS9KlqahTJUDV
 LPuJ3NQM1mtRyhRnnjhNa7PdkL+VpqV2AiwHvHdpSmSvlIpZjxj//4MXUS0VkW7foQB4
 nkYNF/iooQsq/Ue6h8hC9SUJjzEV7qoZgVDIIoqTrj+CjCcrYuhWQTgXUMksWfjbkWaC
 sC6m0CHyVvTBBsysJgoY1hT41rh+reNjN0VrB/Ea6QTQsgqghW2IIhQZyhMF5KrL+o8I
 FDMMxGnViKBy0KGHMNjlrFsnt+7CV+OBSbf+8y7g7t6reVAyj85BJgHVOGuQlscSAZT7
 zSJA==
X-Gm-Message-State: AOAM532EjRaRDmTjpntiqn8FoSKB3HUWAjEuLo1zaeaUi9HlQzdaFK0s
 I+CElWt9PaBAcHGlNFR9mFKVOHNqf8M8wB1ti6MwrQtT/rvzFA==
X-Google-Smtp-Source: ABdhPJwxL2l0vZBcsqZbgFfGTjQq5PxKU9PoR3lCSFRufXKbi3x4/iBLD0FyPQrZVFk96xum4awbqngHWj9mQxpEEPc=
X-Received: by 2002:adf:e6c3:0:b0:20a:e1a1:b176 with SMTP id
 y3-20020adfe6c3000000b0020ae1a1b176mr15045114wrm.291.1652127020011; Mon, 09
 May 2022 13:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <16ba58d6-d06b-1c92-340b-e94119a47708@linux.intel.com>
 <YnBcJ6GPKIBpqYWN@heinlein.stwcx.org.github.beta.tailscale.net>
 <cfed9171-10fa-d8a7-e1e5-74cef23bc299@linux.intel.com>
 <YnEZ3irWISTwEikW@heinlein.stwcx.org.github.beta.tailscale.net>
 <50d7a4cf-d379-29ae-f635-ce4d79974305@linux.intel.com>
In-Reply-To: <50d7a4cf-d379-29ae-f635-ce4d79974305@linux.intel.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 9 May 2022 13:10:08 -0700
Message-ID: <CAH2-KxD=i+rZpFkuQHvX136S8xKmTcViumu6ZyLmdeiBxLxSFw@mail.gmail.com>
Subject: Re: Running OpenBMC Daemons/Applications as non root using D-Bus
 Session/User Bus.
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 3, 2022 at 12:49 PM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 5/3/2022 6:02 AM, Patrick Williams wrote:
> > On Mon, May 02, 2022 at 11:00:01PM -0700, Nirav Shah wrote:
> >> Hello,
> >>
> >> <<<< Moving everything from the system to session /bus/ doesn't really
> >> improve either of these aspects.
> >>
> >> I agree i am not proposing a complete transition to session bus. The
> >> proposal is to move the interactions to and from as you defined it
> >> "external facing application" and anything that does _*NOT*_ really need
> >> root access to the session bus by running them as non-root. Applications
> >> that "may" need root access (may be because the hardware interface
> >> requires root privilege) will continue to use the system bus for
> >> communicating with other root application and session bus for
> >> communication with non root applications.
> >
> > To be honest, this sounds even more complex than just using the session
> > bus for almost everything.
> >
> >> I agree that BMCWeb can run as non root today and still be on the system
> >> bus. Also agree, this is better than running BMCWeb as root. However,
> >> "We can then figure out how to further limit the DBus APIs after that"
> >> is what I want to address. How does having a session bus help solve
> >> this? This for me is complicated to put down in an email. If my
> >> explanation below sounds too high level, I would agree with that too.
> > ...
> >> This is the approach I have seen in most of the Linux Distros for
> >> desktop. I understand OpenBMC does not have the same use cases as
> >> desktop but in this case it could be lot similar. Does this change your
> >> mind?
> >
> > Not really. :)  Yes, "too high level" is probably the simplest statement
> > here.
> >
> > Let me switch this discussion around a bit.  Please name me 4 daemons,
> > which currently reside on the system bus, and that bmcweb does not and
> > should not ever access.
> One possible example that maybe isn't in place yet is MCTP.  If we end
> up exposing an MCTP interface over D-Bus, is there risk that this could
> be used maliciously since a compromised application running as root has
> direct access to the MCTP interface?
>
> If the direct MCTP interface is on the system bus and the filtered MCTP
> interface is on the session bus, then a compromised non-root application
> would still be blocked from accessing the direct MCTP interface.
>

+1 IPMB would be similar to this, although I suspect that we really
don't want to put raw MCTP on dbus like we did with IPMB.  Arguably
even in the IPMB case there were likely better paths, and now that the
shared IPMB state is in the kernel, needing to pass arbitrary ipmb
messages over dbus is probably not something we'd do if we did it
again.

> >
> > I think you'll find it hard to enumerate because our architecture is
> > purposefully very flat.  I know the codebase fairly well and have thought
> > about it for a bit and can only come up with one: kcsbridge (or btbridge).
> > Perhaps you could expand to a few of the systemd daemons (org.freedesktop)
> > where we've created an abstraction (xyz.openbmc_project), but I actually see
> > present day code in bmcweb which interacts with the ones I was thinking of
> > there.
> >
> > So, effectively everything would need to be moved to the session bus
> > _and_ we'd still need a mechanism for bmcweb to access some of the
> > system bus end-points (via restricted ACLs), but effectively that is
> > still every single dbus endpoint.  This proposed move didn't actually
> > accomplish anything from a security standpoint in practice.
> >
