Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15236D88
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 09:42:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KHh02TbQzDq7W
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 17:42:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lhHIkf2p"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KHgD4thzzDqhC
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 17:42:16 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id k8so1094024iot.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J2P7+9BrsV7BFobAF6Gcf5hOBXDyVsf7Cw11pqeBfG0=;
 b=lhHIkf2p/bhc9lWToqafMcafzKV+1jJqbUCG7KNnGqFyzeGt/DTmAF2+xs4d33W5/v
 7iBI9jnRJGEJ4oFuU42IfmcB1VjOoRLb86BoiUrqPN5UlJ+h1zk5dVfF8Htjh3rcE2yv
 A89dNT+HybPHVCM0z+ynLI1HEYDQ3s4ZlPXi3gzGp3y+kFW3SKAkMaMtmrxXWbZQbXaB
 qEDcCsrPo8rcVxCEbcxqpYw5gyTNNnfjI46gezgvpGnRj0lhgO2iQLJjbz2T6Qhyjg/a
 xtjIzO6o4JywE81qxr5HEgraSdy2BM5Ko6Gx3GzaV6FndQOGynmNEy4negaMR6caGjel
 24QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J2P7+9BrsV7BFobAF6Gcf5hOBXDyVsf7Cw11pqeBfG0=;
 b=naXAcSKJIhrYJ0hv/n9VpHRAhMAs+yXb8I0fugTChA4EoiRfbi4ht5aiAM+9vyFQ+B
 LMTaMN47yXuFLOZFuaVS3VNTXj15JlM1Y3lx5FhFrUgBEvVi+rF3191JilzJyQEysi7X
 kjErQTPN4sHe6s94/S1PHIE3cwj38Y8GVGzTsa7FdmoPl5m8xSVBxxAGzFd/xT0ABXWR
 bP4M8DA8hPNZ7dQ6O16RECVYKR/6s0OKEJ5ZGvP3C6WEXp4Fn90jRcJuLM7frNO7CUmp
 DAw6UbPsxuNFg0ghiC0FXrG32HovnxH6h0N40fAF7SlJ8wYvbi92oQrOY0+xCkMjtUsX
 DQtw==
X-Gm-Message-State: APjAAAVSHnDwVkVPIEEn4elYTOsCrVCLKv5SKHJHyxp0s94pkivIu3ma
 JnsrFACrn969ZokaRGfoqkElmBduW/TjcZ+NOQ==
X-Google-Smtp-Source: APXvYqy6Ko9syXmU0XkEyDc/Q2Tk12TRz8+zmvPobBbovp2+NfN8I44+rRcRfj31jwt3e23eYV98CO+eDjREb/FXK1w=
X-Received: by 2002:a5d:9251:: with SMTP id e17mr8467626iol.21.1559806934290; 
 Thu, 06 Jun 2019 00:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com>
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Thu, 6 Jun 2019 10:41:46 +0300
Message-ID: <CAKKbWA71P+afSiWPoth90-Ydq4DBmxSK_yTRWSN+FPw10CqFAQ@mail.gmail.com>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, paulmck@linux.ibm.com,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "William A. Kennington III" <wak@google.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, davem@davemloft.net,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 linux-edac <linux-edac@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 5, 2019 at 5:19 PM George Hung <ghung.quanta@gmail.com> wrote:
>
> Add device tree documentation for Nuvoton BMC ECC
>
> Signed-off-by: George Hung <ghung.quanta@gmail.com>

Reviewed-by: Avi Fishman <avifishman70@gmail.com>

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
> +       };
> --
> 2.21.0
>


-- 
Regards,
Avi
