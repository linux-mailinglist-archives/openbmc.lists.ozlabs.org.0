Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA86E48E05B
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 23:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZfRM6DqGz30LS
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 09:36:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=RMGbk/JL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f29;
 helo=mail-qv1-xf29.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=RMGbk/JL; dkim-atps=neutral
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZfQt5FnZz2yR8;
 Fri, 14 Jan 2022 09:35:48 +1100 (AEDT)
Received: by mail-qv1-xf29.google.com with SMTP id 15so8379178qvp.12;
 Thu, 13 Jan 2022 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PP1423VmXCNEpr6x85pDcRINUY1BVKseyYhoEt1br1Y=;
 b=RMGbk/JLSU6kUhB4j9bf0zcTVb7Wv+IRlRPvm3PqqF+O3xNmPXRYKyavDmR+dg43k4
 LzmhqFkSO0vtg6oDKp8PgtPaPVSgxH1LrSvTkMxRu45MNCPDT4EFztdAmPDsEXag03qH
 1Jz6vo0usc22mEUhUqC1T165qYgckKeSkV3TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PP1423VmXCNEpr6x85pDcRINUY1BVKseyYhoEt1br1Y=;
 b=DQMlHP2cj8SdKEvWpGXzU/p3LeBiyuZWpg9FR6j4L8u+Sz82zWjF1Zz5PXX8ljvAhP
 TvEgWIA6Mf1Ogxp+natnrSGTNafYMg2N1SWeFJ4XfcTiBC5mOShWOLyg/hqIOmnOeRYo
 E0fL5WV6H39pCUEMiG7/J/Wc5yDJ8zX8Xa9swHrc7uDULLc1wW/m+p0oD0ryOlksZQJv
 o0dR6zIxr4LshDsCNHunI8yrMvgA2LsWM/ZTeqa31o5lFV/afa5I5pXc7FSLytb2mZpj
 OXBAeOxXum/zwJCHWLQhmGFkP2zetu0QH0HxAN30bHeo75J+wKA1YtFFtB1N0dHzzEkb
 MT/w==
X-Gm-Message-State: AOAM531ZOGnXxOdTFXFBVO5h0JYyd1kMvSxy+zQJxU2f6Vuv8e4eubc2
 Hu3aNwROV7m/7PkJuUBvRW8lCn8axRDBFsjoAB0=
X-Google-Smtp-Source: ABdhPJwvS5RkVPDYOyFBURNlUniibOApJPDqsNHMVoAteSeZU6gCk2guyywcY3fghdn9aoaUbS7/UAVUrq8+IrhskWw=
X-Received: by 2002:a05:6214:4101:: with SMTP id
 kc1mr5991043qvb.49.1642113345011; 
 Thu, 13 Jan 2022 14:35:45 -0800 (PST)
MIME-Version: 1.0
References: <20220113211735.37861-1-geissonator@yahoo.com>
In-Reply-To: <20220113211735.37861-1-geissonator@yahoo.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 22:35:32 +0000
Message-ID: <CACPK8XfY58odFjf0KNdYXa5MbCg=A07OEfuyjsbnmMtUmxG6ww@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: rainier: add reset-cause-pinhole
To: Andrew Geissler <geissonator@gmail.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Geissler <geissonator@yahoo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Thu, 13 Jan 2022 at 21:18, Andrew Geissler <geissonator@gmail.com> wrote:
>
> This GPIO is used on the rainier system to indicate the BMC was reset
> due to a physical pinhole reset.
>
> See the following doc for more information:
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

I couldn't apply these cleanly to any tree I had. I think you had a
patch to add battery-voltage-read-enable, but that's not in the tree
yet.

I fixed them up to apply.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index cfaa606666e2..7ea70c7d698f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -247,7 +247,8 @@ &gpio0 {
>         /*C0-C7*/       "","","","","","","","",
>         /*D0-D7*/       "","","","","","","","",
>         /*E0-E7*/       "","","","","","","","",
> -       /*F0-F7*/       "","","battery-voltage-read-enable","","","","factory-reset-toggle","",
> +       /*F0-F7*/       "","","battery-voltage-read-enable","reset-cause-pinhole","","",
> +                               "factory-reset-toggle","",
>         /*G0-G7*/       "","","","","","","","",
>         /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
>         /*I0-I7*/       "","","","","","","bmc-secure-boot","",
> --
> 2.25.1
>
