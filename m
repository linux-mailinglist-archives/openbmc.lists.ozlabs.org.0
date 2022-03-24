Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B54E5C57
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 01:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KP5k651yTz300Q
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 11:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sm2QYz88;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sm2QYz88; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KP5jh2h5Pz2xTd
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2022 11:30:45 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id g9so3292804ybf.1
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 17:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
 b=sm2QYz88Sv85BbdSp7wAc5CC6Vfap2Cq9y4XebXVny0JR4QYb9e9KNo/SFvPOwLosl
 mwzbQ7d9he9CGO8zrleFg96U3k6ODOL+TgiCseeneDpFrmmuQJ6QhITJ2gUXejK4cJZO
 +9L1JAd3FXWEhQBeG6IoqDowTNCS3TxIMtQesAWN3eL33dsnwicwyjghchSDKJ2kKi24
 vzXoGk0QUKC1kgbkKA1vKsljIqxDGJ7dgnlzFDebBxH/zmTNZ3EnYs7Tum5btiB3Eho7
 F2j6tTJ1COWjTbHY+1RuJF9pajtIzDt1cFlLuxtbD6p1lFbG1rw+a7X2529r8Xv3c//5
 l8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+4QpJc7UTXQ25ijXf2+lrnAJ1ejmAWlIWrE7E1j33TI=;
 b=oC/EVov+mIyeiecfFUm8PFlZ4z+K6dvWdk9Y3PoTv1T6TGrsZJhmxPGO3hpvsG2K16
 mQvmbreQW5iP05faV4BxkcR6mfjh8DCJqWhyDKFBBUaBPXgiK4lveeh445QD+4ho6ykz
 LwhlPa7nI1oqVvwX2H6EEPqH3QbkJyn0eWSPMOz0bsv97ewYUmkb3VpFSyusx8nQ7d2n
 2BJingj1/F107bNqATkGR2dSHe/+UfdxfIKeQCmFMKEtHP8RkjSu0agHGYVWg3RQJPM0
 h57VM4LzvT/PUzOE0GIT3dlGjc6mu7NvU2sZDzL76UKM92hZTwpfRHask3flhktyWI43
 NxvA==
X-Gm-Message-State: AOAM533EmhIiv0X5IfP5InRLoYhqfi4C5Psz3FMwnCjhzmHCFH2AHisT
 JB1kgZAOe7iHVTqUAptoSjKrRvRZD33GiuW4fTxpCg==
X-Google-Smtp-Source: ABdhPJziaumYzsskDdP1Z7xO/C1TBQ7mH4rtodDlPc2lDpMBwu8r3qc8JCK82cUNPyNzbPdp1h5GHG0MmzYCPdQlTNE=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr2498519ybr.295.1648081841132; Wed, 23
 Mar 2022 17:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220318071131.GA29472@kili>
In-Reply-To: <20220318071131.GA29472@kili>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Mar 2022 01:30:29 +0100
Message-ID: <CACRpkdbuX2Prw__ka3+ns+eGuE5CtLwrqGjUyHXoy8pRRPURxQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: wpcm450: off by one in
 wpcm450_gpio_register()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 18, 2022 at 8:11 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > WPCM450_NUM_BANKS should be >= or it leads to an out of bounds
> access on the next line.
>
> Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
