Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BEE925627
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 11:09:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dO2qLyeJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDYrT2qmzz3cyf
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 19:09:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dO2qLyeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDYqv6MtJz30W2
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 19:09:13 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e02748b2402so5674829276.0
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2024 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719997751; x=1720602551; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3w22GpN3pE0R+URdrJvU+3T3PFPX3qv9+EkSGf+xCaE=;
        b=dO2qLyeJB3CKGtogbrekMg+FW0agD4ZYYx/HNJnwEE6ENlQSlp3MjIi7CdFxAElt6Z
         5kRLhuThXojERk6Zwaz4rW7ph9PBvm0TxfImKCBSD+XFUu2+ogZhNwvSYMmK2iO0dHi/
         Mujc8Odt+bP60xjqcolBtp09L0AX6KuM14SX1WDc2GgJBCmsbgUG1VKlxm22OlYxv63w
         d5UKiR4iNtd4yuSL5tAEza2BLuiNZfLpJK73Ls1cUpH3VH6lG5CC5HpYEFjsZ9wWwgVz
         nFy4uiwPW4Syl4wCq5PfiRSeWfTUuE7qDKPgS+DmDAST1+BgInlWe68P1W3NnBjrJUcv
         +Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719997751; x=1720602551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3w22GpN3pE0R+URdrJvU+3T3PFPX3qv9+EkSGf+xCaE=;
        b=hug9NonZ/WUimEsHK9HGoYvtM8L+AXLCA/UivoccQHxeQUv0Rxw4aQsxtrA+crW+gd
         6NivdeEGO2kvDcVd1rH3oQNvKeW9DZgW9Gn6HkGtBc+EGwLFS15u/ezWqg9J2u6D9dhM
         KCAFPOO87FwwjBLDa45t/ox6lqX93lnay8a6Qu6Kb8QuWsb3gKovLlSFoC5oXDFmwuF5
         tuEa540EJRNPCyVyLd0UEVmODDI2rPlkYCb/zh3zOOluDG2etzki83zjsXQcYZLsvKzT
         NLAFYe1O7BGwYtLjM7OSdlipy453knGaB2yOmRLnPBTOU/b03SET2q6BfbDoxOem1W6O
         FYpA==
X-Gm-Message-State: AOJu0YylPpLE4RHKEAo5wObevCj6ghEvud2VsyzC6BAwHCcJ1d+gDF1Y
	/jHo02hYIgeZGh+82AS082WBq8pRoRr571lZvr1k+Lr6v8kcaK8Dy2jaWwrE+6fzDkhe6s3rC5U
	JDput7MC6YQpyPdTof7KApf8Bl1E=
X-Google-Smtp-Source: AGHT+IGJuNzNpFKO4RcCfFlZKd//MUXXimSBvyqag6SffTSISiPSO4EDnjTrWU+uJjsfR95TNr8WTfq2zHG4QsE8ynE=
X-Received: by 2002:a0d:e653:0:b0:630:fe1d:99cc with SMTP id
 00721157ae682-64c73fc73e9mr104898217b3.52.1719997751641; Wed, 03 Jul 2024
 02:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240701071048.751863-1-tmaimon77@gmail.com> <20240701071048.751863-5-tmaimon77@gmail.com>
 <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
 <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au> <CAP6Zq1gOHB=qmr9T4UjFvDsbKdYEHAeBhsXomM34C2=fONjf8g@mail.gmail.com>
In-Reply-To: <CAP6Zq1gOHB=qmr9T4UjFvDsbKdYEHAeBhsXomM34C2=fONjf8g@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 3 Jul 2024 12:09:00 +0300
Message-ID: <CAP6Zq1hu1yBq+EzAQo=ghpAF1dnWDR-uxS4Lkq_KuDMNtPwJ_w@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in
 modules node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

One more question, for this change the clock node should be removed.

I am afraid that removing the clock node could cause an ABI break, not?

Thanks,

Tomer

On Wed, 3 Jul 2024 at 11:13, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Hi Andrew,
>
> Great suggestion :-) i will try it!
>
> Thanks,
>
> Tomer
>
> On Wed, 3 Jul 2024 at 09:30, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
> >
> > On Wed, 2024-07-03 at 15:55 +0930, Andrew Jeffery wrote:
> > > On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> > > > Modify clock property handler in UART, CPU, PECI modules to reset
> > > > controller.
> > >
> > > Sooo... I'm not sure how much of a hack this is, as it's not clear to
> > > me that the devicetree spec allows multiple labels on a node, but `dtc`
> > > seems to accept it.
> > >
> > > You can reduce this patch to a short diff with:
> > >
> > > -               rstc: reset-controller@f0801000 {
> > > +               clk: rstc: reset-controller@f0801000 {
> > >
> > > and leave the rest of the phandles in-tact.
> > >
> >
> > Well, there is some precedent:
> >
> > ```
> > $ git grep -E '.+: .+: .+ \{' -- arch/arm/boot/dts/
> > arch/arm/boot/dts/arm/arm-realview-eb.dtsi:             charlcd: fpga_charlcd: charlcd@10008000 {
> > arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts:             smbclk: oscclk2: tcrefclk {
> > arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts:                      vcc_io: vcc_hdmi: REG4 {
> > arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi:                     vccio_wl: vcc_18: REG11 {
> > arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts:   vcc_5v: vcc_sys: vsys-regulator {
> > arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi: vbat_wl: vcc_sys: vsys-regulator {
> > arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi:                 vccio_wl: vcc_18: REG11 {
> > arch/arm/boot/dts/rockchip/rk3288-rock2-som.dtsi:                       vcc_io: vccio_codec: REG2 {
> > arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:                  vcc18_wl: vcc18_flashio: vcc_18: DCDC_REG4 {
> > arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts:                     vqmmc_sdcard: ldo4_reg: LDO4 {
> > arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts:                      vqmmc_sdcard: ldo4_reg: LDO4 {
> > ```
> >
> > Andrew
