Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8D3685E85
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 05:33:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P68DK3tSJz3cNY
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 15:33:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WZQTUn5X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WZQTUn5X;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P68Cl09CJz2yRV
	for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2023 15:32:33 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id hx15so28263772ejc.11
        for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 20:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmtcPyOipFfISUEaFPuxMyH7xC2EhWjx/P+P8SbqFbM=;
        b=WZQTUn5XvgZeK7p9Qnu83Tl3WQziy5tMUfiHiHs5fKagrJdf3+AtP5Bdi7tLr0IrNr
         Mk/8U1rZbJikBZEszwykadJP7ANZ7j/VTRZKUudizkH1v9eY5qTBIKJHqWbT+bH6X6pj
         /eyVgtxC+34i+osxQmfmbdINqRStepwgO6vbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmtcPyOipFfISUEaFPuxMyH7xC2EhWjx/P+P8SbqFbM=;
        b=yteLBmqt+zgSgKLwcgV1aYJTKO1rwPjYlQuXA3RlWANPL0DbUsQyUtTprMdNU9yy4I
         rNY2TWIaN7cpBKqEUK5cZ97TKh0E/C2B+kCSyzglm6Ylh6SZI3TQm4pzVociYYX92Xba
         uooZ4Z4poJUbk3RHJdJXH2C8UCNWSAsdyH209QCk2t9xMUo8PkE4OzVcB42+mydVM+uT
         Ed2cGhEhXLMwQkPNlKk2/tkfjH86J2O0XOQlrwuf3xe9SyIkpEXdV4npe5Ymo0SVEwIN
         U+wzocdLVGFrwtJyb/WZElPCPbP5t/i2AFXR/qVY9FbR7ALtlwPMnaPNvw6htWxdEawg
         Ll7Q==
X-Gm-Message-State: AO0yUKUyqGh822rFYHpajx6odMgKL/O7/Ivtw9xNfi8fhrj+QmIBh3Hr
	ufw7nJF1XZPIAIlutDSi/tVFsmDIUVS3YamgXFU=
X-Google-Smtp-Source: AK7set8zmWzH+90LbAm2nhhkY1es4i1QHBAYtoSehCXSZKNIv2muxYvow9oaturRjZgbH0YESbqDHSmzMgPxaVYD2f4=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr247263ejb.237.1675225946301; Tue, 31
 Jan 2023 20:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20230129112611.1176517-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230129112611.1176517-1-j.neuschaefer@gmx.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 04:32:13 +0000
Message-ID: <CACPK8Xf2=uAo-03+q2A5ZOdYoHrdgs6viskxk6QncvXOgtxh_A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: wpcm450: Add nuvoton,shm = <&shm> to FIU node
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 29 Jan 2023 at 11:26, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> The Flash Interface Unit (FIU) should have a reference to the Shared
> Memory controller (SHM) so that flash access from the host (x86 computer
> managed by the WPCM450 BMC) can be blocked during flash access by the
> FIU driver.
>
> Fixes: 38abcb0d68767 ("ARM: dts: wpcm450: Add FIU SPI controller node")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I'll send this to the soc maintainers.


> ---
>  arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/n=
uvoton-wpcm450.dtsi
> index 299fcbba3089b..fda2f13093f98 100644
> --- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
> +++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
> @@ -478,6 +478,7 @@ fiu: spi-controller@c8000000 {
>                         reg =3D <0xc8000000 0x1000>, <0xc0000000 0x400000=
0>;
>                         reg-names =3D "control", "memory";
>                         clocks =3D <&clk WPCM450_CLK_FIU>;
> +                       nuvoton,shm =3D <&shm>;
>                         status =3D "disabled";
>                 };
>
> --
> 2.39.0
>
