Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24447284463
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 05:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C53Tp24L3zDqJN
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 14:53:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZexxVuQC; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C53S63QxjzDqJQ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 14:51:50 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id d1so11961933qtr.6
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 20:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bliBzp0UmaT5VwhEVx46gbMo/leAHEDjhXWBudZAvDE=;
 b=ZexxVuQCyQjlibp9ybCVQfTOafmd8nIFQ9lnikAL0axxAjc0sfwDCPKUSU0EL5zhSt
 ITh9ipG0bWSvN/eQXtlVurEs/dZdwj1Ci1DlbcBRGm+JC+YvPdMDYvKV6nZYq2DOinYs
 cvXWlMFavey/xP3vPMrjN9A/HYMAUCuOkoDDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bliBzp0UmaT5VwhEVx46gbMo/leAHEDjhXWBudZAvDE=;
 b=sXiyOrHU8Bp7XCASddEJIz3eFLNDFZc5mBq103jxu+1ugCLPGMi3g9d6zI4PZDthjR
 FrDo7dwC4NVQkRv4CzDy70/4+M9C/Z+TsToWMheXkFAt6hpAqRqcdf32c6+18llpkf9P
 A18StXN6iNNdP+yC+QxwqiXJtP/ZazyYPH//VHLNNsUmKIG8vBIZZo++30F4IweTw5ai
 BXQknYefGt4pmINu/5pbrz7kg+l8FP0Rm1xnXYPL3ifbhoG9YISY7X1eG/CWtM47iQiq
 KVzo6+QFOReQ1fEnSYYtT5hKPZDjYkPElwi5PmyhTuFOcRrwRgn4vk7Cx0TZlcMXqBQP
 mGQw==
X-Gm-Message-State: AOAM531liZyf8Yhpwv760IjJgqUrpIRHS4+KNPKRGNbFF+tvhfeC5Hk5
 bsQvUbiFx/k5PbjT+eevov1dgedREjlvMZ6cv5ClJ6UU
X-Google-Smtp-Source: ABdhPJw2xaPurRucOk1/wd4iYcYbqdZYuiOALxkXNQEUOscHRmx+a2aZKtHZzSPWWlWw5QCUDSS+o9rzeA8pKgy33JY=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr3265465qta.176.1601956307973; 
 Mon, 05 Oct 2020 20:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063414.275161-1-andrew@aj.id.au>
 <20201002063414.275161-4-andrew@aj.id.au>
In-Reply-To: <20201002063414.275161-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Oct 2020 03:51:35 +0000
Message-ID: <CACPK8XcL0aLUqMwD7PPQHoZ+5f7zTSd4GbaJB+dBHN+0BXXwFw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: rainier: Don't shout addresses
To: Andrew Jeffery <andrew@aj.id.au>
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

On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Make them lowercase.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 46a0e95049fd..2e9206b65883 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -55,9 +55,9 @@ ramoops@b7f00000 {
>                         pmsg-size = <0x4000>;
>                 };
>
> -               flash_memory: region@B8000000 {
> +               flash_memory: region@b8000000 {
>                         no-map;
> -                       reg = <0xB8000000 0x04000000>; /* 64M */
> +                       reg = <0xb8000000 0x04000000>; /* 64M */
>                 };
>
>                 vga_memory: region@bf000000 {
> --
> 2.25.1
>
