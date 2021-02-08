Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A3313CDD
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 19:12:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZDdV1qz6zDsxN
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 05:12:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=q4zVz0YF; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZDZm66P2zDvVS
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 05:10:08 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id i71so15487702ybg.7
 for <openbmc@lists.ozlabs.org>; Mon, 08 Feb 2021 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YjttA/a4UBC8KQi5on1TQ5uPrz40S+1nBopE8dsKOdQ=;
 b=q4zVz0YFPMhjxkoXMgm1V+CnPZ/PyIAIlzgKMBqAE0nUOwDw58JO33TqM/3PWMxT8e
 gI2xoKw/EmKnia45nH1WdJiyaI9D8C5PdMXc+Xna97t1oRaJk0GulKzi0tPZdHqBvnw+
 7Vj1XmRP17uQaZ4EIctPVV7/fSEZSK7r0tDrSOqIlFK25O2gQgCQenTdkWSDL6FNOR8j
 0f+Th2FtH3OlVA15Z9RgiHqkNAeFQq9nvYKrZR0b3W2x6+RAE19BKK8yR/T5IZUcA40V
 k/nz6aS6p+D78UjdMTGRWPYa0Ppw71zU9Q4H0uIUOqBgoPqMYlVknIt185t00OTsddfj
 dwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YjttA/a4UBC8KQi5on1TQ5uPrz40S+1nBopE8dsKOdQ=;
 b=pP/RIO5NHDuplbsZ537wulH6VnaAr2bB3od8SGGHmddYTLQZ4afP8P/LP2DFmaNvU4
 XQ7A/oxCGgmHzzL0wXFeDS8YYVBUjiKxudg87A9ARshDkUPO1d9nU17y7NrH6NU8cGQC
 Nwm69CRsAeuLR2P5AYhN6kru9xd9iY/4khLn2vagWO2mAdkw0fiBUhxndkNbYZZkamvX
 gpaJ1Z3u+/Ask6G9MoyqEiiC1941/jRoOGtm2rJq3kfDwAZ11a1YQ44+rmLpb+5MIO/2
 h1bioVAEnn7yrWe9af2cZwPEyHAWDpU8mXeInvP6RNNIB4sEmt+hMwL8O/E17izMC+Hp
 gEnQ==
X-Gm-Message-State: AOAM5325JGnKoIcL/9+Z7buJOcb4Ml8Sl8hbZITwlMW/p0vpvivCpBs8
 LxCsdFg49VCDzubj6ZpVyXU+H7LT9voqW9e4e1ihHZMdVWkWog==
X-Google-Smtp-Source: ABdhPJyXQoSQHx1r/O8eVFuUW5ehhytmvFuUR2UMHd35/YNOutlx02cpv3NYHbIbl9ceY4ypfBY5TZbk1fkYouB2Cz8=
X-Received: by 2002:a25:8687:: with SMTP id z7mr6079935ybk.209.1612807804767; 
 Mon, 08 Feb 2021 10:10:04 -0800 (PST)
MIME-Version: 1.0
References: <CACWQX80G75i+s8Vcro64uEyvcZn1Dc60y-coS6GqrvkJo59Kqg@mail.gmail.com>
 <c3485284-2ead-ec47-e277-da1694fb6127@linux.intel.com>
In-Reply-To: <c3485284-2ead-ec47-e277-da1694fb6127@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 8 Feb 2021 10:09:53 -0800
Message-ID: <CACWQX82EoPypNGYfy29wziWFHbq4kzOrYoc3StyS6TpgTKpMQQ@mail.gmail.com>
Subject: Re: Making the "new repo" requests go faster
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 8, 2021 at 9:29 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
>
>
> On 2/5/2021 12:02 PM, Ed Tanous wrote:
> > An issue I've seen in the past with adding new repositories, is there:
> > 1. Isn't a clear place to push code reviews for something "new".
> > 2. The project quality/CI/formatting rules aren't really enforced
> > until after you request a repo, then push code to it.
> > 3. Setting up a new daemon with CI/build is non-trivial, and has sharp edges.
> > 4. "state of the art" build constantly changes (make -> autotools ->
> > cmake -> meson, clang-format, clang-tidy, shellcheck, cppcheck,
> > service file location, ect).
> >
> > In an effort to fix these issues and more, I'd like to propose
> > creating a new repository for a "new daemon" template.  The hope would
> > be that we can centralize a single set of "current state of the art"
> > guidelines in such a way that they're usable more than just checking
> > them into documentation.  Initially, template repo would contain:
> >
> > 1. A meson file, that compiles a "hello world" dbus application that
> > requests a name.
> > 2. All the relevant .clang-tidy, .clang-format, and cppcheck files
> > required to ensure that CI is testing as much as we can.
> > 3. Unit tests
> > 4. Pre-integrated repo CI.
>
> +1 on this.  This would be very helpful for knowing how to set things up
> with the latest set of tools.  I know in a crunch, I would tend to leave
> some of these things out because I don't know how to get started on them.
>
> In the future, it would also be nice to expand on the basics with some
> common enhancements such as build options in meson.

Good idea.

>
> >
> > The end goal of this would be that when new code is created, whomever
> > was looking for a new repository could push a gerrit review to this
> > "template repo" and the CI could ensure that it met the automated
> > quality requirements long before any maintainer actually reviewed it.
> > This would likely reduce the time it takes to propose "I want to add a
> > new repo" and make a procedure for doing it a lot more concrete than
> > sending an email to the mailing list.
> >
> > As part of this, I'd also want to deprecate and remove the .clang-tidy
> > and .clang-format that are present in the docs repo, and supersede
> > them with the files in the new repo, such that any changes to the CI
> > infrastructure could be proposed on the template repo first.
> >
> > FWIW, I take no credit for the above idea, I 100% stole it from James
> > Feist, who thought through the broad strokes of this a while back when
> > we were talking about how to move new initiatives along faster without
> > burdening maintainers.
> >
> > I'd love feedback.  Do others think this worth doing?
> >
> > -Ed
> >
