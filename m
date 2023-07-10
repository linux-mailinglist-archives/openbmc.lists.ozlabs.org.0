Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50874CB2C
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 06:23:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k/MmSA+G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzrTT61CDz3bdG
	for <lists+openbmc@lfdr.de>; Mon, 10 Jul 2023 14:23:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k/MmSA+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzrSs4hwcz2ygr;
	Mon, 10 Jul 2023 14:22:35 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-765a4ff26cdso366554585a.0;
        Sun, 09 Jul 2023 21:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1688962952; x=1691554952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdPVtuGWSeh+e/CBypa8yvniv55q4NGBxX2TleYGOls=;
        b=k/MmSA+GB3nUSHuzTWAKdW+rACKSvV3MdhyKgDGKnyuWIjHUbMCagmypEOkZVV55Io
         iBYxTr0uz75WTg64Y7k3kiOIOZ7IrWbZscHM1Qk1xj3ZLi5QvlB8+n0zze9JPcLVG7YY
         /+1/D8rhY6FVGZDJyIpACRvoYHbU0e1L2lxCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688962952; x=1691554952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdPVtuGWSeh+e/CBypa8yvniv55q4NGBxX2TleYGOls=;
        b=ImHW9DavwnQOB/BRTYz7XZv56wFB/V24X+wEMUtIdNIRIiDFdbapSzVrn9CTrjvEy+
         TZv6E9GMExpksZ0JY2ixpNwYkvlmFOAaiDGoxh9LZDDf24V6k8Vw8uNgfIaaSIt8EGMj
         4rGJIzBFhNZS/SNAK7MW5uz+TO4bFglfbKJMUlsiakXSLfD167dnt24U39cCiR5BR0SH
         TDoPWnjM0qQVRNcU33F8Xnqu1YBe6zypPYjp47dfKt0kgkJ5O+Y171oCqPeljYPKoQD0
         +V2TginA1eGdfxACy0A0f6dD2soWClU9i7yE2A1TSva4M3bsP4YxJpF8HZ50a9zqgzm7
         v9Gg==
X-Gm-Message-State: ABy/qLaosmMXH2HZ7+Juuuqtjk+6BGh6P35UOx98wHzSRZv4/26sUIG0
	8WuLXOUPdJdPhZ1wKNcYGCEqOd4bAVidUe/bHjg2jMBP5hqY0Q==
X-Google-Smtp-Source: APBJJlFPmu/OpSM3hi2YqcI2sfhcz7s1RLQ6X0BZQcnNGXKfqOg1DMVVigKZ89Mqohjn+kNP2hZxf+s2peyir5k6h7U=
X-Received: by 2002:a05:622a:1313:b0:3fd:eca6:8aed with SMTP id
 v19-20020a05622a131300b003fdeca68aedmr13615111qtk.44.1688962952027; Sun, 09
 Jul 2023 21:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230628083735.19946-2-zev@bewilderbeest.net>
In-Reply-To: <20230628083735.19946-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Jul 2023 04:22:18 +0000
Message-ID: <CACPK8Xei-295TNmkjg53qXyQHwSUf3s+Sj87_o7ZEw1G0+NPpw@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: uart-routing: Use __sysfs_match_string
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org, Oskar Senft <osk@google.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jun 2023 at 08:43, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> The existing use of match_string() caused it to reject 'echo foo' due
> to the implicitly appended newline, which was somewhat ergonomically
> awkward and inconsistent with typical sysfs behavior.  Using the
> __sysfs_* variant instead provides more convenient and consistent
> linefeed-agnostic behavior.

Nice.

Fixes: c6807970c3bc ("soc: aspeed: Add UART routing support")
Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/soc/aspeed/aspeed-uart-routing.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
> index ef8b24fd1851..59123e1f27ac 100644
> --- a/drivers/soc/aspeed/aspeed-uart-routing.c
> +++ b/drivers/soc/aspeed/aspeed-uart-routing.c
> @@ -524,7 +524,7 @@ static ssize_t aspeed_uart_routing_store(struct device *dev,
>         struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
>         int val;
>
> -       val = match_string(sel->options, -1, buf);
> +       val = __sysfs_match_string(sel->options, -1, buf);
>         if (val < 0) {
>                 dev_err(dev, "invalid value \"%s\"\n", buf);
>                 return -EINVAL;
> --
> 2.40.0.5.gf6e3b97ba6d2.dirty
>
