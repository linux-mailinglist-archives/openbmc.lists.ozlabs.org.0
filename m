Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC93AE437
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 09:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7h9y3SXNz306q
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 17:34:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=QWleZMDc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=QWleZMDc; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7h9d5GSbz2xZ3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 17:34:11 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id r16so6453145oiw.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=adq5T26Ec1nOtSnl/7hfxxTqv0iZ8zh+xfkQUBFl8bw=;
 b=QWleZMDc1Oyc5xBLI9n7u44KCVMfwsZ2O1I4iOfwW0GFvPwKwjpB2H/prcnbJCx6Mk
 0weq0gFZZkmashFG0xDwmSH10t028unKj88gHzt7U1jwfUyZoXjrjMt/cnphIjG9dreo
 7R26dffcG6y1u1otOd3bv5rqxpJrLsrq4L8p8fOBAFmhzJm1sOdDmLBn1D4DC7AvRN08
 9FifqabSvqGLwpf3ygaQ8oWwx0WRQKA64qm8NbAMoL58TbMeRVjjdJWBkzkAskyGn/4A
 q3FFR68FD14nCmbBUPIRtbZuvn3Cj5jfJuItEeKDMI+I68o+0NMZ2JfGf8nK++BjAG7S
 6gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=adq5T26Ec1nOtSnl/7hfxxTqv0iZ8zh+xfkQUBFl8bw=;
 b=WXjLv6v21RE2hhddY9Q44nxF+ZGkg/ZmUJDxIrUJreVw+p6aQKjhW2THOI9++vCJF2
 CmWtAXB0KX//sA682X6d1xWeRWbcYmUZMwgsSjdm5x652k5ZRqasQrQf+J8PPfW+LOg7
 F5nbYrcnLskU/HilsXxWaUWwLgEJmuUqet5gwBVfvDe82XwzxKzVOGvCRAbyyvwcyUMC
 r9mFV8oPRnYcpJJUW2fe4R+AdCrr1G6U/1J1Bfvey9KD4QI5K/C7euV12lKUUcFusRL/
 8e6lfjkR7UT7M7FFZRVFb4Vt7PO9eSqb2mC/pbMX/D1jyA/7SlLqIFf5f4b6FSj7h9Oy
 hPxA==
X-Gm-Message-State: AOAM533l4PVX9t3HSqRm1gt7nipykfY1jwITkCSU6/vooOIK08omndBF
 eLvrmgVdKvfc49WT63emcYCTXL6R+Bl049EplYCOdQ==
X-Google-Smtp-Source: ABdhPJxxBEZoyJyvyiTjm30IdIyC1ZQ5w/szwxpOiCt6XtKYoUtj1az9rP07tAZ+OMbQnalt6DGMerJ2oh74UBPkujs=
X-Received: by 2002:aca:1809:: with SMTP id h9mr12413834oih.4.1624260846807;
 Mon, 21 Jun 2021 00:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210618024758.892642-1-joel@jms.id.au>
 <20210618024758.892642-3-joel@jms.id.au>
 <CAGm54UFSRvCGNuqxoyKjFtM8CjLKxxprJcY+DjXjBOqaF-mJmg@mail.gmail.com>
 <CACPK8XcC+bYV-KY0ueTZ8dczPs4Ty+j+K0RDT+Ud8NZZ01MHSw@mail.gmail.com>
In-Reply-To: <CACPK8XcC+bYV-KY0ueTZ8dczPs4Ty+j+K0RDT+Ud8NZZ01MHSw@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 21 Jun 2021 15:33:56 +0800
Message-ID: <CAGm54UFDXTp0xkHoi+LSBWfJ9rQqT6EDMmtm1o7SxM09Cnz8vw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add
 environment for booting from mmc
To: Joel Stanley <joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 2:17 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 18 Jun 2021 at 03:12, Lei Yu <yulei.sh@bytedance.com> wrote:
> >
> > On Fri, Jun 18, 2021 at 10:49 AM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > This adds the default environment from the OpenBMC project.
>
> > > +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
> >
> > This is good, we hit an issue before that is related to the default
> > env not in the flash.
> > Could you kindly help to make the same change for other configs?
> > E.g. for ast2500/ast2600 evb config.
>
> That's a good idea.
>
> Do you use the mmc or nor flash to boot the ast2600 evb?

We use 64M nor flash on ast2600

>
> For the ast2500, the existing built-in config should work, as long as
> it's pointing to the correct flash offset. If it's not, then we can
> either update the existing bootcmd, or add a .txt with the desired
> config.

On ast2500, we hit an issue that is described in the below Discord thread.
https://discord.com/channels/775381525260664832/775381525260664836/847735311290073108
Basically it's related to the default env in the u-boot code is not
sync with the u-boot-env partition.

-- 
BRs,
Lei YU
