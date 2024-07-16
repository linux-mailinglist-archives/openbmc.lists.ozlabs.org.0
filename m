Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1E931F40
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:26:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X/XbgLag;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPcV5lrLz3cYZ
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:26:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X/XbgLag;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPbn1czBz3cWW
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:25:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100356;
	bh=Fsqc/9vW9Pmy8rQmpkSASk6ZYVEWPF1CmPFPX46tXo8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X/XbgLagquF7acIpgRTketeopm1ej8XASJZI3cBN9isC/qRlDYb2QjtjrKcoVjcUP
	 kgOUCTdStrFxdT8OHXG1D7EEdBRPsffURB9W+pjnwEybrR7TIiQB9jFVXlwHbaKL3R
	 HIPKrrhqZrMLBnRq2w3duiI9XKUccSdvEwPrW1SQ9dkL8GWyTEVDEA6VjNCjlpnYxX
	 ZH/5w4Pput+S3tI+4LpLexSgFRH87XSscLYWGvhkckKl5uSDo9rkHCg8YRx2wv1yF/
	 Pg3QQ/cFBMmmeKyAZxqDiS7Pn+bfcCvHbZpBLTqL9Rnz910qCX3a1t9fm5pA/BO8Lr
	 Ftz8PxqjzP2CA==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B616765555;
	Tue, 16 Jul 2024 11:25:56 +0800 (AWST)
Message-ID: <842718e13e0484b228705bbb9a7e2c82d33a28ad.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1] net: stmmac: Add NCSI support for STMMAC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:25:56 +0800
In-Reply-To: <20240709145039.1910298-1-tmaimon77@gmail.com>
References: <20240709145039.1910298-1-tmaimon77@gmail.com>
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
Cc: Marvin Lin <milkfafa@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-09 at 17:50 +0300, Tomer Maimon wrote:
> Add NCSI support for STMMAC.
>=20
> Signed-off-by: Marvin Lin <milkfafa@gmail.com>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 196 ++++++++++++------
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |  27 ++-
>  include/linux/stmmac.h                        |   1 +
>  4 files changed, 158 insertions(+), 68 deletions(-)

What's the state of this patch with respect to upstream? Is this
something specific to the openbmc/linux dev-6.6 tree, or is there an
upstream equivalent? If the latter, can you please link to the relevant
patch?

Andrew
