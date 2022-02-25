Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39C4C3D6E
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:50:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4clX4BJxz3bc9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:50:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lfteqMKX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lfteqMKX; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4clB1dTwz3bN6
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:49:58 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id s15so1503691qtk.10
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 20:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfJ/gYK4sQY6HFY9x9R3/gAAqyP6qT6/u/oKcVHSX9k=;
 b=lfteqMKX1MdDOYExZguiJbUrWQOUAzBH94Bc5vn09v1A5fFqH8wREdUEWw5IUTMtpA
 yn02KGpfSy0vQOOPvVwHrrKCUmbaubksi7SjuEdqfyAiQ+cBnU1dS34ZZ/fF2p3M6K66
 MeNzH3OM98nJtbN4PSKuSnne8uFtmYUgnyM68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfJ/gYK4sQY6HFY9x9R3/gAAqyP6qT6/u/oKcVHSX9k=;
 b=HGBAnG4R8aEey5rhok9nyWhbKNiGiYiGHUbT4xlQf8ifr596RpQEcdfLuKd7r576z0
 W/Rk81Q4Rjs35vIoVcWMh9zCIJiRZuEQ9znGrrWWre7zWfeBGieTgOgHsClVnbXwENdy
 aLT0rW4IS0Nh4fHnCbT49G75n50LFyeEEcncFGhQNMulIRmBHwU9HWF0JTiZuZWXCo0Q
 CCK464wRQU3tqcLdsVEvMBMxKZ+vhbBMOSd5GCOH6dQ2A0j4dFl48k90eMAQy1merpfc
 JLS7dbhVYbK59TskvUSEip5idY0WFNWmPyxMHFo+13phHbzzfL8fvhZHvcW6X/hIlzxM
 Wvng==
X-Gm-Message-State: AOAM532frckp2+zrlPU8iHucRToWSenBmWWmuI28DK6unHgwBwDzXPJy
 YCi74eY0U+kIGUnxUxPMRVlQJPhpG1iFz91nw7M=
X-Google-Smtp-Source: ABdhPJzjS44aID8IbefGhMynnSqwZkQXAboDwryxna9KwK1VGJtqgEpqej+fuIw14g6tkLEW/xt9UPO8FzaB3jVfisc=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr5541890qta.58.1645764595298; Thu, 24 Feb
 2022 20:49:55 -0800 (PST)
MIME-Version: 1.0
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
 <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
 <7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>
In-Reply-To: <7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 04:49:43 +0000
Message-ID: <CACPK8XdsoL9_aTJL2KV9KD-djtiLRsJnHqWzL6gTWOMKRkjKOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 24 Feb 2022 at 21:03, Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
> >
> > Jason, you should send the patch to the upstream lists (use
> > get_maintainers.pl) for review.
> Sorry for the delay.  I found the right lists with get_maintainers.pl.
> Should I send these patches to the upstream lists as they are, or do
> they need to be tweaked?

You've got some review comments from Andrew and Zev that you should
address. I suggest replying to them, and adding the pinctrl list on
cc. Then when you post v2 you can send them to the upstream lists.

If you'd prefer to just send a v2 to the upstream lists to restart the
discussion you could do that too. Your call.

Cheers,

Joel
