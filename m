Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1F42A959
	for <lists+openbmc@lfdr.de>; Sun, 26 May 2019 13:10:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Bcq169lWzDqMg
	for <lists+openbmc@lfdr.de>; Sun, 26 May 2019 21:10:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/jQtlMw"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Bcpb4DyBzDqLN
 for <openbmc@lists.ozlabs.org>; Sun, 26 May 2019 21:10:31 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id t184so5400434itf.2
 for <openbmc@lists.ozlabs.org>; Sun, 26 May 2019 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zbd0q77KqzJ+Mu2SrB8JWUeum0u0wAMNctAceRVqdB8=;
 b=Z/jQtlMwC2JTqf8JKNEhrisA3RbtmyOVELCMska+lgpmhOCAIMn/69mNRGf4q2Vb+C
 tSXU64mbO52rz32Ue+go6D4lCMgOzAZQuHNQdcDo61nm1AtMYMVXq5m9Ut2VoK4tu1t8
 4I1Z9kpx4HHwf3a7vPrU2D86335kAHeB9VbE0K0HjLZR0EkPYZGMwki/v4Tv7pktD9D/
 EgIqO37lvYBP9pZA4O9nTTqb/TCO0SoVcYsbyZ/8XZ6hvB68GJvxXfLaWB6QkXpEm1PR
 siHEc7fJmcPDGVquux9/8ySB5jNQhFLGi90/rZJuRWPvez435YomzBuhgPFmi1Yydc37
 LtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zbd0q77KqzJ+Mu2SrB8JWUeum0u0wAMNctAceRVqdB8=;
 b=SZZmcixFqHpJDcGDgMs6Zfw1CUneWfb/w44ObZ0kKy3NCYODfvQQI0f+z/ZC2OgV3m
 y+LmLwbS10vHpOCQL5Kd5059gctAqXVK8Lu5T156WhAsWeU4CmruomuO4vNiwyRWxFEM
 odTLnuRwpHLsk9gKkAyEIJ0vU/gsTxpK1SUmZ49YKvtXT83l/2zge7j0zEIc4gArqtfa
 Qz1fq+kDFMc1w32CcRniojOcPRXk5LM4RyeOF2aVBnwPWVykIcMzM2zyjLCw3u3s03sc
 FUb+bBocqva67BBv220FaA7zOd2r/9JJR29C/wUi0h+VUU3jcsMBHVb4QVApbPTucXL5
 FGXQ==
X-Gm-Message-State: APjAAAUjbc++6Wv/E+aXWOb9DI4N8HOdOI7zDQENtNddC6t3Jaf11UjV
 BVM1g2kF0MvYQ6gvMw2qmfceQCHNnDSkRpompA==
X-Google-Smtp-Source: APXvYqy5YZf3bFbLj1d4eNbt8QeStdJBL3l8iL9wHjMvq4uo2c6zRG/muMCFbAMf6L6mk7NbUg437X9VW0R4s+K+hJI=
X-Received: by 2002:a02:1a89:: with SMTP id 131mr68161153jai.78.1558869029276; 
 Sun, 26 May 2019 04:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190523122734.27034-1-ghung.quanta@gmail.com>
 <20190523122734.27034-2-ghung.quanta@gmail.com>
In-Reply-To: <20190523122734.27034-2-ghung.quanta@gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 26 May 2019 14:09:55 +0300
Message-ID: <CAKKbWA52EWP_VHSmFKCkeoBBUd=0WLuS=OtYvfRnPec88rqiGg@mail.gmail.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, tomer.maimon@nuvoton.com,
 wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 3:35 PM George Hung <ghung.quanta@gmail.com> wrote:
>
> From: George Hung <george.hung@quantatw.com>
>
> Add device tree documentation for Nuvoton BMC ECC
>
> Signed-off-by: George Hung <george.hung@quantatw.com>
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
