Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F349A31D5DB
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 08:45:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgVHh5zZ6z3cZR
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 18:45:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AAHObVQG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AAHObVQG; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgVHR5cCgz30HH;
 Wed, 17 Feb 2021 18:45:06 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id m144so11913363qke.10;
 Tue, 16 Feb 2021 23:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCYHkP1aaPC2ju2paPaY+eoqpfjSVcunRt30wEH2p8U=;
 b=AAHObVQGaERydM1DlwWubQJKTKTVnmQBfgoX0PGJn29iia5qcb/iGf1AoROZuZSqvl
 w+PMF3vUx06pWgQNfzENim4S9nkdJxlUW7hEpi6jIvu1/aO87i9jsX5dtWqRrJos722i
 NmAofX+BGRlEjlnFc/i1f4WoZSH26+35dlwUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCYHkP1aaPC2ju2paPaY+eoqpfjSVcunRt30wEH2p8U=;
 b=j6l/KZD+7DQn7jK7zVlkysH9a5BTma4VKgS9u6K0xvUPuDCRnLJexEtUcGj144x3f5
 84nKjDJXiWDN2hjP+p/+tdepraEhk5Q8BuUxoEztLg09Kr7/yVjl7F46nMHO7tXqtmQo
 Vp3D4GFLLGjHZuTGWgY93wcWx128X1Neypu4jq0ha8l9okx7A7+/1C9Lq7pK/aafWBf8
 PmR5BWmDf66o31M6JlrORGfdWDx1d1JfZkE7M1h6muA8g9gqVwlt9eOpYwCttiskslFh
 Djoi++r2aXQlB4e30+Vwx/LfLRMw7i6Du7qEN8CFjKwF1fLLsRq2QKyerGVSc7swGnKh
 jfqA==
X-Gm-Message-State: AOAM533F6Ru0HTFEsWxaVC4IE2BC5CzYXWmAEATMdLeqCufZTvYKoBok
 0Ffl+jJ2dS7mG9KTEPMxD1ft8dodlt4n6R1Ww6g=
X-Google-Smtp-Source: ABdhPJwZtu3Qq+3imBOs8bwV65/o2jyioHqrf93AnZbhcE4AEEgRRwSgKEqek1P9uLpKbbu/kI/mf9O2uP6SF4p1+PI=
X-Received: by 2002:a37:27d2:: with SMTP id
 n201mr19429138qkn.465.1613547903021; 
 Tue, 16 Feb 2021 23:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-2-chiawei_wang@aspeedtech.com>
 <85f00459-4a39-441e-8119-8e12f8132cfe@www.fastmail.com>
 <HK0PR06MB3779B25984A461E4A1ADEF1191869@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3779B25984A461E4A1ADEF1191869@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Feb 2021 07:44:50 +0000
Message-ID: <CACPK8XdFLKg9k6snLSZrRzorxBeg1fLoqakm6J_8VCXh_=JEQA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chaiwei,

On Wed, 17 Feb 2021 at 07:40, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Hi All,
>
> Do you have update on this patch series?
> Aspeed has subsequent LPC module upstream plan.
> We hope that the following patches can be on the basis of the fixed LPC layout.

Andrew has expressed his support for your changes. I will take time to
closely review your proposal this week.

We will set the goal of having this rework merged for the next merge window.

Cheers,

Joel


> Thanks.
>
> Chiawei
>
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@aj.id.au>
> > Sent: Wednesday, January 27, 2021 8:25 AM
> > To: Lee Jones <lee.jones@linaro.org>
> > Subject: Re: [PATCH v5 1/5] dt-bindings: aspeed-lpc: Remove LPC partitioning
> >
> >
> >
> > On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> > > The LPC controller has no concept of the BMC and the Host partitions.
> > > This patch fixes the documentation by removing the description on LPC
> > > partitions. The register offsets illustrated in the DTS node examples
> > > are also fixed to adapt to the LPC DTS change.
> > >
> > > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> >
> > Any thoughts Lee? If you ack it would you be happy for the patch to go through
> > the Aspeed tree?
> >
> > Andrew
