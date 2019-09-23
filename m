Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DEBAD5D
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:59:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBtm4lh7zDqLf
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:59:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CWou+9nR"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBt71m6wzDqKL
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 14:58:39 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id c3so15623709qtv.10
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCLHJc9ohguGr7yUsbQATEafVcmEFIwLez0T0b9vx10=;
 b=CWou+9nREZxjLqLM07E9h8h85xQnSIpPIkr3VGz3U8M87DKFgYKsN32DCu2DvmlL5I
 DyN7RDnP4aeur8N3O2vtccQS/qN/oNDOfh0lom6TebUd90hVQPth1PVgjgeOZCm6Q5xq
 rXY7gpoUS2Ht6bLmwvkODmofu0SaC8M/D85VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCLHJc9ohguGr7yUsbQATEafVcmEFIwLez0T0b9vx10=;
 b=hCJPrvYsLxBc1iWySdbaqwoaFSk/HIlOZZFBwR/b0E6C1IHTzL3D86Xt/pPIxeO5f3
 YUGNzSZPVFYU7gHrfhnsG9kKma1RaKtm4VNYxPfRCMYUMNMMFG6/iWo8+ClkLidNDwBI
 jvb+U6LwKJBqaqSnGcXV/geg4EBjoa2EL8LG+LXJYa1dOFfM4kTsN/X6N1SUbRkdAdbQ
 JXI9qoZZK4Xcr/oSZrpvZALGJelduKADmCn5CoqAjW0IHzTaV/JT6jIV33C/M6+EegCj
 wxHgUKM16zhUDTc2ese/56mu9IpiDPHQ5Xyvi7LP5uvU9cwmu4dFUgP4zIqsRdjtjVFU
 YWhQ==
X-Gm-Message-State: APjAAAVQNJXTEPL2Vaol2CTcLT4yHmPwjM+xBcbjcEnJs6na5LrVGaKv
 kSNw8uDQaKf5E7JC80QgrCq3GjjNAjN4iCKzAR9Usg==
X-Google-Smtp-Source: APXvYqyYcV0e9hRjaIW2mSDD1weUfNHlyTCynXfC0/OlfW0VoD8Ph50F1evmuB0OPotXLbs5viJ/9QIJS3D2ahp297E=
X-Received: by 2002:a0c:e48b:: with SMTP id n11mr23604991qvl.38.1569214715488; 
 Sun, 22 Sep 2019 21:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-7-andrew@aj.id.au>
In-Reply-To: <20190922123700.749-7-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 04:58:24 +0000
Message-ID: <CACPK8XfQkqGeTDyKjv4veut-40hy0nyXuxvEb=Fi4uPKCPCviw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 6/6] ARM: dts: tacoma: Enable 50MHz RMII
 RCLK for NCSI
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

On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Tacoma uses MAC3 for its NCSI-based interface to the outside world.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 408af001c06c..854b0a532a01 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -28,6 +28,9 @@
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_rmii3_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
> +                <&syscon ASPEED_CLK_GATE_MAC3RCLK>;
> +       clock-names = "MACCLK", "RCLK";
>         use-ncsi;
>  };
>
> --
> 2.20.1
>
