Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159A34F899
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 08:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9GPc1B0yz3byV
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 17:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Txxvq0eB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Txxvq0eB; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9GPL5BZJz3bpf;
 Wed, 31 Mar 2021 17:19:33 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id v70so18367953qkb.8;
 Tue, 30 Mar 2021 23:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPdGHSIIR00sAQIYSjMd9oGwW07NfsHMGXGmByQwlRc=;
 b=Txxvq0eBKd/H8YcrQndy9HA0UYExIhy7stpzgsx2OR1DU9qzBRteahNQ6iB8WFDuO9
 61A7Pkcx7uxMi2lkQ/geULAAjdBwSVtXhqUygskJUlAQBzyONk8yTa4CxJRcsIe8/yIO
 cNAKlsNEwMIWQLTHfVcuqOAPqqeod1JEb+pO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPdGHSIIR00sAQIYSjMd9oGwW07NfsHMGXGmByQwlRc=;
 b=ihQigLoueHTsW69xRUm8wwE1MYAubkRIjaAvWNGNUtGGpBtAkLvSKAFqrNuOFXAXy7
 o8aGBaVolEdXLhv1XTAR5cYsAWqrDZY5bWdH8w09xzgtENp86jDmz2tCL41WMSJ/5+8j
 zFAjDBakPQWGGkX6oybDcmw+yOzhNpGn+U392S1JrgZlMmGCfVLTeLX+2zjdBZ4K0lfW
 zgzuixUdCsOk2xiEBL5W6Mpt+Bd1L+Nc41a/S83D7CKF/YD2hzE/2LN9NORDLM/CcJ9U
 6nFgL6nFF3/GTLsGI6/bSOqmJdiqoOZ1kPJa1XUadzLNpdrQqVpdmVXOKfxVHkLP/QTN
 ANsQ==
X-Gm-Message-State: AOAM533ujQxgN0vP/qux0yVK7paAHwefs7vJ4lnruSLHlAoxmOE96Pi9
 9YxeLtARZjoM2mMik3HSSmtKPcML7euV9sYVVL0=
X-Google-Smtp-Source: ABdhPJxTiz+BKd7Wa3J6NU0WsFjpgzR2F7xmXCD+R0O9qnYbgAxLwDKhEJJRSGfkjpBgQZkMqkTSQjLXyEFkS5Hs9+M=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr1705538qki.487.1617171569936; 
 Tue, 30 Mar 2021 23:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210331045831.28700-1-rentao.bupt@gmail.com>
In-Reply-To: <20210331045831.28700-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 06:19:17 +0000
Message-ID: <CACPK8XdfgMg=n9gBaMe+8z3aV4ifAJ3rZP7oL6ME1wem70FQTQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: fix dma map failure
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, kernel test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-usb@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Julia Lawall <julia.lawall@inria.fr>,
 Tao Ren <taoren@fb.com>, Robin Murphy <robin.murphy@arm.com>,
 Thomas Tai <thomas.tai@oracle.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 at 05:02, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Currently the virtual port_dev device is passed to DMA API, and this is
> wrong because the device passed to DMA API calls must be the actual
> hardware device performing the DMA.
>
> The patch replaces usb_gadget_map_request/usb_gadget_unmap_request APIs
> with usb_gadget_map_request_by_dev/usb_gadget_unmap_request_by_dev APIs
> so the DMA capable platform device can be passed to the DMA APIs.
>
> The patch fixes below backtrace detected on Facebook AST2500 OpenBMC
> platforms:
>
> [<80106550>] show_stack+0x20/0x24
> [<80106868>] dump_stack+0x28/0x30
> [<80823540>] __warn+0xfc/0x110
> [<8011ac30>] warn_slowpath_fmt+0xb0/0xc0
> [<8011ad44>] dma_map_page_attrs+0x24c/0x314
> [<8016a27c>] usb_gadget_map_request_by_dev+0x100/0x1e4
> [<805cedd8>] usb_gadget_map_request+0x1c/0x20
> [<805cefbc>] ast_vhub_epn_queue+0xa0/0x1d8
> [<7f02f710>] usb_ep_queue+0x48/0xc4
> [<805cd3e8>] ecm_do_notify+0xf8/0x248
> [<7f145920>] ecm_set_alt+0xc8/0x1d0
> [<7f145c34>] composite_setup+0x680/0x1d30
> [<7f00deb8>] ast_vhub_ep0_handle_setup+0xa4/0x1bc
> [<7f02ee94>] ast_vhub_dev_irq+0x58/0x84
> [<7f0309e0>] ast_vhub_irq+0xb0/0x1c8
> [<7f02e118>] __handle_irq_event_percpu+0x50/0x19c
> [<8015e5bc>] handle_irq_event_percpu+0x38/0x8c
> [<8015e758>] handle_irq_event+0x38/0x4c
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Fixes: 7ecca2a4080c ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Tao!

> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 3 ++-
>  drivers/usb/gadget/udc/aspeed-vhub/epn.c  | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index be7bb64e3594..d11d3d14313f 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -36,6 +36,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
>                    int status)
>  {
>         bool internal = req->internal;
> +       struct ast_vhub *vhub = ep->vhub;
>
>         EPVDBG(ep, "completing request @%p, status %d\n", req, status);
>
> @@ -46,7 +47,7 @@ void ast_vhub_done(struct ast_vhub_ep *ep, struct ast_vhub_req *req,
>
>         if (req->req.dma) {
>                 if (!WARN_ON(!ep->dev))
> -                       usb_gadget_unmap_request(&ep->dev->gadget,
> +                       usb_gadget_unmap_request_by_dev(&vhub->pdev->dev,
>                                                  &req->req, ep->epn.is_in);
>                 req->req.dma = 0;
>         }
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/epn.c b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> index 02d8bfae58fb..cb164c615e6f 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/epn.c
> @@ -376,7 +376,7 @@ static int ast_vhub_epn_queue(struct usb_ep* u_ep, struct usb_request *u_req,
>         if (ep->epn.desc_mode ||
>             ((((unsigned long)u_req->buf & 7) == 0) &&
>              (ep->epn.is_in || !(u_req->length & (u_ep->maxpacket - 1))))) {
> -               rc = usb_gadget_map_request(&ep->dev->gadget, u_req,
> +               rc = usb_gadget_map_request_by_dev(&vhub->pdev->dev, u_req,
>                                             ep->epn.is_in);
>                 if (rc) {
>                         dev_warn(&vhub->pdev->dev,
> --
> 2.17.1
>
