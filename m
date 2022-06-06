Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9053F24F
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 01:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8C043f4z3blV
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 09:02:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BjxHU69o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=BjxHU69o;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH8BY758vz2yMk
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 09:01:57 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id u8so17376840wrm.13
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2022 16:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IlBaGn6gy55azzIy2+5/BC4bxqRiIw4/8AIwuKBiUkw=;
        b=BjxHU69oMY34DUORUuzbEM7FVi/+YB8/2X2uAbCLTax66LrT9FIpFRRhqDBLB02VN4
         bOgDCZ/CRXF8jDwcwHH3mbml+IEa5DETywrAlV0pusxwVfeIRctmSi0oVfQ7oeqq8LHA
         a/YdjcFlD7N0T8m1uImOx4ijldDzU+LXc6u6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlBaGn6gy55azzIy2+5/BC4bxqRiIw4/8AIwuKBiUkw=;
        b=Z49QcqGm6grOc0tos1i0UByzVfkEEq6fC2XnWVFQyjuQpMj3GWsTlUifJ2mmG9ajfh
         tOLX9TiJWKtamjd6WZVrWIr+MTL6BYswVPIfIY8LmqHBleSs/5MLI6dq5XUeEUCubhFa
         6rUxjnTaSDlratdiyQzoVV9k0IOBf3aBaTQ++6uQuyqI+h7DRvSZ4fFDApvwPAyTdqy4
         uk9SLVviORISiPnLRQik26P4L2W6OoTLlYTOplWJ96IDkp8bS72hLzZhweoQXDJDXAYa
         ynAbN4R8nHkGpMO0n3OmKQaler6VdogPIIiEku2IiWp1uA/gURL1J+p7Nzn3Ey2G3jEB
         oZnQ==
X-Gm-Message-State: AOAM532TJbOrdUxmeWufA4y/AVNuPTSIuv7/tAQIQnsdQu9hqqwS0JJa
	ycY+afRuKTlnRIcWH0ShDOpSiPMZv9tq/z4wThy8lkwz
X-Google-Smtp-Source: ABdhPJw0a8Ud46D870kMtKzNTWQ28BLL+UCb4BoncpxULneA87c7YCbghn7bZQ51leaTeLEvaWgkP3+jlR+eO3ifN40=
X-Received: by 2002:a5d:6510:0:b0:216:f04d:3c50 with SMTP id
 x16-20020a5d6510000000b00216f04d3c50mr12098829wru.628.1654556513936; Mon, 06
 Jun 2022 16:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220606000434.1399583-1-joel@jms.id.au> <20220606000434.1399583-3-joel@jms.id.au>
 <20220606200633.GO11809@packtop>
In-Reply-To: <20220606200633.GO11809@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:01:41 +0000
Message-ID: <CACPK8XeZmTxDVboSxS5KEEPdJAg0gSGHS93of+v_QgVNiN5z1w@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] ARM: dts: ast2600:
 Fix indentation
To: Zev Weiss <zweiss@equinix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jun 2022 at 20:06, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Sun, Jun 05, 2022 at 05:04:34PM PDT, Joel Stanley wrote:
> >These lines were mistakenly added with space indentation instead of
> >tabs.
> >
> >Fixes: ba6ce6626286 ("aspeed: Add machine names")
> >Reported-by: Zev Weiss <zweiss@equinix.com>
> >Signed-off-by: Joel Stanley <joel@jms.id.au>
> >---
> > arch/arm/dts/ast2600-evb.dts    | 4 ++--
> > arch/arm/dts/ast2600-fpga.dts   | 4 ++--
> > arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
> > arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
> > arch/arm/dts/ast2600-tacoma.dts | 4 ++--
> > 5 files changed, 10 insertions(+), 10 deletions(-)
> >
>
> Looks like this doesn't fix up all the files that got spacified in
> ba6ce6626286; shall we also cover these while we're at it?
>
> ast2400-evb
> ast2500-evb
> ast2600a0-evb
> ast2600a1-evb

Thanks. I did a "vim arch/arm/boot/dts/ast2600-*" which obviously
missed those four.

>
>
> Zev
>
> >diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
> >index 3aeef78df22d..515afa83af69 100644
> >--- a/arch/arm/dts/ast2600-evb.dts
> >+++ b/arch/arm/dts/ast2600-evb.dts
> >@@ -3,8 +3,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "AST2600 EVB";
> >-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> >+      model = "AST2600 EVB";
> >+      compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> >
> >       memory {
> >               device_type = "memory";
> >diff --git a/arch/arm/dts/ast2600-fpga.dts b/arch/arm/dts/ast2600-fpga.dts
> >index be0788d92473..069a41185597 100644
> >--- a/arch/arm/dts/ast2600-fpga.dts
> >+++ b/arch/arm/dts/ast2600-fpga.dts
> >@@ -3,8 +3,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "AST2600 FPGA";
> >-        compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
> >+      model = "AST2600 FPGA";
> >+      compatible = "aspeed,ast2600-fpga", "aspeed,ast2600";
> >
> >       memory {
> >               device_type = "memory";
> >diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
> >index f55294cdf95e..dbe888a945e3 100644
> >--- a/arch/arm/dts/ast2600-ncsi.dts
> >+++ b/arch/arm/dts/ast2600-ncsi.dts
> >@@ -3,8 +3,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "AST2600 EVB w/ NCSI";
> >-        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> >+      model = "AST2600 EVB w/ NCSI";
> >+      compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
> >
> >       memory {
> >               device_type = "memory";
> >diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
> >index d1d78d5c3545..aa9edcd66507 100755
> >--- a/arch/arm/dts/ast2600-p10bmc.dts
> >+++ b/arch/arm/dts/ast2600-p10bmc.dts
> >@@ -5,8 +5,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "IBM P10 BMC";
> >-        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
> >+      model = "IBM P10 BMC";
> >+      compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
> >
> >       memory {
> >               device_type = "memory";
> >diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
> >index 67b3e3013c6b..76f987052140 100755
> >--- a/arch/arm/dts/ast2600-tacoma.dts
> >+++ b/arch/arm/dts/ast2600-tacoma.dts
> >@@ -5,8 +5,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "Tacoma";
> >-        compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
> >+      model = "Tacoma";
> >+      compatible = "ibm,tacoma-bmc", "aspeed,ast2600";
> >
> >       memory {
> >               device_type = "memory";
> >--
> >2.35.1
> >
