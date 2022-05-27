Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6554535A43
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 09:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8bss3qVvz30F8
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 17:24:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z1eG2A3m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Z1eG2A3m;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8bsR51ynz2ypk
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 17:24:27 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso2258224wmp.0
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 00:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3TvFwVNhYw+TCLR0KUn2X2eZLLvlPt0hWCl0s7fo1s=;
        b=Z1eG2A3mWymXHOwc4ZmkxrspT4nnkOV+ALNVe8051i8VNt9YyIWZPMaugNG3mchOPE
         KfuRcJ+VztVvJwbPYwOgf6U/Bq1NP0Qlt/eS/B4NOf+CHx8JEiwWollHfeP2ZcvKwWBk
         ob4J2YzwhypInjxlnPlrIKusF4MijEptCAO9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3TvFwVNhYw+TCLR0KUn2X2eZLLvlPt0hWCl0s7fo1s=;
        b=rUZlxajYGcR6LaTiIxMsD5g1Byg3pdMzdsOkwXkbH9H48KSWqVkJiCGNVzP5MEWmxe
         m9+7oQptNoNmPo6iohXKpdhHWfKI1/fQSmOvNV53/IkDg/dYBlQA3ET0eZ4Trmykvc4B
         59LfdDxc6sxbfjdGHmWIyJ8eda10R4FSCxowxs5XhF8yKCEm6Mj64krGKtGuI8tsH8hd
         IkLVsFg/K+EqzbvgE5Gggp/jHSg7S0kOqYndVxZMrswRcWeN46CY8+33A1NahnJXuh4U
         1GTxKTadeEP+UvNTlul6d5T1kvdMSAhixuKnl/MaoO2GLaHIbDZ5udG2ctFxNRdJj/2l
         ysHQ==
X-Gm-Message-State: AOAM5307gQa0eCi3SHVcNnZskY2FW9n8KJDQbm6a1vIL0i0hg1KxYnEp
	zIcvqOPF5DFiCYzwmNB3gfbolpMm02xz7Y1LW1EDxUhs
X-Google-Smtp-Source: ABdhPJwacrIcfGfnW5Cmapq78OTQNx7+GMuBpl1+dnNmp8ZM6UqEjY0bIx35A0KeLVjGJFyG36lFqvSnjQRTj8KWDHE=
X-Received: by 2002:a05:600c:3cc:b0:397:337e:14ca with SMTP id
 z12-20020a05600c03cc00b00397337e14camr5729093wmd.10.1653636263319; Fri, 27
 May 2022 00:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220525170240.33918-1-eajames@linux.ibm.com>
In-Reply-To: <20220525170240.33918-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 May 2022 07:24:10 +0000
Message-ID: <CACPK8XesSxgbAQwnOKcPhUrxHZ3VaoO9B+xZXQzbnMa1q7XBCQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 0/2] spi: fsi: Fix spurious timeout
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 25 May 2022 at 17:02, Eddie James <eajames@linux.ibm.com> wrote:
>
> The driver may return a timeout error even if the status register
> indicates that the transfer may proceed. Fix this by restructuring
> the polling loop.
> Also include a patch to display the error return code when failing
> to transfer one message, which would have been very helpful in
> debugging this issue.
>
> Eddie James (2):
>   spi: fsi: Fix spurious timeout
>   spi: core: Display return code when failing to transfer message

Applied, thanks.

>
>  drivers/spi/spi-fsi.c | 12 ++++++------
>  drivers/spi/spi.c     |  3 ++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> --
> 2.27.0
>
