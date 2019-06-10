Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8DF3BD68
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 22:25:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N4Pw2KXCzDqRS
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 06:25:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EC7E2k2A"; 
 dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N4PH3j8VzDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 06:24:50 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id r21so9607571otq.6
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ToW/3n343nvcnieH1GGyMLuH81IebLga+znzFft+Mb4=;
 b=EC7E2k2ApupET/ZcCFlv00EOmouwaTrLykZKZGj32EbH6FkIO3c8iwGjZDnm2JXCyb
 oALlcKGFKy/3MUldMoFLzlglAE5ppJGQFsmZKGm6ThvEiWYp8BKNvXwK6RNWyCXATejK
 NdPWv3Fvj6NPRTyw2OMVY6xgWcAzMNt8Qkk6yyHoVuHlWrPlDPw+kK5NyI09ayg0+2uT
 SBXlZdHwQxUDP+yt/Xsk7nOlK2WWRbQ4U6jr4LVA8kZq40p8w9drWtaySsS3gp4UzPEP
 FmY5JjGI293YbEPL1LRPl4W7aC9GJWXrl8dzPzXhjCU6Qk9Qz/dGejnTDSUSA8YC7JNP
 QqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ToW/3n343nvcnieH1GGyMLuH81IebLga+znzFft+Mb4=;
 b=GNoWOb4G5NUqqN/ImijUrjnQfFNDS4hC3rTdZPCUxIOVi0D2WeWUNUEsj0/TxcPpgk
 HeXL2zWMe8ssqN7bot2z5AEyAiBZzlGDnzgbXEYfNojfkDVWjSdkotZfjHeWUI3eAkTH
 YqGeqIEWA/JHNQwd3yL5UnApikJtN0da3HWay1/vqhHq+Un6/yz9pqgp4g7xr5cov4WD
 icax7gDklpOThrNf1TJ9hviRS9yI2BJS216MwnMpuZVvGdkXsF3ewRwIjwlyAGBi2wKh
 lT+dGrJjZjF+HDWwp/3oT5bC1Ag1TdHjs5jnnFZ6Owp3GcMw8klH0cFKMiZe/gK2RjPq
 JgXQ==
X-Gm-Message-State: APjAAAU1p5gzLAJga6ygz9ly0+TCkkJPuZMNYRl3MmObd/B36ofxd7Lu
 FdP6BsWxPBcp9y8WdaCLHjmJ7j6gxvLBuZATenY=
X-Google-Smtp-Source: APXvYqyQ+wFdF1lXPEIDp4F5nzK5kla7xjEFIA3pTMictBC8PqkZnpdw52jBO2CjM/ITT7eWV3KC2i6x92Z1XIkWhwc=
X-Received: by 2002:a05:6830:1316:: with SMTP id
 p22mr8883663otq.329.1560198287672; 
 Mon, 10 Jun 2019 13:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5Oiwj9Ps0Lc9S4hPS=Jxizgn4=meqP_UGRhUdeZWsphGC8YA@mail.gmail.com>
In-Reply-To: <CAG5Oiwj9Ps0Lc9S4hPS=Jxizgn4=meqP_UGRhUdeZWsphGC8YA@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 10 Jun 2019 15:24:31 -0500
Message-ID: <CALLMt=pxsV3OFZ2KBperSA9oSGef+NBdi9HBFb=DZ5D6Add-6Q@mail.gmail.com>
Subject: Re: Release: branch then test, or test then branch?
To: Kurt Taylor <kurt.r.taylor@gmail.com>
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

On Mon, Jun 10, 2019 at 10:22 AM Kurt Taylor <kurt.r.taylor@gmail.com> wrote:
>
> All,
>
> Before the last release (2.6) the release planning working group
> decided to branch on the freeze date and then continue development on
> master, while testing, documentation, and release notes happened in
> parallel. It worked reasonably well, but there were some glitches. For
> this upcoming release (2.7) we are reconsidering this decision.
>
> There have been concerns raised on this model (please elaborate if you
> have an issue). I believe that the test and security working groups
> have identified requirements to change this, but I would like to have
> specific reasons. And, I was not totally happy with the platform
> verification testing/reporting or feature documentation.

Yeah, my main concern was that we basically didn't do much as a
community. There was nothing to break us from our normal day
to day life (like a master freeze) so we all just kept developing (and
not focusing on tests or docs).  But the question is was there any
reason too? Is anyone using the tag? I know IBM is interested in
using this next tag as a potential base for a release so there may
be a bit more interest on our side with stability and security fix
back porting.

>
> The alternative, and my slight favorite, is to branch at release, not
> at freeze. This enables ALL (developers, testers, document-ers) to
> focus on the release specifically, instead of continuing to develop
> code. The downside is that it does stop new functionality patchsets
> merging in master for a 3-4 week period. We could shorten the freeze
> window if all were focused on polishing the release, however. This is
> not the popular option since folks just want to write code, not test
> or write documentation, but I believe it can make higher quality
> releases.

Yeah, this seems like the best option in a lot of ways but I just
don't think the community is at a point where it could take a month
off from active development. I remember at one point we floated
something like 3 days for the freeze. That seems more realistic but
I still have doubts on whether we could coordinate well enough as
a community to get all maintainers to stop merging function for
ever that long. Would we ask for reverts if someone did merge
new function? Would we hold of the meta-* bump merge if it looked
like a feature vs. a fix? Would we make Brad be the enforcer since
he does the majority of the meta- merging?

>
> Here is a drawing that may help explain what we are considering for 2.7.
>
> https://github.com/openbmc/openbmc/issues/3555
>
> Please comment here, comment on the above issue in github, or come to
> a release planning meeting if you want to learn more or join in on the
> decision process.

My vote is still for what we did with 2.6, branch on freeze. When we do
the branch we should tag master with a 2.8.0-dev to get rid of the
ambiguity we had last time.

>
> Kurt Taylor (krtaylor)
