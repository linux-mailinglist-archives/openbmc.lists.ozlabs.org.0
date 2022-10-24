Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C8B609768
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 02:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwb5R3hzJz3bcY
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 11:08:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kHB2qdqo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kHB2qdqo;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwb4p2JhHz2xJ7
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 11:08:08 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id q1so7367366pgl.11
        for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2022 17:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iITwRvyEMkdYgQt2KVQu2sEjBJEpOK+amumAuf9C5d0=;
        b=kHB2qdqoXifycGPVMfboRzYQWodaFI65ginUV7siYnTCrgRiPi+FPDV/S7y5wK6SXD
         6u8pG1R+/ICsrfTvdeUjjED83xpkAimYJ+zpO2qkQKxdTjOM4A4p97XJrJ0d1NuEwWWM
         VyP/+uwmSY1fHmrkkQ8OJH/zMcdfZ0kFFTtGdlwV9b9o8fL1av5aBK0/+ulKPz7mxDqC
         fMJ8To10L7L0goOr0VtMUsNLcPqB63GKq8V3GFyG5QJmhW3kd6xk/gNgNeip5bYvRtPP
         EyPWhKy6IclKZFiayWPaXLsJ55NffCJPPCXbU2wWOzUV7sU1UILrSwX+xzc4RI2n2gJs
         PaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iITwRvyEMkdYgQt2KVQu2sEjBJEpOK+amumAuf9C5d0=;
        b=4TVXFdAKtb4g4/zuMvw9sa2DL3+hQDdkIUChe565WfmgzBjpilB64MSx0pakAE4bOw
         AbZlj24Rai+zBb0dN2en39XzpCJxGBjm8k2I7SuoCSWXBKLrYKQX5LoTFwunv6RiB2WC
         wcyYd820Zu0L4sDaqnSEGUcdVLtaZRS9gIPbTOBM/OyPAT+q2cxI9wscYWy6ndjEIuE0
         51qbcYNflPE2zdMOLlkNvso66+szgO7EpD0ohyHptgfCnIdJcRd+Y7Lpsv9VaByCEHtP
         1iQD2WnRDqCRGIXETbSTuxyLzgIbVd2C2QbnR2aaaKMB9cleq5Hv+BEXj4+bc666N27B
         ALzA==
X-Gm-Message-State: ACrzQf08OKlbf4rJvrjyK/+NHCq+ezHFCqyoxDOeo6IGjqhdX9/qpfQI
	mY4j5b0K+fZvoBJ2h/r53qZsF1buFm0=
X-Google-Smtp-Source: AMsMyM7/EbO0DJ0/Ib/oyYTV84zEUUFGjPwgEX2tJ6bN/UsZCx+fkKHp7ZYz9M1EBhw4/4vdYQjp+Q==
X-Received: by 2002:a05:6a00:2906:b0:52a:bc7f:f801 with SMTP id cg6-20020a056a00290600b0052abc7ff801mr31494875pfb.49.1666570083683;
        Sun, 23 Oct 2022 17:08:03 -0700 (PDT)
Received: from fedora ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id i20-20020a635414000000b0043941566481sm16325005pgb.39.2022.10.23.17.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 17:08:03 -0700 (PDT)
Date: Sun, 23 Oct 2022 17:07:58 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Linux kernel updates and v6.0
Message-ID: <Y1XXXhYYe8sKejoH@fedora>
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

Finally I added v6.0 to Meta/Facebook OpenBMC repository. Instead of
making a copy of dev-6.0 (like what I did before), I create a recipe to
fetch kernel from your repository directly this time. In other word, we
are sharing the same kernel tree now.

Thanks again for maintaining the tree, and it is very helpful. BTW, I
may ask your help to backport some upstream patches in the future :)


Cheers,

Tao

On Wed, Sep 28, 2022 at 06:34:53AM +0000, Joel Stanley wrote:
> Hello OpenBMC,
> 
> We've been using the v5.15 kernel as a base for almost 11 months. In
> that time there's been 16 bumps to pull in stable fixes. We have
> merged about 300 patches in that time to support new machines, and new
> hardware, including MCTP, nct6775, lm25066, aspeed-adc and aspeed's
> spi-nor devices.
> 
> It's time to move to a new base to ensure progress is made on our
> mission to upstream all of the support. By rebasing on a new kernel
> release we can see what work has been done, and what remains. Since
> v5.15 we have upstream support for:
> 
>  - PECI, thanks to Jae and Iwona
>  - MCTP, thanks to Jermey and Matt
>  - spi-nor, thanks to Cédric
>  - nct6775 i2c and lm25066, thanks to Zev
>  - ast2600 adc, thanks to Billy
>  - ast2600 gfx, thanks to Tommy
> 
> and others I have missed.
> 
> In addition to the ASPEED changes the Nuvton hackers have been hard at
> work. We now have support for their latest generation  Cortex-A35 BMC,
> the npcm845 "Arbel" and it's eval board. Likewise the HPE "GXP"
> Cortex-A9 ASIC now has upstream support. Congratulations to both teams
> for this work.
> 
> I have prepared a v6.0 tree that contains backports of the FSI and
> Aspeed v6.1 patches, and a small set of existing patches. I will
> publish this on Monday, or once v6.0 final has been tagged.
> 
> As promised the last time we rebased, the Nuvoton patches that have
> not seen any updates since they were merged in 2019 have been dropped.
> They are welcome to be resubmitted as long as they are also being
> worked on upstream.
> 
> Please address any future patches to the dev-6.0 tree.
> 
> Cheers,
> 
> Joel
