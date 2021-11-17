Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2712453EC1
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 04:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv77l66fMz2yfg
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 14:04:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RuaXesJ5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RuaXesJ5; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv77L36glz2xsY
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 14:04:12 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id f20so1308437qtb.4
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 19:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GLf5BbJI7CckLz2pFGqJ5AAjWE8XhCK30asv6W7fNoY=;
 b=RuaXesJ5CPg7SZcwlCIA9MbBhNex4vjMR08fNuI5P9JjdcUBeJtdCHutkOIqX29vPi
 F/leFLsnQ5W9fOWB6j26AjvkP+YzR+lrP0jqSZnoLb4Uz/BmH5zpwXazoWHBPtG6h222
 KGrWefhIT+hKuMMGxLFzdhyrsdyqaqdyfGsGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GLf5BbJI7CckLz2pFGqJ5AAjWE8XhCK30asv6W7fNoY=;
 b=NKjLJ4ojHfvxBKis88bLbkpKCM93kSgiTvCLKQxmPIyBcTxmnL1t/T6f3xR9z7zGwx
 6sb8QSXxjzbmYdZAtXX9ftO5FMlWoY7YR5ELp/ly0hHpdfynbM+WDoEqGVXeK4ji+GC9
 4nzV0DCcRKXJJofBtlwbBrBJt7tEeoLKXj0mRRjCfZBlNr/1v95kAlbwd1B+C+GAohZE
 /23kd25RPQfMqxgGCOZdmsP13/aL9X49CfU3aKpEAK8QG62yKVTWUTd8E6QNEOhbVl/l
 ZIkVPCVoHVsczlkdfZVbACOVelfYETH28liwt0v/PzkcOtc/4p6EsX62wc8NTckDf8G5
 pVKQ==
X-Gm-Message-State: AOAM532Am2RLQ099R+skEHA4OZvPzMn6FOE/dTexS8efmKrcmF881N5g
 Ny3nxKy3qwmQk2wt9J0s4Zak8uJyQ1EoMvul6kA=
X-Google-Smtp-Source: ABdhPJwhWpQqavr8/uc/3yJfMZaGN2l1C3RZ+BSTRQLSkMn6G3wacw5uGWvismy3tw6gEIMCBk8rAy/wUp0SNfkp23w=
X-Received: by 2002:ac8:7f15:: with SMTP id f21mr12762615qtk.392.1637118248626; 
 Tue, 16 Nov 2021 19:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20211019080608.283324-1-joel@jms.id.au>
 <8d1631a9-710e-c2c3-228c-d9a942e64aa5@molgen.mpg.de>
 <CACPK8XeDAHVgNObar=ZAOW=gzRhO_33Y-1hvJtF_fbyA2P4O6w@mail.gmail.com>
 <57584776-06e7-0faf-aeb2-eab0c7c5ae1f@molgen.mpg.de>
In-Reply-To: <57584776-06e7-0faf-aeb2-eab0c7c5ae1f@molgen.mpg.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Nov 2021 03:03:56 +0000
Message-ID: <CACPK8Xfsfz=3ByQ0jYXUe-MWs+_OxYqfUTQ5QNppPNjb9SV5_g@mail.gmail.com>
Subject: Re: [RFC PATCH] ARM: aspeed: Add secure boot controller support
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 16 Nov 2021 at 10:15, Paul Menzel <pmenzel@molgen.mpg.de> wrote:

> >>> +     if (has_sbe && (security_status & SECURE_BOOT))
> >>> +             pr_info("AST2600 secure boot enabled\n");
> >>> +
> >>
> >> Maybe it is more interesting to log, when it is not enabled?
> >
> > By default the soc will boot without secure boot, and this is not a
> > problem. It is informative to know that the system has been configured
> > with secure boot as this indicates the system has it enabled, and has
> > correctly booted (otherwise you would not see any message).
>
> Maybe log a message in both cases? Linux also logs the message below on
> my old Dell Intel laptop:
>
>      [    0.000000] secureboot: Secure boot could not be determined (mode 0)

I'll print a message either way, as long as the secure boot controller
compatible was found.

Thanks for the review.

Cheers,

Joel
