Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBE23280E
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 01:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH8nM1JH5zDqkW
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 09:26:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=GLRfHe4D; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH8mL4DqFzDqgM
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 09:25:37 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id y10so26090669eje.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I4QkpyXSDWW88sP5xVKd++XzcNyY23mL9sj5AK+dnsg=;
 b=GLRfHe4DLSQAUp6OYGnC5lQ8J80qhzGQdlEd8Uzc2umOJ5mURK9y2Y7/p3mp6PFnwG
 dBxN3O5Mm18vVz5DdRfwKq/TjFs8Ie4F+0p0NXcAyBkEZmfGGs6gwPnWTY+7PSowhZiy
 Gmm3WIcd+SxlnamRpOSaAg8OohsEJP8R2gV5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I4QkpyXSDWW88sP5xVKd++XzcNyY23mL9sj5AK+dnsg=;
 b=MueDrzI4kRrwJ1ZrCH62HwwkTOYzNmIizEZBHq0F9lJ4cU6yOQ5SoHMYryIHd8Y4HJ
 tpeDU0jIrOwXgkzGF7ShkYFvLN+GDDPnNJtF5RdcHgHMTP3N67vem0nX/PqDUt+OaCVG
 LnqAwARjY+k+ufKK4Fwh9sUyfdJtb0hhxmnIkzOa57SxB+yCX0lzAPQSGm+L509e/9DR
 zz8qaHVR0v2aeA0EpZ2sp/L3PJgRWNluqCH8H13RNiAWVWNLuzBZOYUE/RbFHjUQXhCM
 1pqARjbuNe8H+eI1DClt+etN6P1juRNTCcF9iJfrGJ19QoqPG1iUjdB0rE8j9Q7Os55R
 nXqg==
X-Gm-Message-State: AOAM531/vsHqXeRlLl2JL1c91IF1qOONIID2D1Lxn75rxtsS1vbKzilL
 TBXTehJCEpHC+YlrwalOTi3MEJYpYx/KNLz1MRw=
X-Google-Smtp-Source: ABdhPJy0TH0OkafQMonyFeRP4RsGBJ79RCRihiz6h6U75CnvBXEH7+xdwRICq3G4UdBylxd5DMzPMM3UdK24dfky4Mk=
X-Received: by 2002:a17:906:1ed3:: with SMTP id
 m19mr638998ejj.396.1596065127109; 
 Wed, 29 Jul 2020 16:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-3-eajames@linux.ibm.com>
In-Reply-To: <20200729204528.15157-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Jul 2020 23:25:14 +0000
Message-ID: <CACPK8Xc48KTbw7ZnXTWgEaAiY_Rif-k_Q2Q5ZtZ0U9L+iCMEGA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 2/6] spi: fsi: Fix clock running too fast
To: Eddie James <eajames@linux.ibm.com>, Dean Sanner <dsanner@us.ibm.com>, 
 Joachim Fenkes <FENKES@de.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Use a clock divider tuned to a 200MHz FSI clock.  Use of the previous
> divider at 200MHz results in corrupt data from endpoint devices. Ideally
> the clock divider would be calculated from the FSI clock, but that
> would require some significant work on the FSI driver.

This sounds like something we should fix, especially if we're
experimenting between 200/166/100 MHz FSI clocks?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  drivers/spi/spi-fsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
> index 8f64af0140e0..559d0ff981f3 100644
> --- a/drivers/spi/spi-fsi.c
> +++ b/drivers/spi/spi-fsi.c
> @@ -350,7 +350,7 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
>         u64 status = 0ULL;
>         u64 wanted_clock_cfg = SPI_FSI_CLOCK_CFG_ECC_DISABLE |
>                 SPI_FSI_CLOCK_CFG_SCK_NO_DEL |
> -               FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 4);
> +               FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 19);
>
>         end = jiffies + msecs_to_jiffies(SPI_FSI_INIT_TIMEOUT_MS);
>         do {
> --
> 2.24.0
>
