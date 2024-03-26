Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7188B636
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 01:37:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RFOy9Sck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3W8y2Z0qz3dKG
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:37:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RFOy9Sck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3W8J2WjZz3cRq;
	Tue, 26 Mar 2024 11:36:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7113611D1;
	Tue, 26 Mar 2024 00:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84803C433C7;
	Tue, 26 Mar 2024 00:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711413405;
	bh=r6ja1S3WkmxWys+sE3KabUy5bKAQKHZGyKXel35g+zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFOy9SckrUmOjcVY80p+Bpxbe+5dpDJq+JeaQvIywXepTed1YRXnEepoqUkHhDLDv
	 KZQ8orGHJmcfhxU4yqXzvKwkkh03GuDsm5VknrzWZxwAeC8moegodFxeAFmHcguP3V
	 MvMXRlBgmBX55pjBPgOUTWQbK7zrjPHUR7Ivk7miBmPv+gpyP5Ja8S02vD6UZnj61n
	 CqfQ4NXy/CKPT7KniveufUJdSfosIbl7mM5+gISfC65C9eTYs21OyRMfhMeYTy9MAj
	 ov2d24lOwn4Oj/ZJVUPrXNuEHsLe2pES4uVY1T8XSrKZegQunB7Zn3qmkn816MOaQo
	 yZPbuVAYSRHAg==
Date: Tue, 26 Mar 2024 01:36:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

> > @Andi: are you okay with this approach? It means you'd need to merge
> > -rc2 into your for-next branch. Or rebase if all fails.
> 
> I think it's a good plan, I'll try to support you with it.

Do you feel more comfortable if I take the patches as soon as
they are reviewd?

So far I have tagged patch 1-4 and I can already merge 2,3,4 as
long as you merge patch 1.

Andi
