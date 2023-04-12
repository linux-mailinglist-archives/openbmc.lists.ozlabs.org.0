Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB96DEE03
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 10:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxGNH3fbPz3ccr
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 18:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YoMqdIq0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=YoMqdIq0;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxGMh0kSBz3cL0
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 18:38:55 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id gb34so27025884ejc.12
        for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681288731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Um5VbRbWsLvM7ek2JjvY2x44xiDRKXNxgq+Yy7p5F0=;
        b=YoMqdIq0CSrv+rZ6frBWP9dF6D5k2n16dC4ZOgphVsep7/Xr30ppINPHoIhdC7ogOA
         pnWq7PigEbATgy3dvg94JjgvlXTdjMVYahYEd6PK9LXDupP48D+TpR7YWcCMESpJ3TKH
         PYqP48lBOuW+HNETNDgypTWv/S+k+jvH0tufw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Um5VbRbWsLvM7ek2JjvY2x44xiDRKXNxgq+Yy7p5F0=;
        b=AM8z1ZenlEQuby+NMB5nXBHPbE28fAzoIfe1iooReH7q0WbuSiCtS16Hhf94Bnt17q
         ez9C0jYno2FP15iM9ZGJhoReoTmxN47SztylhHiP4N9ax1cZG6T6eJfOP8zBiOstL2K3
         ux6SBI0uxHFjFK855J6yXLrn+cFqSEYrtTj1jnwE0PKpEWcvvQn69a1udHruF3KdDdQW
         sE0JCi2i3QtcMMh/5ywaiDvIRRuTKdFEbyC3ZxtNty3Oc4Su7ULls+V2B5FL+CT/EfOQ
         jtLuAhyYGka6uMzkEXmCTjjs60A4gxruIxml5wkHE1nvIjgpQ95tpqPBR7/ztCymKlJo
         lyqQ==
X-Gm-Message-State: AAQBX9ffWEllfx4oNo5awgeaALOJ1GDhBYECh8LzbKBTfwDbYvp+g4iE
	d0uAMCiyOEkQKiEIsfcalVp9AF+1LXeKiJ90aBc=
X-Google-Smtp-Source: AKy350alp976Vhm59v96KqRhG2Y/gRQzoC81NWXy06ehFVUef4+1rFhCwpvO6rBirGGn1rpwJKQtXSAhfFM+V0QaZDU=
X-Received: by 2002:a17:906:6d03:b0:931:6e39:3d0b with SMTP id
 m3-20020a1709066d0300b009316e393d0bmr761642ejr.15.1681288730796; Wed, 12 Apr
 2023 01:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net>
 <CAPnigKnU_xma-GOyB0SGpaEOeVX-YhVMun+QpQyWL6dCrZwMZw@mail.gmail.com>
 <CAPnigK=e0b7pFX5jYujSay-D9N-tsr0ttRhCuxBv67Z77r7kaw@mail.gmail.com> <20230407220702.GE18848@packtop>
In-Reply-To: <20230407220702.GE18848@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Apr 2023 08:38:38 +0000
Message-ID: <CACPK8Xdve_ycD7P6iHDRNwUW1k0nskdw+w9GFb9H5GqPP8No6w@mail.gmail.com>
Subject: Re: OpenBMC kernel and CONFIG_PREEMPT
To: Zev Weiss <zweiss@equinix.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 7 Apr 2023 at 22:07, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Fri, Apr 07, 2023 at 01:12:21PM PDT, William Kennington wrote:
> >I just looked again, AFAICT it was never enabled on aspeed or npcm7xx, just
> >the new 8xx part. Hopefully someone else with aspeed chips will confirm
> >from their actual `.config`
> >
>
> Yeah, I'm pretty sure that's correct -- my aspeed builds already show:
>
>     $ zcat /proc/config.gz | grep PREEMPT
>     CONFIG_PREEMPT_NONE_BUILD=y
>     CONFIG_PREEMPT_NONE=y
>     # CONFIG_PREEMPT_VOLUNTARY is not set
>     # CONFIG_PREEMPT is not set
>
> Incidentally, out of curiosity I tried booting kernels built with
> CONFIG_PREEMPT=y and didn't see any major changes in boot performance on
> either ast2500 or ast2400.

Thanks for collecting some data. If someone wants to do the same test
on an ast2600 that would be handy.

I came across the commit today too, thanks for posting it to the list Patrick.

We should keep this in mind for future BMCs as they move to arm64 cores.

Cheers,

Joel
