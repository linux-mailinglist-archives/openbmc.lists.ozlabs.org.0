Return-Path: <openbmc+bounces-1050-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7CCC73D8
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 12:09:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWWJc2kYPz2yv1;
	Wed, 17 Dec 2025 22:09:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765969744;
	cv=none; b=mgqLvVXpuEClUPwfj4EScw6leudSbggCGX4zsuQ4Pxv9iZh/g2OHrl0+8bt3UaPFonBaJNzDx6hgmKNXwTnVtzhcKRXukmAJUEFEbM1XsHdwCCO3JxcKARbowSuy+08K1pgWM0Z+X3gdFg1gRevVfrBXxOPPzUw5v0TuWI3S3tXc0kuwYio+RIrHXdiI7II3fvoYwt+D9AmZs+fvlkHk2+SwdhW97utTNRB1/9qqKJUpFUCPvUPYIePb8gu/EiQHmeuuhYPKNpDihUL1KOvYcMAOHGuCJYaSi74hJ0wgaOmmxml5gV+zuCDbibZWCe/7bBiIHJHnhJzcJ00+YU9FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765969744; c=relaxed/relaxed;
	bh=Zjl3ah3ZMlxbid9kR7SmNyxTEdQUOVD9F+t3RLdk0oI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wo7F/jmt3eamEd44EJkZHwqpjaXwkqwIwO2cc/0/K7NmTNw2ga9oQ586ZSCLBswA3zzDTB2GndteKA7hAvrMAkP87JMINeO5sOpwIaFd7jQgnOWVwCvCABIoxXle3EbgCljtdF+LUQx3czoEOJw0YR/c6dt3pVfXLaKchELvM9qVdVNmwAwP7Ub1HJH7hsOKgltPBrHJHeorMpiHfvZ83Ft5R89EoejYTx6iXlIDwiAS8Y0Iusq2//hHgPIiy5ZEqplrAgAfBQ8P1UYT9ATeKcNm0fvasb5Dw7HKvBhvWQNIelefUMy86yEABa4ODs9EA80I2GaXP6pkD4ZOPBfsUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OPnM7Hux; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OPnM7Hux;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWWJb5LHrz2yv0
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 22:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765969743;
	bh=Zjl3ah3ZMlxbid9kR7SmNyxTEdQUOVD9F+t3RLdk0oI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OPnM7Hux20aXqeC4PX4xZ0PyrceTWVGu3NAEa+TOFECZnxfQP6TvpVc33Xd44Zwuz
	 WMGy56dCFrNzmNSRahzqHq968xpn6rDXAHiT1O1ClBmomNdVa3TlmSvla+i/EFRiT2
	 uEMDoQs7Uka1qwfIqX8DhV3HFZnxAmGWywH3xdn/6jI66rfFeeO1VWq6h5i92Af4TV
	 sAAWPQXKrp+FhwRFQJLaM2nSw7V+GBior2pxQYQxwjiIMAYEyd7xsVtLmV+MrZTV0G
	 Wg+Vh4LL6pFcYzMz8zH+xUzm24F2FJApknXsvv9HMEQPjYx8izPD6hQg/fcm+/xdhM
	 MDqV9MRsu3JKA==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8425E7DE46;
	Wed, 17 Dec 2025 19:09:02 +0800 (AWST)
Message-ID: <7537d63b15688f2d747a4f51569b67c73b23d455.camel@codeconstruct.com.au>
Subject: Re: openbmc/linux dev-6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, Cosmo Chou <chou.cosmo@gmail.com>, 
 Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Leo Yang <Leo-Yang@quantatw.com>,  Peter Yin <peteryin.openbmc@gmail.com>,
 "tomer.maimon" <tomer.maimon@nuvoton.com>, Matt Johnston	
 <matt@codeconstruct.com.au>, Tan Siewert <tan@siewert.io>
Date: Wed, 17 Dec 2025 21:39:02 +1030
In-Reply-To: <0d0b4c80905c331d55043b048863c15e416cf4a4.camel@codeconstruct.com.au>
References: 
	<4ec04355da4aa5595297f31bdd190d4e2c1f4cb2.camel@codeconstruct.com.au>
		 <CAP6Zq1gh24LcnyZF7yt_TYoBMqj=mnkBcZOzkN1g8qQb0fQ8HA@mail.gmail.com>
	 <0d0b4c80905c331d55043b048863c15e416cf4a4.camel@codeconstruct.com.au>
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

On Wed, 2025-12-17 at 21:20 +1030, Andrew Jeffery wrote:
> Hi Tomer,
>=20
> On Wed, 2025-12-17 at 12:43 +0200, Tomer Maimon wrote:
> > Hi Andrew,
> >=20
> > Thank you very much for pushing dev-6.18 to the OpenBMC Linux kernel
> > repository!
>=20
> No problems :)
>=20
> >=20
> > Do you have an estimate for when the dev-6.18 branch might become the
> > default branch for the OpenBMC Linux kernel?
>=20
> The serious answer is "when we've got consensus from the regular people
> that it's a good idea".
>=20
> Though if those people are quick perhaps we could hit merge as a
> holiday celebration.

As an early indication, all changes in the Gerrit topic for the fixes
and recipe bumps have passed CI.

Andrew

