Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4620EBC5
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 05:03:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wq1b2CbNzDqgV
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 13:03:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SekT5IZL; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wq0q3xJhzDqdv
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 13:02:51 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id n2so5760254edr.5
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jun 2020 20:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/kj0H7aQSQUFj+GcCyseTJ0usx892olB2/bTiv6lqw=;
 b=SekT5IZL4KLBC2umYUPyCFhNsdP6X60xEYyL1s8TTSSiXap2Un7aLXR+XEvCtJbLfp
 rqJ6GWBQb2l9prAEXocr1pl0WROSezKxw7XBOB4TY069BePb97Dzb+dZ8cURDuHeOXfK
 kf9oxHJJdfPQG18w08n57htfLYx5s9wlevTYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/kj0H7aQSQUFj+GcCyseTJ0usx892olB2/bTiv6lqw=;
 b=oEFBnnmHkP8WakIxOreq2u9pG36hvoODyUXOdE+QJAGhmfqgBIcGyJrpLTkO/kJu+e
 7ezJItrvqPaGN4++cMw8aC4IXPsvuFdcNoz1WM9db0jJT4X9O9sQmeOkhn3wrMDBy5QV
 4D67dpvneJzfefuQ3Kj4iaih+l26fx40skKg3UBhAjYjNIa0ZoeWNaJw+Wz8uk/0msGX
 wO6WeDsGYFKvXm3b3Ti2vocgGy5b1peTbcTvvDaefszl0s0r97GHvQgA+fWYN5UzG9HF
 CYaQPBnjZtbErbwfEq/myzUqJLMD21ju1gU2dZTn617d/FOcpHxqjYFBkc019jZQPmDt
 HrLw==
X-Gm-Message-State: AOAM533jLcWPbWAZoOtdAh5+GHDFOfZxWuokEy8HBDmDwuAhsqBwlX+j
 iw0pfDRv0dtL+ZTFh4WsamWrfdQIjHMckE4RjXI=
X-Google-Smtp-Source: ABdhPJw/AF4jALKXqb+vKPVHE7r+u6Z1dbSaVsh1z8NW0U11xauoIUn6790kFypQ7jMNVUG964236IFpG4SbotOUpsI=
X-Received: by 2002:a05:6402:202e:: with SMTP id
 ay14mr20740993edb.233.1593486166637; 
 Mon, 29 Jun 2020 20:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200616135724.24514-1-eajames@linux.ibm.com>
 <20200616135724.24514-3-eajames@linux.ibm.com>
In-Reply-To: <20200616135724.24514-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Jun 2020 03:02:34 +0000
Message-ID: <CACPK8Xd==01QYwGsqyophmaSFHpDqH=NVc8oEZhXfjJo9GU71Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 2/2] ARM: dts: Aspeed: Tacoma: Enable EHCI
 controller
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

On Tue, 16 Jun 2020 at 13:57, Eddie James <eajames@linux.ibm.com> wrote:
>
> Enable the second EHCI controller on the AST2600. Also add a line-name
> for the GPIO that controls power to the USB port.

What's the idea behind the power control?

Is there any reason not to add a hog, so power is always applied?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> index 96a45014b7e5..fcaff4023240 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> @@ -95,6 +95,10 @@
>         };
>  };
>
> +&ehci1 {
> +       status = "okay";
> +};
> +
>  &gpio0 {
>         gpio-line-names =
>         /*A0-A7*/       "","","","","","","","",
> @@ -111,7 +115,7 @@
>         /*L0-L7*/       "","","","","","","","",
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
> -       /*O0-O7*/       "led-rear-power","led-rear-id","","","","","","",
> +       /*O0-O7*/       "led-rear-power","led-rear-id","","usb-power","","","","",
>         /*P0-P7*/       "","","","","","","","",
>         /*Q0-Q7*/       "cfam-reset","","","","","","","fsi-routing",
>         /*R0-R7*/       "","","","","","","","",
> --
> 2.24.0
>
