Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11883313CB2
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 19:09:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZDZX1BZbzDvVL
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 05:09:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VFTakFuv; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZDYj5VsszDrRQ
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 05:09:09 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id v123so15423432yba.13
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 10:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnYkXFC3kHXuCkZZQbORLJiD+qhdw5zbaipGsHHvY6I=;
 b=VFTakFuvqYwsP4beIfSYd5bHRnsb2eeBbxV2fpYV5mJVUrPH6A69UKBWBo1No/9IaT
 qfHyRvQN9suSs0wIa6lxKx5dZJn9sZtQecD0qF8ZTDrLccL52QRUnJZ24pAr8IkbLx9F
 Lr3i9PmeqG2pq92BZgm0JG3KngxddplldAG7O+MpLAq54YLwqaaLIy3sUz8809NDgqbU
 ZLzzc2bCTeffqm+1KcqqsW678rv34s5yGuPgtRNb0EjGZ1LCFpnY/yFVC6aItWEIbCYJ
 yENO/BACXzdDh2N7hXiOqziL0FUN3mg8EkWLk7twrwTMIW2yQVS/PYEPzVPSNAdITvA8
 UQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnYkXFC3kHXuCkZZQbORLJiD+qhdw5zbaipGsHHvY6I=;
 b=p5mk8TSZ5YFjn0l6qk826a2i4h/h7LeleKMUw6X9lJ88a7f2gUsRmEMT+hcfX84mAu
 zxJNraigeA4OZmDAnMJSpj+ofSv5xiqPH5WAjTNTcWIEij45fM7I1kT6KW+TgXtcPti1
 8OiFszmYX5riLtdOgga2vt3tTXuoOVUBDqgdX+vUGLUFl02GDgsvHvpuNQITHF9UuzUu
 Lmold39UjnNdDIqbLi3xPIKwY9Cbg3iDjkGezVFFdTlBTH2QWPDdKeg3gptXXYkP0Dc8
 fLeIcdIoROCvxBMVJrrnIAFgomRKL6HQjj6C5s322NP8/IThSybrCtRdDMWHsCMeMZJR
 FxVg==
X-Gm-Message-State: AOAM5303BAa00T5aaN7ObSUazef12b3zpoLrFWaEiDp+g1YzI7lRvfLN
 QFe9pPZYPj8XUNSNL52wjKqverKTZmZO3egoDZUb9Q==
X-Google-Smtp-Source: ABdhPJwsj7silK5Gb4gI8NNevIaJ0VJ3nR5IJ4mmgat+DOEjoBuQyINZYydfEH/T0MIgSsPRb4xvuPu5Ymg/DRubgT0=
X-Received: by 2002:a25:7356:: with SMTP id o83mr6425475ybc.170.1612807744692; 
 Mon, 08 Feb 2021 10:09:04 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <20210205205811.7xdjwjekmoaqnzvu@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20210205205811.7xdjwjekmoaqnzvu@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 8 Feb 2021 10:08:53 -0800
Message-ID: <CACWQX81Y+tjrcZhJns_TiK0RJcyCXFDqbKGeV5GsdNukcHwwXw@mail.gmail.com>
Subject: Re: Making the "new repo" requests go faster
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 5, 2021 at 12:58 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> On Fri, Feb 05, 2021 at 12:02:31PM -0800, Ed Tanous wrote:
> >An issue I've seen in the past with adding new repositories, is there:
> >1. Isn't a clear place to push code reviews for something "new".
> >2. The project quality/CI/formatting rules aren't really enforced
> >until after you request a repo, then push code to it.
> >3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
> >4. "state of the art" build constantly changes (make -> autotools ->
> >cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
> >service file location, ect).
> >
> >In an effort to fix these issues and more, I'd like to propose
> >creating a new repository for a "new daemon" template.  The hope would
> >be that we can centralize a single set of "current state of the art"
> >guidelines in such a way that they're usable more than just checking
> >them into documentation.  Initially, template repo would contain:
> >
> >1. A meson file, that compiles a "hello world" dbus application that
> >requests a name.
> >2. All the relevant .clang-tidy, .clang-format, and cppcheck files
> >required to ensure that CI is testing as much as we can.
> >3. Unit tests
> >4. Pre-integrated repo CI.
> >
> >The end goal of this would be that when new code is created, whomever
> >was looking for a new repository could push a gerrit review to this
> >"template repo" and the CI could ensure that it met the automated
> >quality requirements long before any maintainer actually reviewed it.
> >This would likely reduce the time it takes to propose "I want to add a
> >new repo" and make a procedure for doing it a lot more concrete than
> >sending an email to the mailing list.
> >
> >As part of this, I'd also want to deprecate and remove the .clang-tidy
> >and .clang-format that are present in the docs repo, and supersede
> >them with the files in the new repo, such that any changes to the CI
> >infrastructure could be proposed on the template repo first.
> >
> >FWIW, I take no credit for the above idea, I 100% stole it from James
> >Feist, who thought through the broad strokes of this a while back when
> >we were talking about how to move new initiatives along faster without
> >burdening maintainers.
> >
> >I'd love feedback.  Do others think this worth doing?
>
> Yes!
>
> These are all great ideas.  Thanks for tackling this.
>
> Since I'm the only one with the right gerrit/github authority to create
> repos, I've obviously been the cause of the delay (there are others that
> can but this isn't really something they'd be comfortable doing).
>
> For the record, making new repos from a logistics point of view is not
> hard and not any sort of burden on me.  I'm happy to do that.
>
> I don't know if this is a good excuse or not, but I just want to say
> that in a some of the past cases making the repository took so long
> simply because there did not seem to be any clear consensus on whether
> the new repo was good or bad for OpenBMC.  When you combine that with
> the fact that I'm not really good at making unilateral decisions, many
> times the result was "analysis paralysis" on my part.  This is a big
> part of why I'm creating and excited about this:

In a lot of these cases the community consensus is really hard because
there's no code to look at, just a short description of what could
theoretically go in that repo.  I think a lot of that becomes easier
if we invert the model, as we can talk in concrete technical terms,
coordinate on gerrit, and have the recipes up and building so others
can determine their utility long before the repo is created.

>
> https://lore.kernel.org/openbmc/20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com/#t
>

I think this will help a ton as well.

> -brad
