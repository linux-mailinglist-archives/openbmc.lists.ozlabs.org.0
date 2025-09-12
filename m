Return-Path: <openbmc+bounces-640-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3763B54682
	for <lists+openbmc@lfdr.de>; Fri, 12 Sep 2025 11:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNT986fRTz3d0n;
	Fri, 12 Sep 2025 19:07:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757668076;
	cv=none; b=h4wpBAM0quicikMCs3jw1GW9DUqHjCnGPEEUSmnyr4j3R+VHr4cojoFn/zwX8n84G30VPwnPtVVKQv6P9UyNZETNjgBaw0kaM8NN5TGe4LqRU79se7mJC/Y4qprS5xBnbC2cAf0VZBm5L196saVubSUjPNNTsf1W910K0kl2W6kp/pf1zlz5/bhxnDp33WOUwed5bSI/MfbtcQIV5vc+JTFClfpbmxHakoqfg5VYC0TKQWf38U3a1Eme1p15aNOL5wt8yUFMg27hoRKVOyCfn6nSSdH3oSJvyI7T3hkpwhqd1TczU/mswFwLNSa98LtWB0n+Rxe6NZ8roAY0hhrpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757668076; c=relaxed/relaxed;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZDHAYtjMwaQVmEdLvTzlLWEzJRGYVjzO7hy2J3f8VXjybxZlyogq1igapy4RQRKzpYcrxZjJvm/3vOwirF8sir0wvbcuzWT9s31bxy/tERGGJ4/ZucEEd9jUwWVyNiyiD/dEHdFgrVPR9poWKaPhEa+TLEJD4v2su6mg+gKQ5zl2QrtB6CamDcnKX/sMvBWripsDvyN6Z6K8pdwvk84kN8Ccpo6+mUZ1mL9r8YgB9c03iB2I1F9jSZirxuz1zoKy4Xjyw+rof5800vIhBOYBK4ztScZXNmKC2YXvllG9ORCTNTXWNhSa+m3MwUcN88Fnko84UjWzc+A8DQr56HRSrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gQUT9pxh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gQUT9pxh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 540 seconds by postgrey-1.37 at boromir; Fri, 12 Sep 2025 19:07:55 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNT974xKqz3cxn;
	Fri, 12 Sep 2025 19:07:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757667533;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=gQUT9pxhlZK5toz3qpJBhksN8GlW+u9S0jSBZhnkiD/iqI1/v93UiO6gp/fkoZnEu
	 BNG+EutVZjFVqSirhIOp9fSYQ62IQ4INHGAyJvkiK9+A1vB/LEavjFnLdNacsgCQ2Z
	 o6LCVucyWVOHDpGi+qSdfStgOMsE5J7GWUNCuRD/0BUcXLU5sUrMvNKoFp9QUiNLgc
	 vn3Qbpd4Q51l4mdF4ikc9hTCo0Ye6qznEroVNQNMwlE6uJhmbzZJRRBJ3WgTGzfF/c
	 zy0yPCrTWAvFjjWyhASWPxKXd3EEk8Y0+aU3hBPJ87ASCBluY6wm4OsxTvCmdxEA/3
	 5QIYAH+Ufn03g==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A84664748;
	Fri, 12 Sep 2025 16:58:48 +0800 (AWST)
Message-ID: <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 12 Sep 2025 16:58:48 +0800
In-Reply-To: <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan,

> And AST2600 i2c controller have two register mode, one is legacy
> register layout which is mix controller/target register control
> together, another is new mode which is separate controller/target
> register control.

OK, but the ast2400 and ast2500 I2C peripherals - which this binding
also describes - do not have that facility. Given the 2600 is a distinct
peripheral (as discussed on the v16 series), this would seem to warrant
a distinct binding.

Should this be split out into an ast2600-specific binding, to reflect
that it is different hardware? The reference to the global registers and
transfer modes would then be added only to the ast2600-i2c-bus binding.

Cheers,


Jeremy

