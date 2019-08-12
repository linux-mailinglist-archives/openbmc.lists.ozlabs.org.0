Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2C8AB48
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 01:37:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466sgv5GnHzDqXg
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 09:36:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466sgJ4982zDqRj
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 09:36:28 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id j7so20886292ota.9
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JUhoBbFfJyoEZHhxE0yhHd01Inh7+bhFFQBfYp/6IHI=;
 b=dra7aVosmfh0OkaMyDlp5yDZnvGy5rR6mX9YPNtSsxszMUAzm+aKRKe3W4CwpXDyeu
 Ki/Ug7czsQcWBX2qLPrUJNKcctGMSNW7cbjizqCj8sTxo1WGVZFpy2or10IGe/VvCMA9
 Gapo1f34UGuvVhoHvQ0lFN6osp70lmHXwQi42rlumz995ZGM81lOK+05P5JSq2ZkKmXm
 z88wppWTFrT8P/2WeFFmR52ssiLQtM+bNbpHWl1Xtf2DhpguDxSS8GKpXY5TcE08vojc
 6q0H8YTuSXddsWNJkErpndG0QTGDe0mWnJpEbIyqlrXqdkVOMczK5DVCAgSUEgzaRiid
 fvWQ==
X-Gm-Message-State: APjAAAW70CPsCmi8ViYM5kC9kaoEGnPiMUYNdcwd0fKQ2Fqqw0O6BD51
 Pe/VbN/b12agpElAh9XA/g==
X-Google-Smtp-Source: APXvYqz7S8FkR6SwClag3erlK+yDMUQoYwEC/imJe9WJrw+kMtxqR06+H2rRmQKOwlNcvAwWgGSluQ==
X-Received: by 2002:a5e:8c11:: with SMTP id n17mr313906ioj.64.1565652984885;
 Mon, 12 Aug 2019 16:36:24 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id i4sm131555614iog.31.2019.08.12.16.36.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:36:24 -0700 (PDT)
Date: Mon, 12 Aug 2019 17:36:23 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: hwrng: add NPCM RNG documentation
Message-ID: <20190812233623.GA24924@bogus>
References: <20190722150241.345609-1-tmaimon77@gmail.com>
 <20190722150241.345609-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722150241.345609-2-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, herbert@gondor.apana.org.au,
 arnd@arndb.de, devicetree@vger.kernel.org, avifishman70@gmail.com,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, vkoul@kernel.org,
 venture@google.com, mpm@selenic.com, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, jens.wiklander@linaro.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 06:02:40PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Random Number Generator (RNG).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> 
> diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> new file mode 100644
> index 000000000000..a697b4425fb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> @@ -0,0 +1,17 @@
> +NPCM SoC Random Number Generator
> +
> +Required properties:
> +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> +- reg         : Specifies physical base address and size of the registers.
> +
> +Optional property:
> +- quality : estimated number of bits of true entropy per 1024 bits
> +			read from the rng.
> +			If this property is not defined, it defaults to 1000.

This would need a vendor prefix, however, I think it should be implied 
by the compatible string. It is fixed per SoC, right?
