Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9154C624F
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 06:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6SrY1rpKz3bVZ
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 16:01:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AEGH3S6n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AEGH3S6n; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Sr25PvWz30C2;
 Mon, 28 Feb 2022 16:00:32 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id z66so9500877qke.10;
 Sun, 27 Feb 2022 21:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dl5bImTp8P/vXmU2+b7NmzpeCyOGUJ3zCffquEOpd18=;
 b=AEGH3S6nmgJiVduVsFiCTpBweUwAf7F44ifshZVPRWwe4Qv6YFIYoFJbINshT644jX
 oYCZ9rXlkl7Z+fa4VZFs1j46PDj8ZYQlGehSOH7UuIfpnHf/Mabqno5Y/s3aOw5YzvIo
 q4X3Zd0Yl5/tylayQOeuPJDtyFSxIzToeJA3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dl5bImTp8P/vXmU2+b7NmzpeCyOGUJ3zCffquEOpd18=;
 b=QJIIapSHoQbxcY9IPmlrzzXW08v/rnuPvpdBx1Er7ENTitFeQNI5PgpqBwSlGXLfsV
 WatQIsfphqdTMxzSqvDood1hHMl4I/sYg/CK9x3zMwCGjP8bmx9uyT8T/thiRZb+um4i
 Hl1+5zLTIhYy0A6ZCjLct9FpPVh3zsk1S66MMc/vRCVJk4U8gjowToDCQiXewdn1xWEr
 kc2y81jdlpmon9HwQKQ41/h5K1vkVx4/9sTqcN11JwwiFaWcj1iFxVBjCKQCI2ayujiu
 ecE+fO6oewIz37U7GEsOQAiipyni2ptFbk6NpXMvm74X897A2+8v65/lW68HCWFiJwRV
 hiPA==
X-Gm-Message-State: AOAM530itnnObCVf+9hrlo9ldSqltnwmNfPCJQM7gd6Tsiqb6gNjkhFi
 KFRbkJWKVSXzlFScdCzMsIrr3p8KSLvnhbYzYWU=
X-Google-Smtp-Source: ABdhPJzD+ossvHaHQAKihwxTjH9fBc3NI+O+eeyw7Gb76LJbM2mhqZQ5/unoVcahDCD9C38J+XgCe0KCu1NuXULkWUg=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr10150792qkj.666.1646024429883; Sun, 27
 Feb 2022 21:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20220105101719.7093-1-zev@bewilderbeest.net>
 <CACPK8XeHyoo0D1vQm=L8m284kC5n-O+FEMp1HN+ROWJfx7qjhQ@mail.gmail.com>
 <Yd4rfi/iICQ5EjGh@hatter.bewilderbeest.net>
In-Reply-To: <Yd4rfi/iICQ5EjGh@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 05:00:17 +0000
Message-ID: <CACPK8XfGdTvznj90C7XFJ04QVU96NdwfXQX_Rj+bkCnov1Urpg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Horman <neil.horman@privafy.com>,
 Olof Johansson <olof@lixom.net>, Anthony Jenkins <anthony.jenkins@privafy.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 01:14, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Tue, Jan 11, 2022 at 02:59:28AM PST, Joel Stanley wrote:
> >On Wed, 5 Jan 2022 at 23:10, Zev Weiss <zev@bewilderbeest.net> wrote:
> >>
> >> This is a half-width, single-socket Epyc server board with an AST2500
> >> BMC.  This device tree is sufficient for basic OpenBMC functionality,
> >> but we'll need to add a few more devices (as driver support becomes
> >> available) before it's fully usable.
> >>
> >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >
> >Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
>
> Thanks!

I've merged this for v5.18.

>
> >Have you considered using the openbmc gpio naming scheme for the
> >gpio-line-names?
> >
>
> I looked at it, but decided not to for a few reasons:
>
>   - For systems that are in the early stages of a porting effort (like
>     this one currently is), I'm still referring to hardware schematics
>     fairly often, and using the same identifiers in software that are
>     used in the schematics simplifies things by avoiding an extra
>     translation step between the two.
>
>   - Most of the GPIO-related userspace components (that I'm dealing with
>     anyway, e.g. x86-power-control and host-error-monitor) already have
>     their own GPIO line-name configuration/remapping mechanisms that need
>     to be set up anyway.
>
>   - There's a solid mix of GPIOs that would be covered by the naming
>     guidelines and others that aren't; having a mix of the two styles
>     seems a bit awkward to me.
>
> That said, I sympathize with the motivation behind it and I'm not
> vehemently opposed on the whole, so if there's a strong preference to
> follow that scheme I could probably be talked into changing it.
>
>
> Zev
>
