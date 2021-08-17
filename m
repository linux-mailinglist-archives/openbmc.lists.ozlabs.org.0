Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB23EE854
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpkXC3kjfz306C
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 18:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BD+21WBp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BD+21WBp; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpkWh717Dz2yfZ;
 Tue, 17 Aug 2021 18:21:20 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id eh1so3061194qvb.11;
 Tue, 17 Aug 2021 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4eUZVG0XpccdWtoJobUI2EmJHkDs8bqZphSP7hFWH1Q=;
 b=BD+21WBpfx3JflwQsN76WK36pG10k24qJf49uOaBukabmoZkC1OSJcSGBE5ArXDN48
 JFfC/ftO1VehIaVW3ADemG5c4GUYGqKndbnxYmwlnyuAhwrNvOxtKp0vdiPM3816BOf2
 yG8X0zariuFOwjuSeL48meiOi1n1lEOLD7UYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4eUZVG0XpccdWtoJobUI2EmJHkDs8bqZphSP7hFWH1Q=;
 b=TJJbgu8uaigJot2qzZNwfQznRkFRIuCd1eplHTSpILCW2L+vbQNdoEXGflUtaThQiM
 UsXSJt9XCMgf7JKcgRWnzTq7bhNPH8cm1NTnknkRBeh4U2hYLBe3UVOYVBjlbWb/9Te2
 HH7+OgqBwj3EPNeszptvc1/PU7Xnch+WkNo04ryRjWzoxdwyxyPgQfBpotV/ZMM2SQqL
 zTA6bFDdj8QCp0LZ2tLibfjPDMUAXWhRHNVwyUeNSMBeeXqAj2b0dKifUVWtQ+P+lkUl
 ybT10sF7OP1p4x4cR1rPvb67Zxed8hkDyA/ieMUlpYg3PQhm4jwIeGzt4MAucsCO2CIO
 xlkw==
X-Gm-Message-State: AOAM5300EAk4mTMpFBgDmg6Db3LwzmwmVQoix8UZb5Dgg/QbGvop0IfX
 PeLfKRs4nepWL1rKWdrQxulYHIxiSPcMsEuu5Fk=
X-Google-Smtp-Source: ABdhPJz9DGxB7h6lDvfpMgEsp1O8RBOgo02XQZaKMDjkzBKVciQFWc8H/pOWw1CBfwgQUgIkuWSEZq9MSp8FXp6V3b0=
X-Received: by 2002:a05:6214:27ee:: with SMTP id
 jt14mr2172403qvb.61.1629188476683; 
 Tue, 17 Aug 2021 01:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210813061900.24539-1-rentao.bupt@gmail.com>
In-Reply-To: <20210813061900.24539-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 08:21:04 +0000
Message-ID: <CACPK8Xei0K2vcEGc3Qr5zcb1SHMgNbJ+4_fVd6u-FiOHt4PxSg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: cloudripper: Add comments for "mdio1"
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 Aug 2021 at 06:19, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add some comments to explain the purpose of "mdio1" controller: it's
> connected to the MDC/MDIO interface of the on-board management switch.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Thanks, applied.

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
> index 01ec3ce0a29d..9c6271a17ae8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cloudripper.dts
> @@ -96,6 +96,11 @@
>         status = "okay";
>  };
>
> +/*
> + * "mdio1" is connected to the MDC/MDIO interface of the on-board
> + * management switch (whose ports are connected to BMC, Host and front
> + * panel ethernet port).
> + */
>  &mdio1 {
>         status = "okay";
>  };
> --
> 2.17.1
>
