Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E545D32F363
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 20:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DscZ56hbgz3dFc
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 06:02:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=LaNx5q/t;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=LaNx5q/t; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DscYt0861z3dFM
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 06:02:39 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id l8so2991911ybe.12
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UEOBvM3p0xLV+RZ3NP1a17Bh+46g61CTOaw4103x1n4=;
 b=LaNx5q/tl1heygUQNTYZS4w+KTdlt3rMCE1fCk4uHdg+/5LqFlgok/rh1/CvKS1XJV
 HENtDOrmiSzG9/eOL3ZJfYC8PzVX9l3b1QPjKzRrs1qwzYMgoQdQjEsmZM3zPwCLxtbU
 PWb143mnWOY+20Hsdteg5iBGY3I4A9ZCk/7IPz9ek7h0GzqTHWJRx84p2ivgf0IG4ZUO
 GZdrdQ8EAxU/reUPPBJiHGg3dTOMXcH8UmmkJzRoOKLlH2gv140lM9L10Evx/+YHdfAc
 lS3DU7m41VREft7Vz/DaYpeY3bLH/c7MJ7+4A2yTWz8OFedFOCTTvjyx4ZpiF3SxRa/V
 KOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UEOBvM3p0xLV+RZ3NP1a17Bh+46g61CTOaw4103x1n4=;
 b=pGmFft+INIFBunmgNUwmLaq/FrHoJvN6xAX/YMhAqfrGTo39CGa03Y7ymNaxlHXafz
 S55ZMnuQGNjaMgASn5UYZOGp4leffu7t9Vc4Ib37jWnHIkU+nDUidcqeFunlqzfM8Q8u
 qH6zGVwHS94HOkQ7l0pFuFTpv1cIRpFQNXz2A0GDIlccitSvrOE+IBh4WTmiXXTjB2qy
 50b1eEXCcclKKMcPnCYre1OFusTcWRyUgwKTFsDHpELzxFu2jllDH4U7tHfTM/9kqnO/
 n5sTEkYokna+x/ubPDnVGMlbR0/UR4wjUkTwLe8pSTH31TT9Fs+gwKSiYivilyu4fGoo
 z87w==
X-Gm-Message-State: AOAM5325uA03xF0RZ7poeRMpdqbu3eKx0Qc4TD2SLB5fUscRJjnNAcSz
 ypcjUd+PRQ7IjHaL3EbjQnm9PM1baB8HqZpg/VtRHDZQ38o0O16Z
X-Google-Smtp-Source: ABdhPJxmTJX0qevP4J2fyLYYN2buxn0XxqMs3nnPludFbdERKjxPYZ1wuKwysNZqplgm0HrDlLhLTPT/2YRNjF4YstY=
X-Received: by 2002:a25:8687:: with SMTP id z7mr14506845ybk.209.1614970955777; 
 Fri, 05 Mar 2021 11:02:35 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
In-Reply-To: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 5 Mar 2021 11:02:24 -0800
Message-ID: <CACWQX82OCCAkUzdvKv4pj2YgOL+Y+SifJKAbGOEnZ_MuVyB2+A@mail.gmail.com>
Subject: Re: Making the "new repo" requests go faster
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 5, 2021 at 12:02 PM Ed Tanous <ed@tanous.net> wrote:
>
> An issue I've seen in the past with adding new repositories, is there:
> 1. Isn't a clear place to push code reviews for something "new".
> 2. The project quality/CI/formatting rules aren't really enforced
> until after you request a repo, then push code to it.
> 3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
> 4. "state of the art" build constantly changes (make -> autotools ->
> cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
> service file location, ect).
>
> In an effort to fix these issues and more, I'd like to propose
> creating a new repository for a "new daemon" template.  The hope would
> be that we can centralize a single set of "current state of the art"
> guidelines in such a way that they're usable more than just checking
> them into documentation.  Initially, template repo would contain:
>
> 1. A meson file, that compiles a "hello world" dbus application that
> requests a name.
> 2. All the relevant .clang-tidy, .clang-format, and cppcheck files
> required to ensure that CI is testing as much as we can.
> 3. Unit tests
> 4. Pre-integrated repo CI.
>
> The end goal of this would be that when new code is created, whomever
> was looking for a new repository could push a gerrit review to this
> "template repo" and the CI could ensure that it met the automated
> quality requirements long before any maintainer actually reviewed it.
> This would likely reduce the time it takes to propose "I want to add a
> new repo" and make a procedure for doing it a lot more concrete than
> sending an email to the mailing list.
>
> As part of this, I'd also want to deprecate and remove the .clang-tidy
> and .clang-format that are present in the docs repo, and supersede
> them with the files in the new repo, such that any changes to the CI
> infrastructure could be proposed on the template repo first.
>
> FWIW, I take no credit for the above idea, I 100% stole it from James
> Feist, who thought through the broad strokes of this a while back when
> we were talking about how to move new initiatives along faster without
> burdening maintainers.
>

If anyone is following this thread still, patches have been pushed to
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41099 for the
moment.  As they get closer to approval, I'd like to get a new
template repo created to house the code contained in that patch, and
CI setup on said repo if I could.

> I'd love feedback.  Do others think this worth doing?
>
> -Ed
