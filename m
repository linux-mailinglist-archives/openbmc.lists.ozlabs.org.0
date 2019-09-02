Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED4A4D06
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:08:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBmP2DwKzDqZ9
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:08:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="TnzHe7Ir"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB6G3LPZzDqRH
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:39:02 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id n7so14002310qtb.6
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xHmWobXinSJbe0UagD+mBtM5JbHMC0/DzfdkmDdd9jQ=;
 b=TnzHe7IrQGkl48ntIt2dgK0hIFjoEoYrT3zHr9fVzRlXVLtXrI5qfpeRpv28ITzZBW
 uzkj/wv0I34SmiE13lvTFkkur98LAJruNEbt+yk4abcC9DMgdyZe4A9mEqP4qaEeTfmz
 8fD67UCc+lTUPasil1GIFDH9+9IFb5rFmDIw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xHmWobXinSJbe0UagD+mBtM5JbHMC0/DzfdkmDdd9jQ=;
 b=IqiZfb0jKzjo4Uk82ah25XJJThkdu4FrSS3Nv3noJm5rT3fXH+B0IvZmvCgi/la1Mp
 ANZfx47T80Jjn22w0P+EQZYbqKoEm6NPJOrO7BRt264JM0A2J6nXthtmP0DBwq1OCR8K
 0GA6HQJy2QjXyRDo3zUIdx0OTq75IwODAFnwDTl3cKM/691yhHkSx/sMwVaiyHjfJK68
 Gtn3K1u4KEZubJfeLJ9oImTIXCSmkxg8BpZu3XvkUhuzfsEt4feS91cdFtfUckOrDF0p
 IoPgTxKEr3K7rTDsiLebei5Amhg5ffMbmt+BDwc94HIYUfKjAfd3n6qpW2vIYCCMwcoO
 sAkQ==
X-Gm-Message-State: APjAAAU52oJsvf7rUSElkljnmD61A5JrTzpYg+qSWGzg5yKmWN9LMdA6
 qkfVRR8DzjWjJ2lE3n60a0RKC99EASPF3sfuXOQ=
X-Google-Smtp-Source: APXvYqyirixtsz0s4yE81w6kHHbsoc0mlxe43yhwP4dpMwPPrjlDr1ZqtMyuRaZqXuu+mZzST8O/QJPIFGuIUc/lh8U=
X-Received: by 2002:ac8:2e94:: with SMTP id h20mr319366qta.234.1567384739846; 
 Sun, 01 Sep 2019 17:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-4-andrew@aj.id.au>
In-Reply-To: <20190830090244.13566-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 00:38:48 +0000
Message-ID: <CACPK8XdMfg48O8mmzXXEPBBRcjPm7xhDjJCC3YdO6bAiJ8m1yA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 3/5] mmc: sdhci-of-aspeed: Uphold clocks-on
 post-condition of set_clock()
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The early-exit didn't seem to matter on the AST2500, but on the AST2600
> the SD clock genuinely may not be running on entry to
> aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
> sdhci_enable_clk().
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I don't quite understand what this was doing in the original patch.
The fix is good though, I tested it.

Tested-by: Joel Stanley <joel@jms.id.au>


> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index 6ae81c8af431..0b75806ed69d 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -55,9 +55,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>         int div;
>         u16 clk;
>
> -       if (clock == host->clock)
> -               return;
> -
>         sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
>
>         if (clock == 0)
> --
> 2.20.1
>
