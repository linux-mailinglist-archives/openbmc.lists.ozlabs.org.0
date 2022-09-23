Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046005E70A6
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYXr263Mgz3c7H
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cZWwxqBB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cZWwxqBB;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYXqW5JM0z3bbj;
	Fri, 23 Sep 2022 10:20:38 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-12c8312131fso16256147fac.4;
        Thu, 22 Sep 2022 17:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=wOI+7RifnLsYvXIuNif1j+Pe+3PvkPZ4LwCVFhf/miw=;
        b=cZWwxqBBqFBqZum7y2sdaWueRJk5Us1AGAxvEJgqRMCQuHx2yI/jwjQB1XYgoNLPOf
         /0N+AC55M/O3nmfswF118uqVF39kqxBXHVJvYFMjMCeZChRo2LWTJwzZwFEtC3AOr8V7
         MTqTmjysE6gePjdjSrSQb9Z4FEDg+SBdA+dM0antiTxZgySwVqouwi5mKlPWCr7Sp2AR
         RKM+fzaxwOHgYEfGdJLcpFt5+MkaRtZa7/nv4IEFotZOJMO/rlLDG01/MMUCL7/z7Glg
         5BXxZQ5az53lcqjLErse5UYvf6c2rBDqyKOR+3RqlDovaIVn84kJegwADk4YTz1qyTlt
         MIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=wOI+7RifnLsYvXIuNif1j+Pe+3PvkPZ4LwCVFhf/miw=;
        b=5kh9aYj8Oj3U6ny1Flts40IstCQRMiYI5AqJkfYjJQoqMNerP27VojpFH4oasJDlV1
         k8ZazqKMvuQiht87xNGcMNsc4GYORmVJcUInXYu3e/ZK1VN1hAx5ibc+0hGRnemP0f5h
         BakNqtZiokh2W37e1j+RTDZWR2gmntdE9Z06f44q9O0tQcLmYfjpRgXIvchuaAz4Ec6B
         GUbPGkob3ULX4m3y7aCbZo4opqioBSV9E0C5sFZ/QOxdaYk3YRGSg0K0X6/JuizD5+/q
         cgPCze/q6btgJwnOc4THbb31pMt6sYg6YtJiFx8qcflc7VIcIOhCwlbNj+uFOrvoDVrn
         HdoA==
X-Gm-Message-State: ACrzQf1M5eaC6zUzgpB8nF2PwmnNG1m1zdW3LhJCmE22S52DLWTy/Uok
	kwX5RHN7C6C96/VJMNJQpg==
X-Google-Smtp-Source: AMsMyM6G4hH7WcGJQf2c+vIHQ/UgvzOI553Q8KD5llT+YUAU3KJEKt3k3/pk0J5PdEZ8Z6RFRkwWEw==
X-Received: by 2002:a05:6870:d7a5:b0:11d:a0b:f62b with SMTP id bd37-20020a056870d7a500b0011d0a0bf62bmr3438571oab.190.1663892434995;
        Thu, 22 Sep 2022 17:20:34 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id x9-20020a056870330900b0011c20ffca67sm3825860oae.28.2022.09.22.17.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:20:34 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5d3f:d09:85d2:d6e])
	by serve.minyard.net (Postfix) with ESMTPSA id 45A14180015;
	Fri, 23 Sep 2022 00:20:33 +0000 (UTC)
Date: Thu, 22 Sep 2022 19:20:32 -0500
From: Corey Minyard <minyard@acm.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH] ipmi: kcs: aspeed: Update port address comments
Message-ID: <Yyz70LckHqyiNhGa@minyard.net>
References: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
 <YyywI8265vECnEHv@minyard.net>
 <HK0PR06MB37794D51E9DB4A864249F96691519@HK0PR06MB3779.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB37794D51E9DB4A864249F96691519@HK0PR06MB3779.apcprd06.prod.outlook.com>
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
Reply-To: minyard@acm.org
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 12:08:07AM +0000, ChiaWei Wang wrote:
> Hi Corey,
> 
> > From: Corey Minyard <tcminyard@gmail.com> On Behalf Of Corey Minyard
> > Sent: Friday, September 23, 2022 2:58 AM
> > 
> > On Tue, Sep 20, 2022 at 10:03:33AM +0800, Chia-Wei Wang wrote:
> > > Remove AST_usrGuide_KCS.pdf as it is no longer maintained.
> > 
> > Even if it's no longer maintained, is it useful?  It seems better to leave in
> > useful documentation unless it has been replaced with something else.
> 
> This document has no permeant public link to access.
> Aspeed has dropped this file but we keep receiving customer request asking for this document.
> The most important part regarding KCS port rule is still kept in the updated comment.

I mean, if you have code that is implementing what is documented, why
did you remove the document?  I don't understand why you would retire
documentation that people still want to use.

I could put it on the IPMI sourceforge or github page as a historical
document.

-corey

> 
> Regards,
> Chiawei
> 
> > 
> > 
> > >
> > > Add more descriptions as the driver now supports the I/O address
> > > configurations for both the KCS Data and Cmd/Status interface
> > > registers.
> > >
> > > Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> > > ---
> > >  drivers/char/ipmi/kcs_bmc_aspeed.c | 29 ++++++++++++++++++-----------
> > >  1 file changed, 18 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c
> > > b/drivers/char/ipmi/kcs_bmc_aspeed.c
> > > index cdc88cde1e9a..19c32bf50e0e 100644
> > > --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> > > +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> > > @@ -207,17 +207,24 @@ static void aspeed_kcs_updateb(struct
> > > kcs_bmc_device *kcs_bmc, u32 reg, u8 mask,  }
> > >
> > >  /*
> > > - * AST_usrGuide_KCS.pdf
> > > - * 2. Background:
> > > - *   we note D for Data, and C for Cmd/Status, default rules are
> > > - *     A. KCS1 / KCS2 ( D / C:X / X+4 )
> > > - *        D / C : CA0h / CA4h
> > > - *        D / C : CA8h / CACh
> > > - *     B. KCS3 ( D / C:XX2h / XX3h )
> > > - *        D / C : CA2h / CA3h
> > > - *        D / C : CB2h / CB3h
> > > - *     C. KCS4
> > > - *        D / C : CA4h / CA5h
> > > + * We note D for Data, and C for Cmd/Status, default rules are
> > > + *
> > > + * 1. Only the D address is given:
> > > + *   A. KCS1/KCS2 (D/C: X/X+4)
> > > + *      D/C: CA0h/CA4h
> > > + *      D/C: CA8h/CACh
> > > + *   B. KCS3 (D/C: XX2/XX3h)
> > > + *      D/C: CA2h/CA3h
> > > + *   C. KCS4 (D/C: X/X+1)
> > > + *      D/C: CA4h/CA5h
> > > + *
> > > + * 2. Both the D/C addresses are given:
> > > + *   A. KCS1/KCS2/KCS4 (D/C: X/Y)
> > > + *      D/C: CA0h/CA1h
> > > + *      D/C: CA8h/CA9h
> > > + *      D/C: CA4h/CA5h
> > > + *   B. KCS3 (D/C: XX2/XX3h)
> > > + *      D/C: CA2h/CA3h
> > >   */
> > >  static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32
> > > addrs[2], int nr_addrs)  {
> > > --
> > > 2.25.1
> > >
