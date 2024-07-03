Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DE92552B
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 10:14:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TA+5QBiB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDXcV09Bxz3dDj
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 18:14:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TA+5QBiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDXbt6g3sz3d4F
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 18:13:46 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-643f3130ed1so45779877b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2024 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719994423; x=1720599223; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4f+CDeBDkDj+efwN4Cv22s1xScLrieS9HAMKRnFrcQ=;
        b=TA+5QBiBXVF2NSJUUnFfkE6uRrK45HRp8+5mzW50uJSWcuPFag978ysW+EN2Xx5SwY
         W30AT9tPuqXIuLouWZmkjx0/85nlmRDqh6Dlfz7gaS3ri0Zeoe99YS0VPD6gkw/e+mvy
         B8KEzUwJ7nBZkoXe+TaCXnyc60/DG17C7fVxW6B58+GV/SbYZSrkTyNXOWk4GTyRtT+M
         2RRCXAalVoJqq+iFbGZf03AMjCBvbcE0/lHQCh8XXtPM+fh4N4l+AB7LigX9q011qleZ
         EC8cGS/xw9WnzCjnGqU2ZZo7Mc966Rzx3iJ/d8HIGpRSfgBWx3QA8g+H9/h2p31ITShh
         +Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994423; x=1720599223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4f+CDeBDkDj+efwN4Cv22s1xScLrieS9HAMKRnFrcQ=;
        b=jc5ZQQFCUiZyZ2BguzYK/wFoEXGIRNiUY7HW3P0QiKnaD1Yw/Ep5EjO/1HJlzMJBsS
         HjwwlB4C6Lut/hgs5pF5YD8ma2jT2L9p/8ekN6VnEVnHljhts/APhiQjtpK6DL9/2R5B
         koI31fGSgZ1by8/PxNrr0AWo6Sk/7w6wFJt613KRSBxbYoRdfv/ZQP0FEHDFy2ZSK6r4
         xw/Gl3y/jt5UgNjCXrzqH5AadCi+m2slfCioTlJ6b8mUrq/H2xutl/sn3nFH0VV47lw5
         xgKXPEFc62wmRNuQr+oXVxvCfgvYz1kB4KeZNjx9X49C0neoxxi3SwzKX7vapFzhQUza
         JatQ==
X-Gm-Message-State: AOJu0YxzP0YEWenI5RcVuzd2FZwzkMFEgpbMDbogSp4JP5L+hcZt9shc
	B7pauRE7XsFyMU+QWvf8WxI133qE5fu/BBhC+oZmlYjyj9TW/PQfnrLtOd/arnS30Y1McXYgXyF
	o5Yz4QE3DEmAvtGuQaJqxVbtqPAsvDQ==
X-Google-Smtp-Source: AGHT+IFeE4SvkfQW7idWhPnIk37EEay/FxliVqZkvKgdIwWCLvmpqLmcc71SKJNxHYyHcxR3np199gyv6trxnxjSNXY=
X-Received: by 2002:a05:690c:a89:b0:64a:fd31:d377 with SMTP id
 00721157ae682-64c71803a21mr135306857b3.14.1719994423600; Wed, 03 Jul 2024
 01:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240701071048.751863-1-tmaimon77@gmail.com> <20240701071048.751863-5-tmaimon77@gmail.com>
 <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au> <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au>
In-Reply-To: <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 3 Jul 2024 11:13:32 +0300
Message-ID: <CAP6Zq1gOHB=qmr9T4UjFvDsbKdYEHAeBhsXomM34C2=fONjf8g@mail.gmail.com>
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

Great suggestion :-) i will try it!

Thanks,

Tomer

On Wed, 3 Jul 2024 at 09:30, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-07-03 at 15:55 +0930, Andrew Jeffery wrote:
> > On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> > > Modify clock property handler in UART, CPU, PECI modules to reset
> > > controller.
> >
> > Sooo... I'm not sure how much of a hack this is, as it's not clear to
> > me that the devicetree spec allows multiple labels on a node, but `dtc`
> > seems to accept it.
> >
> > You can reduce this patch to a short diff with:
> >
> > -               rstc: reset-controller@f0801000 {
> > +               clk: rstc: reset-controller@f0801000 {
> >
> > and leave the rest of the phandles in-tact.
> >
>
> Well, there is some precedent:
>
> ```
> $ git grep -E '.+: .+: .+ \{' -- arch/arm/boot/dts/
> arch/arm/boot/dts/arm/arm-realview-eb.dtsi:             charlcd: fpga_charlcd: charlcd@10008000 {
> arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts:             smbclk: oscclk2: tcrefclk {
> arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts:                      vcc_io: vcc_hdmi: REG4 {
> arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi:                     vccio_wl: vcc_18: REG11 {
> arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts:   vcc_5v: vcc_sys: vsys-regulator {
> arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi: vbat_wl: vcc_sys: vsys-regulator {
> arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi:                 vccio_wl: vcc_18: REG11 {
> arch/arm/boot/dts/rockchip/rk3288-rock2-som.dtsi:                       vcc_io: vccio_codec: REG2 {
> arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:                  vcc18_wl: vcc18_flashio: vcc_18: DCDC_REG4 {
> arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts:                     vqmmc_sdcard: ldo4_reg: LDO4 {
> arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts:                      vqmmc_sdcard: ldo4_reg: LDO4 {
> ```
>
> Andrew
