Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4699908D09
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2024 16:12:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Czg30fzn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W11S33pxjz3cZy
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2024 00:12:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=Czg30fzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 323 seconds by postgrey-1.37 at boromir; Sat, 15 Jun 2024 00:11:33 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W11RT0mCFz3cVY
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2024 00:11:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1718374288; x=1718979088; i=j.neuschaefer@gmx.net;
	bh=aPL/fRcAWifCtBqWYTXUxPusiEBvwiSQUuAYnUUTckw=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Czg30fzndUYqZLkLqKH4w/CxDNrFC6XjzjpeKW+BrOo8mPZXd0XF5NUn9Z1CDT7W
	 eH9+MP/mLSgJZjXoi9JSa0mIV2narLY3bb2LfVluvd1Nb74AwZYqEko4hujn+c6bg
	 oqx/h36knNXQBhmecXjWWQsiS6l7aUVjWKR8AZ9PoYy+m3ekKIQBE51jYl567CACH
	 3s5YqmWT2F5bZv0HLi2PpkmsHOY5Tjb1UnJluuLNzQ7niaXPALNfgOHRr283HPkT9
	 kiWbRSbYpihHn5GzUP8LwwLrXsv0WfDMVP+PSSswQAOvqx4Lmh4tob93SMGOcn56t
	 848UhXMaf/nHyl3upA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.135]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1sSfz52exa-016EqB; Fri, 14
 Jun 2024 16:05:37 +0200
Date: Fri, 14 Jun 2024 16:05:34 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 2/4] pinctrl: nuvoton: Make use of struct pinfunction
 and PINCTRL_PINFUNCTION()
Message-ID: <ZmxOLrrZ_ExpoE-Z@probook>
References: <20240611093127.90210-1-andy.shevchenko@gmail.com>
 <20240611093127.90210-3-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240611093127.90210-3-andy.shevchenko@gmail.com>
X-Provags-ID: V03:K1:S+HB3W8uX/0zqI5vXfrLmsRjMOTfGY0EljrATJB3J+9k2C7F01X
 GehLgo98RlIS8TuMJfVZKdZMcKx7HZvVYSJnlkrrgJPMSvJqW8jnbA7USNDWtx+BWMSAVwF
 AR7M7CmRTgpKgvdmKY3FLS1OTamlFaDsPrrvZC/h2Puy0a6bgdcPuyKI/UaJmctwCHy8CQ4
 QZiv2arQx4oKKLTpkCqFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:thCvmib4fc4=;eMZDj6NgcaR88m44zDzDhSj9B4g
 BohGbm180n8HQP39ZxAWMo8pSWsr1cSkpc8go9t0PmsXUWx8pMIqHimxBfguaqCOnzL6P/eT/
 0mva7UewjKbWAkJ+a05RDw/ba7EuUwwt+lbatJ0ZBtGOZXyLI+kvK58e1Cwz4vEzwV4lNPE1t
 d8wjE+yDbSy6ta6XkSnXkP8NM7FRLztmAsO3WTLQdwvB3Ir0H5VuI8i0mA7dmUUarbH+Hz6wZ
 jVxhHfz7VoBZ/E3LG3bYARwoUMgQ3WvqX5FLgboE2aXRrxg0ngAc/ZE7TeCwW89nZ6hvhjgcX
 vw9xUR6e2TKvU4D9EsM3D1rvqWap8twHoMxx5DlIZnUEJpfqcQX5ACZSTUo3akm6PNrwoUttE
 3K6vEkY5ag7jjZNuw5Sj1I1J7JrtfD7tu521Quyi/hr2P7Sh30kHxZJhywHHqh74iDeBRMIBs
 GGVfoZE0ezonhTRZPdOGyk4IcpVWUASQ8z4a5nS2LjlSHRRf8SlOfdP01+qA97q48nlQIiyJR
 iK6M9LNVyc9/P4XOFsB5Ud1mNBE7+uLJY8HlWkZUay9SjG6rnktEN4DmZzVS6cCv2kTWxgZLb
 9PhRTWqVgf3TkVdwb9bG+5JnvXMyYViW8NeDPNfawC6XK/a9u5hOZcSHcQZHIRW/MLzLs4SOR
 aw6EhvNQZ0OY3r9lcV2LRcWriO3q2xdEe623B8UBtS4TnJuUIH88+jUfbxzs3AHb7GeL5ctBi
 M0fAOGtUZe9uxlOc00C9b6lW0shZdOSgiPNnyzzWwbpY1MydIkuQ3Ze9hxe7c+yVW3BGV1ltY
 ECpoGbleHNi0ld/ja/Aad35lFq9VNPsYZ/qGpH1Bsk8P8=
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
Cc: Jacky Huang <ychuang3@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jun 11, 2024 at 12:30:23PM +0300, Andy Shevchenko wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Since pin control provides a generic data type and a macro for
> the pin function definition, use them in the driver.
>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Thanks for your patch, it's always good to see code simplifications like t=
his!

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

>  drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
>  4 files changed, 17 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nu=
voton/pinctrl-ma35.c
> index fb933cddde91..62e877b76a25 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -98,12 +98,6 @@ static const u32 ds_3300mv_tbl[] =3D {
>  	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
>  };
>
> -struct ma35_pin_func {
> -	const char		*name;
> -	const char		**groups;
> -	u32			ngroups;
> -};
> -
>  struct ma35_pin_setting {
>  	u32			offset;
>  	u32			shift;
> @@ -149,7 +143,7 @@ struct ma35_pinctrl {
>  	struct regmap		*regmap;
>  	struct ma35_pin_group	*groups;
>  	unsigned int		ngroups;
> -	struct ma35_pin_func	*functions;
> +	struct pinfunction	*functions;
>  	unsigned int		nfunctions;
>  };
>
> @@ -1041,9 +1035,10 @@ static int ma35_pinctrl_parse_functions(struct de=
vice_node *np, struct ma35_pinc
>  					u32 index)
>  {
>  	struct device_node *child;
> -	struct ma35_pin_func *func;
> +	struct pinfunction *func;
>  	struct ma35_pin_group *grp;
>  	static u32 grp_index;
> +	const char **groups;
>  	u32 ret, i =3D 0;
>
>  	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
> @@ -1055,12 +1050,12 @@ static int ma35_pinctrl_parse_functions(struct d=
evice_node *np, struct ma35_pinc
>  	if (func->ngroups <=3D 0)
>  		return 0;
>
> -	func->groups =3D devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *=
), GFP_KERNEL);
> -	if (!func->groups)
> +	groups =3D devm_kcalloc(npctl->dev, func->ngroups, sizeof(*groups), GF=
P_KERNEL);
> +	if (!groups)
>  		return -ENOMEM;
>
>  	for_each_child_of_node(np, child) {
> -		func->groups[i] =3D child->name;
> +		groups[i] =3D child->name;
>  		grp =3D &npctl->groups[grp_index++];
>  		ret =3D ma35_pinctrl_parse_groups(child, grp, npctl, i++);
>  		if (ret) {
> @@ -1068,6 +1063,8 @@ static int ma35_pinctrl_parse_functions(struct dev=
ice_node *np, struct ma35_pinc
>  			return ret;
>  		}
>  	}
> +
> +	func->groups =3D groups;
>  	return 0;
>  }
>
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl=
/nuvoton/pinctrl-npcm7xx.c
> index 2601aacfb976..c6b11a198c76 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -639,13 +639,6 @@ static struct pingroup npcm7xx_groups[] =3D {
>
>  #define NPCM7XX_SFUNC(a) NPCM7XX_FUNC(a, #a)
>  #define NPCM7XX_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define NPCM7XX_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct npcm7xx_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  NPCM7XX_SFUNC(smb0);
>  NPCM7XX_SFUNC(smb0b);
> @@ -764,7 +757,8 @@ NPCM7XX_SFUNC(lkgpo2);
>  NPCM7XX_SFUNC(nprd_smi);
>
>  /* Function names */
> -static struct npcm7xx_func npcm7xx_funcs[] =3D {
> +static struct pinfunction npcm7xx_funcs[] =3D {
> +#define NPCM7XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	NPCM7XX_MKFUNC(smb0),
>  	NPCM7XX_MKFUNC(smb0b),
>  	NPCM7XX_MKFUNC(smb0c),
> @@ -880,6 +874,7 @@ static struct npcm7xx_func npcm7xx_funcs[] =3D {
>  	NPCM7XX_MKFUNC(lkgpo1),
>  	NPCM7XX_MKFUNC(lkgpo2),
>  	NPCM7XX_MKFUNC(nprd_smi),
> +#undef NPCM7XX_MKFUNC
>  };
>
>  #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl=
/nuvoton/pinctrl-npcm8xx.c
> index 9834a13cf5c9..7c37d2cda9f1 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -829,13 +829,6 @@ static struct pingroup npcm8xx_pingroups[] =3D {
>
>  #define NPCM8XX_SFUNC(a) NPCM8XX_FUNC(a, #a)
>  #define NPCM8XX_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define NPCM8XX_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct npcm8xx_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  NPCM8XX_SFUNC(gpi36);
>  NPCM8XX_SFUNC(gpi35);
> @@ -1060,7 +1053,8 @@ NPCM8XX_SFUNC(hgpio6);
>  NPCM8XX_SFUNC(hgpio7);
>
>  /* Function names */
> -static struct npcm8xx_func npcm8xx_funcs[] =3D {
> +static struct pinfunction npcm8xx_funcs[] =3D {
> +#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	NPCM8XX_MKFUNC(gpi36),
>  	NPCM8XX_MKFUNC(gpi35),
>  	NPCM8XX_MKFUNC(tp_jtag3),
> @@ -1282,6 +1276,7 @@ static struct npcm8xx_func npcm8xx_funcs[] =3D {
>  	NPCM8XX_MKFUNC(hgpio5),
>  	NPCM8XX_MKFUNC(hgpio6),
>  	NPCM8XX_MKFUNC(hgpio7),
> +#undef NPCM8XX_MKFUNC
>  };
>
>  #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, =
q) \
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl=
/nuvoton/pinctrl-wpcm450.c
> index cdad4ef11a2f..5cf6d555c5a5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -482,13 +482,6 @@ static const struct pingroup wpcm450_groups[] =3D {
>
>  #define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
>  #define WPCM450_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
> -#define WPCM450_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm =
## _grp), \
> -			.groups =3D nm ## _grp }
> -struct wpcm450_func {
> -	const char *name;
> -	const unsigned int ngroups;
> -	const char *const *groups;
> -};
>
>  WPCM450_SFUNC(smb3);
>  WPCM450_SFUNC(smb4);
> @@ -555,7 +548,8 @@ WPCM450_FUNC(gpio, WPCM450_GRPS);
>  #undef WPCM450_GRP
>
>  /* Function names */
> -static struct wpcm450_func wpcm450_funcs[] =3D {
> +static struct pinfunction wpcm450_funcs[] =3D {
> +#define WPCM450_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_S=
IZE(nm ## _grp))
>  	WPCM450_MKFUNC(smb3),
>  	WPCM450_MKFUNC(smb4),
>  	WPCM450_MKFUNC(smb5),
> @@ -616,6 +610,7 @@ static struct wpcm450_func wpcm450_funcs[] =3D {
>  	WPCM450_MKFUNC(hg6),
>  	WPCM450_MKFUNC(hg7),
>  	WPCM450_MKFUNC(gpio),
> +#undef WPCM450_MKFUNC
>  };
>
>  #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
> --
> 2.45.2
>
