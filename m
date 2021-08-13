Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E123EAED5
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 05:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm8204vZXz3bX6
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 13:20:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=iPeiFw9V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iPeiFw9V; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm81c2zsCz2yhl
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 13:19:46 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id bj40so13967194oib.6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6lHi5/xEaDfBhSFYmcu/wQeQm9XosaqboBW6iBM8m4=;
 b=iPeiFw9VrYywzMwjDGxpPv2Ff2KDDoK/JVEhZmdc3plgMHabiBQNbbUSeukIphXDdx
 LZBcMPGXDUQS4M59zV97g9zRpTJ4oDcy6CjXGAZzX1jCtzca+O2n751uibYLH3ep+NJl
 K+TCFKQcKAK33zpjU0q48ogooDoSLfOM/0auIBR+8x1Ik3dlpQuw80u4MfprzqaXiJJQ
 f+sDFoR11Tcbvm73RaEIgzbtmOC30pzq1PACyr35C7Oq8qD4unv6yhWPTfOhdpIeLXKg
 lv87jftNouD0wzzy2hu07b62zlBvou+ABy/LmPK4r/4qs48RQZ0tJZle9n3akR8QZt1g
 JwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6lHi5/xEaDfBhSFYmcu/wQeQm9XosaqboBW6iBM8m4=;
 b=pj3FzwFlzXaNbtz1I7GqrsXaWuREP6Tjl14r7rBFwcVOmxByywqjJOwQh5h8LD94no
 4e3AIkD66RLlj0SXbXut8E7lKctChvXnLGbZOM3XCN4cPttzIOpeoYNz5q+HuoEtnKjv
 peLlxXzVTdyJD6GmEQOP+65ohx/aLrR+ScDcEQh+Ywzqob17gErgtboKq7/KlhM9Jy1b
 v1iSjIm5etXASuQP8o6K1lP4eFOd7SQOIbQt+TEGSRQ66PdL4uh4+j4Ec6nmMrKIPnjk
 CdF7EejsAclCboUcNb9UnqVPQ3u0MihonDYjbDpy4a06RfK0hX/I9nRstMZBiqC4GTV8
 1vBA==
X-Gm-Message-State: AOAM532A9amtqWI4VfkWQhHJQEJZJsOGKL9L5bzy1E9JfBjeDVfXefgU
 ciqG8nAwgFRy49iOFMN7+neP2WgAQX+Rs25P7hnU/ixIFZUGog==
X-Google-Smtp-Source: ABdhPJz5vWxRAOBWUQfZc7GSVszeS+1NeE2GzFfDeT0OP0kGQBqseAl1aLOB5tKe2OV71MpV0ZNqBwIV5Zh9ddn5RyA=
X-Received: by 2002:a05:6808:1144:: with SMTP id u4mr496999oiu.4.1628824782749; 
 Thu, 12 Aug 2021 20:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <YQ1FD5q8KbhbXVBK@heinlein> <YRUW7cazmCjW8VpP@heinlein>
In-Reply-To: <YRUW7cazmCjW8VpP@heinlein>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 13 Aug 2021 11:19:31 +0800
Message-ID: <CAGm54UHNeYu9vEcL8R98UMn8qEsSQ6yNK3PUX_dzixzh2n_9gA@mail.gmail.com>
Subject: Re: [External] Re: Yocto override syntax change.
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 8:41 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Aug 06, 2021 at 09:19:59AM -0500, Patrick Williams wrote:
>
> > TL;DR: There is a required change to all meta-layers by Wednesday August 11,
> > 2021 at 1PM UTC.  Any meta-layer not changed by that time may no longer compile.
>
> This change is now merged into our branch.  All of our machines listed in CI
> are able to build successfully.  Many other machines have not yet been updated.
>
> The following machines have had little to no effort since this email went out
> and do not even launch bitbake correctly anymore:
>
>     - centriq2400-rep
>     - dl360poc
>     - e3c246d4i
>     - ethanolx
>     - evb-zx3-pm3
>     - f0b
>     - fp5280g2
>     - g220a
>     - hr630
>     - hr855xg2
>     - kudo
>     - lanyang
>     - mtjade
>     - neptune
>     - nicole
>     - olympus
>     - olympus-nuvoton
>     - on6263m5
>     - quanta-q71l
>     - s2600wf
>     - stardragon4800-rep2
>     - thor
>     - x11spi
>
> Any machine not updated by October 15, 2021, I will assume is unused and
> unsupported and will create commits for removal.
>
> --
> Patrick Williams

g220a is updated now


-- 
BRs,
Lei YU
