Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68780931F95
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 06:10:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bprsKcwf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNQb623kWz3cTS
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 14:10:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bprsKcwf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNQZY6BVdz30WP
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 14:09:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721102994;
	bh=uMONiRQUi8+5FgnCMMkcCAJ+m4lZiufoM2s8Jhevm6s=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bprsKcwfNqM+8fGDr5YQ8egMhgFQQ2l5C2YjtD90fDjseBceC7FIARMXxzrhj1Oea
	 nbrWH2BYiNvm//k3M7zgSJNQOta/d3zbhDG2ZAgndp2ox1NAo5ejmpOm7+C048rYa9
	 CwsDNhpjgiJOaV+ZJuj4Z4lm4erxgzA1s3zwo4fHKoYliC3KjqFeNPRj+yly4acF8N
	 F/Xc6q8kC/XcH3gJ/5PH4bTRbzWgGRBSBtAaFD9Jr4uGZke2VIKSouczpYFJec2oOP
	 zpSmG2WqMT/jLXbMdE/I5fFPJdoFRNtqDQarTN/pQ9DAz0OM/rsLaIYiJPjXJ2iH20
	 9VnGoq3qwwIWA==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 82C8365555;
	Tue, 16 Jul 2024 12:09:53 +0800 (AWST)
Message-ID: <78c279e3be7c9a1440ce7f23b2da4b924266a8c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/2] Add ltc4286 and ltc4287 driver support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, andrew@aj.id.au
Date: Tue, 16 Jul 2024 12:09:53 +0800
In-Reply-To: <20240709115855.17623-1-potin.lai.pt@gmail.com>
References: <20240709115855.17623-1-potin.lai.pt@gmail.com>
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

On Tue, 2024-07-09 at 19:58 +0800, Potin Lai wrote:
> Backport ltc4286 and ltc4287 driver support to openbmc linux.
>=20
> LORE Link: https://lore.kernel.org/all/20231123015440.199822-1-Delphine_C=
C_Chiu@Wiwynn.com/
>=20
> Delphine CC Chiu (2):
>   dt-bindings: hwmon: Add lltc ltc4286 driver bindings
>   hwmon: pmbus: Add ltc4286 driver
>=20
>  .../bindings/hwmon/lltc,ltc4286.yaml          |  50 +++++
>  Documentation/hwmon/index.rst                 |   1 +
>  Documentation/hwmon/ltc4286.rst               |  95 ++++++++++
>  MAINTAINERS                                   |  10 +
>  drivers/hwmon/pmbus/Kconfig                   |  10 +
>  drivers/hwmon/pmbus/Makefile                  |   1 +
>  drivers/hwmon/pmbus/ltc4286.c                 | 176 ++++++++++++++++++
>  7 files changed, 343 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.=
yaml
>  create mode 100644 Documentation/hwmon/ltc4286.rst
>  create mode 100644 drivers/hwmon/pmbus/ltc4286.c
>=20

Thanks Potin. I've backported these into openbmc/linux dev-6.6 from
upstream directly, along with some subsequent cleanups.

Andrew

