Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80068FC0F0
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 02:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IaBX2+gZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv83m5Sv7z3dVZ
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 10:49:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IaBX2+gZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv83G5HYhz3bqP
	for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2024 10:48:42 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 78F012009F;
	Wed,  5 Jun 2024 08:48:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717548522;
	bh=L/rVdD3hcH7IXf8nDF+0t3JeqEwnnwKIcedqxaD/7X8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IaBX2+gZ1ZjRJP8CBuVVPKtfsubdJR/S7r7AlUTPsMpwTyTu7wP32LJCFRQmrp/wB
	 PMtOhywvLNJRz25hwew5H+gCEF/4tDBoLkkLL0h6d7oLCYxNzKTL7dWnYXUpqR0RWa
	 LenlTx77hM5lbj8TYaCAZ6jbFcKocfwurxV+38zkyCTRkq1b2TB0dnOVyE6TtNEdxV
	 iIueM8lv3MK4YGp/kdlMK5zE1TL/DjqjqJ3RAaaeCxsOsGmaEPJYbZC9XfCoI0Ke0R
	 goeuVw1riXZqRQ8RXY2doJCC2TIlZf73eJCDjFzQT7NIG9M+bMJKFhhNGGiNRRW+pr
	 uJ1yyYi3VcJ4g==
Message-ID: <91e86c336062b4c345a3443ae8aa73bf9603ac4e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: Aspeed: Add Facebook Harma DTS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Peter Yin <peteryin.openbmc@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, patrick@stwcx.xyz
Date: Wed, 05 Jun 2024 10:18:42 +0930
In-Reply-To: <20240604094533.2900564-1-peteryin.openbmc@gmail.com>
References: <20240604094533.2900564-1-peteryin.openbmc@gmail.com>
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
Cc: peter.yin@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-06-04 at 17:45 +0800, Peter Yin wrote:
> Initial introduction of Facebook Harma
> equipped with Aspeed 2600 BMC SoC.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
> Change log:
>=20
> v1 -> v2
>  - Revise common to harma
>=20
> v1
>  - Create facebook common dts
> ---
>  arch/arm/dts/Makefile          |  1 +
>  arch/arm/dts/ast2600-harma.dts | 66 ++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-harma.dts

Again, this is for u-boot?

Andrew
