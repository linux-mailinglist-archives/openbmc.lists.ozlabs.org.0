Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C969297CD
	for <lists+openbmc@lfdr.de>; Sun,  7 Jul 2024 14:23:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XLg5iwAt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WH5yh3qlKz3cXM
	for <lists+openbmc@lfdr.de>; Sun,  7 Jul 2024 22:23:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XLg5iwAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Sun, 07 Jul 2024 22:23:26 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH5y60MNTz2xLW
	for <openbmc@lists.ozlabs.org>; Sun,  7 Jul 2024 22:23:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720355002; x=1720959802; i=j.neuschaefer@gmx.net;
	bh=wOY2LTVtor9c0uh4sZNyK/qPJ5Ak71J0G4tckDfFQzU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XLg5iwAtGB4DKNCvvRvzjXwnva3LmonGsylqne73kG1T49mRo5jXTS66JvAKcnw/
	 LKqn/+a/BHi6RmiaTrdPZt1A8zTGu066FOJ6+4FsxOwFrH79mODJQ2TlGcfD/11mv
	 t+o8MSj5uySCm/7gmTar9X8x++9qZuP1bB8FDwNfdzfUMcQL/CMwJpvNBAzIdWN6Q
	 ZIJvoA5r1xaMBeeIfs7qw2FysoEM+cJwJmkGdOdOgsuZ8gfIaM8IkW8Lgzb/oUkVR
	 vW3vGm+DWxRHHhfs2TtsDcCKFwZy7D4Ez/kIVWwiL1xegfde5/lp7d1h/7vZLQp61
	 Ex4VI8bgpANX46V9gw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1sCd4k23Bi-00xmgG; Sun, 07
 Jul 2024 14:17:52 +0200
Date: Sun, 7 Jul 2024 14:17:51 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: nuvoton: wpcm450: align LED and GPIO keys node
 name with bindings
Message-ID: <ZoqHb93S6j-_jaRo@probook>
References: <20240701164915.577068-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240701164915.577068-1-krzysztof.kozlowski@linaro.org>
X-Provags-ID: V03:K1:b4mry7pjbZIt6XKul32V8zWb7qm4V36BMOV1anIacoWRyYBuYrx
 uWIeweF7djxvaYIjhUFzpl1+zKZP6ze2aWiiTmQFfBtn4Glw/E9TKhcPemzk7fHCzPLoqfJ
 nrQ5eIfx/8rrvyMtkYcNlEWcvUb1EuL9vHm78AxGO3NfkFVCGf9JwvozGMnpD18K4V9XXxz
 cKxBsT/L5k1ZA+f1OKzlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aN0MrFcoKs0=;OhSpnPJ9t2wlbVbMV0U+a7GDe3J
 NV+YXgcsNL46eA8UuoGBC0vYr20zx3ZwjTg7MiDl4gIuVh3BilOvcawT3g3uqjMnDHvTvbXt6
 XaMc6yGK8rZefl8dufJj9hnaxrPFpLjwDy2WnCJbS9NEmzRd9ya9ws8hCD1jQQaL6sT4l+B97
 UxE7/la1DCqtSkiZfhjUZFpGZarWxxm3ivYFI14b2OE3+JobzRchoUOWth8OxjjkCWTmEBMWW
 Ee2rKON3xQWH+yx63doB1+dzOGXTR372mEnJRQqea7akhFxP9MwHNfE4z7/jWeIAlpnX8Av43
 NmkaPNTkhfor3kUX/Ozu7yHx/4tWHMrIHpFxx3c4r8sugB/oykaE6j2U5BtI4PiiNLDECuox8
 w06pOZdU6cZX4VgMJpexyWBacVNOZImF0qpnyqMATFYr07zM9hTulmBSxwd8s9F8MjJuicwX7
 KBxHHw16syjDYfgXd3zW2SDAL+wY3ipwpLNhC9wGO5+AH4MJzHHRG/fi203GX48IgpP3SUdmR
 4moAshplO7Jvusg6/wCjlY7K1Im2+lcJBR/nTW9K8zlQ5YfdI8Z7gTaul27Nae1VFDajAWgHL
 MMI8njOIERWjOjURIYIhMAZTAF3WFNnK29sWnOlPuAcK6kHcaH7qes1rBDF2P7yQ4l4byB4D1
 x7chtCEi8WlY3mkC+g9Cz1vI1qYjOjMZU2r5taZVrqWDLRG3ZPu2QwUO1ewwX8GeNrkW7L23H
 uKq5eZeVCwkYdqZKBM+xq2blqfiAvjtYK9xJjm7F1jToWmPqHy7rBHg75HS4r91dnlwn4QAUv
 Di5pPc1a0168mYigalinjpYVnvKlOkpU4FlnTnxQRTjr0=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024 at 06:49:15PM +0200, Krzysztof Kozlowski wrote:
> Bindings expect the LED and GPIO keys node names to follow certain
> pattern, see dtbs_check warnings:
>
>   nuvoton-wpcm450-supermicro-x9sci-ln4f.dtb: gpio-keys: 'uid' does not m=
atch any of the regexes: '^(button|event|key|switch|(button|event|key|swit=
ch)...
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Looks good, thanks!

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

>  .../dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-=
ln4f.dts b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-ln4f=
.dts
> index b78c116cbc18..edb907f740bf 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-ln4f.dt=
s
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450-supermicro-x9sci-ln4f.dt=
s
> @@ -34,7 +34,7 @@ gpio-keys {
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&key_pins>;
>
> -		uid {
> +		button-uid {
>  			label =3D "UID button";
>  			linux,code =3D <KEY_HOME>;
>  			gpios =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
> @@ -46,12 +46,12 @@ gpio-leds {
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&led_pins>;
>
> -		uid {
> +		led-uid {
>  			label =3D "UID";
>  			gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
>  		};
>
> -		heartbeat {
> +		led-heartbeat {
>  			label =3D "heartbeat";
>  			gpios =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
>  		};
> --
> 2.43.0
>
