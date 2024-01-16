Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBD082F61D
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 20:52:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iX5iS1vk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TF05Z67XYz3cTg
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 06:52:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iX5iS1vk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TF04x1mLvz3bpp
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 06:51:28 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc22597dbfeso1116653276.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 11:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705434685; x=1706039485; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K8w04xiJGT72J3l5pZYydZFnp7VG18KNZBIm6eg0WXU=;
        b=iX5iS1vkRirxDmBvCY0QhrM9ll/3/Ob7pQIJLVMU9tg56sZ8WwrwZ631QekM4P4Agx
         LbzXMcuCUtshqqwiTwqk9jGD1lIJiIVCD4FobrqqK3KoWCjWAmvVCei4OvoFtfJ0Dy+z
         5dyFFZRVejIMtm4zealL4eCxTG0G5D4vuVwEDvJNSsIfr3Lc9c14gSW+3PyvUrPjszE5
         3bKw26isp/oO7wNpFhbk9bg1R56WyF1aAyhYU37+t/NLTBUPYeEpeg+cBTTY5aIa4Aqc
         myA5wS27gkamDoR4mnQg5ayr+MCxMS5KP5rh8ITYqGuD7CQijBVM74HeILLIVMbP7qBp
         FfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705434685; x=1706039485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8w04xiJGT72J3l5pZYydZFnp7VG18KNZBIm6eg0WXU=;
        b=UuYjiWjnPxlUSzWjsSRNnNBX+QJK6/0ORi+NA3EycSjS0wpYMuWaNKyUP2y8LdFqss
         ovuYAhMbJ2CCLIGVks5PyqgZBwC3Thz8hN1+cdijhtLh+WeVFztCKz1RTb2hAekNkRKL
         tca9QIKOJsVefoNrmeC7FduoZAXxfEIBWmJnHzODumHIqskc15to5IL2ayta4qGBpExO
         VFq7/9np3HM3CeRcf26yVeE/WAsyDZhmdcBuDWmSiDmIufeddTDsLMjyB137K+WN1Fxw
         0w/XoYEekp1QzVcx+HNtR9ha3Td5e/gAuc19w5dMtNY8s31E3qW1xfOl0WEsgKXDHJSi
         P86A==
X-Gm-Message-State: AOJu0YyYc4NQUicpAwTvkOCERfy2b1w2i8EEU/udzf2h7NkgIfVv/HC9
	TsC37tqEQcTan6jyCKBldT5E1qtgRvH80HQk0y4=
X-Google-Smtp-Source: AGHT+IEcHHyG+hJdFrG3M4zsgP7m+03vGfwWM2Y7XjxHTSXuNkOfPFJRl4DAeDiaEXh4RoBm4dUCzVDv8eYRlr6MSWI=
X-Received: by 2002:a25:910:0:b0:dc2:266a:7814 with SMTP id
 16-20020a250910000000b00dc2266a7814mr1142886ybj.120.1705434685611; Tue, 16
 Jan 2024 11:51:25 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-4-tmaimon77@gmail.com>
 <99eca166-7d78-4ada-ac0a-ad67f3d8eb33@linaro.org>
In-Reply-To: <99eca166-7d78-4ada-ac0a-ad67f3d8eb33@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 21:51:14 +0200
Message-ID: <CAP6Zq1g7NoLVbAUyeQ8jm3qZvjLV6HSVZB+r-X7dxvVNtvddPg@mail.gmail.com>
Subject: Re: [PATCH v22 3/8] arm: dts: nuvoton: npcm7xx: modify rst syscon node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comment.

On Wed, 10 Jan 2024 at 23:01, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/01/2024 14:54, Tomer Maimon wrote:
> > rst node name and compatible property modified since clock and reset are
> > handled in the same memory region.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > index 868454ae6bde..f72c5a03d04c 100644
> > --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> > @@ -93,8 +93,8 @@ gcr: gcr@800000 {
> >                       reg = <0x800000 0x1000>;
> >               };
> >
> > -             rst: rst@801000 {
> > -                     compatible = "nuvoton,npcm750-rst", "syscon", "simple-mfd";
> > +             clk_rst: syscon@801000 {
> > +                     compatible = "nuvoton,npcm750-clk-rst", "syscon", "simple-mfd";
>
> NAK. This breakes the users, is not justified, is not explained.
Sorry, I didn't understand, which user it is breaking? there isn't a
device tree node that uses the rst node.
Should I explain it better in the commit message?
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
