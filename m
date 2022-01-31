Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA04A3D3C
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 06:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnGbf5gBcz30N9
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 16:20:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cEGKKlZI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=cEGKKlZI; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnGbJ5pw8z2y0B
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 16:19:54 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id o9so11807138qvy.13
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 21:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3UldYJYUz96lfvTaFZcYIZDWb0p1IoU18iy7JDFB+Tg=;
 b=cEGKKlZIOO3Fr4YLt5DUhytNzAsSrfNh3nZKar2u62mxQoOjgC4eWJJcKxUocFH0tD
 ObsCQLZM67R+qOozEmtxhhWtBs4bZSvwkglr7+SwqNtq5szPsfzk+PyM8IM11MzvvLji
 67srThzlMlZGQcmXkdYAPDHMI6V//RP7tDonM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3UldYJYUz96lfvTaFZcYIZDWb0p1IoU18iy7JDFB+Tg=;
 b=S/yNmaIERWz4vNdRvwe4X5h8Vf5k+NhfWO5Js0K//WIm3wFpaWrSz0gFi4R1WRVh6f
 Dsv9xecTSlk48Tbg5IsFnYDo0xYX9BtaMvZOCFJRM/mABjYp6pFnO19N6UABS7wYcpFk
 VwoyprFrDmj1/vB98krC58ea7RCEIbh3dK70Wln+QHD25PKGaY+urAxYtGqlhrmS3egL
 6Z/nOFjGVKg6279wwmSWyjVt1Pt/CPpnAPmqiBpFqoDZUisrEp7Y2WNFtW0sh5C9ur/i
 YeW5XSBBJR5hull708xV25G+YelqfM3C/2HL8foFPesDhrhDSaufrCo6i7jhGElIsyh6
 SdVg==
X-Gm-Message-State: AOAM533CvZHSHUmZizta1E7frfV2OwAHfFco5lccT2CK8wFjnxxJqaVB
 KNyAifU8Gsg2KxXPqRG6QjL8/VaqAAa42FjubF6NOI8Z
X-Google-Smtp-Source: ABdhPJw0Njw04gLb2GG9KnkGf0erILHGTJjoANhpoArbx1X6A1wnLU0L51AywXP8iEmm9kEkAziFF/AVM5RhpojvpXY=
X-Received: by 2002:ad4:4ee7:: with SMTP id dv7mr16236145qvb.65.1643606391058; 
 Sun, 30 Jan 2022 21:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20220128214852.21551-1-eajames@linux.ibm.com>
 <20220128214852.21551-3-eajames@linux.ibm.com>
In-Reply-To: <20220128214852.21551-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jan 2022 05:19:39 +0000
Message-ID: <CACPK8XfFJ4AFTi5W437crDN1G84JwwLcjgmn6RiMXSDfL65EBg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 2/3] USB: uhci: Add ast2600 compatible
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

On Fri, 28 Jan 2022 at 21:49, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the ast2600 compatible string to enable the Aspeed workarounds
> on the UHCI.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

This one has just popped up in the stable backports (v5.15.18) so I
will skip it.

> ---
>  drivers/usb/host/uhci-platform.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
> index 70dbd95c3f06..be9e9db7cad1 100644
> --- a/drivers/usb/host/uhci-platform.c
> +++ b/drivers/usb/host/uhci-platform.c
> @@ -113,7 +113,8 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
>                                 num_ports);
>                 }
>                 if (of_device_is_compatible(np, "aspeed,ast2400-uhci") ||
> -                   of_device_is_compatible(np, "aspeed,ast2500-uhci")) {
> +                   of_device_is_compatible(np, "aspeed,ast2500-uhci") ||
> +                   of_device_is_compatible(np, "aspeed,ast2600-uhci")) {
>                         uhci->is_aspeed = 1;
>                         dev_info(&pdev->dev,
>                                  "Enabled Aspeed implementation workarounds\n");
> --
> 2.27.0
>
