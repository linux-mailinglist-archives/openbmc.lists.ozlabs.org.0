Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907EB94FAF6
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 03:12:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D4QLEcFk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjYJt3W5Yz2yVM
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 11:12:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D4QLEcFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjYJK0dX4z2xJF
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 11:12:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723511516;
	bh=VERQ6LmywI73ea4OUNrbSKzDTcXu2gl5OSEJPaEStjY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=D4QLEcFkOydRZs3ruLY3F9g8eG0AuKMZlnJe8O5JbKKCA6w5eH0moyIpHnIpKotVo
	 DRG1QWKeOIWLARNkhdFixvcVEueX3A03Ri+R8eiCN/hd6dC2u0TqRGmu4gIP86C/gV
	 AlNyOYpTz0K2X3z7+BkEEsT19hSUuiXxd1nukg7XZHgqz8MIJVTTRQ0PsOCEC5WvrS
	 WpRrMUwtulQ80MnqKXDkxNKfT48LTZkiOiY2WjURtSVTxOqdJWa0AoNbAtd8QnSbeL
	 v/1YxuVcoed5auv3nkht0UpI0OwAdxfe6MYHQgX5Y248QgnJPZFThUsC2O8oL+wfMa
	 sl46y+3TeagZQ==
Received: from [192.168.68.112] (ppp118-210-65-51.adl-adc-lon-bras32.tpg.internode.on.net [118.210.65.51])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D600866A81;
	Tue, 13 Aug 2024 09:11:55 +0800 (AWST)
Message-ID: <34e98c2202990d3dcaf3b6a201605a5493d2fe91.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v3 0/7] pinctrl: npcm8xx: pin configuration
 changes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 13 Aug 2024 10:41:53 +0930
In-Reply-To: <20240812145816.3301570-1-tmaimon77@gmail.com>
References: <20240812145816.3301570-1-tmaimon77@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-08-12 at 17:58 +0300, Tomer Maimon wrote:
> This patch set addresses various pin configuration changes for the=20
> Nuvoton NPCM8XX BMC SoC. The patches aim to enhance functionality,=20
> remove unused pins, and improve overall pin management.
>=20
> This patchset are applied to the Linux vanilla.
> https://www.spinics.net/lists/linux-gpio/msg101676.html
>=20
> Changes since version 2:
>         - Allign upstream version
>=20
> Changes since version 1:
>         - Squash the non-existent pins, groups and functions.
>         - Remove non-existent groups and functions from dt-bindings.
>         - Modify the commit message.
>=20
> Tomer Maimon (7):
>   dt-bindings: pinctrl: npcm8xx: remove non-existent groups and
>     functions
>   pinctrl: nuvoton: npcm8xx: remove non-existent pins, groups, functions
>   pinctrl: nuvoton: npcm8xx: clear polarity before set both edge
>   pinctrl: nuvoton: npcm8xx: add gpi35 and gpi36
>   pinctrl: nuvoton: npcm8xx: add pin 250 to DDR pins group
>   pinctrl: nuvoton: npcm8xx: modify clkrun and serirq pin configuration
>   pinctrl: nuvoton: npcm8xx: modify pins flags
>=20
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 80 +++++++++----------
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 64 +++++++--------
>  2 files changed, 71 insertions(+), 73 deletions(-)
>=20

Thanks, I've applied these to dev-6.6. The exception during the process
was the binding patch. I've cherry-picked what was merged in linux-
pintrl/for-next as there were some odd differences. I resolved the
conflicts with `git checkout --theirs ...` to force the result to match
what's upstream.

Andrew
