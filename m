Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565D9BC235
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 01:52:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj8t85btfz3byT
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2024 11:51:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730767901;
	cv=none; b=dAUGC5WVDyhs4Ab/W4Fg4Ta04Xn9jQFxSi9vGTCLx4nGU3jAFxfKdp1ZTUwRd2tSE4WSLs/us9g+485bVDGW0kF5Abi3OZlHoiYWjJEz9AdYYeDbnMRzLt/InPcM2uMGxcgE41oZeioC+Y6+WQsbpTJC/x6L62rSo1IjpofHWw7d8dXASFRu2qH5QInxM/z5yG8osl5Ouk5OfWQbq6C77CivEXVyvnF2ZK/SNEsdOOBTGoZI2sjExQc4f9OCtpDoBNsLoQ7mrTrhV6yAKXFPvdf+cUVQGZ7mfNrYc1sivZkx+5sJ7FBcPUuNLBzxk2fkUduWgeyJLEFAWbe+hIpmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730767901; c=relaxed/relaxed;
	bh=ITYUF412IGD3EXf5hD1+vyGezOoq2SuNalYoAo0K4NA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lw+BaMPLa2kL+ethJ2GrOE1AvkZ4yUndgN3H5gRkTU/by9iQz9vyB8ksZJzs+n8+NP35tUpKwpJE/Ixm/HTbVdNnY+RgghmyKiEXxlSth1dXiaUrgC2YkIfpylSjHiLdqHHfEh/D+A14rOCxwjBKqz7NY9mREURzXUs0lz8UBacPLtfCWVLLDJiS72/8ljvuLOrzqzBFROZPgP++qwrMofX3YX+TdUkCLGMOX0uxLKa4qyD5TG/l2G0B5qe6srugYWTHSVHHBXhN5oMH32XBfX4AoGU/jrSTl6HmSOsjXvs3dkzlHWwnR5IIphSnnbzU+AVHwG31rN70h8s56rXOHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FPFPtVNR; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FPFPtVNR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj8t42cF4z2xmk
	for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2024 11:51:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730767899;
	bh=ITYUF412IGD3EXf5hD1+vyGezOoq2SuNalYoAo0K4NA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FPFPtVNRiShJlJ0Qg62L7d998Pti/VPhPeYaN2btBSrxJ2FjmDvcud1KBsQgcf2XJ
	 PN2ictV8BhlLcRND/BI0gJnNGGNDqTfnHxgQy0vzJiKbptXY7DjLz1ra3oT0riOQg4
	 UCmaVo4J3B0HuWJkfvPsKIFJWGwzM6yxvFzbyps74OyOdZEP/U3kvKltHWxOoIR9Zf
	 zFY/qah/vHZX2L/a3CPnB4cDffEkOpExPl1GQx8E1zOYKcKLxZdWC6XM7/tAHQwHsz
	 WfV/M/LIUiAHbcfGWpvBYOAXPEq0yLC+fonRmPKLkeIxFzOqsmsWfEybeh7GqRGNkQ
	 g+6mhyxPAi86w==
Received: from [192.168.68.112] (ppp118-210-162-114.adl-adc-lon-bras34.tpg.internode.on.net [118.210.162.114])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DADBB6A3C9;
	Tue,  5 Nov 2024 08:51:38 +0800 (AWST)
Message-ID: <957c987a4eccc78758ed499eb09e32b5d7969c4d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix at24 EEPROM node names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Date: Tue, 05 Nov 2024 11:21:38 +1030
In-Reply-To: <CAL_JsqJBeoD4yPj1Wva5cbPHweK3RU6pF-Vn=P+MsW0-RhKhZQ@mail.gmail.com>
References: <20240910215905.823337-1-robh@kernel.org>
	 <CAL_JsqJBeoD4yPj1Wva5cbPHweK3RU6pF-Vn=P+MsW0-RhKhZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-11-04 at 07:26 -0600, Rob Herring wrote:
> On Tue, Sep 10, 2024 at 4:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g>
> wrote:
> >=20
> > at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > =C2=A0arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 6
> > +++---
> > =C2=A0.../arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 2 +=
-
> > =C2=A02 files changed, 4 insertions(+), 4 deletions(-)
>=20
> Ping!

Ah, thanks, I lost track of this one. I've applied it to be picked up
via the BMC tree.

Andrew

