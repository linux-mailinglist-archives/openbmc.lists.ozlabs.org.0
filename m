Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF32EE794
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 22:21:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBfL93BHxzDqV1
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 08:21:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=pqhc4FbW; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBfJx0HfZzDqZX
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 08:20:16 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id g185so6723763wmf.3
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 13:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dz2VFT9BOovf5/OXY8EGv4UbF9nMKrZ/PhbPb41hoQg=;
 b=pqhc4FbW4/sf97+Pm4jrPLJ17xiwIUqfLzBh3dg6lHvzcryGpd0yr7XgdJ5M/5OYvo
 iYSJStjjqLuowCf/dV2dYLgD4sfHpUEH3YbBrcDbt6hbMWr/W3HGD5icUGY+ej/oF5p1
 VDMKzr7LUIKvQqdMlp/JSORK0mSDGmMCVBCjoYh8EQ7iEoju/hnDxLmGWJBruvPtmgcK
 yRAvfKTuf8l+YSdm75bIjtQIhL+wNcR6fMmilchR0HlRHcC9e77JxkyRXM4TpsK718LL
 jDYadu9dqFchQqxqYbZ9Un8b18kkgcKmfXb14z+GQfxkAGibZrVImSVwMDbTQeHjFISC
 C9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dz2VFT9BOovf5/OXY8EGv4UbF9nMKrZ/PhbPb41hoQg=;
 b=dr5T8vIc9VmFOBOFhd+nBT08Qi8sYT+daIT5QY6OwZIvC4rSx2uPujZKN5MHMHpUTE
 z3b39+hAuIeMx0SyX4HSXp8CSOoylcB61op4/PsLVxdEPSTvvsqyEJ/5Jy5OlsuoRY6I
 aUwHIZJzot6rUHGtJexmPaLHfVBJySDeAGTtVgOy1D7N0njv8USxB/Q8DKgnmtZDxjVX
 WI+w5/1ZAjAh1fw3RYhwtNlYnn24Ik3NIhO2LB7E7zLJDgMqoOKF1oFbg5hT5nA02eLk
 k3EO3wMar5V3PYoyMfpBy1gXwUnG2XVQlRPTwpOJyRXpTS7E+ZEB3ao48mvpp/aMIldG
 C7Yw==
X-Gm-Message-State: AOAM533lqSJTN7CmU7odMLQRzDQpV4+NrpGtacn2vlaIKB+pSvY96LQw
 v+eJf4NM/HPmtrz/LUthEfN1FZjKsrBVSIkEXYveFA==
X-Google-Smtp-Source: ABdhPJw/e2qZTRGcp5GwFjn9iACxV3Y7/aa6s00C9ApG4Xwz/e91jfiNYIhintEL4zHubyTqCXYmtUM0ucapvWVaUdg=
X-Received: by 2002:a1c:7213:: with SMTP id n19mr383204wmc.14.1610054411703;
 Thu, 07 Jan 2021 13:20:11 -0800 (PST)
MIME-Version: 1.0
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
In-Reply-To: <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 7 Jan 2021 13:20:00 -0800
Message-ID: <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
Subject: Re: Upstreaming downstream Google BMC repositories
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Brandon Kim <brandonkim@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
>
> Dear Benjamin,
>
>
> Am 07.01.21 um 18:33 schrieb Benjamin Fair:
>
> > On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> >> Am 07.01.21 um 02:49 schrieb Brandon Kim:
> >>
> >>> We're exploring ways of upstreaming some of the downstream repositori=
es
> >>> from Google to openbmc/* .
> >>>
> >>> Half, if not most of the downstream repositories are C++ daemons that=
 are
> >>> specific to Google so we didn't want to create a bunch of new
> >>> openbmc/<repo> that no one would use.
> >>>
> >>> An idea that Ed gave me was having something like openbmc/google-misc
> >>> repository for all these repositories and if there are any that seem =
useful
> >>> to others, we can break it out into a different, separate repository =
in
> >>> openbmc/* layer.
> >>>
> >>> Please let me know if this seems like a good idea and I'm open to oth=
er
> >>> suggestions!
> >>
> >> Thank you very much for putting in the effort to make these repositori=
es
> >> public.
> >>
> >> Using the openbmc/google-misc approach, how would the git history
> >> (commit log) be handled?
> >>
> >> Personally, I would prefer having small repositories as git makes that
> >> very easy to handle. Also it might save you time, as you do not have t=
o
> >> think about what to do with the git history, and do not have to merge =
it.
> >
> > We would most likely squash the history together, in case there's
> > something confidential or private in the earlier commits.
>
> Understood. If that could be avoided, and only the confidential stuff
> removed, that would be great, as the git history gives a lot of insight
> into design decisions.

It should be noted, there isn't really much git history to speak of
for the things we're looking at pushing.  The intent was that we'd
write good descriptive commit messages when each piece was pushed.
With that said, I very much suspect that these things won't be
terribly useful outside of google.  If they are useful outside of
google-built systems, they really don't belong in meta-google or
google-misc.

Some examples of things that would go in this repository.
1. The google public keys/certs.  I would hope that non-google systems
are using their own root certificates.
2. Disabling of ssh login flows.  This is done in a very specific way
that requires interfacing with out of network components and protocols
that are specific to our systems.  I'd be surprised if anyone found
this useful.
3. In-band telemetry code implementing interfaces for interfacing to
google infrastructure.  These haven't been built yet, but will likely
be a translation from the public facing APIs (Dbus/redfish/ipmi) to
interface them to google infrastructure.  it's unlikely anyone else
would use this.

>
> > Many small repos would be easy to handle for us, but OpenBMC may not
> > want to have lots of small Google-specific repos in their org as this
> > may make it more cumbersome for others to find the relevant repos that
> > they're interested in.
>
> Understood. On the other, with small repositories, they can only use the
> parts they need.

See above, if there are pieces that people want to use on non-google
systems, they don't belong in meta-google.  With that said, your
statement is incorrect, recipes are not required to be 1:1 with
repositories.  Multiple recipes can point at subfolders of the same
repository, allowing you to "use the parts they need" by simply adding
recipes.  With that said, this is not the intent, and I would much
rather move code to a more common layer (meta-phosphor for example)
rather than have non google systems including meta-google in their
bblayers.conf.

>
> > There's also overhead for the project maintainers to create the
> > relevant groups and permissions for each new repo.
> Please note, that Without knowing the contents of the repositories and
> the size, this is all just my opinion. If the OpenBMC =E2=80=9Cadmins=E2=
=80=9C can
> easily create several repositories, I=E2=80=99d prefer that route.

Today creating new repos is non-trivial, and IMO we already have too
many of them, which is causing a lot of thrash.  I'd really like to
see us start consolidating some of these (see my patches to
consolidate all the meta-layers into openbmc/openbmc with the owners
plugin)

> If it=E2=80=99s too
> much work for them, their preference should be chosen.
>
>
> Kind regards,
>
> Paul
