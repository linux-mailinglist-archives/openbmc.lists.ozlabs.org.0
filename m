Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A076AB45
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 10:44:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IDDSX87I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFTDb2b22z2yt6
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 18:44:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IDDSX87I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFTD210F5z2xFl
	for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2023 18:43:45 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so5356801fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Aug 2023 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690879421; x=1691484221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BhvIkOiG+uMZP4JM+69r8ne1565zMfKwFxHIBxYWbGc=;
        b=IDDSX87IPAkTalI67D61h5tIyLTjxttmxUnHRhNjLPYjcBJNaIzRMNp69DasxuB5Al
         rQminpqHAm1lpPcAPtxr7y44tfK2G6BgwLckF/tuz4qJ78C9UMn5RQuJTy2cZT4F18eK
         e/BIiACegaTRRNZLvT3lcVDmEFY2rJBB319FSPbEvPF2dzFbtwK4GiBqkVFnF8amlt60
         RhaSXZdRr2ekB0txYQp187qho0jN3zaKdUktix7JOe6M0hDEzEOWcUNlU+ewDr8RQsFj
         1Vn5xR4Sn4zeD0x9cBq7GvtY8wFDpq7e2mlABkW4F54h9DzJJHD8116wjvr4zSzsC7r7
         YV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690879421; x=1691484221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhvIkOiG+uMZP4JM+69r8ne1565zMfKwFxHIBxYWbGc=;
        b=IPhybwZjKZwF1sZ2gA6TDe8vFLL8J80vKioZwsJY0FsV8rKAOhXbB9RwBclQ9NadoJ
         Sm8GOO0Sde3wcR5CqemuP/Kt+G7XLP4PYfgf9lIJsO+xOdwc96UFBXjhcv9+ca0aHFKQ
         p8MtWzHHkXEtfzOXArP95zA/BrSuB2g2Roxvxy34juaNBE4VOBh0Jquu/owpzmMhXNil
         hDCIuBl/ptPcP2LlrF3iEao0HCh4vbgD3TsDfqZaPa+HrlSeWDvRxyR+lxIhFuhfvsID
         UUTpC5ALu3OppuvGarSBe03acHyb/FlVnvp4XfJCk9hba3p5X+bAKLlOoPX3xS00pPuy
         Q0XA==
X-Gm-Message-State: ABy/qLYus2d+zA5Ml7OLtVr9j0jfSpMmZxFU4rUcnHBQSFWWkP2Oo5XC
	cu3UEWe+0FVk/ve4owqZO1VhXCXJafoAoVRI+w4=
X-Google-Smtp-Source: APBJJlGP+ZMsioTtAzbRr4O83nVEXbsaQizCIVfpIplEbXKQzu3K25pK10ZvNvh+aTt+A79RzUyarnk4SQNfB1LDr1o=
X-Received: by 2002:a2e:9dc7:0:b0:2b9:412a:111d with SMTP id
 x7-20020a2e9dc7000000b002b9412a111dmr1895155ljj.42.1690879421368; Tue, 01 Aug
 2023 01:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230727202126.1477515-1-iwona.winiarska@intel.com> <20230727202126.1477515-5-iwona.winiarska@intel.com>
In-Reply-To: <20230727202126.1477515-5-iwona.winiarska@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 1 Aug 2023 11:43:30 +0300
Message-ID: <CAP6Zq1hsuwCtNhmwiMgB1f_S0DSs6vX=8fZC+0LaHuVoJgkmog@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: nuvoton: Add PECI controller node
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

I have done r-b, could you do a small modification

On Thu, 27 Jul 2023 at 23:23, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Add PECI controller node with all required information.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> index aa7aac8c3774..b8326bbe9fde 100644
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> @@ -68,6 +68,15 @@ apb {
>                         ranges = <0x0 0x0 0xf0000000 0x00300000>,
>                                 <0xfff00000 0x0 0xfff00000 0x00016000>;
>
> +                       peci0: peci-controller@100000 {
Please modify the peci0 to peci we have only one PECI controller.
> +                               compatible = "nuvoton,npcm845-peci";
> +                               reg = <0x100000 0x1000>;
> +                               interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk NPCM8XX_CLK_APB3>;
> +                               cmd-timeout-ms = <1000>;
> +                               status = "disabled";
> +                       };
> +
>                         timer0: timer@8000 {
>                                 compatible = "nuvoton,npcm845-timer";
>                                 interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> --
> 2.40.1
>

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

Thanks,

Tomer
