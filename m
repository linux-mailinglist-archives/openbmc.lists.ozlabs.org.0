Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60F45CE23
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 21:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzt813xkGz2yxL
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 07:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RGL665Fm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=RGL665Fm; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzt7X4Ctrz2ynG
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 07:35:52 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id z8so7952724ljz.9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 12:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W54IP7ZfTzOTv8YEG94wvKQzkghls5bBy75RxgiZ+Oc=;
 b=RGL665FmhjUZQ8uT209FuyJtmIJBiFgyfKOSntBuy27KplTh7Vwh7g7fi2+e6IXZvK
 Eq3ZJwqSYday+l+teo+LpqMHEp6ZasmPSL9JCqXpJYQZpSzjt3K4L3sMF0ib0sLecNjK
 vVlep+fCEj4BA9VCbUIeRCeoLCmXOMcKhtnDnEvkQ54GXu1ipyxHnbeAPl5VIMVFn7KC
 kTnnN436lFlbEK2qa/lrjTVGcidofk/wOGrw+AzPOjT0wWFqKtdp83m93qgqiaDMaMN3
 HXyNVOcR0wzyd199svmJ7Rc1FbTiTN2zJ0Y0uTS4dgiDsmEgXTwqRUHyeGMXfOwxpkiy
 ZV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W54IP7ZfTzOTv8YEG94wvKQzkghls5bBy75RxgiZ+Oc=;
 b=mzBiJdbXwrzpcn3VLJS8ys1zUe1lDKeUMjbVIy+d5qweag3r+1OyIOGhpxLC7hKNBI
 IWL8F4gGiIvqGN7Iz2qURzLOL5gKMC5LXE95NZSK+oIXmL0eU3ORzpkHDjBHXTtJP/2K
 rQ3PXZKKH5+3+ipmMBHSy7HwJ9n0270aFSJdVvxF70E5VRa+BpXXsXsAstSHQ+3p7PQ9
 tG6SsdvVsS/+yDKsK/BdZFBF7gtEI2Sy6Xjy5kk8BRkNRfV0W+EwVne0VQX7L32ZBzUA
 I3JunkrkZDLeHuJ5bL/mL7Qmcg6ajZqL22Npf+UqLkL6jFU4eurcaSn0JeHcLO99lXTb
 2jgA==
X-Gm-Message-State: AOAM532Rc4uXgPehT3ke6ylsa5vGkPZDhyFJNlIRA6BrlN9lelYrUD7O
 DJshc1kus18B/RQQiAkm/MEiSpE5JRb90XfJBSfE8Q==
X-Google-Smtp-Source: ABdhPJwzEufKnCHLo6+lDSeUT7VkUWObuaEaaPgOjqHmlU+vthQOtdPxB6R0rrkDqSelBLue5klWuApY3S3C7TcOPhE=
X-Received: by 2002:a2e:7801:: with SMTP id t1mr19792158ljc.253.1637786143468; 
 Wed, 24 Nov 2021 12:35:43 -0800 (PST)
MIME-Version: 1.0
References: <CABoTLcRtPYy_Yim20FCcX6qS--t7KD81GOZyT9pKV8OwuhLPrg@mail.gmail.com>
 <YZvLdFJnQM+GB9yy@heinlein>
 <48d0cc9e-6ab6-4d94-a8aa-1be8b8c1f155@www.fastmail.com>
In-Reply-To: <48d0cc9e-6ab6-4d94-a8aa-1be8b8c1f155@www.fastmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 24 Nov 2021 15:35:27 -0500
Message-ID: <CABoTLcS1=8fp09RZxxpfha3L7REEgaBht3ivtCx5Ex-y5aDx7g@mail.gmail.com>
Subject: Re: Making obmc-console_git.bb more generic (again)?
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Patrick Williams <patrick@stwcx.xyz>
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
Cc: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi everyone

I just sent https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49082
for review.

It took me a while to test (mainly because Yocto is weird). From what
I can tell, this should be fully "backwards" compatible with existing
meta machine layers that do or do not use the OBMC_CONSOLE_HOST_TTY
variable.

Oskar.

On Mon, Nov 22, 2021 at 6:20 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 23 Nov 2021, at 03:25, Patrick Williams wrote:
> > On Wed, Nov 17, 2021 at 05:01:25PM -0500, Oskar Senft wrote:
> >> Hi everyone
> >>
> >> I noticed that as of
> >> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/30369 (aka
> >> https://github.com/openbmc/openbmc/commit/abf95efe7c3a34cc2e5d7424abb59710fb4a1d4d),
> >> obmc-console_git.bb assumes that we always want to use ttyVUART0.
> >
> > There was a push to move service files outside of the openbmc/openbmc repository
> > and into the underlying repos.  Brad could comment on why as he was
> > asking for it.
> >
> >> We used to have support for OBMC_CONSOLE_HOST_TTY and then create the
> >> symlink /etc/obmc-console/server.${OBMC_CONSOLE_HOST_TTY}.conf as
> >> needed.
> >>
> >> From what I can tell, OBMC_CONSOLE_HOST_TTY is still used in quite a
> >> few machine layers. Some of them (e.g. meta-amd and meta-facebook)
> >> even went so far to replicate the previous behavior by deleting
> >> /etc/obmc-console/server.VUART0.conf and then re-creating the correct
> >> one.
> >
> > Speaking for the Facebook machines, we have some machines which use a different
> > vTTY and we have other machines which manage multiple hosts and thus have
> > multiple vTTYs.  We probably should have contributed code to pass the desired
> > vTTY(s) as a meson-option.
> >
> >> Is this actually the expected behavior? Or was that just an oversight
> >> in the commit?
> >
> > I think it was the "put the default/typical config into the repo and let
> > everyone customize it otherwise if they need" approach.
> >
> >> I'd be happy to send a review request to make this generic again if
> >> people agree. A bunch of follow-up commits could then remove the
> >> duplicate code in individual machine layer overrides.
> >
> > I'd be thankful for this.  Please feel free to add me as a reviewer.
>
> Yeah I'm not sure what happened here, whether that was something I did
> or if someone's made changes to the recipe since. When I added support
> for exposing multiple devices from the one BMC there were some
> complications around not breaking everyone vs having to modify every
> in-tree consumer. I didn't have the bandwidth or ability to test fixing
> all the platforms at the time so I put some work-arounds in the install
> phase of the obmc-console recipe. Maybe that broke things?
>
> Anyway, please also CC me on cleanups.
>
> Cheers,
>
> Andrew
