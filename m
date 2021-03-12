Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7D338222
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:16:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRDz3Gtfz3cXb
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:16:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KuF7k9iV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KuF7k9iV; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRDl4d2xz2yhK
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:16:05 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id f12so2580893qtq.4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbX9oc/b4WidYsrm0fwNVlG2V9RPH7ffgPSYV0u1vqQ=;
 b=KuF7k9iVq2HAtDErkDeWGDKolsZR5M685HC4/KtrSyvl+Ag6D5atUhX5aEyYUEd+vW
 lKEQq3v9mm8UOpAziiLHIe2BcXConHEwk2pS0TgJsw1JsV0iWNS9f0CWhq1z0YUNqhLc
 uGYk3zlirYFJOfRb/zJGkXOFxwGcm/fbNbCBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbX9oc/b4WidYsrm0fwNVlG2V9RPH7ffgPSYV0u1vqQ=;
 b=U10JveosAt66Vj2EzlWUgv9AyhTJcoPv4h0wlrVKlw5P4Kh1FqK+FALnFXT3qMVus5
 8Be9nBWrnmn7UY8qBFR1wqGDHVfJuE1FfEj5RTs1XEsn/7qSIptsLZ9RQTg0QfzSgr8T
 rYSnRNqlDA1pblwiJ0ZVJsdNkTULySL6k32Oc/c4Z0guWxrw5awZAt/493hsfL6zmDR0
 fyscMn+9mvIMqUdD2Mz8ft3VK54nOl5+TOVCVQA/ilTaTcMdUlpF+FEg4ng1NF/+SLKQ
 l7FdbHq0onkb/4xiVsFkPHy9p9FBemhxOUOLY86J0WbpFGFN9v4dtbQZC9l2exEo3oXr
 nTBQ==
X-Gm-Message-State: AOAM531rfJ58K89ijPmSFRqgkcI0MgKz1UfhSvyQCFadAzA1nnCzyfVQ
 W2ojVNh7f1eK/a2nZzMyiCZNjEIFWgjO6dsEm54=
X-Google-Smtp-Source: ABdhPJzYD6zzNHhXvx4Wb4WM3LsfDiiKb1pKy6A9ijkN/kEr74nTC5I026dYGCHpZBsAmNfmNAePVxx/mAtHE2nSU1o=
X-Received: by 2002:ac8:5953:: with SMTP id 19mr9667601qtz.263.1615508163382; 
 Thu, 11 Mar 2021 16:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-12-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-12-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:15:51 +0000
Message-ID: <CACPK8Xf+7zOjkEvGBHMDo2GG9Ce_enPg_mpQTpwR68wa4dOf4Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 11/35] ARM: dts: aspeed: rainier: Mark
 controllers as restricted
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> Some devices cannot use the loop command due to security requirements.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

This is missing your s-o-b.

In this case I think I can assert that the patch comes from a
trustworthy source.

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 5ee87d749ce8..85fb60d16fdf 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1453,6 +1453,7 @@ eeprom@0 {
>
>                         cfam3_spi2: spi@40 {
>                                 reg = <0x40>;
> +                               compatible = "ibm,fsi2spi-restricted";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>
> @@ -1469,6 +1470,7 @@ eeprom@0 {
>
>                         cfam3_spi3: spi@60 {
>                                 reg = <0x60>;
> +                               compatible = "ibm,fsi2spi-restricted";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>
> --
> 2.27.0
>
