Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC19253B1
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 08:30:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=S1vIT/Jp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDVK41r3xz3cXD
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 16:30:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=S1vIT/Jp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDVJX75C7z30VY
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 16:30:20 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net [118.210.145.155])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 28ABF20135;
	Wed,  3 Jul 2024 14:30:20 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719988220;
	bh=XKJYSkz2Ki4DaPGk5cZIkE998dxLPcWpzz8t9jbdTnU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=S1vIT/JpGs/q+8I5zeuDtlxIzZGr1QQI9KwdcaE1mITUwVUebjku99CdZtkJrJvKp
	 8ADr6QSsjfOhs/9ObVF5gSdpdS+x2A3niPESYOrwlWHoXpMT6tv6AwVGcIXx4qpT53
	 3fUH+Df66eUcYxfFI4Sc32RmqmMkZvFhkE9EHV+EZ2eHUaXPob67Xq6wfZxsX7eUh+
	 z9lo5+Vx5KAtpLnXnMsGtSjS/k3t9wztyhAbVzBfYsAb5hH0rJpUtd8+WWtjGRpPHu
	 0c/OWgiCyAwNxsT9xNUWxCZZw77qP8ekg76zzrEuDCogPmKeED+i5AdsEmdjC2Q0YH
	 /IrWU9XQF5Y6Q==
Message-ID: <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in
 modules node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 03 Jul 2024 16:00:19 +0930
In-Reply-To: <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
References: <20240701071048.751863-1-tmaimon77@gmail.com>
	 <20240701071048.751863-5-tmaimon77@gmail.com>
	 <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-03 at 15:55 +0930, Andrew Jeffery wrote:
> On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> > Modify clock property handler in UART, CPU, PECI modules to reset
> > controller.
>=20
> Sooo... I'm not sure how much of a hack this is, as it's not clear to
> me that the devicetree spec allows multiple labels on a node, but `dtc`
> seems to accept it.
>=20
> You can reduce this patch to a short diff with:
>=20
> -               rstc: reset-controller@f0801000 {
> +               clk: rstc: reset-controller@f0801000 {
>=20
> and leave the rest of the phandles in-tact.
>=20

Well, there is some precedent:

```
$ git grep -E '.+: .+: .+ \{' -- arch/arm/boot/dts/
arch/arm/boot/dts/arm/arm-realview-eb.dtsi:             charlcd: fpga_charl=
cd: charlcd@10008000 {
arch/arm/boot/dts/arm/vexpress-v2p-ca9.dts:             smbclk: oscclk2: tc=
refclk {
arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts:                      vcc=
_io: vcc_hdmi: REG4 {
arch/arm/boot/dts/rockchip/rk3288-firefly-reload-core.dtsi:                =
     vccio_wl: vcc_18: REG11 {
arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts:   vcc_5v: vcc_sys: vs=
ys-regulator {
arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi: vbat_wl: vcc_sys: vsys-regu=
lator {
arch/arm/boot/dts/rockchip/rk3288-firefly.dtsi:                 vccio_wl: v=
cc_18: REG11 {
arch/arm/boot/dts/rockchip/rk3288-rock2-som.dtsi:                       vcc=
_io: vccio_codec: REG2 {
arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:                  vcc18_wl: v=
cc18_flashio: vcc_18: DCDC_REG4 {
arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts:                     vqm=
mc_sdcard: ldo4_reg: LDO4 {
arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts:                      vqm=
mc_sdcard: ldo4_reg: LDO4 {
```

Andrew
