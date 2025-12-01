Return-Path: <openbmc+bounces-956-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A4DC99948
	for <lists+openbmc@lfdr.de>; Tue, 02 Dec 2025 00:24:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dL0NW4nVgz30YZ;
	Tue, 02 Dec 2025 10:24:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764631467;
	cv=none; b=U+7y5IA1rmbwYNOMQv85x8sAMcCDvD7vql0ThtM8dSa4AvGoym2UEWu7XbfnsGcxY5QJ45A7KXhZA5mBFi3Lg4Z2Td/ULnxPHM6EfL5ztuUyD6Ve5CAOYyyScKluz7/Wz2U/o9TGgto78l4ex3WtD9LLHaGEoj8sWhy3JW2o+Fwatu4swUj6PCZrFZTiNukDJIksl5qrzVQkQuUzTMOEHJlFYMTXuzdpTqLXu1aWRJGJkHanFHyEBr/b+IBT6jvpToxzxS9lsCFLCq+FbkFYdclcveb4jmuo7Q8oDwgxzOexaXS6GxslcQlPHTDY4oqWE6AEcDIEJ7MgyyUr325clA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764631467; c=relaxed/relaxed;
	bh=32z3Fnar6DOpzeo43tQ+e60Vac+frcVlWp7nftSbSdw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gAfzgmssMmbj5mvWh/JNHjh1MM/Baa6Mxk/Qa4JEn/5moAJTw7WxVzXn9PXnRoVxHpijnKCgOE6F4pJcdsB+YpOLqo955MA1aEAtZuQYlVDnL1m81TQVPJrkPgCKaUCC7mxbPjmDyf/kYlcgv7lrkR6oPwdorZX7q2GM9jm3TkE/0Se6Vg3WMOy3wJ2QEyyaE7LVaJ3jhpu8GvSDZzOKVJN07JUrZwSh5dMf4pGO0xJaQ/L4Vov4UH34xDeqiEeB+II4GQEyevT7NxMxx+FQsFnvBPz0DeJSqF6e+sL8JP+2F1dXGt1DcPVjNWXLUf3dHBrhw6LNReuRfDSJk4eAhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CRJZz3wX; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CRJZz3wX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dL0NV61mPz30Vn
	for <openbmc@lists.ozlabs.org>; Tue, 02 Dec 2025 10:24:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764631466;
	bh=32z3Fnar6DOpzeo43tQ+e60Vac+frcVlWp7nftSbSdw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CRJZz3wX15BHjTcFTIf6iN/g2bJYaTE+ebs8jiK9aNTFIQCSYK316GkiRBw24uV3Z
	 l43vxhArLPNHYvcT1DM4xNio+dVovdBORKfo4S/riyAWOw1O7LEPYAGBEaFP6C1qJv
	 N928Q62gCPr9p4v1j8d4Ars0059L2ICfmGUqEbOlF5IhO68UOfgxEYfJWmKLMllUNJ
	 0BZV2WTJha0KyYkNJnSxsVTL2LM7JKJlUIQFZdAKryRBcBJinX+uvuI2Tj+DpO8Rqt
	 QmjbE1G2xUs5FV3QsAlXfkFmhGTP+mLQ7lJ+azhZbmjodgn6lsQTuSJkWBoRW9kndC
	 fa67sQTFr6PDQ==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 046EA6472E;
	Tue,  2 Dec 2025 07:24:25 +0800 (AWST)
Message-ID: <8ec00dc3dfdf32edcd86ca007a596eb43acb66de.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot 0/2] aspeed: Add support for msx4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Eddie James
 <eajames@linux.ibm.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Tue, 02 Dec 2025 09:54:25 +1030
In-Reply-To: <aSZVxjFQ0+pqc/hq@molberding.nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
	 <127d5cd2b57bfd88402a27e5e03ac807d115c2cf.camel@codeconstruct.com.au>
	 <aSZVxjFQ0+pqc/hq@molberding.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-11-25 at 17:20 -0800, Marc Olberding wrote:
> On Wed, Nov 26, 2025 at 10:52:51AM +1030, Andrew Jeffery wrote:
> > Hi Marc,
> Hi Andrew
> > On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> > > Add a board file and dts for msx4. the board file is required
> > > as the BMC is strapped for ABR boot support, and this functionality
> > > isn't desired as support in linux is lacking.
> > >=20
> >=20
> > Can you expand on this? What's missing?
>=20
> As far as I could tell, support to pet and eventually disable the FMC_WDT=
2
> doesn't exist in the linux kernel (I'm happy to be wrong, I'm not in love=
 with this workaround)
>=20
> So when the 2600 is strapped for dual SPI ABR, we just end up boot loopin=
g
> between the two spi flashes, since no one pets the wdt.
>=20
> This patch just disables this support altogether.

Hmm, yeah, I think I recall disabling it in a u-boot environment script
back at IBM. Maybe Eddie can track down whether that's still the case.

Andrew

