Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CE259B30
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:59:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgtZz0T6WzDqGN
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:59:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=NWMTkGKR; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgtXG4zwGzDqQd
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:56:59 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id h126so1200963ybg.4
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hL/wsCEtfAoDawU5XuheNKUT92YVFIYe+MIClRmd/5U=;
 b=NWMTkGKRDLrCu4Fg+mqtZB+TkIsjuopkgXcCpnazrLXTmzjhni29kT7FAL0b/SWS1y
 5nNM2exXDi5n4D+ojxrwe2cVZtsn7sOWtrEWhZwm7P0yhatZQMb3kLe+xRztHdBYSskA
 3YN9xguxIAI0GRDqk9UtvksJLLUwFLlDCP5S6MqIPHhZNfAQmz5Gj1eT+yyEs9OdSNun
 eGOldLwkvEwPJbiaupGJvOmDnHL785zHxmampInV15tYusSnsZNv5GsEn4RW3c46QMwS
 W4oXunuaMMeWSKrBZIQFHSbsFUEwPKSlYxn6rDEgC7cA54slBdOPUl91q6RpW3bI1lOd
 W80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hL/wsCEtfAoDawU5XuheNKUT92YVFIYe+MIClRmd/5U=;
 b=tdnEw6kAguA8bu9eedittU5+rH2guQBASglq/vuHvwcjj+ErbSqMPf082HWIq1QlyD
 6+ee4qlGanSTSyrZ4HidDTBOwBERv8B9NpAFaZE5kahNZFYoWtV8Z9Ng0U7S0EPEPrCd
 OhYrK9BJU1htkunHL5538zhqkuRZwri8wt2PYI2XTU09ok8FFK5T5lSSnKVhqF1lIsp2
 7jZXZKAQM/1/BNwFrFfc65NDlaKzfaH8GJ7PCWoxFkWTdffq/8uj9r5SY7U7ZPKLmCOY
 ukMaldsoyr+mEkztojIiMBlajV1vLYZv6DyL92buFxtV34nEaXNuVKMzdtSsneQlHy9B
 kuwQ==
X-Gm-Message-State: AOAM533+qbTqR2uC629a/JgdLDyuVmOPwriOexP1744tXu0xEzSYSUIM
 JFJBwIkA+DOPeM9FPo+HGOqm6hpUD/yZRnb1uES9Ug==
X-Google-Smtp-Source: ABdhPJyxmRMbRAGpADNN+Fb/gqW3fFq6dtYbxpC4AycOp3ZLqHCGzjBu6N0DtLVRhHeSbCJ//5C9Erutjsqk/qzKgqw=
X-Received: by 2002:a25:d4e:: with SMTP id 75mr3818843ybn.480.1598979414961;
 Tue, 01 Sep 2020 09:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
 <20200901162025.GS3532@heinlein>
In-Reply-To: <20200901162025.GS3532@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 1 Sep 2020 09:56:42 -0700
Message-ID: <CACWQX82tn757sPn2zF7moN=GjdkkzSdS8aNsfq59c9taLG7fLg@mail.gmail.com>
Subject: Re: When building OpenBMC . . . ?
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 1, 2020 at 9:20 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Sep 01, 2020 at 09:09:33AM -0700, Ed Tanous wrote:
> > On Tue, Sep 1, 2020 at 5:26 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > > On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> > >
> > > #2 should go into either meta-facebook (or the underlying code
> > > repository where the fix is needed).  These will be common for any
> >
> > +1
> >
> > Could we also make the statement that as a project, we will enable
> > every platform feature we are able to for every platform by default,
> > and if a company wants to specifically disable some features for their
> > use because they haven't vetted them, they should do that in a
> > specific distro?  Said another way, the "default" for every machine
> > should be every feature enabled, as that's what helps users and
> > developers the most.
>
> I think this is where we get some conflict between, for lack of better
> words, commercial and hyperscale philosphies.  We may make a decision
> that we don't want net-ipmi in our datacenter, for security reasons, so
> we have it disabled in our meta-facebook layer.  Yes, we could disable
> it dynamically like a customer of a commercial vendor might do, but it
> is simpler to not even have the code in the image.
>
> Today we've combined machine definition and image definition into a
> single meta-layer across the board.  This is probably reasonable for
> a single vendor who designs their own machine in-house

Single vendors have the same problem.  Customers of said vendor want a
build that "just works the way they want", and don't want to mess
around with changing configurations per-machine, uploading public
certificates, uploading webui customization, or having the possibility
that an insecure protocol accidentally gets enabled in prod.

>, but is less
> reasonable for cases like Facebook where we do our work within OCP and
> others can order the servers we've designed from various ODMs.

There are companies using hyperscaler platforms that have net-ipmi
enabled.  There are companies that have transition plans to replace
one protocol with another, and at some point, will "flip the switch"
moving from one protocol to another.  I think explicitly separating an
OpenBMC featureset (for lack of a better word) from an OpenBMC
supported machine will lead to a better result overall.  I also think
it has some nice scaling properties as hyperscalers ratchet up the
number of system types they support, they can have more reuse of
featuresets between machines.  Also, when debugging said machines,
it's really nice to have a folder (meta layer) of "what's different
between machines" that's separate from "what's different between our
build".  I've used that many....many times to do A-B compares to find
elusive bugs.

Anywho, I think we're mostly agreeing.


>
> --
> Patrick Williams
