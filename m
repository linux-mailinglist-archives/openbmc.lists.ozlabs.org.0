Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BB262380A
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 01:14:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N72Pv3FH7z3cHs
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 11:14:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OhIxVFzO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OhIxVFzO;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N72PJ5xRRz2yRS
	for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2022 11:13:38 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso2344380wma.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Nov 2022 16:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LQlpOcOiXl81/Ahx2mm4s89XDhcypuM8H0pgEvSLsww=;
        b=OhIxVFzOVdFlVAxUjiWITaflbOUzZBeBCFzmZLiaVFcrAl8ad2QvVW8PY/ovUth0b9
         pXwjnWlUhSP30lOWc/Yxi6AanJiEwgI3WqW+wTOKkerTl8blg/5mn0Grxkysdqzk06kv
         rcRDbHY5YOeSH7gZpEvSbxOB3AmhYD0u/Q1JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQlpOcOiXl81/Ahx2mm4s89XDhcypuM8H0pgEvSLsww=;
        b=acAKfCGbE75mLsLTSUCcnNn5II3tjlxlZ47Um8iWMWdwP5wlfd5UfGwBo11ImUxP8Y
         LvaAmkdhXHmnvCAs4AAtsePZzB756jOiS2jfwY0oHktPctk6IooXVmZ7BrB/pQs5bLVu
         MT/GNS9juIPDCb0bi8EPjcAyCcZk0lDpXGYZ2JumjSTp0sL+tvJ2O+r4BZ94TqWrER1x
         zlCe+DoHAzp6Yl+h0OIMrtx6vFXKDMaw0s7nxp3/OBKDb2pTZz1Rvlo+gCMMYN+BBYb5
         I73S8QihAbt6LdVOMmN5dCB/TkNt/cv18SVHOap3TFwj09utnHQS6JuhOj74p5BeCwAB
         eYug==
X-Gm-Message-State: ACrzQf0JOeH+dRxheG1PkgEb+nVdIZxADcfwC0bfHftYMjqwxmAqm/yW
	FMmxaaY1GeRp9tOAiqr0wxGqyH+eZYffpD5/Jh0=
X-Google-Smtp-Source: AMsMyM6ZralU9souDC9JtnLIt2EwbirtzEfO0f/SdzIXpaf7G7fGeqcKFbfqOIdJVqqIYcDtxFK2g4ntenfJp7ILodQ=
X-Received: by 2002:a05:600c:1d8f:b0:3cf:54f4:ef4 with SMTP id
 p15-20020a05600c1d8f00b003cf54f40ef4mr48808133wms.190.1668039214549; Wed, 09
 Nov 2022 16:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20221026064021.16683-1-zev@bewilderbeest.net> <20221109114748.GE18848@packtop>
In-Reply-To: <20221109114748.GE18848@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2022 00:13:22 +0000
Message-ID: <CACPK8XdD_ZfN1xqR9P_J0-9VxHA_=Ma+rqDhNv33-L0CQT2fUw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] Revert "config/ast2500:
 Enable RAM devices"
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Zhang Jian <zhangjian.3032@bytedance.com>, Dylan Hung <dylan_hung@aspeedtech.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Nov 2022 at 11:48, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Tue, Oct 25, 2022 at 11:40:21PM PDT, Zev Weiss wrote:
> >This reverts commit ba91e9df1e16db0d209177148e864c65e58eb00f.
> >
> >CONFIG_RAM=y currently breaks DRAM initialization on ast2500; Aspeed
> >recommends against using it [0].
> >
> >[0] https://lore.kernel.org/openbmc/HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com/
> >
> >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >---
> >
> >Note that I'm not at all tied to this particular patch as the fix if
> >the interested parties can agree on better course of action; I'm
> >mostly just hoping to spur some further conversation given that
> >currently a vanilla OpenBMC build bricks my ast2500 systems in a way
> >that's not real easy to recover without a flash programmer.
> >
>
> Ping...I'm hoping to get e3c246d4i migrated to u-boot-aspeed-sdk soon
> (bearing in mind the end-of-year deadline suggested in Joel's email a
> few months ago [0]), but with this issue outstanding doing so will make
> any such systems self-bricking unless I hack around it with a bandaid
> kconfig fragment in a bbappend, which doesn't seem like a great fix
> since it's not really an e3c246d4i-specific problem.

I've merged this for now.

We should consider removing the C DRAM training, or re-working it to
match what the assembly does (IIRC it is different in structure
compared to the assembly. I don't know why).

>
>
> Thanks,
> Zev
>
> [0] https://lore.kernel.org/openbmc/CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com/
