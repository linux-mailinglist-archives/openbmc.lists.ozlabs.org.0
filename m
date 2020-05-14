Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F81D31D8
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 15:53:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NCgg4zDczDqfZ
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 23:53:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=GFNpVrbz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HY9mlU6d; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NCfg3mG0zDqf5
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 23:52:58 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8F4C4C1F;
 Thu, 14 May 2020 09:52:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 14 May 2020 09:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7inUiGYjV1XRj0FZpwum6PAUy6l
 XiUcpoE9cDkVBRV8=; b=GFNpVrbzNHOsnhPIXL0zyKHvUApAi+NKFZeYeHKhBeD
 sQ/OAWwmrlybhUfj77c/7c4ZRghiEo3bDUXJ8Efi30IWN0mpJzAnDOCNsu87ya2I
 kVg+HlHS/5EULapP6X+Gh1ceV4PAohsluDS0HbI50iHBgLQc+GBfoT1Lp9GgAjc+
 5lfWtvHbUg6YBQupwpsGHOgn41ws7jDfi4rB7AvzdjJylJ5daauJAu1ggtvUTgHY
 w2pIbqqAes6SWY2U1xKA6AjhcDcGbDfsH2Njl9tNC4CFiWwGUnxs9JWw7/d5e1sd
 v7owm0cmNcCjczRgudo50bDwOVcj02ucxE9RN5ig6jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7inUiG
 YjV1XRj0FZpwum6PAUy6lXiUcpoE9cDkVBRV8=; b=HY9mlU6doXks6UiZRqdNkY
 QkbZUL2YEmEd13U+Ph1CeSaeGgCuO42wmHI3eLNRYPACGDzEgmCnXb1/grfl1Ozo
 wpgBGoU/qmPUWy5OrX/0+CD09m9wpM0ORD8NpRBe/gLbTwXCt61XbhRJcWUl1fiD
 F+lhLY/WD+Wm8e+0urHNj67cNCBgfU/23fhXID7JwTeXUbEBns5zSoUgxhK0amkg
 NBAY5IsN0hkLaNVBZWTNIaKnxJGvonE4E+uHDOjHsazlmV6EEfV4cpvnh5j5MMzP
 w1XNELPij5TK+nGf1PH2UmSp903RrYQAgr+sz/O5Q8chYsP2o/oeP0utxSODIsvA
 ==
X-ME-Sender: <xms:NU29XrEyiDLlW-ysi4QFUBsmZRsonv5XiCKrB7yymqtZOxt6MWjuxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejiedruddvtddrud
 ehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:NU29XoW3qmKjIasSj-AkpdPckV0QXwW4sXaWUREPd-PSh5WbUCaZ4A>
 <xmx:NU29XtL5jd-0YG_2GWFRv50So4G6VTtYaqXxKveb6kemtVAB7kX99w>
 <xmx:NU29XpF2YWzvOklulzKuUIWq_8VwntmFbv1skNqT_1W1IVLj00l_xw>
 <xmx:N029XgB2-lB72ydvzTycwxmFKQpdflQQlPY6PHzRLC_SlCjk4y8mnQ>
Received: from localhost (mobile-166-176-120-152.mycingular.net
 [166.176.120.152])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20D6A3280059;
 Thu, 14 May 2020 09:52:53 -0400 (EDT)
Date: Thu, 14 May 2020 08:52:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [RFC PATCH linux dev-5.4 2/4] ARM: configs: aspeed-g5: Enable
 modules
Message-ID: <20200514135251.GC1166713@heinlein>
References: <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
In-Reply-To: <20200514132703.448317-3-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 10:57:01PM +0930, Andrew Jeffery wrote:
> This is a step on the path to enabling kprobes, which depend on
> CONFIG_MODULES=3Dy.
>=20
> Setting CONFIG_MODULES=3Dy results in the following change in kernel size:
>=20
> Before:
>          $ size vmlinux
>             text    data     bss     dec     hex filename
>          8140500 2440582  178904 10759986         a42f32 vmlinux
>          $ stat --printf '%s\n' arch/arm/boot/zImage
>          3445200
>=20
> After:
>          $ size vmlinux
>             text    data     bss     dec     hex filename
>          8240349 2388862  172304 10801515         a4d16b vmlinux
>          $ stat --printf '%s\n' arch/arm/boot/zImage
>          3458368
>=20
> This gives a 41,529 byte increase to vmlinux and a 13,168 byte increase
> to the size of the compressed kernel image. In the most constrained BMC
> flash layout (arch/arm/boot/dts/openbmc-flash-layout.dtsi) this change
> decreases the free space in the kernel partition from 1,011,248 bytes to
> 998,080 bytes.
>=20
> CONFIG_HW_RANDOM=3Dy seems to come along for the ride with the
> `./scripts/config -e modules && make olddefconfig && make
> savedefconfig`. The measurements above include it, I haven't
> investigated why it gets enabled or what effect disabling it might have
> on the numbers.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspe=
ed_g5_defconfig
> index e124b4ddd442..e30f27a413f4 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -46,6 +46,7 @@ CONFIG_NEON=3Dy
>  CONFIG_KERNEL_MODE_NEON=3Dy
>  CONFIG_FIRMWARE_MEMMAP=3Dy
>  CONFIG_JUMP_LABEL=3Dy
> +CONFIG_MODULES=3Dy
>  # CONFIG_BLK_DEV_BSG is not set
>  # CONFIG_BLK_DEBUG_FS is not set
>  # CONFIG_MQ_IOSCHED_DEADLINE is not set
> @@ -152,6 +153,7 @@ CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_ASPEED_KCS_IPMI_BMC=3Dy
>  CONFIG_ASPEED_BT_IPMI_BMC=3Dy
> +CONFIG_HW_RANDOM=3Dy
>  CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
>  # CONFIG_I2C_COMPAT is not set
>  CONFIG_I2C_CHARDEV=3Dy
> --=20
> 2.25.1
>=20

We're already using modules on the facebook/openbmc kernels and it
hasn't seemed to cause any issues.  Is there any argument why we
shouldn't begin moving some of the drivers to be modules?  Any easy
change would be to make all the hwmon content as modules and load them
based on the device tree.

I think there is a DISTRO_FEATURE we should enable for userspace support
of modules.  Let me know if you want me to investigate that.

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl69TTIACgkQqwNHzC0A
wRknrBAAgBLQNeUy0HO++Ok8/zhZkVW5jKTrpWHYLZfBHzMF2IfPZaI9W3D6Sa6n
DKbQuQQD8ZqjXw41kPqTPQenzq2INn8aEsYznd88XAnsF0YEzhozrQbh5O+2ZvUc
QOnVHqFx9a0mhFY6xQywe8KwebWRgonWt6X7wM5ykSV+Ky5B2fDHvyNGaV3wtcTd
4YbZpLAle5jcDhBFBiTz2Xc8RVLV2goqQOHfnzXJWe6yxGGqZaj7vCUYKqL5kvoj
sBl7wnzQs8K0rsOjC1xsD7w4gNpEtTrAGTXniLUidhbk22dcGJ3h6qOZifWpuBuP
rH+FYdad3wDGvyVIwGzo/vsplWNI+at7IgJsPkO2Xf7NxRhFQwzeD1cJSb5j9ITx
bv0EwY2CGwCPYnfiIkvZhilzkktvzIQXN3wiT+HhjcbuMld2k7SP4DRYxUl0wjL9
vKm+2CMQZcocS6aE7OJu8Uxp2wTLyrpX5PspaO1vmRWptWK5TjXOuNsyJalcMqov
FWiaWpuXpvOh+YnHVdETpe/Enn2VvRmoXSWRhn6AQZy0Q5zH0fWvJrf1ZeiLLarj
wvbQ+FR5jHs8cG8qn2TrVgNKFKoAKnXEJk+IbkoRaOYr898L4vBp5ZfC1HGbUMNC
xeqwnvp/LWu9Z4T4x/5suMiCO4Khsk4l54OwRIWeOns/9ceEtBo=
=3ZH+
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
