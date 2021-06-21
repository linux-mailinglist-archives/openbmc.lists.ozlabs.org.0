Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1625E3AE308
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 08:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7fTm5lWzz3066
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 16:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Dj2pfkd8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dj2pfkd8; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7fTR2Dq8z2yhr
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 16:17:45 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id w21so13852351qkb.9
 for <openbmc@lists.ozlabs.org>; Sun, 20 Jun 2021 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yrlsYr9zBUctDOcfSWl3eF/Fi1Fb2YRf5onTOBAAuzI=;
 b=Dj2pfkd8JIlsPYIvzwSRrFNJrhIxS7CtXkBPdWnCN8rF1iEbk2prq2I6OGtRJrKArL
 cHsXmJqn9Sxfg/PvR8+UYD9v5/cyKtuaTU+5krrWXDw0Qq5JYI2aXJcoT49q7B2anQKc
 4W8JsuF/3VcRjzDUxi4lylwJ4Pf22T4wrVh+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yrlsYr9zBUctDOcfSWl3eF/Fi1Fb2YRf5onTOBAAuzI=;
 b=UcjAmgZt2Gp333DQfmh28fRkVRmhP1wCCmlMUzX/+IaENNbG3BVyWA4docGZiXYOYj
 4BUm1heW1HQLfIVNM+rNENxGjLTL8ogs1G7WyHzG+6eIwesWAm+7vI8Ki5pz8uggaA3j
 tGgaBlSBMQ86GfflGdoNYX71lGsaVYE2e/l33phRxcIJiASU8Zm16xyiLnpB4TQnnrl7
 0pYOOh7VePZ2hhLGVtBWXxNOrZCID64PIQn3oThQe39qJ14Wd6bUbOVwYN3TpvEy+2eT
 EpXScm1fhEsqdfoBnlFyyzprBLHHoeoVCoARs4pH5hncGCwrkapRRc8q+jg08YlKrzSq
 7cSw==
X-Gm-Message-State: AOAM530ZUFpqWkWiLt4PXT7WVGNl2QePs+Z0aIF6fQ4YnqeZjMDLluc9
 bd93E796Hb6Pzs+QwafyzcExmWbN8/elAjC4ZrQ=
X-Google-Smtp-Source: ABdhPJzDWRZJ9+m2XadIvrZF8J6Yj9TEtDC7pOxxu1lx3AbGwqC8aA99HSS6IfFToqIXIS9fIyT8543rCAUULrh/L+A=
X-Received: by 2002:a05:620a:2099:: with SMTP id
 e25mr21401430qka.487.1624256259231; 
 Sun, 20 Jun 2021 23:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210618024758.892642-1-joel@jms.id.au>
 <20210618024758.892642-3-joel@jms.id.au>
 <CAGm54UFSRvCGNuqxoyKjFtM8CjLKxxprJcY+DjXjBOqaF-mJmg@mail.gmail.com>
In-Reply-To: <CAGm54UFSRvCGNuqxoyKjFtM8CjLKxxprJcY+DjXjBOqaF-mJmg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jun 2021 06:17:27 +0000
Message-ID: <CACPK8XcC+bYV-KY0ueTZ8dczPs4Ty+j+K0RDT+Ud8NZZ01MHSw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add
 environment for booting from mmc
To: Lei Yu <yulei.sh@bytedance.com>
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

On Fri, 18 Jun 2021 at 03:12, Lei Yu <yulei.sh@bytedance.com> wrote:
>
> On Fri, Jun 18, 2021 at 10:49 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > This adds the default environment from the OpenBMC project.

> > +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_openbmc_mmc.txt"
>
> This is good, we hit an issue before that is related to the default
> env not in the flash.
> Could you kindly help to make the same change for other configs?
> E.g. for ast2500/ast2600 evb config.

That's a good idea.

Do you use the mmc or nor flash to boot the ast2600 evb?

For the ast2500, the existing built-in config should work, as long as
it's pointing to the correct flash offset. If it's not, then we can
either update the existing bootcmd, or add a .txt with the desired
config.
