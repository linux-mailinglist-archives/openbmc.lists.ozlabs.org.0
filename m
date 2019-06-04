Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B633E78
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 07:38:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J11M07hQzDqRS
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 15:38:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="atjcVXKu"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J10z1CJ5zDqFY
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 15:38:10 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id 14so12398793qtf.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 22:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pToIqUS9uPJ1vh6dRsDaXF33hDKyM6jq7/h5cRnOaT0=;
 b=atjcVXKuH4LvmD4AUTaAcDAYjaAF5emsN9vLtqegSkyVwMl4xl7cR5GfJ2yys6KOAX
 ttmhjYD2ab3NNdcFNag47ehAQXFOGc68MC3sVSfFQwQgO9/CSMw2/tAMaiKLgUn8Eu5r
 5aiSqSizHyZLq4eUwrgTaT3ajHHswhEUOZBCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pToIqUS9uPJ1vh6dRsDaXF33hDKyM6jq7/h5cRnOaT0=;
 b=Sg8NMAPk5pFqb/J2+uD+78HmUPvZ8m0mKliyXsbrx9lrWCu96fJBnkr7s0WH39j+iq
 H7386gI9QyWI5Qx21BpepbhcNVFsPT8cpCmqBh3i8pQqqKDNbLYjjX29emdSWfB+PuZG
 IaoAsvU3qasy3FDcS0jkwppeDp1lDtnFYQjFGVhPAOxs/B1v5Aq6O4BT9xq8VNTFgzev
 pMFjcA/cG7hn9c+P6tPzE2OGNKnoUh0kuEZVj2jtJ6pBwAQW/Zyqejmra422pb4/QJkQ
 /GfTG8R6i6/cdpxwQenEBY44VuNtbJOXJsFzmZtLwLE8GXbeUlcn9q4+8xrDe4pVIQIy
 vY9A==
X-Gm-Message-State: APjAAAW8Z6Cpc8q9m65aDkXBBKZpMKIgTSS9vTWBigx3Gj80WgdN4ztp
 s5ubcdRXokQiatwnjruGfKIXqkxtVu7q2hJRSCM=
X-Google-Smtp-Source: APXvYqydJUoJ0hjc62ktjUTg3iA3SDXt4OQa58k39AQtG1xH9q1Amvoesglhfpg/RIr38YOpw0+ogZbNEfhVE0NkNuI=
X-Received: by 2002:a0c:f68e:: with SMTP id p14mr13640303qvn.172.1559626688576; 
 Mon, 03 Jun 2019 22:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190523105448.26300-1-ghung.quanta@gmail.com>
 <20190523105448.26300-2-ghung.quanta@gmail.com>
In-Reply-To: <20190523105448.26300-2-ghung.quanta@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Jun 2019 05:37:57 +0000
Message-ID: <CACPK8Xcw6=kACAfCsE7qsHQ82g9s5T5wbp+FpVFQXxXtH3NhDw@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v1 2/2] dt-binding: edac: add NPCM ECC
 documentation
To: George Hung <ghung.quanta@gmail.com>
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
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On Thu, 23 May 2019 at 11:00, George Hung <ghung.quanta@gmail.com> wrote:
>
> From: George Hung <george.hung@quantatw.com>
>
> Add device tree documentation for Nuvoton BMC ECC
>
> Signed-off-by: George Hung <george.hung@quantatw.com>

Can you convince one of your fellow Nuvoton contributors to review this patch?

Have you submitted this patch for mainline inclusion?

> ---
>  .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
>
> diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> new file mode 100644
> index 000000000000..dd4dac59a5bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7xx SoC EDAC device driver
> +
> +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
> +uses the EDAC framework to implement the ECC detection and corrtection.
> +
> +Required properties:
> +- compatible:  should be "nuvoton,npcm7xx-sdram-edac"
> +- reg:         Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:  should be MC interrupt #25
> +
> +Example:
> +
> +       mc: memory-controller@f0824000 {
> +               compatible = "nuvoton,npcm7xx-sdram-edac";
> +               reg = <0xf0824000 0x1000>;
> +               interrupts = <0 25 4>;

I think we can use the defines for 0 and 4? GIC_SPI and IRQ_TYPE_LEVEL_HIGH.

> +       };
> --
> 2.21.0
>
