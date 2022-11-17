Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8162D17B
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:14:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCQ4K1T2Hz3cMv
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 14:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Mnt+8hMI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Mnt+8hMI;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCQ3m4sdMz3cH0
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 14:13:40 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso3665064wme.5
        for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2022 19:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ubJsdukZd6hmGCkvgH7dJJKR0qa6wG90zbtzUqic6ro=;
        b=Mnt+8hMI9l+tThQLN3GBz0b6BzE+2VpS/9xz24GGRgKRMUVM+UtgPHMq+Xr/6Sy5fc
         77ghg0F3z5gMm3zmwWatCU0QTFeY9nNwZtcGqG07k7fwhtupG1s17TYdBornFRlhtVuy
         nKOXVTqBrNmtzY9VMHVPc7vYxcLUJO8D7MTVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubJsdukZd6hmGCkvgH7dJJKR0qa6wG90zbtzUqic6ro=;
        b=ZkR0fxC9+/v7I6KwHnMlb7pCY0scSTxAt7yq5lWnTm5/ZQLuBmtEmpDrIjX0hJwSBu
         F/t9liWPkf4fJAWYAajKMQQZNc9avM4LTQYrNOyxQjyVH4TGnRecPkYbA4+4W7bWrlB4
         P9Nn5ansAYoRv/v4SdEtQ7pPX96oiWuudXHKDGZ4KFmH6A46J5D244xbw9ukO0rtvKVY
         WwmsrYfvD2ScwEUZLwTmOzvWOE6vL5mxQBY5zgLmrdZAIpnn2XEl+Z8bHe9jS9xcoaoh
         2tFMvpu3OFPXHWOVVbSQn3VWTSXUjzwV76eEM9p5PyR+YVbguA7z7juP3t3kJGbR2msh
         4aLw==
X-Gm-Message-State: ANoB5pmwsqw+UxvZAae1mo2wyJ3+Z2xByvN7KYJwWjgida/P2Mp5SkUT
	U0m8W2hwZmLdHK67Jzt21mTEkM3EW+7OfCxXbG1H96YB
X-Google-Smtp-Source: AA0mqf6BkhrNoCw0dEl3bfU4pextmUJO234WFIPNGo++Rq1l01vAp3TC5EKauCwGKpM448zzBfyiLOwsSs9TJj4uCLE=
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr3773438wmi.10.1668654817514; Wed, 16 Nov
 2022 19:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221116165714.2349545-1-eajames@linux.ibm.com>
In-Reply-To: <20221116165714.2349545-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2022 03:13:26 +0000
Message-ID: <CACPK8Xej5SS-N=JBUnZfG0jb7f-Lw7g_neLXeA4vhdm1ZkWLvA@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0] arm: dts: aspeed: ibm-power9-dual: Update
 OCC nodes
To: Eddie James <eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 16 Nov 2022 at 16:57, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set the ibm,no-poll-on-init property for the OCCs.

Is this required to make them probe?

Previously they worked (it would attempt to read form the host and
fail, but the driver would probe). Do we need to fix the driver, or do
we need to fix all of the device trees (vesnin, palmetto, tacoma)?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/ibm-power9-dual.dtsi | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ibm-power9-dual.dtsi b/arch/arm/boot/dts/ibm-power9-dual.dtsi
> index a0fa65b44b0f..916041e6e00c 100644
> --- a/arch/arm/boot/dts/ibm-power9-dual.dtsi
> +++ b/arch/arm/boot/dts/ibm-power9-dual.dtsi
> @@ -86,8 +86,13 @@ sbefifo@2400 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
> -                       fsi_occ0: occ@1 {
> +                       fsi_occ0: occ {
>                                 compatible = "ibm,p9-occ";
> +
> +                               occ-hwmon {
> +                                       compatible = "ibm,p9-occ-hwmon";
> +                                       ibm,no-poll-on-init;
> +                               };
>                         };
>                 };
>
> @@ -187,8 +192,13 @@ sbefifo@2400 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
> -                       fsi_occ1: occ@2 {
> +                       fsi_occ1: occ {
>                                 compatible = "ibm,p9-occ";
> +
> +                               occ-hwmon {
> +                                       compatible = "ibm,p9-occ-hwmon";
> +                                       ibm,no-poll-on-init;
> +                               };
>                         };
>                 };
>
> @@ -203,15 +213,6 @@ fsi_hub1: hub@3400 {
>         };
>  };
>
> -/* Legacy OCC numbering (to get rid of when userspace is fixed) */
> -&fsi_occ0 {
> -       reg = <1>;
> -};
> -
> -&fsi_occ1 {
> -       reg = <2>;
> -};
> -
>  / {
>         aliases {
>                 i2c100 = &cfam0_i2c0;
> --
> 2.31.1
>
