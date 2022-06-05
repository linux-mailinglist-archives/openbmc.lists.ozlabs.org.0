Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D253DF06
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 01:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGYVs3HXwz3bY6
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 09:59:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PL+rET0q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PL+rET0q;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGYVT30Z8z2xD4
	for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2022 09:58:40 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id z9so80108wmf.3
        for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2022 16:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/BF7x/NRPNj4ORmyfqoRGRvkKrCdAiCVwbB/tcTHbs=;
        b=PL+rET0qlbwZP6BQaj/SBENaeemk0g0tVhoypIWvKW3to1xksnnekzQmUjgNzrHcdb
         BbkawYJK+ku1c3xrgM0cWCvEQH3qqiLuqfEnN39xdrGNipw3yP2Tf6nazXi9gCKZTgBH
         j9K+LusFkKZSq59HYwk1dNUnbDfSvFmK5YKh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/BF7x/NRPNj4ORmyfqoRGRvkKrCdAiCVwbB/tcTHbs=;
        b=KeYl+FzNRW4QSw2TxDjIRt9fCYjp+YrpLpt3zZACyXn2nh914mXXNcUSgItgOaNucE
         1iZe3aJkaLf0OXJmQG4cB/IMKzVkkVSSXY/i7bPr71wLKYboU2uPEf+avAnPIwZQYCUe
         JRihOetpgiqqrlHBRNOaGecGZEqSJuLJUssuBo3JakOeebIrl2x/O1Z3QJapMZmCGa+7
         CiydAzoBPwvx5aKLb7w3L/jkdCKCcXFWNrRUkmU8+Xrx2Ivrqr7UB0jxsFqveYLoJtt2
         PMMb0d8iNhTPsvQMSgAOR+b7VuCTUsUf6stlXXIno9zAs7+6OfBHG4MQE9K/9DmYNnPs
         e3jQ==
X-Gm-Message-State: AOAM530xKpP8asVK366WOMJO6ykKa1brpX9m2CVP6F4DW/5cC2wXxGcG
	OurMw4sgKvv0UVzshYIii2L/4kFI088tmXv2XzY=
X-Google-Smtp-Source: ABdhPJx/fNM07vFhL6ZDsQUC+iVns2Po8FvY5WtrYIAR8nSROY98/F8SHW256x/PWTgfTER4OS+kN2HsFJqBt6jiNAk=
X-Received: by 2002:a05:600c:4e50:b0:39c:eeb:dabe with SMTP id
 e16-20020a05600c4e5000b0039c0eebdabemr35875550wmq.190.1654473515486; Sun, 05
 Jun 2022 16:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220602025030.90710-1-joel@jms.id.au> <20220602062241.GN11809@packtop>
In-Reply-To: <20220602062241.GN11809@packtop>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2022 23:58:23 +0000
Message-ID: <CACPK8Xf=kT_yU99dT2zsL-W5kua+BrsvbtkmC7wUw6SizwKMpA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: Rename Rainier
 to P10 BMC
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

On Thu, 2 Jun 2022 at 06:22, Zev Weiss <zweiss@equinix.com> wrote:
>
> On Wed, Jun 01, 2022 at 07:50:29PM PDT, Joel Stanley wrote:
> >The Rainier device tree is used for all IBM P10 BMCs, which includes
> >both Rainier and Everest.
> >
> >Signed-off-by: Joel Stanley <joel@jms.id.au>
> >---
> > arch/arm/dts/Makefile                                    | 2 +-
> > arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} | 4 ++--
> > 2 files changed, 3 insertions(+), 3 deletions(-)
> > rename arch/arm/dts/{ast2600-rainier.dts => ast2600-p10bmc.dts} (93%)
> >
> >diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> >index 3515100c65ce..8d05d1e70310 100755
> >--- a/arch/arm/dts/Makefile
> >+++ b/arch/arm/dts/Makefile
> >@@ -686,7 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >       ast2600-intel.dtb \
> >       ast2600-ncsi.dtb \
> >       ast2600-pfr.dtb \
> >-      ast2600-rainier.dtb \
> >+      ast2600-p10bmc.dtb \
>
> Nit: to preserve the sorted order, should p10bmc be before pfr?  (s6q is
> before slt, anyway.)

Yep

>
> >       ast2600-s6q.dtb \
> >       ast2600-slt.dtb \
> >       ast2600-tacoma.dtb
> >diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-p10bmc.dts
> >similarity index 93%
> >rename from arch/arm/dts/ast2600-rainier.dts
> >rename to arch/arm/dts/ast2600-p10bmc.dts
> >index aa91b12ed399..d1d78d5c3545 100755
> >--- a/arch/arm/dts/ast2600-rainier.dts
> >+++ b/arch/arm/dts/ast2600-p10bmc.dts
> >@@ -5,8 +5,8 @@
> > #include "ast2600-u-boot.dtsi"
> >
> > / {
> >-        model = "Rainier";
> >-        compatible = "ibm,rainier-bmc", "aspeed,ast2600";
> >+        model = "IBM P10 BMC";
> >+        compatible = "ibm,everest-bmc", "ibm,rainier-bmc", "ibm,p10bmc", "aspeed,ast2600";
>
> It's a bit orthogonal to the rest of the patch, but I notice these lines
> are space indented instead of tabbed...could maybe fold that fixup into
> this, but it looks like that happened on a bunch of the ast2x00 dts
> files in commit ba6ce66262865, so a separate patch to fix them all might
> be better.

Thanks for pointing that out. I'll send a patch.

>
> >
> >       memory { device_type = "memory";
> >-- 2.35.1
> >
