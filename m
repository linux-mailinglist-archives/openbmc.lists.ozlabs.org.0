Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4997766B
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 03:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4cB724Fzz3cBP
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 11:27:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726190859;
	cv=none; b=i2ZTSb+RKvT7n08KApUwLLisD0Ic2LIvg1qEiNa2N3rH6dKvAkT7BjAjIRjrd7gc5rBZZ/+frTKOV6YE+MLQLXCAXpPZVTp7KO5cT3KQPzBkYx4D3jlk932Aftma3jrnl6ymaVDgypunf7rjYdKMKcJEouMk2nK+A5tYMDWhm0nviJIi3yoHiuhyKfBj/YA5X9atOEkmaQ/ZYPi6AWEB1ddx4N1ov/PwkRaR1dzOKh93u1mr71kKuinzppun18G6Cp4aCBYAwBHNsQxO3ZN+qJkNI779iwFmQWvruE1cheOS6hwMQJwkOGpFhK2o2Mwe8SBNE60UuiE5ATm6uaZpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726190859; c=relaxed/relaxed;
	bh=kivjswOpFAcbziz4axDBuZS5CMkuBCbgfAaPuOju2uA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gZE7n0wPCe5W8QFtBo1vwKsAE1PRUPdIrLWcKSsi9+zGEgSLjIazv3BboDqzIcC7JKo6MVjBLqJdnQCHVsoxWJZg2O3+osUhTlm8S8MwJjDEZjJzfvQRlv2u+ayWoIAm6b0WUL+20FOK351jIr9+N8QANP+jkKzWdWxkoDUi5oyysBY2c0VBxbzNMgNP0LpSyZR/lhDW1MNVx5xRoE7OvCzjTT1e6tIiaLGbiTX/K3wKiNeRp5QNDXwl93MfYf13pqMRS75dPUX48H+ay6Kc7Fkb2tMxlcJuWfj9TdR4Mf2OVSUiL9ajHPpXKvJInZ+eTSbm4JussKCNGjvV7zWP+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=laLX3jLt; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=laLX3jLt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4cB32jBxz2yFD
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 11:27:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726190857;
	bh=kivjswOpFAcbziz4axDBuZS5CMkuBCbgfAaPuOju2uA=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=laLX3jLthOcftIzMdjIAvYWLcFbYkWD/Ns0Yqn2zcoUIARX0tw6oEH+hi4gkx+y+t
	 DmwSJvxkkAwvJzuDMhKxPSXAyTvKF/lYCI52l/Aid76OnTBNhjJeJ3XVYiid7q8dS4
	 xBuwkBAG3MdfR8qZO8pxrOiUbUTvvckjxY4ktQ7hQolUZ3oX+3Akx5oyekSyaZyW0r
	 HPq0mqHG6n8Dz2esdqUFPtbHoxTIzs7NJdYSqcsFarIPigln5afMccJ0XcniOryPsS
	 ALkZ6j5sxCoG7HwIIxHGKdA6rnvUwdDYAyxaVs8eN4AAVA0AUlRhGxzhovhfECX3xo
	 uM69ymH+E5LNQ==
Received: from [192.168.68.112] (ppp118-210-183-200.adl-adc-lon-bras34.tpg.internode.on.net [118.210.183.200])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A2902650D6;
	Fri, 13 Sep 2024 09:27:36 +0800 (AWST)
Message-ID: <5605d69863356355297b370efacdff44cc8ed7dd.camel@codeconstruct.com.au>
Subject: Re: libmctp / libpldm / pldmtool
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Ananth, Rajesh" <rajesh.ananth@smartm.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Fri, 13 Sep 2024 10:57:33 +0930
In-Reply-To: <BN8PR04MB5906A2433F59E7470A2E939794642@BN8PR04MB5906.namprd04.prod.outlook.com>
References: 	<BN8PR04MB5906A2433F59E7470A2E939794642@BN8PR04MB5906.namprd04.prod.outlook.com>
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

Hello,

On Thu, 2024-09-12 at 19:48 +0000, Ananth, Rajesh wrote:
> Hi,
>=20
> After I do the "bitbake obmc-phosphor-image"  I am not able to see "libmc=
tp / libpldm / pldmtool" getting installed.
>=20
> I do see that these are present under "meta-phosphor/recipes-phosphor".

Unfortunately, just because the recipes exist, does not mean that the
libraries/tools will appear in your rootfs. Some work is required to
have them included in your build.

>=20
> In my build environment, I see these:
>=20
> rajesh@bld-ub20s-openbmc:~/openbmc-portwell/openbmc-pcomc660-v2.2.0/build=
/pcomc660-ast2600$ find . -name pldmtool

This platform doesn't appear to be upstream so we don't really have any
information on how it's configured and whether the artefacts should be
included.

> ./tmp/deploy/licenses/pldmtool
> ./tmp/deploy/licenses/armv7ahf-vfpv4d16/pldmtool
> ./tmp/log/cleanlogs/pldmtool
> ./tmp/stamps/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/license-d=
estdir/pldmtool
> ./tmp/work/armv7ahf-vfpv4d16-openbmc-linux-gnueabi/pldmtool/1.0/license-d=
estdir/armv7ahf-vfpv4d16/pldmtool
>=20
> In my build environment, I expected something under ".../bin/". The bb fi=
les are as is from the openbmc git.
> In the package generated, I am not seeing the pldmtool and the other asso=
ciated libraries installed. Am I doing something wrong?

Likely :)

A further point is that libmctp is very likely not what you need. It's
an implementation of a full MCTP stack, which can either run in hosted
(userspace) or freestanding software (firmware, operating systems,
etc). While OpenBMC has historically used libmctp, it is considered
legacy for OpenBMC purposes, and you should use the AF_MCTP sockets
provided by Linux instead.

You can find more information on the Linux MCTP stack here:

https://codeconstruct.com.au/docs/mctp-on-linux-introduction/

libpldm and OpenBMC's PLDM daemon together use the AF_MCTP socket
transport for Linux, and this is the supported way to implement MCTP
and PLDM in OpenBMC.

You can integrate the supported MCTP and PLDM stack into your image by
adding `require conf/distro/include/pldm.inc` to your platform's
bitbake configuration.

Andrew
