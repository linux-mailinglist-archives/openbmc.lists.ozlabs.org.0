Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BC4DD306
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 03:22:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSTF4rDMz2yxP
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 13:22:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ALZxrUZ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ALZxrUZ0; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKSSs4WFqz2xtv
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 13:22:04 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id kj11so1747097qvb.11
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 19:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYyPNyC151dU+0Bndo4JAWfZkgTh2qbpeKX8WACizz4=;
 b=ALZxrUZ0e7DUadU4oouwSiCM5t/OZIU2ne8tCSR2F3ZgsQpCNZU3r3iUZebe3K5/qU
 Uc4G6NlpKbsuTgzw+n42DIrscmeymKt7WX96WkHx0nv1+3DQOYkQH2isGEY9BszDXI1T
 uQkY9It0XV7H7At3HcFxzI2wGIL9/FdStdV1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYyPNyC151dU+0Bndo4JAWfZkgTh2qbpeKX8WACizz4=;
 b=WWWXj9EY22HpQuqQsq2Ty0hb4Ags6v3CVPUMQQ5R7S93akB/A1zHbU6EbhrwPePBjR
 dOaef65qzYCi1+vbgv4nyos/9TILiugxP5153JLnHdg7xxxtMww07Uoyh77/1Q1LbTVz
 lx2nWaqDuSODEkZr08W3zL8X9xLmaU/9Ak4cab4Z0o3o8X3Muizl6ShFqiHq4yw172eO
 kRp8s11zVjcHPFuMQIzdFQK+rliYqe6bZwojDkbOffOAbc1MFi19v3zA4DfCWWCLW3lN
 qGj0llNWrKQdlLRkL9UMCZSS4qX9hgAJvf8DAXS5f2rMGc3UgSlVrv9qTvJKkLfGZGZk
 ybQg==
X-Gm-Message-State: AOAM530jDa+KYhK2VHKsj34x7V9vdvMdSSBUD85KoL0dA3r3F+F2mTQM
 ZG2zo/LNUyQQAapWlhPLginZ37QuzzOle07mZeFLyy41hJk=
X-Google-Smtp-Source: ABdhPJx8OOVT5Cv9gG8bWVxum8e78Y0GXLuSftePApSCy/dPXDGTlVqCe1PADgIQ/gt0VfTFNN3hbPAlsytfNHCD/vE=
X-Received: by 2002:a05:6214:c67:b0:435:bbb2:5c40 with SMTP id
 t7-20020a0562140c6700b00435bbb25c40mr5687596qvj.21.1647570120003; Thu, 17 Mar
 2022 19:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR06MB23152A66322ADC7B9CDFF895E6129@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB23152A66322ADC7B9CDFF895E6129@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 02:21:48 +0000
Message-ID: <CACPK8XdAZdURVBdmnZ-+ch+xmbCv_N38EbQD93neENmh3-9Lqw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX
 delay on MAC0/MAC1
To: Howard Chiu <howard_chiu@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 at 06:30, Howard Chiu <howard_chiu@aspeedtech.com> wrote:
>
> The property 'phy-mode' on ast2600 mac0 and mac1 is recommended to set to 'rgmii-rxid'
> which enables the RX interface delay from the PHY chip.
> Refer page 45 of SDK User Guide v08.00
>
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>

Thanks Howard. This makes MAC0 on my AST2600A3 evb work again!

mac1 was working fine without the patch. Do you know why?

Why do we do this for mac0 and mac1, but not mac2 and mac3?

Because the user guide is not public, can you please quote the
relevant information in the commit message.

Tested-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index a6382082d38c..9a1979541d2d 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -116,7 +116,7 @@ ethphy3: ethernet-phy@0 {
>  &mac0 {
>         status = "okay";
>
> -       phy-mode = "rgmii";
> +       phy-mode = "rgmii-rxid";
>         phy-handle = <&ethphy0>;
>
>         pinctrl-names = "default";
> @@ -127,7 +127,7 @@ &mac0 {
>  &mac1 {
>         status = "okay";
>
> -       phy-mode = "rgmii";
> +       phy-mode = "rgmii-rxid";
>         phy-handle = <&ethphy1>;
>
>         pinctrl-names = "default";
> --
> 2.25.1
>
