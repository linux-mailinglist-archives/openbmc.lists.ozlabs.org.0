Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62D931F35
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:21:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=g/rtUzBo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPV86Kjbz3cY5
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:21:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=g/rtUzBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPTg0mvhz3cBd
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:20:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100038;
	bh=s1qbTIELZe/Em4CLc4cJMoHXwR8j92dQ0IZbA9cLYVw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g/rtUzBoRn3F6T/3GnV+2pDviX/gzhWCE63lQIS9Sx8357dT9x4jQ5X6vkubnf5+R
	 EVDGPlVZIXYzK2jhNKu3cvq1bfjDXcbiNrRkAa4uH34oZ6dtXsiIEFWXED8XhXOp79
	 qOqU7UDz3T+sUNdZKodzq4wSFm8+D/fTGUwLhc3BLojtRAYK1hK0QmDt6FC+uYzbaW
	 20DWFt14VQ38D3G8iguxQmshjknBLjvLZlGRmtr8n1NsXT+8jf3BXuNwK7/aCtLPrq
	 UX7cEBhTeVvPpmjo/cSU27wRs4+R6bpbXSdVy7CwcU3Xd6vi9vVrA1dehohqZkIHdV
	 5JvsDvqNpa+Xw==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 83E27655AC;
	Tue, 16 Jul 2024 11:20:38 +0800 (AWST)
Message-ID: <9f367de6783433b16fb04372985b9d6112e10ad4.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 0/7] pinctrl: npcm8xx: pin configuration
 changes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:20:38 +0800
In-Reply-To: <20240711200213.2402248-1-tmaimon77@gmail.com>
References: <20240711200213.2402248-1-tmaimon77@gmail.com>
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

On Thu, 2024-07-11 at 23:02 +0300, Tomer Maimon wrote:
> This patch set addresses various pin configuration changes for the=20
> Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,=20
> remove unused pins, and improve overall pin management.=20
>=20
> Tomer Maimon (7):
>   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
>   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
>   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
>   pinctrl: nuvoton: npcm8xx: remove unused smb4den pin, group, function
>   pinctrl: nuvoton: npcm8xx: remove unused lpcclk pin, group, function
>   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
>   pinctrl: nuvoton: npcm8xx: modify pins flags
>=20
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 64 +++++++++++------------
>  1 file changed, 31 insertions(+), 33 deletions(-)
>=20

What's the state of this series with respect to upstream? Is this a
bunch of fixes specific to openbmc/linux dev-6.6? Or do all of these
patches have equivalents upstream?

Andrew
