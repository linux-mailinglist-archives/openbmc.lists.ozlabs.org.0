Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0719C444B95
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 00:23:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl2rc6H4lz2yHM
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 10:23:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=c4zINkFo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=c4zINkFo; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl2rG1fCRz2xCH
 for <openbmc@lists.ozlabs.org>; Thu,  4 Nov 2021 10:23:07 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id v2so4085921qve.11
 for <openbmc@lists.ozlabs.org>; Wed, 03 Nov 2021 16:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYkDRS5tcW7HGK1RAu8WQelb02ZNdMcg3YYYD7yeYSc=;
 b=c4zINkFo+4a4HcyPyJkgJW1vAgMaUKs+Pyah/xnENPZHXngyW+cukaRLO9szyLfj43
 DVpOsFhY5HiXb92Uqt56bKotaLm5hfB7k3xI7tpNJ6IdpY0F0FD3jen5Hxj1dgVEKHYV
 eAZBMwYgEdixTbmE18eouEdtlUVFQD5suY9Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYkDRS5tcW7HGK1RAu8WQelb02ZNdMcg3YYYD7yeYSc=;
 b=lF6mrar1bBWe4zCmLtYcvMaLM1UDX9jTa4DFNnWJm82XYvgDgPeOYr6WRwtI2x2/1o
 IbVMDtDvr3/cLXuc0Q+8lCQqfx5vSkUQcYzroB7MKiGyt+ZcsrHdG9GPVKWJ+7lxjFiU
 8xwtIpuse6qRbxkmoxHcv37S/6f5SKEdj4ihhnhiwNsFe+Mf1isKboTcfml5UV9c1NI4
 4trPUBQ2ieN+Ujne1A3oIR9n0FGfuP8QjO0IOwvfICd0DyPfhQObiy0GL6bPPqzrhkKT
 LYmX7QeOgz8Hi4lw71OIWQNvZzDCElDZ+z/5a+KLBbGj83AwQAgHK2+nb1wwFWtbX8YF
 rJMA==
X-Gm-Message-State: AOAM531amrs2kJ0mh5URRReFuTOF1jewIB6S+y4UvgEiFNE9ip4L09hj
 O6G6UnpA0l5ALSRXg2Pqdf1tDuRlalfWtyzJbVc=
X-Google-Smtp-Source: ABdhPJxTl6pG0LuVnKg1c7Mi9+O9bMeja3oMX2bOWHexGW8kHB18k4LCC0ACNIwy1Yi6BI6WsEtpvQhpodCjcShYFPc=
X-Received: by 2002:a05:6214:98d:: with SMTP id
 dt13mr46315291qvb.13.1635981785624; 
 Wed, 03 Nov 2021 16:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
In-Reply-To: <CABoTLcQHOcfvHkCGX0nMUxFzmTcceuBhL3CQERn66CT8UsSvwQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Nov 2021 23:22:53 +0000
Message-ID: <CACPK8XcRfTkZynhnmYn0ySq82MjJQZwgy_4UjKpcxYgF5cG7xw@mail.gmail.com>
Subject: Re: Cherry-picking 5.16 commits into OpenBMC Linux?
To: Oskar Senft <osk@google.com>
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

On Wed, 3 Nov 2021 at 16:29, Oskar Senft <osk@google.com> wrote:
>
> Hi Joel
>
> There are a few commit that I sent upstream that have been accepted by
> the maintainers (i.e. have the appropriate "Reviewed-by" tags) that
> are waiting for 5.16 to open.
>
> I'm waiting for these patches to be available to be able to send a new
> meta-tyan directory to OpenBMC for review.
>
> Would it be possible to cherry-pick these commits into the OpenBMC
> Linux tree to speed up this process? Or is this something you
> generally prefer to not do?

Yes, this is exactly what the tree is for.

> Specific patches:
> https://lore.kernel.org/lkml/20211020164213.174597-1-osk@google.com/t/#m8f7ac85809049fadcabf6e0bed1ebab12e71f094

I've applied this one.

> https://lore.kernel.org/linux-arm-kernel/20210909004920.1634322-1-osk@google.com/

If you take a look at the dev-5.15 branch, you can see that this one
is already applied.

> There will also be an update to the DTS from the second patch once the
> driver change from the first patch has fully landed. Or should I
> better send that DTS change now and we'll take it into OpenBMC Linux
> together?

Send the dts change to the upstream lists. I'll review and put it
straight in the openbmc tree.

In general I encourage developers to send patches straight to the
upstream lists, and once they've had a review there send me a note to
backport them and I will do that as soon as possible.

Cheers,

Joel
