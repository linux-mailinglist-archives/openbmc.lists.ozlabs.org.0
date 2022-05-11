Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010C522A7A
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 05:38:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kygbf1YvGz3byj
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 13:38:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GxhkfQkT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=GxhkfQkT; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KygbH6LnHz2ymf
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 13:37:47 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id DDA8382B;
 Tue, 10 May 2022 20:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652240266;
 bh=uP1Xo0x1pOGO5xKKa3+WfAnww0QOt761fKgaKy01umc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GxhkfQkT6voDVfTlQkhvcvRqiHid/zqLa3Jk0HUxVaOzBTZs3kuCWHqJmZDJ7HY++
 iPa3eQR1Q9qu7O1j+drSnrpwU6NniS/1uTv7ftcC8OwpJsNNZOBl91+P/dnaEgky+2
 HYUx0mlsRjkYxdcvay6Fa8WklpiyMNf5l32kGyCk=
Date: Tue, 10 May 2022 20:37:44 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
Message-ID: <YnsviIh2dFoogpIE@hatter.bewilderbeest.net>
References: <20220414210045.26480-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414210045.26480-1-zev@bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 14, 2022 at 02:00:45PM PDT, Zev Weiss wrote:
> The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
> are mostly compatible with the existing ast2400-evb device tree, with
> a couple small tweaks for the serial console UART and ethernet MACs.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  arch/arm/dts/Makefile             |  1 +
>  arch/arm/dts/ast2400-ahe-50dc.dts | 34 +++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 arch/arm/dts/ast2400-ahe-50dc.dts
> 

Ping...does this look like a reasonable approach for a board that's 
mostly-but-not-entirely EVB-compatible?  Once the regulator/extcon 
driver question gets sorted out I'll post a kernel dts, after which I 
think the necessary pieces will be in place to add an OpenBMC meta-layer 
for this system.

This patch is also still outstanding as a semi-dependency (not strictly 
necessary for this, but nice to have for it):
https://lore.kernel.org/openbmc/20220414205950.26406-1-zev@bewilderbeest.net/


Thanks,
Zev

