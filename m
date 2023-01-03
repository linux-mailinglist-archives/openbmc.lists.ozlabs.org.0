Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AF65C89C
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 22:07:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmlfZ4wc1z3bW0
	for <lists+openbmc@lfdr.de>; Wed,  4 Jan 2023 08:07:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SYo9JSDw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iybfOjly;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SYo9JSDw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iybfOjly;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nmlf027cCz2xKN
	for <openbmc@lists.ozlabs.org>; Wed,  4 Jan 2023 08:06:32 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 437BE5C0151;
	Tue,  3 Jan 2023 16:06:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 03 Jan 2023 16:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1672779990; x=1672866390; bh=U6vIGUihDj
	I9+JXJUDlYRSdHc3B0UMrz18hufPM5s78=; b=SYo9JSDwz1lv8aCA6eU0yh+7/l
	UyrWo8lHo7sn2tFHXMbpT+2Psw1qV3C3fsm2PCOiTmxWhZSXFYa+dl5vegcTeF1V
	ydPSRQXGx9LEsU9Bh82D2lt1XOLLpBm9Xd+8w7W0YiA3do0/oiQWXyF24uKgV/hV
	dilqHVTNsmjnxnFvSW9vsZAHAZFeN88RhieUaTdVgIpEgkOREyEUx4mpXVyoInH6
	a0hYtmubmGXHT6H9hScusW2wW0oLYQtkUc4sFW4IFHG9+QRcIZlwTpUD5JLhVwv0
	VkS+mOfnL7gno9mrwgyQPTqezSDz1m23gnSjpzk53ZZeJniVODClR+1/CCTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672779990; x=1672866390; bh=U6vIGUihDjI9+JXJUDlYRSdHc3B0
	UMrz18hufPM5s78=; b=iybfOjlyjVxN7WUpAZz8dAHFndoLf0UJKqtod6VN4Uf1
	VNTA4v/tBDtxVmSH4Vs3JiUZ07YEexWPNYYhixpO2waMINo/Fbi0ln5qdUp/ZfS2
	K1HyfQPFBlp3roWG34d82bNcQqhHfnGxo5o0EQ0L3PIyIT35ZpEmbHKuGKoqk8/S
	6Ywg2qhlIIX56O4hRtuU5IVw6567BXJL2Lr1kCKDNrin3yDrYq+vNcEM7bKh2tWb
	GGlkpLqedJFCOOfh/DDfkb02xU96YJ453zubCFSLpggaft62jrnwjVdZP2lQfwkN
	gO06e88ZGSmF1qAFB2zCHSgXXQiA+JtNehnk1AbClw==
X-ME-Sender: <xms:1pi0Y7xHV0YhiOubrfhbwnhgNfW1607iBefsR-woJnjpigyJHQsFgw>
    <xme:1pi0YzSP4s6NE00biuqWehfHoI9Yn8ZrOrPcj1kM-cm-wIpbbwLSMoC-SfYDinma9
    liu2SLBHr-9XaJHHWc>
X-ME-Received: <xmr:1pi0Y1UJcLbW_6XAiX4nXKYPTqzJea11VPu2xjeH6hh6EkY-VtBTyy7toQRsptp9B0246TWs9o6HHGJ68DeyCtwa3CZORNj_vrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:1pi0Y1jDVetZidDpFHnEo1fkZU2HNAzAw4HfVtw3Rhsv2UnefLRqyQ>
    <xmx:1pi0Y9AAaeLhLXxJto3FcWYlzq5_HfaCS_LZ6YgBmjDA7sqUZUvMzg>
    <xmx:1pi0Y-LUFl4nzfYRf00Lc93DqGhlnbtOFJUPyggHvZsSbVVV0joyng>
    <xmx:1pi0Y8M0fFeLTFxWy3nnSxLKR8I43zSZavSPHrpSaG6bPWGh36iySQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 16:06:29 -0500 (EST)
Date: Tue, 3 Jan 2023 15:06:28 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Potin Lai <potin.lai.pt@gmail.com>
Subject: Re: [PATCH u-boot,v2019.04-aspeed-openbmc 1/1] ARM: Aspeed: add a
 config for FMC_WDT2 timer reload value
Message-ID: <Y7SY1HNfaY1/lhQB@heinlein.taila677.ts.net>
References: <20221216163023.551569-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLor5I5os9FE0Clw"
Content-Disposition: inline
In-Reply-To: <20221216163023.551569-1-potin.lai.pt@gmail.com>
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
Cc: Potin Lai <potin.lai@quantatw.com>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Dan Zhang <zhdaniel@meta.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SLor5I5os9FE0Clw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2022 at 12:30:23AM +0800, Potin Lai wrote:
> Add a config for FMC_WDT2 timer reload, and set timer reload value if
> FMC_WDT2 is enabled.
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>  arch/arm/include/asm/arch-aspeed/platform.h |  2 ++
>  arch/arm/mach-aspeed/ast2600/Kconfig        | 10 ++++++++++
>  arch/arm/mach-aspeed/ast2600/scu_info.c     | 13 +++++++++++++
>  3 files changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/inclu=
de/asm/arch-aspeed/platform.h
> index ca270d4be1..4c2b0866fb 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -44,6 +44,8 @@
>  #define ASPEED_FMC_CS0_BASE	0x20000000
>  #elif defined(CONFIG_ASPEED_AST2600)
>  #define ASPEED_FMC_WDT2		0x1e620064
> +#define ASPEED_FMC_WDT2_RELOAD	0x1e620068
> +#define ASPEED_FMC_WDT2_RESTART	0x1e62006C
>  #define ASPEED_SPI1_BOOT_CTRL	0x1e630064
>  #define ASPEED_MULTI_CTRL10	0x1e6e2438
>  #define ASPEED_HW_STRAP1	0x1e6e2500
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/=
ast2600/Kconfig
> index f5852afa77..4c141672a1 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -53,6 +53,16 @@ config TARGET_QUALCOMM_DC_SCM_V1
> =20
>  endchoice
> =20
> +config ASPEED_FMC_WDT2_TIMER_RELOAD
> +	int "Aspeed FMC_WDT2 timer reload value"
> +	depends on ASPEED_AST2600
> +	range 0 8191
> +	default 0
> +	help
> +	  Aspeed FMC_WDT2 timer reload value, the time unit is 0.1 second.
> +	  if this value is 0, left original FMC_WDT2 timer reload register with=
out
> +	  change (Default 22 seconds), if it is > 0 then set timer with the val=
ue.
> +
>  source "board/aspeed/evb_ast2600/Kconfig"
>  source "board/aspeed/fpga_ast2600/Kconfig"
>  source "board/aspeed/slt_ast2600/Kconfig"
> diff --git a/arch/arm/mach-aspeed/ast2600/scu_info.c b/arch/arm/mach-aspe=
ed/ast2600/scu_info.c
> index a2277eec58..c18bc3923a 100644
> --- a/arch/arm/mach-aspeed/ast2600/scu_info.c
> +++ b/arch/arm/mach-aspeed/ast2600/scu_info.c
> @@ -30,6 +30,9 @@ static struct soc_id soc_map_table[] =3D {
>  	SOC_ID("AST2625-A3", 0x0503040305030403),
>  };
> =20
> +static u32 aspeed_fmc_wdt2_reload =3D
> +	CONFIG_ASPEED_FMC_WDT2_TIMER_RELOAD & 0x1FFF;
> +
>  void aspeed_print_soc_id(void)
>  {
>  	int i;
> @@ -302,6 +305,16 @@ void aspeed_print_2nd_wdt_mode(void)
> =20
>  			printf("\n");
>  		}
> +
> +		if (aspeed_fmc_wdt2_reload &&
> +		    (readl(ASPEED_FMC_WDT2) & BIT(0))) {
> +			writel(aspeed_fmc_wdt2_reload, ASPEED_FMC_WDT2_RELOAD);
> +			writel(0x4755, ASPEED_FMC_WDT2_RESTART);
> +			printf("Set FMC_WDT2 timer reload value to 0x%04X\n",
> +			       aspeed_fmc_wdt2_reload);
> +		} else {
> +			printf("Keep FMC_WDT2 timer reload value as init\n");
> +		}
>  	}
>  }
> =20
> --=20
> 2.31.1
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--SLor5I5os9FE0Clw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmO0mNQACgkQqwNHzC0A
wRmPaBAAnjYyZXlR1JxJC7640MPlV35pHAQRenZVppU5+e2FkGFJVX/oqmpdruzO
tfMRdjNof2LsncKVTtCPCISZuAbNq0cn0LkSCJos1LdpQ3CambgwBhag7wNq2GZC
x3Wi8gDqju4Tv73kWhx+uXiUWrI4Dj5y8GzWA47meFhnvvqqiXis+jTZ3dQkeEHQ
9vtlrhoOrnqy74rabb+YqCUnx26/+rMtKc0RmcOx5V30xM4b5E6rSPGJwVsLN/l+
cGmEnDXbunwu5PvK2HLSxzNfCVu6+tPGzYa+QHw5iNkelHhkW5FLJOMGlL2KCIoR
krw6Nz/ieI9YB3J9j4fVvBCs+f1+IhjFVFiLf/m9xW1/BREEvqIDX0nVg+65NDjo
S/YwSK/ik65/yjcIuuXoaXldoXvvWvtyCNgc0GXsZmU5YE5QDo30n0wLiMxwC6oq
cr6vlaw6K2mIj/p9VA2iFiCQvTN7w5z9VkRPuUJcCU4VdiaXyaNNBeIsfTQOXWtm
xi5epOu9nUyHJG5LFkdU5BtgawMYM23VGTbmg0w5uoh4mkRQiWOFvpLoTa44cb13
vkMvo/m6Ix/1FJ+pupGNs1qzfyPDAhQuey/Y1Vj8an5zs4IMyQljwrfhjzoSXvb5
cXw2Kw9svmNyLHGLk+a35SdvKzVKrM3WyUrtpVDxty7fnBDDJJI=
=JbMK
-----END PGP SIGNATURE-----

--SLor5I5os9FE0Clw--
