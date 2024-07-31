Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417B79425AB
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 07:15:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PNKgrdIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYgK31Sdsz3dCH
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2024 15:15:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PNKgrdIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYgJW5yylz3cjS
	for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2024 15:14:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722402888;
	bh=MNGD6Zw/yF5VLsp7OyJMb4W2+d39E5yHXjXBEK4+CdQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PNKgrdIlEmU748BfiNO8Gl3eIgCZsMuvpYgQsKYI94ma84cC1+Pe5TXybCLZAEZZO
	 fLEyKnvAHMrjT03mO15fMnf9TcC6FnLuo2c4CnlwqPJ6Axb9VMDWvv84ijGGrTJnjR
	 hkGVUQOo2DJlwbj0vQkTwmavxr7jwkwHiB10R77NLhpdvNwaleUKx22IiMZUJYNkU+
	 5nHyECWOETwKutzCJ+mF0hN2Nb6v32kp6u9UKuaqERZ3zmZ4KWjeSqORyisMVwo0mG
	 t7abNRy2Niwj+2X8E0UJ5D0iLvHU2lRk+ay7UVx8UF7S14Nv5jcFxiD0G6pQam3LgW
	 lIYeWqNO84uTw==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B8099656A9;
	Wed, 31 Jul 2024 13:14:46 +0800 (AWST)
Message-ID: <9bfb41d03105dde846fa7fa9a1b6feba1ab53c43.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 0/2] Add Nuvoton NPCM845 i3c master driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stanley Chu <stanley.chuys@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 31 Jul 2024 14:44:45 +0930
In-Reply-To: <20240730062122.3781121-1-yschu@nuvoton.com>
References: <20240730062122.3781121-1-yschu@nuvoton.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, joel@jms.id.au, tomer.maimon@nuvoton.com, cpchiang1@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-30 at 14:21 +0800, Stanley Chu wrote:
> This patchset adds i3c master support for the Nuvoton
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>=20
> The Nuvoton npcm845 i3c controller implements I3C master functionality
> as defined in the MIPI Alliance Specification for I3C, Version 1.0.
>=20
> The npcm845 i3c master driver is based on svc i3c master driver and
> add platform specific support for the npcm845 hardware.
>=20
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>=20
> We will contribute this patchset to torvalds upstream soon.

Please reply here with the appropriate lore[1] link once you've sent
the equivalent patches upstream. When you've done so, I'll look to
apply these patches to the OpenBMC tree based on the feedback, along
with the OpenBMC-Staging-Count tag.

Thanks,

Andrew

[1]: https://lore.kernel.org/
