Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 318F626E6FA
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 22:57:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsq6Z2nNJzDqgF
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 06:57:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ZnFj8w3Q; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsq5f03tszDqfX
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 06:56:50 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id g96so2640156ybi.12
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 13:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JmPDFocZI4UY744fTRFTWJ5s7XgiLsk2InTaCnzzKZ4=;
 b=ZnFj8w3QFbOs4r++33McuJjMMn1bTHg2ckNCMTQ2a6Cex6q4ouVm3BdNwqccDc49gO
 xTE+Yrub4XCJKRvfpa151bFPMmjK/qylqxeZuiwR0KqoO2nO3+3IIbyDowAMhZVdicGb
 dYan34xtiiInHCegw8SAaPFsJ3DSodRhbtdBJVh3ZkhUayWLCjgwsXJn7BEP4fzHNYDy
 u6fti5HkXP53Y9TfUE/KzPlzzjiLgybfHW75pgo5BoOD+TbW+D9p8yTfefRJG8vJVGQQ
 Wbx2nFtN1PiBTTdY6DD/UP+bi1s3pwq616kN6qM9pQ4oxdffs6hStv1572q5jSx1JF4E
 9gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmPDFocZI4UY744fTRFTWJ5s7XgiLsk2InTaCnzzKZ4=;
 b=MbX3j2x0mUair7hMRonAoxHGnT9qkXiL7Ww7mxerbfYLW9SW67bG7Vw5Xjazx42UZD
 CSYlfHTMn3PXyO2TYlofF84K4+zfvaCM03ndKAr3nGge27BojAfiNgN72XaVk0jpQBcr
 PY7/PEv3Gnon3gr2KAGjN6kDXHJUAe3XSeuOaLN5x31e8DjRF4Hil1rReiv1eZfsCvLx
 fnjVFXAoUXJtnhTigsVgHjN+v51DMW30rTSl0fJ62PxRfOQe2DMWvYfRPbO63xAsO44a
 xtUwVia8zF8u9XElY9IdC8wqe5/t0ZGxXYV/sbSPqdPyMs5j1kZFJmcuMErwEfOvq3xS
 qgsA==
X-Gm-Message-State: AOAM533WBHNLDYCljjWOt2x+ANfs6acMbcmeUoB7XX/SV8QjbQflXfoz
 H9vX3rn7go2zVNxqUutFNNmJoSegQt6Rveg2m2rBfgc3N9WKxA==
X-Google-Smtp-Source: ABdhPJxJq6/NK8lTuDIDpuqzWtibq64eLybGfgWhWf/hgrRuPHv+mKcmc6MBN3pozLcXjLcKH58csGI/tuv9GWchFiQ=
X-Received: by 2002:a25:1581:: with SMTP id 123mr8969079ybv.480.1600376205511; 
 Thu, 17 Sep 2020 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 17 Sep 2020 13:56:34 -0700
Message-ID: <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
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

On Tue, Sep 15, 2020 at 1:31 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> I've heard a handful of times that meta-phosphor users often have to
> remove the latest feature added by default to obmc-phosphor-image.
>
> I have an RFC for an empty image that these users could bbappend and
> opt-in to specific image features instead of having to repeatedly
> opt-out.
>
> If you like the opt-in approach, please drop a +1 and/or review my patch:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36516
>
> I bring this up now because I, and others have been adding new image
> features to obmc-phosphor-image (e.g. turned on by default), and I would
> like to start a discussion about what it means for an application to be
> in the OpenBMC github organization.  I would propose that it means it is
> enabled and turned on by default in obmc-phosphor-image.
>
> Looking forward to your thoughts.
>
> -brad

As a general description, this sounds great, but as always the devil
is in the details.  The biggest obstacle to this I see is that we'd
need a policy and design around supporting mix-and-match on features,
which I don't think we really have today. Today, most features don't
mix and match well, one example of this being entity-manager requiring
intel-ipmi-oem.  Thus far for that simple example, nobody has stepped
up to make it a generic yocto feature and separate out the code,
despite pretty widespread adoption.  I think the idea that we're
suddenly going to just start doing a better job of feature separation
because of a single patch is a little naive, and I'd really like to
see the project make steps forward toward that before we create a
minimal image.

If we want to do this going forward, my personal opinion is that:
1. Someone needs to go figure out an example for one non-trival, cross
application feature with multiple options, and get yocto sorted such
that said "feature" enables the right component options.  Entity
manager might be a good one, phosphor-webui vs webui-vue might be
another good one (I'm looking into this currently), or individual
Redfish resources in bmcweb might be another.  There are a bunch of
examples of this you could start with.
2. Document a policy around what it means to be a "feature" including
some relevant examples.  Is Redfish a feature?  Is IPMI a feature?  or
are those just interfaces to access other features?  Do we need a
hierarchy of features?  When/where should we use DBus to determine
feature enablement, and when should it be a compile option?  We've
been very inconsistent about these questions in the past, and it's
part of the reason that adding "features" properly is hard.
3. Someone needs to go through the user-facing clients (phosphor-ipmi,
bmcweb, ect) as well as the recipes, and make sure command handlers
are organized in such a way that they're enabled or disabled by
feature, and we can successfully enable one feature at a time.  This
will likely expose some interesting dependencies (like how IPMI
commands have to be enabled/disabled by library) that we'll likely
need to tackle.

If the above tasks just fall onto the subsystem maintainers, who now
have to field the "I enabled X on my minimal build and it doesn't
work" type bugs, that seems like a non-starter, and likely to cause
more confusion than the current status quo.  If someone or group of
someones is willing to go do the work, I think it'd be a great benefit
to the project, and something that would help a lot of people.  I'm
happy to pitch in as well where I'm able.
