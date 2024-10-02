Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924298CB67
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 05:09:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJKY90Cy4z30gG
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 13:09:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727838584;
	cv=none; b=SRwUV2SlIUzXFO2cp0zrvuIGh+KIXT8HVp2a79SOUUX1J/9j2bRA/xzZzoqwjxNVJPF+4IV9pDxYWkXOY/v3atZBnsQ+b1GW95F1pxvw4SKhQ38LY5c7mGWFte3jGxgyJmurZE4t8EHcuaL3YPek1IXXoO3ZDJQCikC2WhZLCTfBz/6DelEa680qgfDHS0YZ4N2F9K8FIrSDw7zLhYlZ0Y46LcEdtzZAU5QynMkWJGEnU3xJgLfQ1ECKLPjkK4Ynlx2rstfGbOPE40gL+o4E9vxRZks2y1PZe4r11TvjdHITT7nx9ORHe+c2XDXMoOjBwmcfnzrzHcVRulFB5ehx2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727838584; c=relaxed/relaxed;
	bh=InGTpWHbOeAgyPf0G10q9qzihIDIAq+ryf64rAtaskE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WfGTDc/cmq0yfUE9gfWarvzCnt25qE02Kw3VT+zunqSs/njAk717u//5D6OwIZ0IxiumPsPyZimb9YX07Qx9oge1AexseBbeWbBY2G7wjRdZNDDf67EwhjbeIjx1LPgaEkzjxuk8rlqqd7y6ljhP6o+2jUIRIOpo0kIj0QIppFpW4xUD7lgYt0VyjMfKe9efMCn8LvsfnA8vghT7rJeawWwBMb/uSYYkgPcXOFXJQPwr7C4PusBw4y3UWra99pv/7++QFmW5dfIKbcygfpbi2x0lVtX2kIAXUz/sqI/GN+Hatzx3FJwIYLft5ppVuIkqgoCBiOP3cMNg81fvXN1uEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qwz0DwBP; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Qwz0DwBP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJKY4546Tz2xl5
	for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2024 13:09:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727838584;
	bh=InGTpWHbOeAgyPf0G10q9qzihIDIAq+ryf64rAtaskE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Qwz0DwBP94tjUfcFxExW3GWLoGucll7ZcDUpFV6oFiGxBX3xhvnu99bi+WZGgvsJ5
	 tBan8RhNNsVXOgQK/Djbyh8T/GlTBNFg1XlwNOhT5JApHuov1EyHbDT2a53HSAGqpo
	 CPVm3hRHEBY8UEiEs8KHB/c1x6IqaL1gQUR2QLiGkiJGLGrNNVqMwqWysW/Zj71K6o
	 X9ENhviqAqXFE6EokFRurMUiks+iz2dQCDePfVMguL5XJERtgoZQC9DI5P1/s7dVwK
	 HLhnnWCfa33aOALrFaF7ORhe/obI/IyPcYhgiQ3U8mg1u4oMaz12EFiDVjktdPE6VM
	 IEwe8TczJZVKA==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 574D164BDC;
	Wed,  2 Oct 2024 11:09:43 +0800 (AWST)
Message-ID: <65b8ae466fd2d285d3bf5c73c9a38ed6c73ef0a8.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add OHCI node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Tomer Maimon
	 <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>
Date: Wed, 02 Oct 2024 12:39:42 +0930
In-Reply-To: <20240930214329.192587-1-william@wkennington.com>
References: <20240930214329.192587-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,

On Mon, 2024-09-30 at 14:43 -0700, William A. Kennington III wrote:
> From: "William A. Kennington III" <wak@google.com>
>=20
> The EHCI peripheral already exists in the devicetree, but the hardware
> also supports a discrete OHCI unit on the same USB PHY. Generic OHCI
> works fine for this device already and has been tested on real hardware.
>=20
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch=
/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> index 358b52894ac0..5aeb5009a5d7 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> @@ -142,6 +142,13 @@ gmac0: eth@f0802000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ohci1: ohci@f0807000 {

I got an additional warning here too:

+/home/andrew/src/kernel.org/linux/origin/build.multi_v5/arch/arm/boot/dts/=
nuvoton/nuvoton-npcm750-evb.dtb: ohci@f0807000: $nodename:0: 'ohci@f0807000=
' does not match '^usb(@.*)?'
+       from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yam=
l#

Andrew

> +			compatible =3D "generic-ohci";
> +			reg =3D <0xf0807000 0x1000>;
> +			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +
>  		ehci1: usb@f0806000 {
>  			compatible =3D "nuvoton,npcm750-ehci";
>  			reg =3D <0xf0806000 0x1000>;

