Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F54423571
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 03:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPGzP04tYz2yWL
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 12:27:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ckdJ1ofQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ckdJ1ofQ; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPGyy0GGJz2xvP
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 12:27:19 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id x9so1105639qtv.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Oct 2021 18:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5V/CYpZDaox8A4m9HczsKoqQ1wtwSA/29fW/9YWuUg=;
 b=ckdJ1ofQolakb9qYLOXHqOqdztVHWt7OPkn5cdwwXmel359jJcqZjM5QS2fP3IQWc9
 mzNzz6vXC5HJHEt62VeDnV2joYMh7KNS7oB0lCnSzS+DrCR/OojyFMQdi3v357pl20su
 wZ4xIyCFjQjoM1HpZ80aRqkhfDZBO5kIdrswE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5V/CYpZDaox8A4m9HczsKoqQ1wtwSA/29fW/9YWuUg=;
 b=6V2KvP20abG3sjV/VEM68bDAifOPEamymQxg4WlDGDvqNGOC3mSRrbM+jNWFVo0MZL
 uX1apofbwrAVz6WCk9P+cLB0Z1FMok4iWr5YdBtPCU6epkc7fcgbx1S/L+gTXmUUWnlD
 YTOx2plVXqykCa7y/6PvdisSG4N12x7vLY13QX6iDQNf7jW5Kuz6nP1i8xIo+Wa05WFA
 pUBJmVCkZ8mP4Uad6UDZZ4OkfCZUqSmwqzHkKHiUiP3Jp1XjQ0+ngqGCLtsVzbhurXrh
 09tc0qyPAS93ATaecI5CtbpJh9hmp14XsGn3ghhL7kiPrBTPbZnlhJiVRKYCwTLBd2ej
 v+TQ==
X-Gm-Message-State: AOAM530a8o1hheNONac2qwvaZ+R4aQWNlFTh58s/q00HqW2H5NVha3ip
 JoJJaJNkoZRAwqCyZYMvpMSt+kEOunf4slhT48Y=
X-Google-Smtp-Source: ABdhPJzT1l9b+M36cXq5gGZEJbZS03Kabud0GqWeHScKREcFXttNa38KaP4Cr1WMWpPTL8ttV2cmwm4KjdbM2pdUGQM=
X-Received: by 2002:a05:622a:45:: with SMTP id
 y5mr23214853qtw.145.1633483634594; 
 Tue, 05 Oct 2021 18:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210910073619.26095-1-neal_liu@aspeedtech.com>
In-Reply-To: <20210910073619.26095-1-neal_liu@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Oct 2021 01:27:02 +0000
Message-ID: <CACPK8Xf40cfnFFeeAzkdXk6ikbfBhWOOt6U8Oq3iCaxe5v5=_w@mail.gmail.com>
Subject: Re: [PATCH v4] usb: ehci: handshake CMD_RUN instead of STS_HALT
To: Neal Liu <neal_liu@aspeedtech.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Bruce Mitchell <Bruce.Mitchell@ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>,
 Tao Ren <rentao.bupt@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Greg,

On Fri, 10 Sept 2021 at 07:38, Neal Liu <neal_liu@aspeedtech.com> wrote:
>
> For Aspeed, HCHalted status depends on not only Run/Stop but also
> ASS/PSS status.
> Handshake CMD_RUN on startup instead.
>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
> Tested-by: Tao Ren <rentao.bupt@gmail.com>

Has this one gone in? If not, here's some tags:

Reviewed-by: Joel Stanley <joel@jms.id.au>

It also needs to go to stable:

Cc: stable@vger.kernel.org
Fixes: 280a9045bb18 ("ehci: fix EHCI host controller initialization sequence")

Cheers,

Joel

> ---
>  drivers/usb/host/ehci-hcd.c      | 11 ++++++++++-
>  drivers/usb/host/ehci-platform.c |  6 ++++++
>  drivers/usb/host/ehci.h          |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
>
> ---
> Fix STS_HALT handshake failure for Aspeed 2500/2600 platform.
>
> Change since v3:
> - Add more description.
>
> Change since v2:
> - Use my "real" name for both the Signed-off-by: line and the From: line.
>
> Change since v1:
> - Handshake CMD_RUN status on startup instead of easily skip it.
> ---
>
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 6bdc6d6bf74d..55f92d25336b 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -634,7 +634,16 @@ static int ehci_run (struct usb_hcd *hcd)
>         /* Wait until HC become operational */
>         ehci_readl(ehci, &ehci->regs->command); /* unblock posted writes */
>         msleep(5);
> -       rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT, 0, 100 * 1000);
> +
> +       /* For Aspeed, STS_HALT also depends on ASS/PSS status.
> +        * Check CMD_RUN instead.
> +        */
> +       if (ehci->is_aspeed)
> +               rc = ehci_handshake(ehci, &ehci->regs->command, CMD_RUN,
> +                                   1, 100 * 1000);
> +       else
> +               rc = ehci_handshake(ehci, &ehci->regs->status, STS_HALT,
> +                                   0, 100 * 1000);
>
>         up_write(&ehci_cf_port_reset_rwsem);
>
> diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
> index c70f2d0b4aaf..c3dc906274d9 100644
> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c
> @@ -297,6 +297,12 @@ static int ehci_platform_probe(struct platform_device *dev)
>                                           "has-transaction-translator"))
>                         hcd->has_tt = 1;
>
> +               if (of_device_is_compatible(dev->dev.of_node,
> +                                           "aspeed,ast2500-ehci") ||
> +                   of_device_is_compatible(dev->dev.of_node,
> +                                           "aspeed,ast2600-ehci"))
> +                       ehci->is_aspeed = 1;
> +
>                 if (soc_device_match(quirk_poll_match))
>                         priv->quirk_poll = true;
>
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index 80bb823aa9fe..fdd073cc053b 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -219,6 +219,7 @@ struct ehci_hcd {                   /* one per controller */
>         unsigned                need_oc_pp_cycle:1; /* MPC834X port power */
>         unsigned                imx28_write_fix:1; /* For Freescale i.MX28 */
>         unsigned                spurious_oc:1;
> +       unsigned                is_aspeed:1;
>
>         /* required for usb32 quirk */
>         #define OHCI_CTRL_HCFS          (3 << 6)
> --
> 2.25.1
>
