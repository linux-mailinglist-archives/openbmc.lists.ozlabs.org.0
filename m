Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A830A334C1
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 02:35:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ytd6B3cDzz3cVm
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 12:35:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739410512;
	cv=none; b=CgkW5I8L3dbu0Voq0HPpJdOlf0zPWh0goJ0Ev0frMV2wpym0lSbygjIz6LoBgeXCvswImqFqHBlIHC1rHkGV6vdHS9AJg6mQosNRj7Cl76M3cjq0O8H0jnUgIYLapCv8KmDLZnrOM+Ksg1VK13CTA34QMoZVvQ6IFTJy0FTBYzQ8EdO5LJZQDx05ZSnQA8iLQVA4blQMc6DUIAsjcSn5Ci1kSO3zuNi4mn8YyVJBmMDDow2FFtAvzFH8T+Tpw3rlKVdjuY3ihc0k3FaZ9itsSSw5LIBLWvCEa6rwWlZ5sXkbp7trYdFJcN0NDZ0gw7K8WiHZKRL1CBxuDldjcxeyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739410512; c=relaxed/relaxed;
	bh=7VGU4GfhPMqJEXler7778/nCovI5qCQgVoJqnQCQB0k=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ov+gzy0HF6rw2RyLkbSCFi2uVw1IpMkihqfJyVvJWiya4f96+MpNiBppO+BtnYdd3Vz+9ED8He6JlcbL7eHTUUAaL9202EruRugY2SAHEzLX/9GDbyDbXs86JuaUFXFlGYtmL2eA+ZjmaHYGxJZ50o/VeMwCkYwNQKiuIEYwSLVQgSbsvKq4LzZzOqkhATtYD2TXbutbip4CHT+RfcYgcYHFknkzp8odizdeyZeHGpa837ETsmzDWdqje8JRuCi10VZR8WZm7L3e+VmRuk9FXDmeafskqd8Zfj6+Ov03VDbw84HsDyQPDrPvaESiD0HengnBXmwughgQxFSyZm9BGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Dt2Qll0r; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Dt2Qll0r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ytd644qSbz2yq4
	for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2025 12:35:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739410506;
	bh=7VGU4GfhPMqJEXler7778/nCovI5qCQgVoJqnQCQB0k=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Dt2Qll0rbSoLUxnB0twbir6+FHpnuwPZEw8dZgzabM1BDg+KUDwwQcVYlTuaikOnZ
	 SGgGTMO0TFLCJqvj044vDNGvijq11/Pm8Te9g86797aGwPePKFY0pQnseRcVH8qgMp
	 Z//+afmjw9kXgkHxYCanUP+CukG217Kj//LdRx/rGVBLECQAbGcOEQys4prUg+mtWW
	 GBdnKgf8Onu4LQJR44+chpQhPq49jydIXQGUoVVeGloOlTpXoPoKFGbWd3hu8iEVeI
	 pNF3ribb00h9rECGOuNm/+HDM3sd2bErTVPglhvMODJK093Uvz1HeIr411vwXRR0Ae
	 V+Wm6iVtQLjsA==
Received: from [192.168.68.112] (203-173-7-184.dyn.iinet.net.au [203.173.7.184])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7D1B37576E;
	Thu, 13 Feb 2025 09:35:05 +0800 (AWST)
Message-ID: <5d84475dc07c43fada8f3e10169739d57348eaa4.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Align GPIO hog name with bindings
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>,  Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Thu, 13 Feb 2025 12:05:02 +1030
In-Reply-To: <bdd7b203-ccb3-453b-ae91-32f257fc909f@kernel.org>
References: <20250116090047.87499-1-krzysztof.kozlowski@linaro.org>
	 <bdd7b203-ccb3-453b-ae91-32f257fc909f@kernel.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2025-02-12 at 21:36 +0100, Krzysztof Kozlowski wrote:
> On 16/01/2025 10:00, Krzysztof Kozlowski wrote:
> > Bindings expect GPIO hog names to end with 'hog' suffix, so correct
> > it
> > to fix dtbs_check warnings like:
> >=20
> > =C2=A0 nuvoton-npcm750-runbmc-olympus.dtb: G1A_P0_0: $nodename:0:
> > 'G1A_P0_0' does not match '^.+-hog(-[0-9]+)?$'
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> > ---
> >=20
> > Changes in v2:
> > 1. Rename rest of the nodes I missed.
> > ---
> > =C2=A0.../boot/dts/nuvoton/nuvoton-npcm730-gbs.dts=C2=A0 |=C2=A0 12 +-
> > =C2=A0.../nuvoton-npcm750-runbmc-olympus.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 120 +++++++++-----
> > ----
> > =C2=A02 files changed, 66 insertions(+), 66 deletions(-)
> >=20
>=20
> Any comments? Can this be merged?

Joel was taking NPCM SoC patches through the BMC tree. I'll pick this
up. We should probably update MAINTAINERS so they don't get lost.

Andrew
