Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DC5BF599
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 06:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXR043NB1z3blb
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 14:54:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UP1eJt0z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UP1eJt0z;
	dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXQzf1MFCz2xtt
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 14:53:49 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id c11so7838611wrp.11
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 21:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cupo/Rbd6yyeF3N//+2RJNt1ud6587gTp50Xm+JUGsk=;
        b=UP1eJt0z3oyGa1fxlHwpEeyC4TagmKPTewuDV/su/mE2kEmNXy1CKGnlB1U5dCxLSK
         EIsv7va862LXokR9njcqM/UoDoIYmK8BBMg7uleWxkoGRhzq7SzIDXDJVag4mFzlKHI7
         hC32lEYOw8vdvbBk32043mpWdHpCz8x62sUY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cupo/Rbd6yyeF3N//+2RJNt1ud6587gTp50Xm+JUGsk=;
        b=hkONq9DjcIZCjJzsYNMT9sC84VSMRoWsuwaph2sKtA9J+CmRSnVP7S1mO7q60zOWq7
         a4n01WQ72E+2JBjmeIPsGtW1vUxCdICdlZbM9tNiVIR86geJDHu0tYuMReJvMB4r2OiM
         Axp8zWdEMqAjEJhtf5cLWt4YrREa7CKstKhW4XVCWl2mWR1cMclNlvTP8Q2/iwEH2aAj
         vuTN6YERAAX4KXH5PqxXam4bnM8m6fYgad+3d0poEqfid384ihb8dqt1TdyRShDY+CGc
         ltqvnE6Ffcci9iGbP1W+p/MFJbZC0dbIrxkcVIdsbArT5bv1VHNVAQ7X3k8L8WHBFjWz
         atgw==
X-Gm-Message-State: ACrzQf0ANJvwV80VF2MjCeGQ/GrD3yzAXd3Ac/vMgw93iV9XdgaQnSvm
	RgU6LOg55O5mIDrZZrZX3jhNEALVCAPpOoFEBNs=
X-Google-Smtp-Source: AMsMyM40tv3am10nuG2zGzuSkFOId3EClOjR7W1CEqxj/BeVFiWsw3egT9spycVx1q0miYOpdHAYC8+RHP+pApyQjJE=
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr15835605wrt.549.1663736025328; Tue, 20
 Sep 2022 21:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220817015949.16946-1-joel@jms.id.au> <20220817015949.16946-3-joel@jms.id.au>
 <b92f8f95-0adb-4c30-92f5-4d39009fbd96@www.fastmail.com>
In-Reply-To: <b92f8f95-0adb-4c30-92f5-4d39009fbd96@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Sep 2022 04:53:33 +0000
Message-ID: <CACPK8XdA=67QB8OgHHniT-oPb7e=UHQ1j0V5d-AU8GHYPRn4CQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ram/aspeed: Remove ECC
 config option
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Dylan Hung <dylan_hung@aspeedtech.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 17 Aug 2022 at 05:38, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 17 Aug 2022, at 11:29, Joel Stanley wrote:
> > -config ASPEED_ECC
> > -     bool "aspeed SDRAM error correcting code"
> > -     depends on DM && OF_CONTROL && ARCH_ASPEED
> > -     default n
> > -     help
> > -       enable SDRAM ECC function
> > -
>
> Do we need any config refreshes?

Thanks for pointing that out.

I'll leave it to Dylan and the aspeed team to decide what to do there.
Assuming they still maintain and test those configurations, they will
need to add a new device tree that enables ECC.

Cheers,

Joel
