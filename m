Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B97CF1EB30B
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:34:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZMV5LdyzDqMm
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:34:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XN79O8ia; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bZLk47SNzDqMm
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 11:33:33 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id o15so11069057ejm.12
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 18:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jf0PpsX6C8kWtMfYKasAVBsOuUfVvuSONVJzbL4czS4=;
 b=XN79O8iaKan2hjQ7+IORwJqEF3Mk3doGplbtwUoZ9tmuhyRL/oYYrhrMWafCKIRyhp
 dQ4d5SWQYRYxAI/ZW0DV6SkR4IM1bM/INhHNYOTIRkwa8p1JBq8ONNvcHpsXpst4mL/4
 ZJmYG0HS8Gq4HTG54kqXOd3Ars/L35naDQEB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jf0PpsX6C8kWtMfYKasAVBsOuUfVvuSONVJzbL4czS4=;
 b=Z/8qZBV7cTlQvO+fGnh/gelQOPUJPIu573EwrK9bFi51ZQLFz/8kCxf1kbtZgYNqhg
 wk9VQN5z0GsLKtBuNAZ8XqzqcZ5bFY0WGqHtcJzmgAF8kyzxNtQy6P1T62ezyQadRidj
 76+d5/FF0uQK1Ls58nulbC3kIhd8f1wlRO5xe0LgRWOOy6eDnHrIomIK7GaqK8yXQtiY
 w17iUVqIMgLSBzVPQL6cDd99aElB1yvQeqjpESz+D3C5FX0o6YMUdJb2SeRGts/muzdr
 zn33qEJs8rZduyivJbtMN7BYPFzNsUbl8V/AjP2ILlpIprMmo76+IcSia8VeutWtIw/R
 gTUA==
X-Gm-Message-State: AOAM533AxC6Md6cbgV0eQDQyDZiogTFrZaOD5ysMT8bA+I6IYEI6XzaJ
 eL0w3GtPpfk1Gteveo2BLnVlq1Wg+P94FtK42bk=
X-Google-Smtp-Source: ABdhPJwDBAz8D68I2RsKEuAcOjCZ1wnbHeC4B6kbrwEeuhe9+hTnnuYX6wlcjoLszoN5lfmaw7ci0JynzabS9HZpoT8=
X-Received: by 2002:a17:906:945a:: with SMTP id
 z26mr14540915ejx.448.1591061608147; 
 Mon, 01 Jun 2020 18:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200529172200.21123-1-bentyner@linux.ibm.com>
In-Reply-To: <20200529172200.21123-1-bentyner@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 01:33:16 +0000
Message-ID: <CACPK8XeFUvkwmw_esUZbf+Q3oiKG3NXim=D-e-F=eDNsEij8Bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: rainier: Add line-name checkstop
To: bentyner@linux.ibm.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 29 May 2020 at 17:22, <bentyner@linux.ibm.com> wrote:
>
> From: Ben Tyner <ben.tyner@ibm.com>
>
> Rainier uses GPIO B6 as the checkstop GPIO. Define the line-name
> so that this GPIO can be found by name.
>
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>

Merged into dev-5.4

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 01db238ce741..61723d3131d2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -73,7 +73,7 @@
>  &gpio0 {
>         gpio-line-names =
>         /*A0-A7*/       "","","","","","","","",
> -       /*B0-B7*/       "","","","","","","","",
> +       /*B0-B7*/       "","","","","","","checkstop","",
>         /*C0-C7*/       "","","","","","","","",
>         /*D0-D7*/       "","","","","","","","",
>         /*E0-E7*/       "","","","","","","","",
> --
> 2.20.1
>
