Return-Path: <openbmc+bounces-1116-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A8D06B08
	for <lists+openbmc@lfdr.de>; Fri, 09 Jan 2026 02:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnNwl3rdkz2xGg;
	Fri, 09 Jan 2026 12:09:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767920999;
	cv=none; b=GDojusjHSl0CbGKAcM9McjbtgaLZnzbLTkEqBm1vz80gRYGDrIKqEl/ye4H6HuMmtxkxZ+ZgplYPu0mV7X+Ae6bZ2YwIuAQ2wfSonhkBXHA/BJsg4xv3plaa+jsyV3+aI+pivNdcdC9fUq4EVjs+Uqjf4RBr5OK10zb5bvbOyBlI4iD89i4ag8x6MZ4YRX2TQBF7tYqHNKpr+T7+CftuMS5roBb6nchW4EXf14+6iXOxCBq6T19SyeGPEgwrLRfWu4XZmwD5Nawl00R9Gdghjfy4Fm3V6RB/1LzynvtV3lBZfhA7OfFJunWSP57CBIzR3UkTgynVuLfS66hr5LlvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767920999; c=relaxed/relaxed;
	bh=xEmYz2eEu0GD1+huHFkbyyE3FZcw6xvPbknrzN24JMo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lipkW+ELdiAJk/UcYAtJyTkdG86ybBqEd/auwp04/11WUZQHNDwOCl3CwN3AZOWKxcIcxg2zvyIYIZjN3oUiTrzACXqsuLl1qBeTgszrNaKdM7yJQnrplew2fs4T8plvJULCTUpCSfx9vslmscyyIvtmUjWB2QA+YO+2y7L7dl4V3TVUjHFHrUx7CKrtPrMtHiVbQki+4DrscPY6wfGQGp/iuWcdR5glUqa1tj0i+P/KSdoXPYq1RVsnUJJz6KIX84tLWl9aHXh45RFgY9KXHOe7rH8fmpiYU6WEqy2f5x+3TzZGOgkNm9J8w0eBiJhhtoKJL6Jwf8N1BeqG+vTkdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f5QsO7Jg; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f5QsO7Jg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnNwk36ZTz2xFn
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 12:09:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767920991;
	bh=xEmYz2eEu0GD1+huHFkbyyE3FZcw6xvPbknrzN24JMo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=f5QsO7JgKiKwtfo0NC2WKxrbNedm2H+BSDZ6UzdhBsZ20fMBJYaEURWpxqZSUBIjs
	 cZQDyxfGZimUu5Zjcnb8CClzcSc+tgfZ/ptZLOd1dLXBAyWp+E3P5E2zAEc3rvQPih
	 WRT29nG0/8e7j8CA3iebO1Spop0e+x7Wy5WmPe5Fq4UlwKFNQVGV1n5wZ2dVeh4fNi
	 Z1ZGwav4r/h7o7CjlrAWEln1kJE3ogo5S927h3yzvHaydlr9/f1cqgfTuL7nfTZSS+
	 OkwofRS+F7JdYg/r8LAhzQwW+QyTSjV+mpXhz57pt8luUunEYO6PbNH6kXNckNI9rn
	 N2a9Ii8ydPoWw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3BB237E142;
	Fri,  9 Jan 2026 09:09:51 +0800 (AWST)
Message-ID: <d6ca5544da6f90a72dde334c4d76270fa9db9469.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add missing "device_type" property
 on memory node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon
 <tmaimon77@gmail.com>,  Tali Perry <tali.perry1@gmail.com>, Patrick Venture
 <venture@google.com>, Nancy Yuen <yuenn@google.com>,  Benjamin Fair
 <benjaminfair@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 09 Jan 2026 11:39:50 +1030
In-Reply-To: <CAL_JsqL2ZS_D-ZUGRmJ6=dhuAAfoTUoC3CNsP4_FBat160dCVw@mail.gmail.com>
References: <20260105193232.3167128-1-robh@kernel.org>
	 <176786448160.1407469.7623777355686519631.b4-ty@codeconstruct.com.au>
	 <CAL_JsqL2ZS_D-ZUGRmJ6=dhuAAfoTUoC3CNsP4_FBat160dCVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Thu, 2026-01-08 at 08:56 -0600, Rob Herring wrote:
> On Thu, Jan 8, 2026 at 3:28=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Mon, 05 Jan 2026 13:32:31 -0600, Rob Herring (Arm) wrote:
> > > "device_type" is required for memory nodes, but is missing on Nuvoton
> > > npcm845-evb.
> > >=20
> > >=20
> >=20
> > Thanks, I've applied this to the BMC tree.
>=20
> I didn't realize Nuvoton and Aspeed are 1 tree now. Should MAINTAINERS
> be updated?

Yeah, it should. I've sent this:

https://lore.kernel.org/all/20260109-npcm-arch-maintainer-v1-1-a0ec6aee22fb=
@codeconstruct.com.au/

Andrew

