Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1565F542185
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHyP56g0Wz3bkJ
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=L4ZTdmZf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=L4ZTdmZf;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHyNj5RbKz2xgX
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:43:32 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id d14so17938682wra.10
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uEAGxJn4xSLTeYrkou2UNXBwZgIAjh1tfeI6iSJT+NE=;
        b=L4ZTdmZfwNfGfC9+8IkhThsXKnoeU4WRmtYYWIxianIOMR56MoPjpJ9JRPI5/bL1xN
         dpJtlCkW5m14UtzFkyqrihFKce/d0ervRoM4STaEYb3wpgbL5wPCghLk69awWI1rwYie
         7aDRwNlPZMUCiFWpxA6jiC40/cxD6no2YVXPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEAGxJn4xSLTeYrkou2UNXBwZgIAjh1tfeI6iSJT+NE=;
        b=mIMWmgJUNC8hAISEPrPRYPH+mDIq+YlJeaPlefSwIAwJVAf9EsuMAjwdsd5FMVGWcc
         LyToxemIyOTx5qMgKX7TqO2Ql/rBf2Bcv3ry471wZd+SZqqMh//axoAuJv5SepFYxMr7
         6HVexTb+pWB6orESGxOMbCpo0HiJbIEV8UZyYzMXjimI8LrTlhYbtNukBa9h5aiIMEhE
         jCMd3JxfDgm+6Fh+0QSq/kZaRPrSxZMeXBVs+rUWQBJ/3u5a1K7Uc8zA9Hlw9Do7dnJu
         KLZYCEw6IPg0Xbua34XxKLwODo87KwfVtplzozCl1QEZq2JelRb9PWCo61sfatk0HG9+
         sSWA==
X-Gm-Message-State: AOAM532b6ojhNB+MrH3eFBMDKjEGtWluehwh5+k+qPAQMky25HhlKRrB
	O7dvO+IUHMhTsLntWxP/WdMNUVbU8osAIra107k=
X-Google-Smtp-Source: ABdhPJzBKwDN1aGeLlz+cFmiSADH5FxPeVWOuxpfyh8ANn7DyZ/V0pv3RfXFCzbJlfJmzGnfc4bdtPaTfHffGV8bix8=
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr18690138wrd.606.1654670608903; Tue, 07
 Jun 2022 23:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220608064143.1234929-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220608064143.1234929-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 06:43:16 +0000
Message-ID: <CACPK8XcKdDMcKpGt-sX3ZRBxPBziOn80mXLbLCnwh_g51KcpHQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Aspeed: remove
 unnecessary i2c pinctrl
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:42, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Remove unnecessary i2c pinctrl from machine dts files to make them use
> default setting in ast2600.dtsi.
>
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Jae.

> ---
>  arch/arm/dts/ast2600-bletchley.dts | 15 ---------------
>  arch/arm/dts/ast2600-evb.dts       | 15 ---------------
>  arch/arm/dts/ast2600-intel.dts     | 15 ---------------
>  arch/arm/dts/ast2600-ncsi.dts      | 15 ---------------
>  arch/arm/dts/ast2600-pfr.dts       | 15 ---------------
>  arch/arm/dts/ast2600-s6q.dts       | 26 --------------------------
>  arch/arm/dts/ast2600-slt.dts       | 15 ---------------
>  arch/arm/dts/ast2600a0-evb.dts     | 15 ---------------
>  arch/arm/dts/ast2600a1-evb.dts     | 15 ---------------
>  9 files changed, 146 deletions(-)
>
> diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
> index 57ca845b94a7..8067863de880 100644
> --- a/arch/arm/dts/ast2600-bletchley.dts
> +++ b/arch/arm/dts/ast2600-bletchley.dts
> @@ -170,37 +170,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>  &scu {
> diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
> index 515afa83af69..ad0bd4671917 100644
> --- a/arch/arm/dts/ast2600-evb.dts
> +++ b/arch/arm/dts/ast2600-evb.dts
> @@ -243,37 +243,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>  &pcie_phy1 {
> diff --git a/arch/arm/dts/ast2600-intel.dts b/arch/arm/dts/ast2600-intel.dts
> index 19d19f6ef52a..4b5a90b09223 100644
> --- a/arch/arm/dts/ast2600-intel.dts
> +++ b/arch/arm/dts/ast2600-intel.dts
> @@ -244,37 +244,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>  #if 0
> diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
> index dbe888a945e3..20ef7d7b9fb5 100644
> --- a/arch/arm/dts/ast2600-ncsi.dts
> +++ b/arch/arm/dts/ast2600-ncsi.dts
> @@ -245,37 +245,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>  #if 0
> diff --git a/arch/arm/dts/ast2600-pfr.dts b/arch/arm/dts/ast2600-pfr.dts
> index 8596207f5463..16bb84997a63 100644
> --- a/arch/arm/dts/ast2600-pfr.dts
> +++ b/arch/arm/dts/ast2600-pfr.dts
> @@ -247,37 +247,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>
> diff --git a/arch/arm/dts/ast2600-s6q.dts b/arch/arm/dts/ast2600-s6q.dts
> index 52b620d3b4fe..59fec60936dd 100644
> --- a/arch/arm/dts/ast2600-s6q.dts
> +++ b/arch/arm/dts/ast2600-s6q.dts
> @@ -118,80 +118,54 @@
>
>  &i2c0 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c1_default>;
>  };
>
>  &i2c1 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c2_default>;
>  };
>
>  &i2c2 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c3_default>;
>  };
>
>  &i2c3 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c4_default>;
>  };
>
>  &i2c4 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>  &i2c9 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c10_default>;
>  };
>
>  &i2c11 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c12_default>;
>  };
>
>  &i2c14 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c15_default>;
>  };
>
>  &i2c15 {
>         status = "okay";
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c16_default>;
>  };
>
>  &display_port {
> diff --git a/arch/arm/dts/ast2600-slt.dts b/arch/arm/dts/ast2600-slt.dts
> index 93c5d86ce379..9935b9c9a597 100644
> --- a/arch/arm/dts/ast2600-slt.dts
> +++ b/arch/arm/dts/ast2600-slt.dts
> @@ -241,37 +241,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>
> diff --git a/arch/arm/dts/ast2600a0-evb.dts b/arch/arm/dts/ast2600a0-evb.dts
> index 859808a10d7a..0ef856644c95 100644
> --- a/arch/arm/dts/ast2600a0-evb.dts
> +++ b/arch/arm/dts/ast2600a0-evb.dts
> @@ -230,37 +230,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>
> diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
> index a5576a004f2d..61e24ecd7c38 100644
> --- a/arch/arm/dts/ast2600a1-evb.dts
> +++ b/arch/arm/dts/ast2600a1-evb.dts
> @@ -243,37 +243,22 @@
>
>  &i2c4 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c5_default>;
>  };
>
>  &i2c5 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c6_default>;
>  };
>
>  &i2c6 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c7_default>;
>  };
>
>  &i2c7 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c8_default>;
>  };
>
>  &i2c8 {
>         status = "okay";
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_i2c9_default>;
>  };
>
>
> --
> 2.25.1
>
