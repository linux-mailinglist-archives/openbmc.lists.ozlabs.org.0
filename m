Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649B7EC78
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 08:10:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460GxW0Rc0zDqgF
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 16:10:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="R3+zgINs"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Gwk3XdkzDqW8
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 16:10:13 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id w17so28490973qto.10
 for <openbmc@lists.ozlabs.org>; Thu, 01 Aug 2019 23:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFWaj3cSyAp5cCruqVAXM269R+jXFA+hpQyudleBW8I=;
 b=R3+zgINs75dLpE9xitGDlrbGtE/wzbCCZrUQRqXd1DkFAauk+rXBs5F/P6isRb82rQ
 fGCdP+uzBdeSYGqQpFlJB3PO3LQtniJfZDwC7aTY1w7I/MNKmSqPPLN5EwZ2gGwtY3KB
 /kjIdOGt+CsMNaXLGf9WLJI4inkssBNReoyCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFWaj3cSyAp5cCruqVAXM269R+jXFA+hpQyudleBW8I=;
 b=dMEZgPbEhbhvGGfIJbSXNTU7Mp4f6xvBuG9zJeEuYpWgPlGKfTUviOzsFRPoHeRqkk
 Py2P+we2XZKa0CCZvHbquASWEu3sE3tL7g7RBwZmZ/LnHlDcqfK3FpucS8Gn50ZQUKPp
 WzlS9kkYzcyzu8lMhUeBDbA90RytorEBhRAjiK09FDJ6a01e5QTsuO2s122xDhGRKNBq
 Ke4ywVNKIXS2VCsCsHwnJiFqooJDQIlORsIsWFtwi9CEiTRKCzfAF3YkFQAUKY+QzfT2
 Mhl+XT7UDo93vu21IdlH4yJ/OOAUvhCbjf1DE/3UhlJZrp/1F9Y9v+SfJjCGga9n2USn
 VC6g==
X-Gm-Message-State: APjAAAUCEsGKfPJ0Bm0JwUDXydKHAaP/q5poWHIkjrEj1Wb/5KnJR8ml
 /uY4r+QqJizlsrfp4TR+kndNoqCPUK99a2Ie3QA=
X-Google-Smtp-Source: APXvYqz7bb22+a5Wv4AkSi0btb/AAI8H35mfK49hqP0WgDG+Ezce+iETXBjueb2NE8qmF9oHprwt/CYIrmsrIe0PbKY=
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr97906903qvv.38.1564726208597; 
 Thu, 01 Aug 2019 23:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190730081832.271125-1-avifishman70@gmail.com>
In-Reply-To: <20190730081832.271125-1-avifishman70@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 06:09:56 +0000
Message-ID: <CACPK8XeqDRNYJC+=xC_XySSTX6mHi5r94UDaeMPQv3DFV1HYQw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Winbond w25q256jvm
To: Avi Fishman <avifishman70@gmail.com>
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com,
 Richard Weinberger <richard@nod.at>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 30 Jul 2019 at 08:19, Avi Fishman <avifishman70@gmail.com> wrote:
>
> Similar to w25q256 (besides not supporting QPI mode) but with different ID.
> The "JVM" suffix is in the datasheet.
> The datasheet indicates DUAL and QUAD are supported.
> https://www.winbond.com/resource-files/w25q256jv%20spi%20revi%2010232018%20plus.pdf
>
> Signed-off-by: Avi Fishman <avifishman70@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788511d5..74b41ec92414 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2151,6 +2151,8 @@ static const struct flash_info spi_nor_ids[] = {
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
