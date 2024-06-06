Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A413F8FDCB2
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 04:25:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mtXrEPEw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvp815YH3z3cTj
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 12:25:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=mtXrEPEw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvp7T0cFtz30W9
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 12:24:36 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 50D0F20154;
	Thu,  6 Jun 2024 10:24:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717640672;
	bh=v1CbRtyILYSHMnRhivnPSxM2QcB1sHUL4ZN0rjujJk8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mtXrEPEwSZLxH/9ycRYXnYrF6qo7TrMQGYZ4MkGbZVJBNgy6oFkGrwKyQGj+JhG8a
	 J59sfAT/1VQieOlDqXkSfyUjqs6i4AwOmLOJExJxHc6RlDkTX1Ob+xXfnGxQEVLZEr
	 JRl20BuS0FiFHXeWNo7VOID5gjVsChzo0Lx8NlPg++wuMnEhNelrenl+GCSmltN1Fq
	 9o97sAD985+ZhQrCh1n4U9+t0xyaKcx3ArW29EHkpWVMuiEr5QwCtXyH9BbKO5vCtp
	 mo0aV6c0Y/B2eolk0mo5M0XECa6SxHUDanoRgbi4A1mOg6UGGLmtnL7A+OZNpcmZL+
	 gK4lV2Dqn/mhA==
Message-ID: <81de8de3f5416794e617ffe97132f00eaec27fce.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: Add IEISystems FP5280G3 BMC machine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: George Liu <liuxiwei1013@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Thu, 06 Jun 2024 11:54:31 +0930
In-Reply-To: <20240605013017.38885-1-liuxiwei@ieisystem.com>
References: <20240605013017.38885-1-liuxiwei@ieisystem.com>
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
Cc: wangzhiqiang02@ieisystem.com, suxiao@ieisystem.com, banht@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-05 at 09:30 +0800, George Liu wrote:
> The IEISystems FP5280G3 is a power platform server with an
> AST2600-based BMC.
> This dts file provides a basic configuration for its OpenBMC
> development.
>=20
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>

Hi George,

I've just noticed that you've only sent both this patch and the patch
at [1] to the openbmc list. These patches must first go upstream and so
must also include the upstream mailing lists.

[1]: https://lore.kernel.org/openbmc/e60b20fed3ec9c0624bb714bf704a325f71339=
4e.camel@codeconstruct.com.au/

Please make use of ./scripts/get_maintainers.pl to find appropriate
people and lists to include. Alternatively, try using the b4 tooling in
your workflow. `b4 prep --auto-to-cc` helps a lot:

https://b4.docs.kernel.org/en/latest/

Otherwise, please first see my feedback on your other patch at [1].
It's probably best to send your current batch of devicetree patches
together in the same series so that I don't get conflicts in the
Makefile when applying them.

The cut-down warnings for this patch are:

../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:269.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:272.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp1=
12@49:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:277.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@1/tmp1=
12@4a:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:282.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:285.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp1=
12@49:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:290.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2c@2/tmp1=
12@4a:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:392.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:396.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0=
vdda@60:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:400.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0=
vddb@61:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:404.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0=
vdn@72:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:408.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0=
vio@73:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:412.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0=
vpci@74:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:416.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:420.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1=
vddc@60:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:424.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1=
vddd@61:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:428.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1=
vdn@72:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:432.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1=
vio@73:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:436.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1=
vpci@74:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2=
, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:440.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:444.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1=
610@6c:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:448.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/rdim=
m@74:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, #=
size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:452.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/mdim=
m@54:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, #=
size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:456.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@2/ldim=
m@44:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, #=
size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:460.5-15: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2c@3:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:544.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/p=
ca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:549.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@3/p=
ca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:576.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/p=
ca9548@71/i2c@0:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:581.6-16: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-switch@70/i2c@4/p=
ca9548@71/i2c@1:reg: property has invalid length (4 bytes) (#address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:771.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:774.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/tmp1=
12@48:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:780.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/eepr=
om@50:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:785.4-17: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@0/pca9=
555@24:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:804.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:807.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:810.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2c@3:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:819.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:822.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/tmp1=
12@48:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:828.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/eepr=
om@50:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:833.4-17: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@0/pca9=
555@24:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:851.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:854.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:866.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:869.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/tmp1=
12@48:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:875.5-18: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/eepr=
om@50:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2, =
#size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:880.4-17: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@0/pca9=
555@24:reg: property has invalid length (4 bytes) (#address-cells =3D=3D 2,=
 #size-cells =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:899.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@1:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:902.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@2:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:905.4-14: Wa=
rning (reg_format): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2c@3:reg:=
 property has invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cell=
s =3D=3D 1)
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (pci_d=
evice_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (pci_d=
evice_bus_num): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2=
c@1: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2=
c@1: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2=
c@2: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9548@70/i2=
c@2: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@0: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@0: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@1: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@1: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@2: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9546@70/i2=
c@2: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2=
c@0: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@70/i2=
c@0: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2=
c@0: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9546@71/i2=
c@0: incorrect #size-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2=
c@0: incorrect #address-cells for I2C bus
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5=
: Warning (i2c_bus_bridge): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9546@70/i2=
c@0: incorrect #size-cells for I2C bus
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (i2c_b=
us_reg): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (i2c_b=
us_reg): Failed prerequisite 'i2c_bus_bridge'
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: Warning (spi_b=
us_reg): Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:268.19-280.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:270.13-274.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1/tmp112@49: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:270.13-274.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1/tmp112@49: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:275.13-279.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1/tmp112@4a: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:275.13-279.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@1/tmp112@4a: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:281.19-293.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:283.13-287.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2/tmp112@49: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:283.13-287.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2/tmp112@49: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:288.13-292.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2/tmp112@4a: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:288.13-292.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@180/pca9=
548@70/i2c@2/tmp112@4a: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:391.20-414.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:394.16-397.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vdda@60: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:394.16-397.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vdda@60: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:398.16-401.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vddb@61: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:398.16-401.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vddb@61: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:402.15-405.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vdn@72: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:402.15-405.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vdn@72: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:406.15-409.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vio@73: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:406.15-409.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vio@73: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:410.16-413.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vpci@74: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:410.16-413.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@0/cpu0vpci@74: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:415.19-438.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:418.16-421.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vddc@60: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:418.16-421.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vddc@60: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:422.16-425.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vddd@61: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:422.16-425.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vddd@61: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:426.15-429.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vdn@72: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:426.15-429.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vdn@72: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:430.15-433.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vio@73: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:430.15-433.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vio@73: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:434.16-437.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vpci@74: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:434.16-437.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@1/cpu1vpci@74: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:439.19-458.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:442.15-445.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/pxe1610@6c: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:442.15-445.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/pxe1610@6c: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:446.13-449.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/rdimm@74: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:446.13-449.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/rdimm@74: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:450.13-453.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/mdimm@54: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:450.13-453.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/mdimm@54: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:454.13-457.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/ldimm@44: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:454.13-457.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@2/ldimm@44: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:459.19-461.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:459.19-461.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@300/pca9=
546@70/i2c@3: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:541.22-545.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@3/pca9548@71/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:541.22-545.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@3/pca9548@71/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:546.22-550.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@3/pca9548@71/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:546.22-550.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@3/pca9548@71/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:573.22-577.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@4/pca9548@71/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:573.22-577.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@4/pca9548@71/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:578.22-582.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@4/pca9548@71/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:578.22-582.7=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@380/i2c-=
switch@70/i2c@4/pca9548@71/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:770.20-802.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:772.13-776.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/tmp112@48: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:772.13-776.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/tmp112@48: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:778.14-781.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/eeprom@50: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:778.14-781.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/eeprom@50: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:783.15-801.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/pca9555@24: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:783.15-801.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@0/pca9555@24: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:803.20-805.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:803.20-805.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:806.20-808.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:806.20-808.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:809.20-811.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:809.20-811.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@70/i2c@3: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:818.20-849.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:820.13-824.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/tmp112@48: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:820.13-824.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/tmp112@48: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:826.14-829.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/eeprom@50: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:826.14-829.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/eeprom@50: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:831.15-848.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/pca9555@24: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:831.15-848.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@0/pca9555@24: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:850.20-852.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:850.20-852.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:853.20-855.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:853.20-855.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@680/pca9=
546@71/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:865.20-897.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:867.13-871.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/tmp112@48: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:867.13-871.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/tmp112@48: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:873.14-876.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/eeprom@50: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:873.14-876.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/eeprom@50: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:878.15-896.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/pca9555@24: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:878.15-896.6=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@0/pca9555@24: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:898.20-900.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@1: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:898.20-900.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@1: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:901.20-903.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@2: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:901.20-903.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@2: Relying on default #size-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:904.20-906.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@3: Relying on default #address-cells value
../arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dts:904.20-906.5=
: Warning (avoid_default_addr_size): /ahb/apb/bus@1e78a000/i2c-bus@700/pca9=
546@70/i2c@3: Relying on default #size-cells value
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /: failed to m=
atch any schema with compatible: ['ieisystems,fp5280g3-bmc', 'aspeed,ast260=
0']
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: $nodename:0: 'pca954=
8@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: Unevaluated properti=
es are not allowed ('i2c@1', 'i2c@2' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@20: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@21: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@22: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@23: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@70: $nodename:0: 'pca954=
8@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca954=
6@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdda@60: failed to match any schem=
a with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vddb@61: failed to match any schem=
a with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vdn@72: failed to match any schema=
 with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vio@73: failed to match any schema=
 with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@0/cpu0vpci@74: failed to match any schem=
a with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddc@60: failed to match any schem=
a with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vddd@61: failed to match any schem=
a with compatible: ['infineon,xdpe132g5c']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vdn@72: failed to match any schema=
 with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vio@73: failed to match any schema=
 with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@1/cpu1vpci@74: failed to match any schem=
a with compatible: ['infineon,ir35221']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@2/pxe1610@6c: failed to match any schema=
 with compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@2/rdimm@74: failed to match any schema w=
ith compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@2/mdimm@54: failed to match any schema w=
ith compatible: ['infineon,pxe1610']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@300/pca9546@70/i2c@2/ldimm@44: failed to match any schema w=
ith compatible: ['infineon,pxe1610']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2c-switch@70: $nodename:0: 'i2c=
-switch@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2c-switch@70: Unevaluated prope=
rties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', '=
i2c@2', 'i2c@3', 'i2c@4', 'i2c@5' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@0/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@1/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@2/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@3/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: $nodename:0: 'pca954=
8@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@4/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: $nodename:0: 'pca954=
8@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9548@71: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/bus@1=
e78a000/i2c-bus@380/i2c-switch@70/i2c@5/tmp1413@4c: failed to match any sch=
ema with compatible: ['microchip,emc1413']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@20: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@22: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@23: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca954=
6@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@71: $nodename:0: 'pca954=
6@71' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@71: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: $nodename:0: 'pca954=
6@70' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9546@70: Unevaluated properti=
es are not allowed ('i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: pca9555@24: '#address-cells', '#=
size-cells' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi@1e79b000: compatible: ['aspe=
ed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-mast=
er.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-m=
aster', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/scom@1000: failed to match any schema with compatible: ['i=
bm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/i2c@1800: failed to match any schema with compatible: ['ib=
m,fsi-i2c-master']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@0: 'compatible=
' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@20: 'compatibl=
e' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: occ: 'occ-hwmon', =
'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: occ: 'occ-hwmon', 'reg' do not m=
atch any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400: failed to match any schema with compatible: ['fs=
i-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@1,0/scom@1000: failed to match any schema wi=
th compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@1,0/i2c@1800: failed to match any schema wit=
h compatible: ['ibm,fsi-i2c-master']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@0: 'compatible=
' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@20: 'compatibl=
e' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: occ: 'occ-hwmon', =
'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: occ: 'occ-hwmon', 'reg' do not m=
atch any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@1,0/hub@3400: failed to match any schema wit=
h compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@2,0/scom@1000: failed to match any schema wi=
th compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@2,0/i2c@1800: failed to match any schema wit=
h compatible: ['ibm,fsi-i2c-master']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@0: 'compatible=
' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@20: 'compatibl=
e' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: occ: 'occ-hwmon', =
'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: occ: 'occ-hwmon', 'reg' do not m=
atch any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@2,0/hub@3400: failed to match any schema wit=
h compatible: ['fsi-master-hub']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@3,0/scom@1000: failed to match any schema wi=
th compatible: ['ibm,fsi2pib']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@3,0/i2c@1800: failed to match any schema wit=
h compatible: ['ibm,fsi-i2c-master']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: i2cr@20: #address-cells:0:0: 1 w=
as expected
	from schema $id: http://devicetree.org/schemas/i2c/i2c-controller.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@0: 'compatible=
' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@20: 'compatibl=
e' is a required property
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@40: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60:compatible:=
0: 'ibm,fsi2spi' is not one of ['ibm,spi-fsi']
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi2spi@1c00: spi@60: Unevaluate=
d properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@40: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: spi@60: 'eeprom@0' does not matc=
h any of the regexes: '^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,fsi2spi.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'pagesize' is a requir=
ed property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'size' is a required p=
roperty
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: eeprom@0: 'address-width' is a r=
equired property
	from schema $id: http://devicetree.org/schemas/eeprom/at25.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: occ: 'occ-hwmon', =
'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: sbefifo@2400: '#address-cells', =
'#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-sbefifo.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: occ: 'occ-hwmon', 'reg' do not m=
atch any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/fsi/ibm,p9-occ.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b000/cfam@0,0/hub@3400/cfam@3,0/hub@3400: failed to match any schema wit=
h compatible: ['fsi-master-hub']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: fsi@1e79b100: compatible: ['aspe=
ed,ast2600-fsi-master', 'fsi-master'] is too long
	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-mast=
er.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/fsi@1=
e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-m=
aster', 'fsi-master']
arch/arm/boot/dts/aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: /ahb/apb/dma-c=
ontroller@1e79e000: failed to match any schema with compatible: ['aspeed,as=
t2600-udma']
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: gpio-keys: 'cpld' does not match=
 any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[=
a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/=
aspeed/aspeed-bmc-ieisystems-fp5280g3.dtb: leds: 'bmc-bootup', 'bmc-heart-b=
eat', 'bmc-init-ok', 'chassis-power-on', 'fan-watchdog' do not match any of=
 the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

