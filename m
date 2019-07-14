Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F867FE4
	for <lists+openbmc@lfdr.de>; Sun, 14 Jul 2019 17:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45mrTz3WmqzDqXP
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 01:40:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EbTQ+Azt"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mrTG0PHQzDqVq
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 01:40:15 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id z3so30385442iog.0
 for <openbmc@lists.ozlabs.org>; Sun, 14 Jul 2019 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4bHQ1Jc5WTGlqwv+kn8JJgmRRoI96dt/IgZ72rjGBA=;
 b=EbTQ+Aztyq+1j51yJyaXlSrersnYBW/r0zoiVuDyu0dByJxIupmw500q+tV1XItn3f
 fGPvHEoox/Z2H3e03WWBHc79byethRqRi+k9uixTxTuO23jbUomxPKTd6GvYAtaiPQ/i
 BsMn4aPMKMHujUFkvPFJLSBEmaL9p1TQgxkZAySXVbi7K49mzgSmmLNPnEmwk6SQ5yEb
 RPT1qxMUSl+rvW9rcrl0PnK4LG/WCY1Agi8HMWmiSVUYe1jxwuT9MAvWrBkS6TR8+nnb
 Yt/QsX/b/hRkM9trNmZDyCSaOIFJGcWZzCLVA70oHtdzYR+04HE81/hQddh/Kfp2ap6x
 5wAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4bHQ1Jc5WTGlqwv+kn8JJgmRRoI96dt/IgZ72rjGBA=;
 b=JuXme2ELXCMe8ff02OyTSrmU8OXj14qrjrc+GczZ03E3TL5wzJyfuHCb/gva1Z5RNN
 JhuitP3iGzWHR+MSRwyTQGbgNkf8jhikg36xtHptchr9+CJyDq6FmS8FncMU2/cVflMe
 sMT1Gr5P8U2mgD4GoWcFViFwg87sz9R3lNw5979weUrhKL2ZgstR6BkYT5JbO0R1Rl7r
 iB7AFKLjSene3scLiRzrpl4YQfuabP1bPjCtcYzIGhYwBZWyUMWh/lct13XfCmN7tUXT
 ylrl3gLgWjrGTkrFzqIo1YuNYDoJl8+p79Xks2OqKjvbb9A8esjuki8YcStZq160A8oL
 xBXA==
X-Gm-Message-State: APjAAAU0k/jI/BSj3QaJCW8fyWtc9qjnr00YfrMUmfdJtLUSUUuSgbDy
 4se6gH++K6H+wfGpyUbqf5exHPjKbAZVUGGNkw==
X-Google-Smtp-Source: APXvYqz5e0ZMsmxeq3BvuV3Veo7tfSZ2IU3WmhirYiJwumXbxG0Wrfs4Jq9gZf52yJ643RUwyL5TZQdr1Y9XVtHMokQ=
X-Received: by 2002:a02:b90e:: with SMTP id v14mr22926814jan.122.1563118811187; 
 Sun, 14 Jul 2019 08:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190702133444.444440-1-avifishman70@gmail.com>
In-Reply-To: <20190702133444.444440-1-avifishman70@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 14 Jul 2019 18:39:29 +0300
Message-ID: <CAKKbWA7ZLLp4nmcG+rFQbc=f5GWSThoghgF=B5CiunDczYAz3w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add Winbond w25q256jvm
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, 
 Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, 
 boris.brezillon@bootlin.com, robimarko@gmail.com, 
 Willis Chai <WillisC@supermicro.com.tw>,
 Jerry Wang <Jerry_Wang@supermicro.com.tw>
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tudor, Boris & Tudor,

I see that you pushed this kind of commit of Winbond chip previously,
can you please approve also this?

On Tue, Jul 2, 2019 at 5:23 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Similar to w25q256 (besides not supporting QPI mode) but with different ID.
> The "JVM" suffix is in the datasheet.
> The datasheet indicates DUAL and QUAD are supported.
> https://www.winbond.com/resource-files/w25q256jv%20spi%20revi%2010232018%20plus.pdf
>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0c2ec1c21434..ccb217a24404 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2120,6 +2120,8 @@ static const struct flash_info spi_nor_ids[] = {
>         { "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>         { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>         { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +       { "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
> +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                         SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>
> --
> 2.18.0
>


-- 
Regards,
Avi
