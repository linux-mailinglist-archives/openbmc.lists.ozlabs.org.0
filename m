Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC24A7B9A2C
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 05:15:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=O34P3A/o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1GsR6GVWz3ckj
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 14:15:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=O34P3A/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Grk2s8Tz30NN;
	Thu,  5 Oct 2023 14:15:02 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-84-62.adl-adc-lon-bras32.tpg.internode.on.net [118.210.84.62])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5D962200DB;
	Thu,  5 Oct 2023 11:14:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1696475698;
	bh=R7cbZEGmJy2Gw2vxwUa3TW2M1e1bape91R+3bvKvVu0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=O34P3A/oGQNwIozMFMzAjDAioU17wp3c9h1nOMZ7RV8TgQXElvFBqhe4Bsbl8fE3x
	 gQJHr4JcMw0cY+ZWvzT4kdJUNrBlJY268m03OdYVbLkUGQxAsG2UsnZSHZkVBfy/ud
	 Ijx6ZjbiaRGBK5PJQOHlqpK/zAbkif3zrnpSQ4DHsBw/vEdgEDH2Dkffu3UU5j4eKu
	 MRDmWH4T+LbN/9/q9UkU98aF7+68IUsY6WlrKbKEy7JE2euX6wE7QhXOhK9C7SBe/D
	 dFxN+kL91aUD6hgp+qRN2ZtZi7wnw91jBnLcYB5RQCJFiBsHw/M9m/+6dufL4msv8U
	 Iljyq3ilKd4/g==
Message-ID: <3bf55144b8169a8f44c67e9a6b63cc67a2edfa50.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] pinctrl: aspeed: Allow changing SPI mode from
 hardware strap defaults
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, Linus Walleij
 <linus.walleij@linaro.org>,  Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org
Date: Thu, 05 Oct 2023 13:44:54 +1030
In-Reply-To: <20231005030849.11352-2-zev@bewilderbeest.net>
References: <20231005030849.11352-2-zev@bewilderbeest.net>
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

On Wed, 2023-10-04 at 20:08 -0700, Zev Weiss wrote:
> Some platforms unfortunately have their SPI mode selection bits
> strapped incorrectly (such as being configured for passthrough mode
> when master mode is in fact the only useful configuration for it) and
> thus require correction in software.  Add the SPI mode bits to the
> GPIO passthrough bits as the exceptions to the read-only rule for the
> hardware strap register so that the pinctrl subsystem can be used for
> such corrections.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!
