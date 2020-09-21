Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D41272AE0
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 17:59:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw8JC5mV5zDqpk
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 01:59:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vHCG8voe; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw76k3CsJzDqYL
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 01:05:48 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 67so10539431ybt.6
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 08:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7CssO0syQI881+hui9JB/hlFiKzlUBEOIm0aBrbAtF8=;
 b=vHCG8voeZt1AhMq4+qd0duDQL+aGUXyNOMeQe0SGKLxqpAS4nSnCJM6TGqp4IJer/G
 t5MJAOiRfQof2NEW/QmyaKPfEtt6IAn7J9widMyq/gdb0yQ5STAE3pBctiTeSO1v6W0i
 h/0Qmigc+oLTCLrhdZspar4O8Er7k9AEyOgyR2WuzMrDUNRldI/KtnFcaeDNwaJD0Tb4
 e6h4bYfDk/0gs/v9lLrkmrYuowrM4MKcf+KSVk2CL/ZB1ZWB7pX0XTSqCN5Mvt1Adta0
 QHjBVn/C2mGfgx/ADW6+ZgmvLarEyJfQWcymX3PWm7NdyZt8UNaVsP9y/FS9WOcM6nyO
 KvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7CssO0syQI881+hui9JB/hlFiKzlUBEOIm0aBrbAtF8=;
 b=jQnKeHImFhUsW4uWmWL5RgGjFAzgW8GubwLiFn3BzZmYgKHVNQPFT8pU7h49zl/Irb
 yozKOxnDlbiZdt/NYn/WUMOMku3MNXfjgfEknKJVRFd6GTwPb4uBVXKDcFggzaQRivLO
 iExBUF+lROssxPIwRy0oCajVolYCYrlCV9lZ7f/OhcZKewjbxqSLp+NQdfoy17HHfjbH
 ihB5810IQasKoFcvMPnr8ZzGtIowzVDkGV0M+rEHJL/3+JiuXO+iWKLVNbiuWAgLN0qF
 cOXc1dYsjOkdMLi67kiLJNoNk2Vj9HNCaJO498WqW0NpnivLmlVq+fbX4rpTKt4FZntn
 SGuQ==
X-Gm-Message-State: AOAM531loU1pOEYXGsGOoxzW4fFrdQnenNNnLm1w829z+e7JLlXdON1u
 THnobuOP6TpML8A13XtXQ4+9ySpfyuWHMNyO5TCKVA==
X-Google-Smtp-Source: ABdhPJz5im6fkXVlR0pkR71ZEaCnlY+THLgVYgPEsMerTihEhRzeLWZhMrV7GKmKrfEEGBawkqkOTeAsrSkZFzsH2Xk=
X-Received: by 2002:a25:ef03:: with SMTP id g3mr412833ybd.340.1600700744079;
 Mon, 21 Sep 2020 08:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <MWHPR11MB004670BBADCA48F5EE9BE9C7F13E0@MWHPR11MB0046.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB004670BBADCA48F5EE9BE9C7F13E0@MWHPR11MB0046.namprd11.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 21 Sep 2020 08:05:33 -0700
Message-ID: <CACWQX82k+zN8ZgE6Fm+wEQWS4Fsnndy7vTaV4K8ChQL2QR_THA@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: "Khetan, Sharad" <sharad.khetan@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 17, 2020 at 3:22 PM Khetan, Sharad <sharad.khetan@intel.com> wr=
ote:
>
> Ed, welcome back .


Thanks!  Glad to be here.

>
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.org=
> On Behalf Of Ed Tanous
> Sent: Thursday, September 17, 2020 1:57 PM
> To: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: interest in a minimal image recipe
>
> On Tue, Sep 15, 2020 at 1:31 PM Brad Bishop <bradleyb@fuzziesquirrel.com>=
 wrote:
> >
> > I've heard a handful of times that meta-phosphor users often have to
> > remove the latest feature added by default to obmc-phosphor-image.
> >
> > I have an RFC for an empty image that these users could bbappend and
> > opt-in to specific image features instead of having to repeatedly
> > opt-out.
> >
> > If you like the opt-in approach, please drop a +1 and/or review my patc=
h:
> >
> > https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36516
> >
> > I bring this up now because I, and others have been adding new image
> > features to obmc-phosphor-image (e.g. turned on by default), and I
> > would like to start a discussion about what it means for an
> > application to be in the OpenBMC github organization.  I would propose
> > that it means it is enabled and turned on by default in obmc-phosphor-i=
mage.
> >
> > Looking forward to your thoughts.
> >
> > -brad
>
> As a general description, this sounds great, but as always the devil is i=
n the details.  The biggest obstacle to this I see is that we'd need a poli=
cy and design around supporting mix-and-match on features, which I don't th=
ink we really have today. Today, most features don't mix and match well, on=
e example of this being entity-manager requiring intel-ipmi-oem.  Thus far =
for that simple example, nobody has stepped up to make it a generic yocto f=
eature and separate out the code, despite pretty widespread adoption.  I th=
ink the idea that we're suddenly going to just start doing a better job of =
feature separation because of a single patch is a little naive, and I'd rea=
lly like to see the project make steps forward toward that before we create=
 a minimal image.
>
> If we want to do this going forward, my personal opinion is that:
> 1. Someone needs to go figure out an example for one non-trival, cross ap=
plication feature with multiple options, and get yocto sorted such that sai=
d "feature" enables the right component options.  Entity manager might be a=
 good one, phosphor-webui vs webui-vue might be another good one (I'm looki=
ng into this currently), or individual Redfish resources in bmcweb might be=
 another.  There are a bunch of examples of this you could start with.
> 2. Document a policy around what it means to be a "feature" including som=
e relevant examples.  Is Redfish a feature?  Is IPMI a feature?  or are tho=
se just interfaces to access other features?  Do we need a hierarchy of fea=
tures?  When/where should we use DBus to determine feature enablement, and =
when should it be a compile option?  We've been very inconsistent about the=
se questions in the past, and it's part of the reason that adding "features=
" properly is hard.
> 3. Someone needs to go through the user-facing clients (phosphor-ipmi, bm=
cweb, ect) as well as the recipes, and make sure command handlers are organ=
ized in such a way that they're enabled or disabled by feature, and we can =
successfully enable one feature at a time.  This will likely expose some in=
teresting dependencies (like how IPMI commands have to be enabled/disabled =
by library) that we'll likely need to tackle.
>
> If the above tasks just fall onto the subsystem maintainers, who now have=
 to field the "I enabled X on my minimal build and it doesn't work" type bu=
gs, that seems like a non-starter, and likely to cause more confusion than =
the current status quo.  If someone or group of someones is willing to go d=
o the work, I think it'd be a great benefit to the project, and something t=
hat would help a lot of people.  I'm happy to pitch in as well where I'm ab=
le.
>
> [Sharad]
> All the issues (and considerations to resolve), you bring up are great. I=
t will need policies, definitions, and categorizations as you point out. I =
think it will take quite some time to get there and its unlikely that we wi=
ll achieve perfection. So we may have to start with basic, add a bunch of t=
hings to make it a minimum BMC (I think the first step will be agree what t=
hose minimum feature set is), and then be able to add from there. It may no=
t be very granular (as there will be interdependencies), but even if we hav=
e a few such configurations/combination of feature it will be useful for so=
meone to start with. I realize this doesn=E2=80=99t solve the problem fully=
, but I think it's much less effort and hence easier to start with.
>
>

I like to think that's what I proposed, starting small, with 1 example
of how to do it "right", then building on it.  I'm not looking for
perfection, but I'm looking for commitment that we'll continue to push
this forward in places where we haven't been that successful in the
past.  If not, I think it has the potential to confuse what is already
a complex and bifurcated build environment even further.

One minor thing to clarify:  I had imagined Brads proposal of a
"minimum" BMC would have essentially nothing added, and would just be
a kernel that boots, with no interfaces, services, or handling.  Is
that what you were thinking?  I had not imagined that we would never
"add a bunch of things".  If so, maybe I misunderstood what Brad
proposed?
