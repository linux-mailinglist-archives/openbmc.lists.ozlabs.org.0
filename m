Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA8141A39
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 04:06:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NqxF1lQ4zDqvw
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 12:06:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="S4XZStqX"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nqwj6xkmzDqmT
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 12:06:13 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id p15so9605729qtl.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 19:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nIzeJxvw04fP5EmqmtqBama1meww8D07BGk/wdXxxo=;
 b=S4XZStqXwOmr9+jz7VVgn+DzZKY5c07KryOo6V3qQ1T/xtfcIx22qdRwJU1YDP0DYN
 z6fkF3JervPoNr28MKb/IVqjxqsacd2J5s/IyJfJ/vtb70LmQHBi47n0ixk0RxONffR2
 5nGg6K68Yx/30Vzjm/JIXb34XEqKMoXyhRSlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nIzeJxvw04fP5EmqmtqBama1meww8D07BGk/wdXxxo=;
 b=ZoqL7YeuRrytrwZW/u4thPofP3+akBy8W6STldmmwrydwgu8Z+7fJeEaQm/yOJLMkT
 vIGLqHyeBHVJYL6PUhvS0prys59Soo7VxRZkj9cqDa9q7EwYt1Er7sN0kyQ1ndY2Ivc3
 AHZEh7qGxVPYT3lgeJGm3N8jvrt73KUTP6QXR8tcxO+WjeObzSSU+IXtLT6uZ4m5Lo3I
 F1MVe44KvU60w3upa2r2t9WC2/UOpv8+pCwU9qDvcD7R04RcrUGDaD9rLM1RVdsdAWY4
 JX3UJosO7nEPyiK/b9GJ0svQRh3kszGs21AkCByxWH3ZCJ4JqfUbX3NYHlEiVJQ9MeV1
 i7uA==
X-Gm-Message-State: APjAAAXaEpcRtivdpGvKTvB6OcyoLR4EMMQzSkhZTZSGTXx9cu9XQ25l
 m+/ZMhRyCbMwIVy+VSJ2+fhN1yI9paU5fWGrDpc=
X-Google-Smtp-Source: APXvYqxe40pGBXfVf+qc+oCuAjsLz0TCzCgVLiw/R6l7RCc2zj42icZ6GRxe1aBbD51/Nu7qejd2xmcW126DfJ2vSE8=
X-Received: by 2002:a0c:d0d4:: with SMTP id b20mr64205qvh.38.1560305169734;
 Tue, 11 Jun 2019 19:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-5-sam@mendozajonas.com>
In-Reply-To: <20190606044950.5930-5-sam@mendozajonas.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 02:05:58 +0000
Message-ID: <CACPK8XdB6HN13Ov=vO++2tYCakbwqPDEfbsOA9dzBj5hs9Jvmg@mail.gmail.com>
Subject: Re: [PATCH 4/4] net: NC-SI setup and handling
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
>
> Add the handling of NC-SI ethernet frames, and add a check at the start
> of net_loop() to configure NC-SI before starting other network commands.
> This also adds an "ncsi" command to manually start NC-SI configuration.
>
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

We need the u-boot net specialists to weigh in, but this looks okay to
me. Please clarify the help text for the NCSI command, then add:

Reviewed-by: Joel Stanley <joel@jms.id.au>

> --- a/cmd/Kconfig
> +++ b/cmd/Kconfig
> @@ -1296,6 +1296,12 @@ config CMD_LINK_LOCAL
>         help
>           Acquire a network IP address using the link-local protocol
>
> +config CMD_NCSI
> +       bool "ncsi"
> +       depends on PHY_NCSI
> +       help
> +         Configure the attached NIC via NC-SI

Can we clarify in the text if we need the 'ncsi' command to use any
NC-SI attached NIC, or if it's more for ncsi and network debugging?
