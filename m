Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294076AB3C
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 10:41:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JmTFmA/Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFT9n3dCFz30PB
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 18:41:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JmTFmA/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFT9846d5z2y1d
	for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2023 18:41:14 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so42544251fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Aug 2023 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690879266; x=1691484066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEDttWqgK0CFKCWb2NcBurYWAnq5TrPHr/6xcJLjutQ=;
        b=JmTFmA/YwVf47WGQzgGNC9Gx2CdqnxgNkk6BJi/OVBNaULhsSmi2x3Jvs7ZplJjAwM
         ypvMQDX5HWHnKwcQ+/XV+dnvaNL+pvtqYjC5KrKANuSkIYgZ9G4Xza0bNQF1hq3+Vcp9
         wcLoiajHTwANqrXpV7M1yZa/+1/WWdIW7gXuW4YAXxBsanf7mPrll6cidJQ0pJ1eMCkD
         W1CEIGvZeEHlcbYNVju3/FKKEC9cqwqJz1hIRrgQZeb7LbSWYV8BeAtNMPg0/YkxPPZ6
         G+ctwUMYFMSx9T6PLHB7HNiY9XTDYB0/4UDlOq42vEhzHc/cUhMXYNsZbwTEY8q/Br5/
         Ah9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879266; x=1691484066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEDttWqgK0CFKCWb2NcBurYWAnq5TrPHr/6xcJLjutQ=;
        b=QSTxGIRl4Gknon4ukDohtvTyKCzgYxyOyvsb6lyPI1uL23iUK96xyLM4xLKWa52ttU
         ntlh+aIWFsVxLIb29McSJ9/XLJiuvzySFzOIIONDtlGIpeUBLHBb9Kgg+h7C5XpfpHd9
         oTJZB1Oa0WnrS6jvmanXpl6h80yhLy5hoO3yN+8SvvIqpGDYT5kUg6BbGei2Djry0LFU
         rnX1n+flbuhi77+9xnEfOPwxFioPZQ3P++ZTudoiHtvrAF2upxZEmwabfcb2xsqYIRlg
         wky7gIBn1lb9vLxrACROTOiHIOpx9xkvO+Ro0zA8bA0N5Wwp6vriaKBetPHDpjLkq1zt
         E/dg==
X-Gm-Message-State: ABy/qLaTSIWsx5PseGlnn5wU5dmvYc8Wd0ELEN8/t5LtSpnbltY2BSvO
	jYmmZCUs7Jn4CYbOs7BCjXc2JgTC2qllprwwoCo=
X-Google-Smtp-Source: APBJJlHigaiD/soq+foL/ueHdSCoL9kwM9uOiteOXtMYbntsGWOD4BdKieuCUt+o8fwYXw0uO3/Sy5quE1gVN+fCcDI=
X-Received: by 2002:a2e:8ec3:0:b0:2b6:e12f:267 with SMTP id
 e3-20020a2e8ec3000000b002b6e12f0267mr1845557ljl.5.1690879265602; Tue, 01 Aug
 2023 01:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230727202126.1477515-1-iwona.winiarska@intel.com> <20230727202126.1477515-4-iwona.winiarska@intel.com>
In-Reply-To: <20230727202126.1477515-4-iwona.winiarska@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 1 Aug 2023 11:40:54 +0300
Message-ID: <CAP6Zq1hh_wr81L4vtYDct69rrqdSrxjap9-uZfvmt0xMvrfRJQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ARM: dts: nuvoton: Add PECI controller node
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

I have done r-b, Just could you do a small modification

On Thu, 27 Jul 2023 at 23:23, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Add PECI controller node with all required information.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> index c7b5ef15b716..cccc33441050 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> @@ -220,6 +220,15 @@ kcs3: kcs3@0 {
>                                 };
>                         };
>
> +                       peci0: peci-controller@f0100000 {
Please modify the peci0 to peci we have only one PECI controller.
> +                               compatible = "nuvoton,npcm750-peci";
> +                               reg = <0xf0100000 0x200>;
> +                               interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk NPCM7XX_CLK_APB3>;
> +                               cmd-timeout-ms = <1000>;
> +                               status = "disabled";
> +                       };
> +
>                         spi0: spi@200000 {
>                                 compatible = "nuvoton,npcm750-pspi";
>                                 reg = <0x200000 0x1000>;
> --
> 2.40.1
>

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

Thanks,

Tomer
