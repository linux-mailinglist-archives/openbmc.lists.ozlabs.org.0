Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB52FCAC8
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:37:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDnY38xjzDqpp
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:37:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=iSNs0E+H; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLDmm2CzmzDqhT
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 16:37:10 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id 143so24301658qke.10
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 21:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8lxEBbF4fE0IBp5t/KrTzWs9yD9HxyV4m4dAe04P270=;
 b=iSNs0E+HQvO006LMxjtBL85pQZCD/KG1DGkjtmzA9/9LfRVnJcJVfP7GnyiaVjx2Bh
 gEbS8dmmSxn8+AjC5M1FC3YmCXSfKVGT0lzC0OCn2IVWGiLaZ1eE6YsxNfDYRDq9OyVQ
 W67a6pCgo3mkQFlu11kbJEFsNBydu5e7MsBCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8lxEBbF4fE0IBp5t/KrTzWs9yD9HxyV4m4dAe04P270=;
 b=D/+PEvKB0QmPEaPpZimcG1jr99rqv6qSfnCKcu88VMpp7Z8RNorWWkx/88T+03p3tK
 O8Ti26HVLgHY4IvCpJsyOBQoDOfGBSqMXGKN4wbq7+30KLc6ckut7EsEpxnJixmSJbbF
 u49FtJDYXSbf5MbOf+qBzSsFtau1AEngZIdJgaurQ4w/cpQ9yyy0V/RbB1X20f/O89I8
 aVEcq+raZq/EIZAIoBM+qckgQoMrYtAQ557ubJbmE7/0bqkBYvTmjMHnSol+3LdDTkHV
 UfvxsEWoxL2uslMPz6JwrVj8RbbHlPEM3bpTvYdCLDEsG+MYY8kjsuTRBlZegDvQ3eEX
 uaOQ==
X-Gm-Message-State: AOAM53371c0P7JeNWAwj3xbJwbxFbGF2W10oxHz1R9mZWCIIwtQ0qat0
 pG9JI7FH9lEN4RE+Hd9IZ0/qakuZE+hHkSwzMxk=
X-Google-Smtp-Source: ABdhPJwI+ZKCJx3ndDZQoE4Wy/Nrl9P3FCdFByoXNlvc9ps7RG3R84o8CB++91prUg13PG1oMXsP86zYwRfBdIYvgNU=
X-Received: by 2002:a37:4f4a:: with SMTP id d71mr8100924qkb.55.1611121026619; 
 Tue, 19 Jan 2021 21:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20210119223412.223492-1-tmaimon77@gmail.com>
In-Reply-To: <20210119223412.223492-1-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Jan 2021 05:36:53 +0000
Message-ID: <CACPK8XcSDg=Kb1aZ0fBanf=DWGjnwkxrTAiDuZ6NV2aU1z+pjA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v1 0/4] Minor NPCM7xx modifications to
 dev-5.8
To: Tomer Maimon <tmaimon77@gmail.com>
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
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Jan 2021 at 22:34, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Minor NPCM7xx modifications to the latest patches
> that been pushed to dev-5.8.
>
> Tomer Maimon (4):
>   arm: dts: npcm7xx: Add syscon property
>   arm: dts: npcm7xx: modify PECI node.
>   arm: dts: Olympus: Enable PECI dimm temperature
>   watchdog: npcm: Modify get reset status function

I have merged patches 1, 2 and 4.

Cheers,

Joel

>
>  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi        | 9 ++++++---
>  arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++
>  drivers/watchdog/npcm_wdt.c                          | 4 +++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> --
> 2.22.0
>
