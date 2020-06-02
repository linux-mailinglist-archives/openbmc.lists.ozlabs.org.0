Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1201EB30D
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:36:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bZPc4Y6qzDqNj
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:36:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CD3HCJ7i; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bZM65J62zDqNm
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 11:33:54 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id g1so7888164edv.6
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2020 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eG9IodGEhsOoh9tQczF//XAUGF+pp2mQdwU7hao9HI=;
 b=CD3HCJ7iM1fBimXNS+A5Rse9ZTNozR0QkRyCx3QU/uJWh0Rg1NbJzN4b3VUkHXbY0O
 VQiu67ETqEvdLPV2z7pAIeXKstQN3SH6/nl/Q70bJYtMzmwFnArn3xT2dzXqudx2XQj7
 ey854DLkgW84sRybVVJYax4SozcK1SmnQZ29Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eG9IodGEhsOoh9tQczF//XAUGF+pp2mQdwU7hao9HI=;
 b=oupCboB7HcFVclLrcEnktJ/ii25VMgBSgXuuiJvCwQgpBHjGM5Eqrob08F82o88l7Z
 pglGaBP16m9QkB28mxm00Vif0b3brsaBHFM8NtNXyLrdJflRPaewHZ9Q9do45ofYcncp
 X9j073uTLOUrRpeEc4xrzhmeWJc1MJ25ryngQNPpSETaZTfewA4Hm0aOvsubMUBYovR5
 nni8EjzRPPSGlWc+XxgQQ+ReiEmUwhah7ljmvwqp2ypNXph0u0kQwwA1QGzmVNGce4R4
 qfWwMTXSHF6h9bfoS3rbpM0mT4BeSJRfB7rDVUnQfwg9/M4SvX/MRaowZbDtcEiwgcIV
 F2gA==
X-Gm-Message-State: AOAM530cctD3iOZftD4Y1ywhraZQdJksr7yivslXdRRJbrXk8LiJLBpU
 fjYz374Qr2HyuzQ5rNq5/Gam90+P5T1H7EOvGpp6qMyShr0=
X-Google-Smtp-Source: ABdhPJwm/tJ1F2eSi35omRyuLG8dJsbp09zbBovaRl1KRwIZmmRTSf3mfLx+OCDmQkStzT4MBDuVYD+rzGXK7TjEm2A=
X-Received: by 2002:a50:a981:: with SMTP id n1mr23212085edc.377.1591061631330; 
 Mon, 01 Jun 2020 18:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200601182022.4031-1-bentyner@linux.ibm.com>
In-Reply-To: <20200601182022.4031-1-bentyner@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Jun 2020 01:33:39 +0000
Message-ID: <CACPK8XfzVmZ=-VPhd4xaJKFPrTOiKkHwryOnS96MrimQmOuGeA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: aspeed: tacoma: remove checkstop gpio-key
To: bentyner@linux.ibm.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 1 Jun 2020 at 18:20, <bentyner@linux.ibm.com> wrote:
>
> From: Ben Tyner <ben.tyner@ibm.com>
>
> Attention handler will monitor the checkstop gpio via the character
> device interface so it needs to not be defined.
>
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>

Merged into dev-5.4

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index ba1f4cb7e..d2850956c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -39,12 +39,6 @@
>         gpio-keys {
>                 compatible = "gpio-keys";
>
> -               checkstop {
> -                       label = "checkstop";
> -                       gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
> -                       linux,code = <ASPEED_GPIO(E, 3)>;
> -               };
> -
>                 ps0-presence {
>                         label = "ps0-presence";
>                         gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> --
> 2.20.1
>
