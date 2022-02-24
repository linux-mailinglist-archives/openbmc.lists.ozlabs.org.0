Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF93E4C2698
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 09:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46970950z2yb5
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 19:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AMmUWpiF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AMmUWpiF; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K468k0r8Dz2x9V
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:51:48 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id h13so2417041qvk.12
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QfcDvcMiMrFcAL1VhJu56DYxdK9loWaywe14zUAaoJI=;
 b=AMmUWpiFw08sJGZYRKvlasA5feymHsGsyEQa3WUc4xYSQNiNRB9YJhgGhanDXkcRXp
 l7Vo4sthMbq6/Zvm+MxOzWKfOGmRygNsrnM2wG8QG68Qci+6M57tFNFGrkuVFlPp7kyH
 5TrA3MeGhZiH2kj+q25ocesgffdKK0WuWq2+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QfcDvcMiMrFcAL1VhJu56DYxdK9loWaywe14zUAaoJI=;
 b=rlvLWZnU0Vm0WBxoyxKcJFtUixTHhtB8b/3JsPS0RwgVZ0rhaCVHdmlbjLMJs2+7iP
 UmWsE7ippblFAVXqKcTfmAeY2nleEQF543x2w8SDtEkD+lSSePRfYjbE0qdos2zAlUwV
 FqlnykIPbA512Fz2UFAGFWBE/Jo3mJdd7EoqvgmKFFQ9DDEsmq4XuWBRCqGmyjX66lTJ
 CxtxREFogK4YjDLd/QZDdHlXtLfzBGL2U9wdztc3tNtvxzB6uk20ogyJHTMcdPQ1Loxp
 ryj/Yx4XHXKriJ88l9MJZUnMRGGBGCGw7oBU3v7TS+cCJvQ30RhhVPG6RbK5oxR5Fx+a
 ZQ0A==
X-Gm-Message-State: AOAM5314ECHzmA+HPjt2VchpyF1KfxsQLx5HrwqmBRvjE/NTfdXNlD95
 wnbJR6o5V4NqYFiIdsztiSAJQZEZXlD4A2X6MovgxkI6f0o=
X-Google-Smtp-Source: ABdhPJykmHrKfXpzIKgbqQMJwupCJnkm1Q50nUT5H/MrcnJMiJoL56xaiPSzqpdBfCsNpSspmIK5vBtRb5y4G1mOIvw=
X-Received: by 2002:ac8:7d91:0:b0:2de:7321:5514 with SMTP id
 c17-20020ac87d91000000b002de73215514mr692918qtd.625.1645674360607; Wed, 23
 Feb 2022 19:46:00 -0800 (PST)
MIME-Version: 1.0
References: <CAGm54UE7-QxGBniV3J2jnBiW4ygvRcHxKd=G88PsOiNZP+hBTA@mail.gmail.com>
 <HK0PR06MB3779076AB5B2189822951A4C913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CAGm54UGNdAtX=zSuZdZwQ6k2FjPj-Cxd3AwVxyNLLhifEntHbw@mail.gmail.com>
 <HK0PR06MB37792404CAB772185CB386B0913C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8Xdu2VzLBW0oMy_bGo=hoJUng25pffGEYXe9xjyqC4=7tQ@mail.gmail.com>
 <CAGm54UH8ZrUWms84E-4mzgUvGEdVYJGiq4mWSyCKoTzAtFc9HQ@mail.gmail.com>
In-Reply-To: <CAGm54UH8ZrUWms84E-4mzgUvGEdVYJGiq4mWSyCKoTzAtFc9HQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Feb 2022 03:45:48 +0000
Message-ID: <CACPK8XdJ3PNPzvhHLW_WUy2Tkvot7u9AvzztXNL8oWDZFfPn0g@mail.gmail.com>
Subject: Re: New u-boot-aspeed-sdk runs slow and cause wdt2 timeout on ast2500
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
Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 openbmc <openbmc@lists.ozlabs.org>, tangyiwei.2022@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 23 Feb 2022 at 10:02, Lei Yu <yulei.sh@bytedance.com> wrote:
>
> > > > > Could you share us the boot log with timestamps?
> > > > > It would be nice to know the time elapsed at each stage.
> > > >
> > > > Pasted to https://pastebin.com/emseqW6c
> > > > It contains two logs, the first one is good, and the second has the issue.
> >
> > Working:
> > [2022-02-23 02:47:03] U-Boot 2019.04 (Jan 24 2022 - 10:18:18 +0000)
> > [2022-02-23 02:47:06] ## Loading kernel from FIT Image at 20100000 ...
> > [2022-02-23 02:47:12] Starting kernel ...
> >
> > 3 + 6 seconds.
> >
> > broken:
> > [2022-02-23 02:58:07] U-Boot 2019.04 (Feb 15 2022 - 07:22:14 +0000)
> > [2022-02-23 02:58:12] ## Loading kernel from FIT Image at 20100000 ...
> > [2022-02-23 02:58:22] Starting kernel ...
> >
> > 5 + 10 seconds.
> >
> > Interesting that the pre-hashing part is also slower.
> >
> > The old branch was based on v00.04.03. The new branch is based on v00.04.09.
> >
> > I wonder if this is the cause:
> >
> > $ git diff  v00.04.03..v00.04.09 -- configs/evb-ast2500_defconfig
> > diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
> > index 9fcf55b05ebb..000ed3f90bdd 100644
> > --- a/configs/evb-ast2500_defconfig
> > +++ b/configs/evb-ast2500_defconfig
> > @@ -1,4 +1,5 @@
> >  CONFIG_ARM=y
> > +CONFIG_SYS_DCACHE_OFF=y
> >  CONFIG_ARCH_ASPEED=y
> >  CONFIG_SYS_TEXT_BASE=0x0
> >  CONFIG_SYS_MALLOC_F_LEN=0x2000
> >
> > Lei, can you re-test with CONFIG_SYS_DCACHE_OFF=n ?
> >
>
> Yiwei helped to test with CONFIG_SYS_DCACHE_OFF=n, and it works fine now.
> So it seems we get the root cause!

I'm glad this worked. The bill is in the mail :)

I would suggest this is not the root cause. This is a workaround that
speeds up booting enough that you make it to linux, but if your kernel
image got a bit larger (for example), it would take longer and the
issue would show up again.

To properly fix the issue, we need to ensure the watchdog is serviced,
as I mentioned in my previous email.

Cheers,

Joel
