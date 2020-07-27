Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF822FD16
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFwrq3BwxzDqkk
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 09:25:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=G67kQUuz; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFwqd6S5KzDqkW
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 09:24:13 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id g11so6999820ejr.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 16:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xM16+9OA99w5ephlgTCRjglWjEgS63bz9o3IOYOIm7o=;
 b=G67kQUuzwV7dl3s16MC+j2fuhezMpsBd2exYO+tzgfET2snhYH+FkjeUFeLZR9cirQ
 JKeZPFf8qtc3jgd+mmL5LAGnP2DI0osoBCFYJvOmnpEQ+zJaTfluGFQeKdXfCnNieBTV
 JKeI9WWXrwv0nxq4iSQsWpqkz+GTksekaRAxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xM16+9OA99w5ephlgTCRjglWjEgS63bz9o3IOYOIm7o=;
 b=q6cbh8K7cWPdz3K+qM0Zt/d9bqJCmyZDRCK1cHsyAxAnkudFjPI8u1caGk7Zxf/r/A
 5riOLPUzebLgHkFNfOqlG0Jj4GTNPeztfYYKHqUd8DYcKey7Tz8hR6d61J5ECMX9rbL6
 uEt90ZXJEMfncYNKqm9f1xTI2BKa/9fuoq1DBlHHkwe/YwR+dqY8kuMP5qGcGEMdupmY
 1CYAxN3Rl2y2BSWx44UI6IuH+voNqpNqOihL+0KaZWhlhTdv0S8r83jth5Eo2OJLJrJ9
 GzmGGKaTi+BJB/bj7X0Amw+uQyygprq4eYMW1sHSHCmUanS0EOVS1ezIwjTrbaCNau7a
 iDMg==
X-Gm-Message-State: AOAM533xQ9yEvC40VAdHBSQuS6/HKwtgI3HJkkqNaiI3YT7l9FWH6cQP
 NsN0BGK4WHKlNIPt0LLmryMGnpwIvQlkeFdY9m0=
X-Google-Smtp-Source: ABdhPJzyOb8ESvQxhvskEahOmhZh6GwF/GEvlsPoC5gw9Q1D0ff2BxB5quVqDdPt1sAFUjqKfqzwZ91PLxLA88DRkPY=
X-Received: by 2002:a17:906:3984:: with SMTP id
 h4mr24471568eje.254.1595892249009; 
 Mon, 27 Jul 2020 16:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
In-Reply-To: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Jul 2020 23:23:56 +0000
Message-ID: <CACPK8Xc+nAj3bL0Uz6qCdPZiL3h0MCaLQEB1qyYaqbVC9XedrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rainier: Add leds that are off 9551 on Operator Panel
To: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 at 12:41, vishwanatha subbanna
<vishwa@linux.vnet.ibm.com> wrote:
>
>
> These are LEDs that are controlled by 9551
>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
> 1 file changed, 82 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 0b5c6cc..ecbce50 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -69,6 +69,38 @@
>                 };
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               /* System ID LED that is at front on Op Panel */
> +               front-sys-id0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System Attention Indicator ID LED that is at front on Op Panel */
> +               front-check-log0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure Fault LED that is at front on Op Panel */
> +               front-enc-fault1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* System PowerOn LED that is at front on Op Panel */
> +               front-sys-pwron0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> };

This patch is malformed. It looks like you've pasted it into your
mailer, which makes it easy to break the patch. Instead I recommend
using git-send-email to send your patches as it avoids this issue.


>
> &gpio0 {
> @@ -514,6 +546,56 @@
>                 };
>         };
>
> +       pca1: pca9551@60 {
> +               compatible = "nxp,pca9551";
> +               reg = <0x60>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +
> +               gpio@0 {
> +                       reg = <0>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@1 {
> +                       reg = <1>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@2 {
> +                       reg = <2>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@3 {
> +                       reg = <3>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@4 {
> +                       reg = <4>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@5 {
> +                       reg = <5>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@6 {
> +                       reg = <6>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +
> +               gpio@7 {
> +                       reg = <7>;
> +                       type = <PCA955X_TYPE_GPIO>;
> +               };
> +       };
> +
>         dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> --
> 1.8.3.1
>
>
>
