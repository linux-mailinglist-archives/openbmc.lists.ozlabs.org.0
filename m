Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A435932C
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGkQ30sNkz30Dq
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 13:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jcSmnDiU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jcSmnDiU; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGkPm1nqyz2yjY;
 Fri,  9 Apr 2021 13:38:51 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id f12so3239639qtq.4;
 Thu, 08 Apr 2021 20:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zWYrgmgXBOXRjVrzdgXfjhYpQ0FoUCzYmeLXCLSnYFE=;
 b=jcSmnDiUo1MMc6Q3MSiXiyB7AXqJBpPE3e98RkysCl8SPty3nDcOvOcRler+dmur5d
 aMg54JUXZxIhZg03ZAR8c4WicszsfYamOPqGCL3/D+KRBdvKzAB4CjehLG05aGaqWbqE
 rpwrfWYwUuXjd2oNzh9mCifoRsFoJ+gnmN5pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWYrgmgXBOXRjVrzdgXfjhYpQ0FoUCzYmeLXCLSnYFE=;
 b=g0bUQwjmz48lF7NyXz/q5e/jlT939B4aBJKPmO9d6LrHP3NBOkX/pm8sFu0cze/rxI
 Ced1IMgwuROheWCo4TcwuGTDSppzja+WlGJ2Y1j6YjoSoGJOHT+ofR8oLj/1NrLcY7hM
 zJwx7bTkDpsch7/T5XoZxaXHWWrF9H3+Y76CnWQYZNQsGBD/aJXbIMtY7fJxepqK56Gm
 R9d0nhzfXrxzbtATjzCNvlPRmTUZniTmfgt0AT/SpTbML8PePCpyJ10bLbVWX4gHxJ/8
 1QYgcsi0A99j1tIF9riTowsCAQxqajH2cVMJjYtY9gzayLlRs31q6aBdqKZ54p3g8tP4
 s3YA==
X-Gm-Message-State: AOAM532fTcE81cYrIFdM7/D6dkPnj/TpM+C1b9ROOerop99/Fb6Pyis+
 mt7UCCzLFLoxWYKx76LEGEPgOdcw2jTrKnx+iPk=
X-Google-Smtp-Source: ABdhPJy3ab4kwwpcl+l+Ds70eJmyq2Cr6Wy6ME4tEKA06FjzEJMtXRy47zcwt64rNz+2wEnTaXI69wecrdATFzf/+XE=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr11274286qtr.176.1617939528484; 
 Thu, 08 Apr 2021 20:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-5-andrew@aj.id.au>
In-Reply-To: <20210319062752.145730-5-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Apr 2021 03:38:36 +0000
Message-ID: <CACPK8XcFX9Ljo8K9XzhtCnTXKS0muknzrV6=SU6Wh5jJSPdNAg@mail.gmail.com>
Subject: Re: [PATCH v2 05/21] soc: aspeed: Adapt to new LPC device tree layout
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 openipmi-developer@lists.sourceforge.net, Lee Jones <lee.jones@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
>
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
>
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>
