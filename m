Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B99A006A
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 07:07:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSzVJ6vZhz3cLv
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 16:07:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729055237;
	cv=none; b=BLhYkyztPQ77dMwJte6nJvS61BdvU7zNe4AJLCaN7lUlfuZWQJ2h7CRnrmyhmqzQn5btt15F1CUwUMtKS5ZciVQCB1TZ3XOZNudP+FxuIYHXp+z9LAhxDfYMgEKeNqOGkUBtUG1TEgsTjuTeb8TpD2sD5pghlSLkQOfK15kdL4SAk4OpUhVW6o+cZ6qd9mWw+kwm+J24LcxA+vTEFizKGrtmA9VYnz8EDci4hkdJAK9xIJTY2QTF+MFtlwMclXy77TDpk1BavDjV/MutAl2PYXpeVHHbSqGUQRWkSWWluLmf6bEDm8SJ0cypcomYZOQigObH3xUENWhR138A9Qac0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729055237; c=relaxed/relaxed;
	bh=2xl6GiNHnVkURELe+WIxH38Tw0c480sjCHy4Ex2x+rA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gkF2w47XaPsUaJoHsbu5T8tetJ/fBKGaf79z+6FQQPtG6UhPpWoHEPeDQ4wcGLN5R+MHKoEAn2wxOeZ2VOBShZLL6W452L27D1UAk3quWCHI94IUuzR+Oj29xBiQjiXYKy4WH/shqk2ineL2Wpr2T8vTEN1o6tSN28/BXDcNOyk7s4k2yvvU/QPWTyjshZv6R9hES3Ai7S7NdV9nbEpnLcf5/odUW785+8y4Qm21qQmCvzZn42hJdNynCY7PyIhDyGMoskFnT9hUXx33U/khC7h/Fq/0Y/p+mvP/gigvP6lBUgaFg8wO6PBI4HEPLIDMPHVX6PF1Lqpol0OtvMUI9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lrGa2CNO; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lrGa2CNO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSzVC2Xkxz2xrC;
	Wed, 16 Oct 2024 16:07:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729055230;
	bh=2xl6GiNHnVkURELe+WIxH38Tw0c480sjCHy4Ex2x+rA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lrGa2CNOs9oShkkf5L53gsq0hIF0WsD8lx77LkW0phj5nw/HhlpNvrA99hjgTGn9m
	 kWnzgrP0SYB3f/ecuEN+ZXU4w+MXBFtR7BPrkmFFX9W+Jmrl1ueAFvXl1t1DYv51fF
	 fS/b4dH4n6TxU/OCOgj32bsQwFad4DhZbPaGrHuZ0EXVzNMuUN6dAKfolGh6RM+vkd
	 JuCj/I1pScJOLkLjMZ2XoJZf42dkWMnpODdi4/V7xJ17ncro0pkN5sQYK6hVqPPpwX
	 R4+ALlqlyOyu4qp9IjGtVytLKaDBc8/JM6XglaRrRXa5kJacVLqBHY+aeTALUMQhp1
	 sRpGQomyJMETg==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C654767B60;
	Wed, 16 Oct 2024 13:07:07 +0800 (AWST)
Message-ID: <7555c528c90e6151f54d0e17c278527f95fac184.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Chanh Nguyen
	 <chanh@os.amperecomputing.com>
Date: Wed, 16 Oct 2024 15:37:07 +1030
In-Reply-To: <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
	 <172891445289.1127319.4114892374425336022.robh@kernel.org>
	 <b5919d904c9f06a618a54d49bc895c3081a511e4.camel@codeconstruct.com.au>
	 <e8e31fb4-4a9f-4ea9-be4d-9ba29d824cc5@amperemail.onmicrosoft.com>
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

On Tue, 2024-10-15 at 13:39 +0700, Chanh Nguyen wrote:
>=20
> On 15/10/2024 07:44, Andrew Jeffery wrote:
> > Hi Chanh,
> >=20
> > On Mon, 2024-10-14 at 09:05 -0500, Rob Herring (Arm) wrote:
> > > On Mon, 14 Oct 2024 10:50:31 +0000, Chanh Nguyen wrote:
> > > > The Mt. Jefferson BMC is an ASPEED AST2600-based BMC for the Mt. Je=
fferson
> > > > hardware reference platform with AmpereOne(TM)M processor.
> > > >=20
> > > > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > > > ---
> > > >   arch/arm/boot/dts/aspeed/Makefile             |   1 +
> > > >   .../aspeed/aspeed-bmc-ampere-mtjefferson.dts  | 646 +++++++++++++=
+++++
> > > >   2 files changed, 647 insertions(+)
> > > >   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtj=
efferson.dts
> > > >=20
> > >=20
> > >=20
> > > My bot found new DTB warnings on the .dts files added or changed in t=
his
> > > series.
> > >=20
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the warni=
ngs
> > > are fixed by another series. Ultimately, it is up to the platform
> > > maintainer whether these warnings are acceptable or not. No need to r=
eply
> > > unless the platform maintainer has comments.
> > >=20
> > > If you already ran DT checks and didn't see these error(s), then
> > > make sure dt-schema is up to date:
> > >=20
> > >    pip3 install dtschema --upgrade
> > >=20
> > >=20
> > > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ampere-mt=
jefferson.dtb' for 20241014105031.1963079-1-chanh@os.amperecomputing.com:
> > >=20
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /: compat=
ible: 'oneOf' conditional failed, one must be fixed:
> > > 	'ampere,mtjefferson-bmc' is not one of ['delta,ahe50dc-bmc', 'facebo=
ok,galaxy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'micros=
oft,olympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc=
']
> > > 	'ampere,mtjefferson-bmc' is not one of ['amd,daytonax-bmc', 'amd,eth=
anolx-bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bm=
c', 'asrock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc=
', 'asrock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebo=
ok,minipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,=
yosemitev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'i=
bm,mihawk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,=
witherspoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf52=
80m6-bmc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bm=
c', 'lenovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qco=
m,centriq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8=
036-bmc', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-b=
mc', 'yadro,vegman-sx20-bmc']
> > > 	'ampere,mtjefferson-bmc' is not one of ['ampere,mtmitchell-bmc', 'as=
peed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-bmc', 'facebook,blet=
chley-bmc', 'facebook,catalina-bmc', 'facebook,cloudripper-bmc', 'facebook,=
elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-bmc', 'facebook,harm=
a-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc', 'ibm,blueridge-bm=
c', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc', 'ibm,system1-bmc'=
, 'ibm,tacoma-bmc', 'inventec,starscream-bmc', 'inventec,transformer-bmc', =
'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', 'quanta,s6q-bmc', 'ufispace,ncplite-=
bmc']
> > > 	'aspeed,ast2400' was expected
> > > 	'aspeed,ast2500' was expected
> > > 	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yam=
l#
> > >=20
> >=20
> > This needs to be fixed as pointed out by Krzysztof.
> >=20
>=20
> Thank Andrew, I'll update that in patch v2
>=20
> > *snip*
> >=20
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/=
bus@1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@58: failed to match any schema wi=
th compatible: ['pmbus']
> > > arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/=
bus@1e78a000/i2c@180/i2c-mux@70/i2c@0/psu@59: failed to match any schema wi=
th compatible: ['pmbus']
> >=20
> > These two should also be fixed. The compatible must describe the
> > physical device, not the communication/application protocol. It may be
> > necessary to add a binding if there's not one already for the device.
> >=20
>=20
> Hi Andrew, My device is following the pmbus specification. So I'm using=
=20
> the generic pmbus driver=20
> (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree=
/drivers/hwmon/pmbus/pmbus.c#n237)=20
> to probe my device.
>=20

The devicetree doesn't describe drivers though, it describes devices.
The compatible string needs to represent the device.

>  In arch/arm/boot/dts/aspeed/ directory, many boards=20
> are also using this compatible to probe our devices.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts#n219
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dts#n263
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dts#n260
>=20
> Andrew, Recently I saw the ASPEED platform's maintainer accept the=20
> "pmbus" compatible with a warning log. You can see in the below list=20
> that patches were merged recently.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dbb3776e564d2190db0ef45609e66f13c60ce5b48
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D28cfb03afcb20a841e96e821ba20870a7c437034
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D36d96827f480e90037d162098061333e279ea35f
>=20

Unfortunately for your argument, I'm not trying to make the case that
some people are allowed to do this and others (such as yourself) are
not.

Rather, this is the review process in action, where hopefully everyone,
including myself, tries to improve their practices with feedback.

You can also find discussions where other maintainers (Guenter, hwmon
maintainer; Krzysztof, devicetree maintainer) have asked that "pmbus"
not be used as a compatible:

https://lore.kernel.org/all/f76798ea-6edd-4888-8057-c09aaed88f25@roeck-us.n=
et/

The tools are asking you to do something different via the warnings,
and so am I :) Please define the compatible according to the device
used in the design.

Thanks,

Andrew
