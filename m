Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F1338204
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:05:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR070mysz3cKT
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:05:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Q4IphmDY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Q4IphmDY; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxQzr53hQz3bN9
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:04:55 +1100 (AEDT)
Received: by mail-qt1-x830.google.com with SMTP id 73so2561325qtg.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOgcusFmLJedcSsWvk7xxmOwgtk4mAKx95LEaZvqvC8=;
 b=Q4IphmDYFjTXzKyBFdf0igwO5f7E3F0ScXJ1u2JTlj46rgoa0KgOjYHP2NdUZLYNgB
 vE0IJTf7gZFcLLo2obgPTFBuXc+A+qmeRAF/+nK1KCSFbio90fCQTHtSeZqkETCT5BQw
 L8qoR9N6V6hYdVxl9dkl7w0wI2j8i3Cjbwcbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOgcusFmLJedcSsWvk7xxmOwgtk4mAKx95LEaZvqvC8=;
 b=KAkqawPG8J5i5Pfbc0C30n6PlAhggD121grB1W7McATbxy3Imxzv/pf+mlTFFqRTmy
 rOgDv0wcoHSo0PHG6XbEm1TEuX9cmcN1WSF4FCm6QkOSsHEglFdqfDG/0NZFTpoqnrn2
 hxnN9owT/ag8UJffv5KXL47zp3YahcCxjQFKXklM9/HNiiI8glRZJID8GTa8F3WgDowY
 uEw2z9ZOddsIC0MKS67Tw+kiVAYdcDY3yrs56s1d4h03fqads3w4effRUgg+XRkLjiDG
 OMjRybNIyUiu/fItzNQ3z/I7B5yMDcrMRocEvISMQ39UMWPW/StQo/WtkD6TrHSwO/+W
 FB5A==
X-Gm-Message-State: AOAM533ddMKrJ/bSsbll4RcTwKbG3RDFSgVhM/I/nfxvRjffRZ7r992X
 B/syVS8WOuyVxpW3WD4EXuPNlmY0Y7j50ub9uFgqTNY4pBc=
X-Google-Smtp-Source: ABdhPJzeQXXC9FkQB7ojRbFjM099FOLHVwdYjA1AusQ6E2ltpd2CRjTQ1E4fXLW0mUt82nQWSSGWiXgfaY/UCHM+a80=
X-Received: by 2002:ac8:5953:: with SMTP id 19mr9628487qtz.263.1615507492253; 
 Thu, 11 Mar 2021 16:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-3-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:04:40 +0000
Message-ID: <CACPK8Xe+kZ4RJOG9A4L0uTiMgnHea0Ejt+nLL0JBMV31KvM2sA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 02/35] ARM: dts: aspeed: rainier: Add
 directly controlled LEDs
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
> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>
> These LEDs are directly connected to the BMC's GPIO bank.
>
> OpenBMC-Staging-Count: 1

Drop this when putting patches on the list.

> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index fdeac6d0d8d3..f52c10dd1a18 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -135,6 +135,26 @@ i2c2mux3: i2c@3 {
>         leds {
>                 compatible = "gpio-leds";
>
> +               /* BMC Card fault LED at the back */
> +               bmc-ingraham0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure ID LED at the back */
> +               rear-enc-id0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure fault LED at the back */
> +               rear-enc-fault0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* PCIE slot power LED */
> +               pcieslot-power {
> +                       gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
>                 /* System ID LED that is at front on Op Panel */
>                 front-sys-id0 {
>                         retain-state-shutdown;
> @@ -178,7 +198,7 @@ &gpio0 {
>         /*E0-E7*/       "","","","","","","","",
>         /*F0-F7*/       "","","","","","","","",
>         /*G0-G7*/       "","","","","","","","",
> -       /*H0-H7*/       "","","","","","","","",
> +       /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
>         /*I0-I7*/       "","","","","","","","",
>         /*J0-J7*/       "","","","","","","","",
>         /*K0-K7*/       "","","","","","","","",
> @@ -186,7 +206,7 @@ &gpio0 {
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","usb-power","","","","",
> -       /*P0-P7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","pcieslot-power","","","",
>         /*Q0-Q7*/       "cfam-reset","","","","","","","",
>         /*R0-R7*/       "","","","","","","","",
>         /*S0-S7*/       "presence-ps0","presence-ps1","presence-ps2","presence-ps3",
> --
> 2.27.0
>
