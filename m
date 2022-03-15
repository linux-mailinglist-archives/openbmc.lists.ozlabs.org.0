Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4414D921F
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 02:13:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHb5b4Q63z30NW
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 12:13:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ux34JU5Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ux34JU5Y; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHb594SmBz2xXd
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 12:13:31 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id jq9so13998020qvb.0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 18:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dwAn3W7JqTFJWnJs64oLAKVQi0GEmuJXd5CMnlgQgRo=;
 b=Ux34JU5YorjpXisd5AMSmmAtUrKGTm9Mtqprl1tcSJdR9wJtcwpTcX15Y/Z40CP504
 QCJtfE4Oqkh+sLBjAR7PdLdkn/xyldqxP8XkVHoJDo8eQS53Fo8YOgzvB3YxM7bUnjUh
 hkaHGxrCmEEfZu9sEkeVL0d/WNJc8Afg4KuVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dwAn3W7JqTFJWnJs64oLAKVQi0GEmuJXd5CMnlgQgRo=;
 b=xuDcjCuDgKMzfTpHxJhltyrprdXNnRbuK3gCWHm9mlD0e4QOCwj5IT1dkX26InDGD/
 fQ7Rwq4gSzx6vGADtbGuIb/WO7eXpBUtT0ruv78c0XZaT9TBswPM2CRUo2TTGnnHf3J0
 HjvPd8+VwVntPGEB0U+m2eznonrKGWAm+ClDXRkYTwSptrmoIQWyy6zEpOQbEnZGk9Tt
 gpPUjouRIwQV41RmVI6XOvhW1fetfxWePOJjpw7X2Q1wmI6LXag7mo2uoKFfn3w46xuK
 8DFyXaseutySAhvG7qd3okwi5kb1Sb32N8PYZ8Y6mPgI5ap0huOm+m+ebAvzhVY1d7Yf
 lPBg==
X-Gm-Message-State: AOAM533iETqOb2t4nl1kT+tESt3UEo4W2N9/bvqQ0myRgzrftTqjCKaW
 KLR174NeJftjIWLoV+DykaAOl4yGG6RCBeo1brs=
X-Google-Smtp-Source: ABdhPJytKfY1Xv1hYw9fXk9v623Ig2P8yrtMnEqcEpDjV9v+JQJgqJQZKcLwZoqzgNdI/js1Wht0gpsieyZ3Mom37iY=
X-Received: by 2002:a05:6214:2a85:b0:439:db71:f630 with SMTP id
 jr5-20020a0562142a8500b00439db71f630mr16198122qvb.65.1647306807951; Mon, 14
 Mar 2022 18:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
 <CACRpkdahSbWv4q7hoBAm_4+oKPEui9zX5-4m6wvPWfonWpbZUA@mail.gmail.com>
In-Reply-To: <CACRpkdahSbWv4q7hoBAm_4+oKPEui9zX5-4m6wvPWfonWpbZUA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Mar 2022 01:13:15 +0000
Message-ID: <CACPK8XeOE9mjmudvOS7uQg1e9Fh2e_cq1KTxkZsftbCo5YLk_A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 15 Mar 2022 at 00:17, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
>
> >   dt-bindings: pinctrl: Add Nuvoton WPCM450
> >   pinctrl: nuvoton: Add driver for WPCM450
>
> I applied these two to the pinctrl tree. Sorry for taking forever
> to figure out that I needed to do this :/

Thanks Linus. The device tree changes are queued for v5.18 too, so
they will all go in at the same time.

Cheers,

Joel
