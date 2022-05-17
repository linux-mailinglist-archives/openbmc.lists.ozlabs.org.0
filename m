Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DC5298EC
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 06:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2P1w48PCz3bpb
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:55:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dKOp5Uno;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dKOp5Uno; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2P1Y5SpVz3bXy
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 14:54:55 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id j24so7778956wrb.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 21:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDZqy4KpXP0ak5pkNolRilSCv8ELUf5g4zxea/Ty6CI=;
 b=dKOp5UnoXxMtB2NStP6YX7azLTfn10eH3xbBPgAzaNrdxSiu7VzjKOukIwUXaMfIBb
 sejtRyfLad949z48zPfbiybhG1IxrYoum4E1+jYEHxUoEQXKAFX5BzwVMr8W/jYmZKsR
 cn945vInk1o7tE6pVFIBv1jYrtRcPoer1CsMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDZqy4KpXP0ak5pkNolRilSCv8ELUf5g4zxea/Ty6CI=;
 b=szLtnAFir3QNZzvYNzaynXlFEm7JhMxWKWjmbyTkHiMYdP+f0MwJHZ0bUZNOugJoXl
 OCbcF2Ai2SAVzG9aJsZHVy9OgprVyXPbKHRrTPHCnHJvya2MyT4+4mltNz5gRuVPVdlh
 PtG9ngg20+OpC/yeo8bJjAhkbb13R0ocfaMM5FF7sGok+bq1X1jIUU16DAGLsoePVSPX
 +FqDcFIWWJYQHvEqevE4adFCeW/L3dkApMx2tCbuWfSzCXb1IqVuTQyA+7tQsAHQAthA
 Uj+tZC5uvbkduF1NOIyomXr7NA3LqWrh6CgpikZjISVLc723i9pVAThyX/BDIW2JPMDB
 TreQ==
X-Gm-Message-State: AOAM533CA0J3fViC92ZyYNaW7i/OZe5DKuX0ci/Q8aAlp7oUrCk0Ofzb
 mz/tBmsYuKexGhLZY8oYDkPJKmknDrdxBWcNHwANmws4xDA=
X-Google-Smtp-Source: ABdhPJxutOdIvs5CzTCBsEO1wF5br8bVZSS8XiVH0953JvsHBDlra17CcuWRUVdUTe6fleEGzXb9EKaipoJ06VS+pxw=
X-Received: by 2002:a05:6000:16c4:b0:20d:914:a441 with SMTP id
 h4-20020a05600016c400b0020d0914a441mr6453389wrf.705.1652763287700; Mon, 16
 May 2022 21:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220517043825.26893-1-zev@bewilderbeest.net>
 <YoMpw1WrKC+RBez4@hatter.bewilderbeest.net>
In-Reply-To: <YoMpw1WrKC+RBez4@hatter.bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 04:54:35 +0000
Message-ID: <CACPK8Xca-07ZnYjCUmxEA3H-WQLohD-JYVEp+hM+XaHPNGfmUQ@mail.gmail.com>
Subject: Re: [PATCH] ftgmac100: use bus name in mdio error messages
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 17 May 2022 at 04:51, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Mon, May 16, 2022 at 09:38:25PM PDT, Zev Weiss wrote:
> > Previously we'd been using a device name retrieved via
> > ftgmac100_data->phydev, but the mdio read/write functions may be
> > called before that member is initialized in ftgmac100_phy_init(),
> > leading to a NULL pointer dereference while printing the error message
> > issued if the mdio access fails.  We can instead use bus->name, which
> > is already available at that point.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib support")
> > ---
> >  drivers/net/ftgmac100.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
>
> Sorry, forgot the subject-prefix tag on this one -- this is for u-boot
> v2019.04-aspeed-openbmc in case it wasn't clear.

Thanks, I figured that out :)

How do you reproduce this one?

I didn't realise we had downstream changes for this driver, we should
ask aspeed to submit their downstream changes to u-boot mainline.
