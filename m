Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8399DACD
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2024 02:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSFjc2VdCz3cXP
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2024 11:44:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728953072;
	cv=none; b=mS2qeOPJke7sE6kcorFEk0ecyi6eNUu1EBw1G5Ju9mR5atM+Mr2unOxPCZ8kt2TfBzqPaYzk9c6qM3YcN6w+XQGsIp6JI3rMvXhkxVI5K91vGpwoPQgM5nyiSjQ9nMvzjQy3ma8njBOxMm+7GzdYu/URiX2zFOjktYBiVc/LeSNDXtx+e4O5jhTsONQ1ntTERP1wSXHoFGxAEK2lmz+cteNBd0ScwQiYiUR5CnkCuh9ENK9JGEG0skido8Rc/fjMgr1IjNLJs92pgAEMXdyn16CBZwVfdJbHujzqJhdktsMlyDvyK9dD9+B1bf8hAosvnujSR8oPdGeEZ65rWFSYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728953072; c=relaxed/relaxed;
	bh=2nnTU/ADEM4/VUxWefc0PONe2IBy5+5Jla7mbf0EfVs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ES0TYIHvIZLWOWS5qU/6TWw1RCDj0pCqp0fQDO251ctaT0O8XVVyyc9aYPg1g/5TJnUC/gQTv5qke8D9F4iRvuTA4hyz375gsoyfqY+yQO7Knu5s0IvoeWV6b0EBmEYN9btZ8o4ojg7BUou2Wo/wPgVXNDKnOlTZbPu4oNz0Cpo19tOco+BP2zU50qXdtwkiCizATOx8c4zY+iBnyCREh7qRVyQbOaZ+KCBMBpRrEPgMtvYhZHf790S8SR539IpSNM+7MKUwY6fOXkJt7BdFL6Jbqj0RrA2cEA7qIj0aGq3qMhaTLFoMNEnMmU8hfCIvLQTmlZ68qsB734f7Td0Eag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PiOv2Rv5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PiOv2Rv5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSFjW2dghz2yPq;
	Tue, 15 Oct 2024 11:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728953070;
	bh=2nnTU/ADEM4/VUxWefc0PONe2IBy5+5Jla7mbf0EfVs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PiOv2Rv5D4gz2LFQ1h7BrLF79+/3pHIZJ+tJ9BELKEx57hW33NeTxupy4Zch8v+jg
	 jwjE5z2HOStoVOfhe3YWxqNZz8A5gzBfWKlLw2THkfMIK9yGq94HOvEGsPn1JIs5Dl
	 NvymJ7DbZDry2bLNbBhpAnAboweXTFHT2yvSzydX6gqxSv927YB4S/NfosYcGKmhb4
	 o1lBI3qWsHSezjrDopLqLklQflemn37Y2NR7eMxSYhLxZhmoahwt6Ebp7bf+QVmpst
	 hF2S+ArVf6lGiBsjQAahRkhReJjQ6gUrmfJPBnM4UjqszbGa/g0LupdNDFY5A4TIIQ
	 Z+yYLAYSTiL6A==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 75277649A0;
	Tue, 15 Oct 2024 08:44:29 +0800 (AWST)
Message-ID: <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Date: Tue, 15 Oct 2024 11:14:28 +1030
In-Reply-To: <172891445289.1127319.4114892374425336022.robh@kernel.org>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
	 <172891445289.1127319.4114892374425336022.robh@kernel.org>
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chanh,

On Mon, 2024-10-14 at 09:05 -0500, Rob Herring (Arm) wrote:
> On Mon, 14 Oct 2024 10:50:31 +0000, Chanh Nguyen wrote:
> > The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Jeffer=
son
> > hardware reference platform with AmpereOne(TM)M processor.
> >=20
> > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > ---
> >  arch/arm/boot/dts/aspeed/Makefile             |   1 +
> >  .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 ++++++++++++++++++
> >  2 files changed, 647 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjeffer=
son.dts
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ampere-mtjeff=
erson.dtb' for 20241014105031.1963079-1-chanh@os.amperecomputing.com:
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /: compatible=
: 'oneOf' conditional failed, one must be fixed:
> 	'ampere,mtjefferson-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,g=
alaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,=
olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
> 	'ampere,mtjefferson-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanol=
x-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', =
'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', '=
asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,m=
inipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yose=
mitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,m=
ihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,with=
erspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6=
-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', =
'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,ce=
ntriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-=
bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc',=
 'yadro,vegman-sx20-bmc']
> 	'ampere,mtjefferson-bmc' is not one of ['ampere,mtmitchell-bmc', 'aspeed=
,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,bletchle=
y-bmc', 'facebook,catalina-bmc', 'facebook,cloudripper-bmc', 'facebook,elbe=
rt-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harma-bm=
c', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bmc', =
'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,system1-bmc', 'i=
bm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', 'jab=
il,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-bmc'=
]
> 	'aspeed,ast2400' was expected
> 	'aspeed,ast2500' was expected
> 	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
>=20

This needs to be fixed as pointed out by Krzysztof.

*snip*

> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/bus@=
1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@58: failed to match any schema with c=
ompatible: ['pmbus']
> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/bus@=
1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@59: failed to match any schema with c=
ompatible: ['pmbus']

These two should also be fixed. The compatible must describe the
physical device, not the communication/application protocol. It may be
necessary to add a binding if there's not one already for the device.

Andrew

