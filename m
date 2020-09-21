Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A05C7273238
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 20:51:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwD6Y08P3zDqvL
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:51:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=q79pK98Q; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwD5D1w0ZzDqWf
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 04:49:51 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id x10so10989672ybj.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 11:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8n95EnvByBIxXySoK5XtgJj9VXN067Rq/NCaMDuYi/A=;
 b=q79pK98QZGHtpqAV7V0XytZR7sZ3UKGgiwaJ+zxg2d2/NW4uUXbXkg5Wy4GUYyR+9F
 Y+Id8Fv92YUfDvFp4gplNqzsmunbNvQwnUQhpOdEjVJ6VjAIrI8KGf3vkYfo6lDiUSM0
 GgqSJJt3A/vWC+Kydf67swG+i3hrD0D+z6Oys3ef59SzLUoxNjbLSD5++DqNEo7QPs2k
 z8K+fXJe/8pxragb7Xg/doQv/bCu5dbd7ilspYSv3V7IjHZWOnR9r5HVAziQmKfCmxFK
 zBLhqpn3NsFn2PpQynLVoJi36dvM6JOcGIByWDbUbVY0VPJLF/ZGVolm0XqoruA/GDAi
 BI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8n95EnvByBIxXySoK5XtgJj9VXN067Rq/NCaMDuYi/A=;
 b=YrbemuoxFJGFkYtx5cgvfDo4mc+F1ydp0vSkXP2VyTc/qESFbiqrVKT7j27vWVusib
 jQPwq3kGjBSf0Ih4sigGwpMetqzris2jOO2uGV/YeDIjacZ0Y7mljGSBGM2lAna8DY9c
 Gk/87SAijRBg/CE18hHR7RxrqmuQC/eHeyWisNRBGWu0qx9Y2gyVkvbQgnnXhsipWcQ9
 Mbx7TH5+6Qj7SKwbnmahzS/GqMcbRlUkEvqB2Hq4u3VHDuA8SbZEgq+/D45tduokUIU+
 R1kGDUM41Petdbyc/Gteii/q87LgSlAD4SuJW1GaMBZyoE2bixmWPopWrBgVnZAENPsm
 bpeA==
X-Gm-Message-State: AOAM533dcDsGaGoYf3TeV4gioyLui46bbae0S+q5ouFbXT1qextj+8kN
 122uDhgc59vmE73nkX693ExM3Be+XcG+/uRP4Rfr/A==
X-Google-Smtp-Source: ABdhPJyzmbN7fijFvj2D6yDIpfFR7iZxDnjplEf08pSg7x9TSWChhMN+bM6wHCP3cN6FekFrVZRPxhuoLIndOQNJxcc=
X-Received: by 2002:a25:b8cb:: with SMTP id g11mr1771813ybm.203.1600714187748; 
 Mon, 21 Sep 2020 11:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921182000.twlx3epiawrlfs55@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200921182000.twlx3epiawrlfs55@thinkpad.fuzziesquirrel.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 21 Sep 2020 11:49:36 -0700
Message-ID: <CACWQX81A-vh97+oXT4ejqgM6p4NdmxTffH-sUeruAiQNb5quqw@mail.gmail.com>
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

On Mon, Sep 21, 2020 at 11:20 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> On Mon, Sep 21, 2020 at 08:53:26AM -0700, Ed Tanous wrote:
> >On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >>
> >> Ok but those are autotools/cmake/meson options which correlate to a
> >> distro feature or maybe a packageconfig.  Those are orthogonal to image
> >> features and image recipes, which is what I've proposed.  I've not
> >> proposed a minimal distro policy.
> >
> >Maybe this has all been a wash then.  I had thought you were proposing
> >a minimal distro, and didn't realize you were building a minimal image
> >with the existing distro.  My bad.
>
> No worries.  To have a minimal distro, we first need a set of default
> distro features from which to subtract some to have a minimal set.  We
> don't really have any real distro features defined yet - the ones we do
> are non-sensical IMO - they are artifacts of my lack of bitbake-fu from
> 5 years ago.  I would like to hear about areas where you think it might
> make sense to define distro features.

To be clear, I'm not blaming you here.  I think we're all learning our
way through yoctos eccentricities :)

>
> >With that said, the images description is "Basic OpenBMC image with
> >full support for the hardware supported by the system".  Was it
> >intentional to call out "full support"?  Maybe I've misinterpreted the
> >long term intent of this patch?
>
> I can see how my summary would cause confusion.  FWIW I used the summary
> in core-image-base as a template.  Is there a better summary?

Something like: "A basic OpenBMC image with no features enabled".

>
> Maybe this helps - I was trying to replicate oe-core:
>
>   core-image-sato -> obmc-phosphor-image (all/most of the image features
>                                           are enabled by default)
>   core-image-base -> obmc-phosphor-image-base (a minimal set of packages)

Ahhhh, that makes a lot more sense if that was your model.  For some
reason I thought you were trying to build the equivalent of
core-image-minimal, whose description is:
"This is the most basic image allowing a device to boot to a Linux
command-line login".  I got mixed up in my yocto terminology.

>
> What is the minimal set of packages?  I don't think we know yet.  I
> expect many to bbappend obmc-phosphor-image-base, and select specific
> image features (IMAGE_FEATURES) or directly install packages
> (IMAGE_INSTALL).  After enough time has passed, we can use those as an
> input for identifying what makes sense to use in the base image recipe
> as the default.

So your thinking is that this would eventually become the new
"defaults" image?  Possibly the "well supported" image?  I can get
behind that.
