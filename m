Return-Path: <openbmc+bounces-1419-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MxMDRnYpGnWtwUAu9opvQ
	(envelope-from <openbmc+bounces-1419-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:21:45 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861A1D2110
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:21:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKNw2sKDz2xS3;
	Mon, 02 Mar 2026 11:21:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772338218;
	cv=pass; b=ghI38RwfYuOt5mkweaJw/iehxPjMGMa0cR6VJGXt1IJbp0/SbDh4VI0M8NS2nEn21XMw0Tfb2y2/2vG7+mnMJccV0gNueppdBGkF326zsF2uanBU/HEyQvni+FH28IVMigOMQ84iA835sDauI+IaJdk8pD5asRjYDPfbm0SgJv4SXyN1/utp/oh6IUx803XLChrDUvTRonuQx8lc47o+I/LAdcsM0KtZgaJlIjYectsSWxQN1Y/eCZ1eRkE6RzbHiKCR61XMqKNd5N8GDT2VrZoQMC24IXlV70Q0lbhlSJ52zF9vKN6/WrcZLe6GM1A/+/a0s8iPRFa8/2GOSVUelQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772338218; c=relaxed/relaxed;
	bh=KAFYWqJBfFkp4n/cSmKLl2bFL1Hccm3foEKegWsZz6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tn8BteiO/M7h+p756Huue8apFOkI1cKxEqMWabgG8lctg2rW7KCLJ3wzuOK1SLlM0wtDJmazLS0kUguxfWjQY3RmzBw9N8ibKolDNRjrHoofHi7XgnW0+aMgnRVXJwJK72p/QPhOBIvzVOPGIFRKacLMEC7E5r6+g/MamBi9i3Be52T0PE00UuMJN+exbluZSU4ntNy/xS8PNuETk79GHKluuyc6oRL2iEneT5a72YgSuohfRvePLJWKNMwbMUBVInOXjMqy8VRzGv5dpMJU3HejOEwlA25Rv5HWt6vZ4MxrJ61h9G/Pblpyv2VMKu8BvsIVczOxKdVnKY9cLPlRhw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHCt8prF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHCt8prF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com [IPv6:2607:f8b0:4864:20::122c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNpWF5KBRz2yF1
	for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2026 15:10:16 +1100 (AEDT)
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1275750cf9cso2646633c88.0
        for <openbmc@lists.ozlabs.org>; Sat, 28 Feb 2026 20:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772338214; cv=none;
        d=google.com; s=arc-20240605;
        b=MxkZN1P3hod+unpAiHjaMyjfPOIVgAfLgw9SFkrzNsuUopDPoas8k2tQ3BcWmBBMRf
         niwRelkNm3tZdXRjpB2YLA0IRk5eENXhaTwy4CHE9osi6dVLfXxCVRiYVnagwmzbaD4o
         0PVntXVap7nO+78dEqfXySbP3Q6i95AXgYt0L4TzaAa7VZZcrYQgN9KTnezRgWe1uC+q
         lfZkuA8yWA4z48fNpWtyhzGgITA1aL6z9cEfjtzbzuJz1pIqWyDMgQfBh9rMnWwhcOcE
         869FuowwiEkEgqipo7mOvM/7w5iwa54MHyozb/Ch+jtLcDs/JXdYSTmbWcHYZLylocti
         Djgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KAFYWqJBfFkp4n/cSmKLl2bFL1Hccm3foEKegWsZz6E=;
        fh=YTdhD3rTqLSsJXmPdAuMzN97wMU9QlhyUTd4+csBByg=;
        b=F8XYaWeuF6bbpFt1poprqEmnPqTQAYfosP+3SN/vS+xDCS0hNteTqWfGD9zfF0Xi3f
         IEG3jVoBSQdviWC6fZXyNvKzRwXimzqKoyEDn19UfABH6l/qpdanKgFjvDvrszwo5/R0
         4EsuSoVKro69f7T19Cc302zZUVfiuRK6AwwX6V7WlD9SrxSxNmq+IyO2YBzH9cbYe+Na
         X4ILToBHbsJrHfYhpW3gS9TGKGnlC8MLm8THNx5b/+nhOjHMyctKqYM0JrxN/vkMzSJ3
         Lpp+XM+cH4KevbVvIQ/2LGfxtlelw1m3A5qzwQCe9ZTeAcDiS2Zsp9ayxptgENqjK/Tx
         OfhQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772338214; x=1772943014; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAFYWqJBfFkp4n/cSmKLl2bFL1Hccm3foEKegWsZz6E=;
        b=JHCt8prFgtcsnRcQprEstHFMG5HORK1F7y3Ka1t7SdWttJ4nOi93GbICZ9QF5kV+SL
         eoxOSAb3slThvStELKQi+12ZxtlyDz9T8OO9eDFlqz+tr7/9qwS3IiY4iTZ7ZYbg0TI4
         28QnaLKKnJBv78FQ2kf+h+9/yUl4gypSgI5scFXqpfNpRx5p8W9LR2YMnJeW4a0pZbCE
         zkYCDa2Ra5gAPnpvYY6YSDF1c1NjAVIaf8YVw5RAMGx+AJC4SQUmF+k97lSLErQgT2hg
         CrONdWbsWeVeRmOYflzw/h5dfIi/BXOykZGlMfmOxyRYxZD+dZ0AbrsyteuTbLgmE1a4
         FCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772338214; x=1772943014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KAFYWqJBfFkp4n/cSmKLl2bFL1Hccm3foEKegWsZz6E=;
        b=lx9ELJ/4ZCEuys9EN1Ie7NVkb1/FAiQ+aA/zIGhG9hPEzygzhlWR2YpmstvJBsZ5jv
         2YvwzrtzpLQNUcojz6w1MCruoHVU40glowUBuyIhSEn4FCYfv2gL3tTVL6yTkipVaaBm
         I+qhD7l2XQWzSMgwdlXgQxrQf+jpS7ljJfF6dMZeDQr8jztnEKx1Few0ySLyrEUhJ1v3
         noPq1GoPkO2euLq/NA+87ac/DkS+YWXlw8cs7BCOq6+g9f2+8P0/HPP7yrG7CllM+0dW
         +W51XbapB7MYjwlWHsdDsZeljDrNraP5hPLhlJHZ0o38vzAHTAmCSf4GgkfucgJLvFfJ
         4KvQ==
X-Gm-Message-State: AOJu0YwrZ0AzI2/96lpCTZEMXfwPAAUTNtabkWAhYnYO2C2PR+MZAcMN
	OGoJ6JvIpi6hOJ0tFSveqjC4XhHKgIcfsUqCXa+uO2IYn9d4ShboY+CCn106usfJXFcLJhjKSas
	J/sHJxuJKg+LwujaEWaCa5DoND+SPiE0=
X-Gm-Gg: ATEYQzxN1Lhy1VrsCV7FdlVNf+QoTXnPEQYN+vMDiFhGBJRhVHiahfzR445L6dCaxlU
	EI6Od88EzLTk+hcqitoxM9hAezCJSA9RJX2vrerWXD6/SNQ5pwALuDNsfYcAUOO1yEIOItsTsDx
	OdHAJf4ihejrHnQjtewH35DTe729WZRW2engE73WZDkeCVMFB43weHd58T1wt6Iqz1z98v5rolX
	rW6uZ9flfBPrx3UIwYRX9uNSNWpKh9aWE1N9aUZZn5Y98YYG9DSt4f50TpbZH3JuVQCPfRwhAMW
	+IYXHVnfA1djfKxVfHzH
X-Received: by 2002:a05:7022:f83:b0:127:366c:8727 with SMTP id
 a92af1059eb24-1278fc915a9mr3129486c88.40.1772338214232; Sat, 28 Feb 2026
 20:10:14 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
In-Reply-To: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Feb 2026 22:10:03 -0600
X-Gm-Features: AaiRm51UMxF9OvQXcEtupTx4IO4klTc4PKCnmczC6Q6tBwNpN1Kg2I3YFKWL16E
Message-ID: <CAJ13v3RjXmAL7L3DC8pcLv_xOQB7Bn7iFTPRKLwfqGpPaQRbWQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
To: joel@jms.id.au, andrew@codeconstruct.com.au
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1419-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anirudhsriniv@gmail.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.2:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4861A1D2110
X-Rspamd-Action: no action

Apologies, This patch was meant for the u-boot tree and I forgot to
include u-boot as a prefix in the patch title.

Should I resend another version with the corrected title?

On Sat, Feb 28, 2026 at 10:00=E2=80=AFPM Anirudh Srinivasan
<anirudhsriniv@gmail.com> wrote:
>
> Add dts for Asus Kommando IPMI card, an ast2600 based pcie bmc card
>
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
> ---
>  arch/arm/dts/Makefile                            |  1 +
>  arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts | 98 ++++++++++++++++++=
++++++
>  2 files changed, 99 insertions(+)
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 5141c3dc3aa025e2f5c9b2bb98216ee5c72cdf70..fa6837be747da4fbe102ac27e=
60ee3d81e230cb7 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -682,6 +682,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         ast2500-genesis3.dtb \
>         ast2500-romulus.dtb \
>         ast2600-ampere.dtb \
> +       ast2600-asus-kommando-ipmi-card.dtb \
>         ast2600-bletchley.dtb \
>         ast2600-dcscm.dtb \
>         ast2600-evb-ecc.dtb \
> diff --git a/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts b/arch/arm/=
dts/ast2600-asus-kommando-ipmi-card.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..11fee8d5403541f2453f6b8c6=
f123c5d1108137d
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-asus-kommando-ipmi-card.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +       model =3D "ASUS Kommando IPMI Card";
> +       compatible =3D "asus,kommando-ipmi-card", "aspeed,ast2600";
> +
> +       memory {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x40000000>;
> +       };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +       };
> +
> +       aliases {
> +               spi0 =3D &fmc;
> +               ethernet0 =3D &mac2;
> +       };
> +
> +       cpus {
> +               cpu@0 {
> +                       clock-frequency =3D <800000000>;
> +               };
> +               cpu@1 {
> +                       clock-frequency =3D <800000000>;
> +               };
> +       };
> +};
> +
> +&fmc {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> +
> +       flash@0 {
> +               status =3D "okay";
> +               spi-max-frequency =3D <50000000>;
> +               spi-tx-bus-width =3D <4>;
> +               spi-rx-bus-width =3D <4>;
> +       };
> +};
> +
> +&hace {
> +       status =3D "okay";
> +       u-boot,dm-pre-reloc;
> +};
> +
> +&mac2 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy2>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii3_default>;
> +};
> +
> +&mdio {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mdio3_default>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       ethphy2: ethernet-phy@2 {
> +               reg =3D <0>;
> +       };
> +};
> +
> +&scu {
> +       mac2-clk-delay =3D <0x08 0x04
> +                         0x08 0x04
> +                         0x08 0x04>;
> +};
> +
> +&sdrammc {
> +       clock-frequency =3D <400000000>;
> +};
> +
> +&uart5 {
> +       status =3D "okay";
> +       u-boot,dm-pre-reloc;
> +};
> +
> +&wdt1 {
> +       status =3D "okay";
> +};
> +
> +&wdt2 {
> +       status =3D "okay";
> +};
> +
> +&wdt3 {
> +       status =3D "okay";
> +};
>
> ---
> base-commit: d40130c7056b84dc5213f3ff6764d0e45bb84035
> change-id: 20260228-asus-kommando-9de4d6b779a8
>
> Best regards,
> --
> Anirudh Srinivasan <anirudhsriniv@gmail.com>
>


--=20
Regards
Anirudh Srinivasan

