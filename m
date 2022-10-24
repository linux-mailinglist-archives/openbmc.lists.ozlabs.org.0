Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E8F60992B
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 06:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwhyb6X5Fz3c4S
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 15:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PaEE05vg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PaEE05vg;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwhxm0FwGz3c3V
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 15:32:27 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id z14so736767wrn.7
        for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2022 21:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iFaG7ESZ00lLwjW4FVPsSVfqPHNkJsNyJ8IBJe2sGg8=;
        b=PaEE05vgd6n1jTp9kojzZ573nB02OLn7Tv43f8AoaWgJ9Gp5eFB0U2DVJDdfpX4zPH
         DtRNfqVVgpKziYC4+z5V2DgzVSwDZ3DSf4hj3VSVkT6HPU5CvXjo/u2ZfvrflMJKYLqd
         7FhOW4T9q1qsHgVVBj09qefluB15OH8F9bGgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFaG7ESZ00lLwjW4FVPsSVfqPHNkJsNyJ8IBJe2sGg8=;
        b=VrijEDy57+kNELwhU/KI47ky6B0x1DAwaVv+zTlpYVuRda9E+PwJDW4Pt/5C5xH/yZ
         UdcTCUCX9eoHiQbD/d8yvyO3FE7h5G01Czvmj+OV4/93YL2d9aghsCiwK95L7kNIBClP
         fFZvrsFnu7ovOw4TMXb3Zf8YdOED7mIhZLeAa9Uisw04BgorMHEv50Au6yYq6dGVX5pc
         wzRZmvdK7VRyhapRepcxzfMJeQLvpilpLijV9j/v7cmlSAVRaNhW0w/CJPCN3nVX4908
         0HXzBZF0k3/4pUUmJrf5Yf2qdrXnk307YBYeIbZxUug1kFCy6fS26mvWC7jrtVm6qnJ7
         erxg==
X-Gm-Message-State: ACrzQf1bA4pfTCmKuTSAcgdXTUhOwSovEImX5ySpHZwve7Gs3l+kN0Sy
	FTA7qnLj459UWHC4oOyv2tYjnjPvSGzoEPFr50RBUPBp
X-Google-Smtp-Source: AMsMyM5CjYviTNrGvo/6vq6rH2bCX5nRwfvlSHZemtahe+urbGuDFZZSfKVC8Kpe+zK5aJlGWEGHLMEH25xT4ZYwxFk=
X-Received: by 2002:a5d:6c63:0:b0:230:8257:be9e with SMTP id
 r3-20020a5d6c63000000b002308257be9emr18938900wrz.606.1666585944634; Sun, 23
 Oct 2022 21:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CAPnigK=NZVWH+msS3Ajf-RBQqzK9hnoecizuFF=QbKh-mK=DNw@mail.gmail.com> <Yz1raUAKT8CjTp7o@heinlein>
In-Reply-To: <Yz1raUAKT8CjTp7o@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Oct 2022 04:32:12 +0000
Message-ID: <CACPK8XcS1Mj1Ztz2n_YmnF8SO3xNf5Sedgqu0GKb73nz9incQw@mail.gmail.com>
Subject: Re: Linux kernel updates and v6.0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 5 Oct 2022 at 11:33, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Joel,
>
> Any thoughts on this?
>
> On Wed, Sep 28, 2022 at 03:30:23PM -0700, William Kennington wrote:
> > The ToF was talking about linux versions being used for OpenBMC users and

In the future it would be preferable to bring the discussion to the
community first, instead of talking among the TOFs.

> > we were wondering if we could codify a policy around which versions we will
> > be developing against regularly. In the past it seems like you usually pick
> > LTS releases to base on (and Facebook / Google are interested in sticking
> > with LTS releases in order to reduce toil / number of potentially
> > incompatible kernel upgrades for each of our machines). It would seem like
> > kernel 6.0 should be an LTS release, although gregkh hasn't said anything
> > specifically about it yet. Can we get something written about the expected
> > alignment with upstream kernel release cadence?

The documented alignment is every 30 days:

 https://github.com/openbmc/linux/wiki/DevelopmentProcess#openbmc-kernel-maintainer

Obviously that doesn't happen, because we lack the developer power to
perform this work. The document could do with some updates in that
respect.

I intend to rebase on each upstream release as they come out. This
means every 90 days or so. There was a period where that worked well,
but we have been stuck for a while due to lack of developer (my) time.

Building on an upstream LTS makes sense if the following are true:

 - You're regularly pulling in the stable point releases and pushing
them out as firmware updates

 - All of your patches are upstream. The stable tree can only apply
patches to code that is upstream. If they're not upstream, then
they're not getting patches backported to fix the issues, so the
stable tree doesn't provide any benefit to you

 - You're actively submitting fixes to mainline to be backported to stable

Obviously there's code that we ship on the BMC that is upstream, and
gets a lot of attention from the wider kernel community. The
networking code, filesystems, scheduler.

Given we have a lot of downstream code, I would (and regularly do)
argue that we're just as well off shipping the latest upstream kernel
than we are staying on an old LTS with less upstream code.

As we strive to upstream more of our code, the benefits of being on a
LTS tree increase.

How do we encourage developers to upstream their code? One way is to
regularly rebase on upstream releases, and drop patches that have not
seen any development. This works as a forcing function and incentive
for upstream development, and you could argue it has worked. Since
dropping PECI in v5.15 we have seen it submitted and merged upstream,
for example.

I've had minimal trouble moving the IBM systems from kernel release to
kernel release. Perhaps you're relying on userspace interfaces that
are not upstream? If that is the case, I encourage you to get the
interfaces upstream earlier, so moving is less effort.

Cheers,

Joel

> For minor clairification, I believe it was Intel / Google that preferred
> LTS.  Meta does not have a preference as long as the OpenBMC tree is
> well-supported and we can backport changes that have been sent
> upstream.
