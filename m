Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E02ED19
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:59:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tKqK2vRzzDqRc
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:59:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tKpN6cvnzDqPk
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 08:58:51 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id w197so9756807oia.2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 15:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ny4oOCNu4qgktzg8dYrHtC/j54FWv++KQps7rlvKcPg=;
 b=b6/3xAhx6ss+Xh4mDLH8KcrByvMG5EsCs6jGnQGS4/xyi+gM3jWOIU8g1LJteDTn3m
 LWsIqXmC/+zBmlghCqbnz6ox5qhAaINYAkLnG3F13LSsuCDPSPLaX4c62f+I2FzC/wKJ
 Zu+zRQaUJP7aPwSOl9jlze2n5YZLU6B/ec7XoMDmS3n4r+OSMC41Y78cxDR4PeNoh0Kz
 DYkdyQBecsLSRk6SjnJ3iu+V418cyJOAq1jFXD+F5SDlNTbxvDpU2AhojGTeKISrrXwf
 CbHojxNzVno9qT6Bh6yMuGaq/J5YccNwu0Cq7fTj4vQaTDzlBXBnXhgJgBCHKmdaybbK
 4H6g==
X-Gm-Message-State: APjAAAX+9MzZESjxgGdj3Hm+aPT9JKymZaOicMmF+OhJ2Q2bUXxV209N
 ZlDlHB+E9B5iDrCdCmdJWw==
X-Google-Smtp-Source: APXvYqwNnA5K9okx087TgpZXy5ng5WNqVJDOpJxMQgUk8bok5PwAPI0KZLXBkHxz/j6QV5CW/AgTEA==
X-Received: by 2002:aca:d90a:: with SMTP id q10mr1108213oig.65.1556578728752; 
 Mon, 29 Apr 2019 15:58:48 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e133sm15117456oif.44.2019.04.29.15.58.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 15:58:47 -0700 (PDT)
Date: Mon, 29 Apr 2019 17:58:47 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: misc: Add common LPC snoop
 documentation
Message-ID: <20190429225847.GA8905@bogus>
References: <20190416111631.356803-1-tmaimon77@gmail.com>
 <20190416111631.356803-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416111631.356803-2-tmaimon77@gmail.com>
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
Cc: mark.rutland@arm.com, linux-hwmon@vger.kernel.org, arnd@arnd.de,
 devicetree@vger.kernel.org, avifishman70@gmail.com, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, venture@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2019 at 02:16:30PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM BIOS Post Code (BPC) and Apeed AST2500 LPC snoop.

s/Apeed/Aspeed/

> The LPC snoop monitoring two configurable I/O addresses
> written by the host on Low Pin Count (LPC) bus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/misc/lpc-snoop.txt         | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/lpc-snoop.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/lpc-snoop.txt b/Documentation/devicetree/bindings/misc/lpc-snoop.txt
> new file mode 100644
> index 000000000000..c21cb8df4ffb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/lpc-snoop.txt
> @@ -0,0 +1,27 @@
> +LPC snoop interface
> +
> +The LPC snoop (BIOS Post Code) interface can monitor
> +two configurable I/O addresses written by the host on
> +the Low Pin Count (LPC) bus.
> +
> +Nuvoton NPCM7xx LPC snoop supports capture double words,
> +when using capture double word only I/O address 1 is monitored.
> +
> +Required properties for lpc-snoop node
> +- compatible   : "nuvoton,npcm750-lpc-bpc-snoop" for Poleg NPCM7XX
> +                 "aspeed,ast2500-lpc-snoop" for Aspeed AST2500.
> +- reg          : specifies physical base address and size of the registers.
> +- interrupts   : contain the LPC snoop interrupt with flags for falling edge.
> +- snoop-ports  : contain monitor I/O addresses, at least one monitor I/O
> +                 address required
> +
> +Optional property for NPCM7xx lpc-snoop node
> +- nuvoton,lpc-en-dwcapture : enable capture double words support.
> +
> +Example:
> +	lpc-snoop: lpc_snoop@f0007040 {

lpc-snoop@...

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +		compatible = "nuvoton,npcm750-lpc-bpc-snoop";
> +		reg = <0xf0007040 0x14>;
> +		snoop-ports = <0x80>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> -- 
> 2.14.1
> 
