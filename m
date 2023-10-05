Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA17B998B
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 03:18:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=m9x/vKg/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1DGC71Cwz3cVy
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 12:18:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=m9x/vKg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1DFX5Sgsz3bd6;
	Thu,  5 Oct 2023 12:17:52 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8B8D1200DB;
	Thu,  5 Oct 2023 09:17:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696468672;
	bh=WN/ilaCxe3QgMddZZjU7PId19PdgcBpr/ZP9C7Gmuag=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m9x/vKg/TE3TAGrcLxTojNzClrEkgYnOEY5+tf8xe76QiqAhHIeMjif1oQec6sjbL
	 CcLutjUOP4/x2v5wDlX6JEfJ8iO3sFLOS+VVSRT6IbtsC7d0lI8rBShKgChEaGp4k8
	 N3/L7kqwcY4VqvrStpYmNLwcR67dHYh8kYnUUdneo9S0IU8nVRq5DqlDqR5qX+Q08M
	 Vi/4W18RcVM5VsxUv/BTFv4ASfhE6ZP5krKuY8Zcoon8WFB7dosKCDDrN3CsB30B8c
	 YI4QZmkNccNHGsOr4AueM848o8vtRNwvshBjzznt2Ei/8qA/6n8pIaB4gyUDLjlixk
	 j/cExR+TeHnNg==
Message-ID: <e5f0a67e05cf477bdb4ec6efd9c554f4aaa2cf8b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] pinctrl: aspeed: Allow changing hardware strap defaults
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, Linus Walleij
 <linus.walleij@linaro.org>,  Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Date: Thu, 05 Oct 2023 11:47:50 +1030
In-Reply-To: <20231004071605.21323-2-zev@bewilderbeest.net>
References: <20231004071605.21323-2-zev@bewilderbeest.net>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2023-10-04 at 00:16 -0700, Zev Weiss wrote:
> Previously we've generally assumed that the defaults in the hardware
> strapping register are in fact appropriate for the system and thus
> have avoided making any changes to its contents (with the exception of
> the bits controlling the GPIO passthrough feature).
>=20
> Unfortunately, on some platforms corrections from software are
> required as the hardware strapping is simply incorrect for the system
> (such as the SPI1 interface being configured for passthrough mode when
> master mode is in fact the only useful configuration for it).  We thus
> remove the checks preventing changes to the strap register so that the
> pinctrl subsystem can be used for such corrections.

So the strapping for the SPI1 configuration seems to be prone to
(copy/paste?) mistakes. Is there evidence that motivates dropping all
the protection instead of poking a hole for SPI1 like we did for the
passthrough GPIOs?

I'm still a little attached to the policy that software should be
beholden to the strapping, and to try to mitigate software mistakes
given the smattering of bits required to drive the Aspeed pinmux.

Andrew

