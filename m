Return-Path: <openbmc+bounces-1049-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5CACC72A2
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 11:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWVvW3BS2z2ytT;
	Wed, 17 Dec 2025 21:50:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765968647;
	cv=none; b=Fui1DTAtJ3QnXqYm66tqU/jW1oM0CIpUvSEyXcQ43kiigJJWUlMUj189PsvfveCF8o0qLndZwIJ1jhRe4mtu6+HtGpBQbrRVVkPumiMekApt1Wvt/Te5fTZ6CXxni3JApxYNlTM3CIfBaoGABK0FxbBHR0v0+dVezZ/zTfFsMBJwmmW+rwNkCKUcjY3fUJWVVytP7bkrFuSUS5OJaz5tDs8hTv64XLN9Pvpf2UqZc5q+6SgRpqoDCYha9Z03J+9hDyyDznmxM+pVrXc/UNJZSf7A6NfbMO35xNn//RI2CTmVwJvKVyQYNb6/vNWqYWhez/6dMRDeO+6dDVgBjLbOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765968647; c=relaxed/relaxed;
	bh=QG6DL42LGXoqq8oBgB01PIHZChhehytOVC9XmRS541g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dcnZoS8yUiqNKPpDQNpUp6Os0zY2R/BYguYbF8gN8NGaRWA4N+4oqaHhp7OmWsfbEBd6qR65Hmej+OiKzggumZXfVZy/owYj50/Z7t3NGvq5UCrUWWChP3GocCBw2v9S96MZ7U7/WqOFdcyjCGqWpvlQ5+c7PH8go4hyYF+ORMa/BAcYiwS4+TOSHKdeA1c75/I3JY+pZUgqwBSS7jocRDvQWUVUq4ISUA+weEGyielCz1b9LVSObmSTHZh1VqXsf4r6/bBYDG5Kq/LKCJgGfjPx2map3xyRXmdnRfi4XLX0mNmxE7vTyUt+9IYA/+b0iwB1PBq/iyMH+kLV1Wit4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q+pY9wwh; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Q+pY9wwh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWVvV6rJsz2yrb
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 21:50:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765968646;
	bh=QG6DL42LGXoqq8oBgB01PIHZChhehytOVC9XmRS541g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q+pY9wwh9Su9F7vmk2l+mkw1QFbeRbF4OIRnqnRtf6I/u8nwzJbysigGIwsoNKkFB
	 fqK0pm3uT48GoEqMN+cm0aeYQHol4ukJUuW1YgFYUOuFPad8RbGPtbHhmS1iRU3Tqj
	 1Fb3llHPQj4KgsNLLFsxlVkJ26jZzMmHGgScUZkqKZK116aMlGfEtMc2GhBz8+jUQ3
	 KZmAvRLo5UwlUoOiqWtuXt1oZIcbe0Tc0iyeRFxLTFpDpwcX5J7+ElLCqobdfuuihJ
	 I9NfxKp/RzFCPQcPYIiYc7m2LKE8KGW/eIu8AkLoJp3J6pnmoXrsOskyFc1DIFdpn6
	 OwLOKIvoFePjg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 557447DE46;
	Wed, 17 Dec 2025 18:50:45 +0800 (AWST)
Message-ID: <0d0b4c80905c331d55043b048863c15e416cf4a4.camel@codeconstruct.com.au>
Subject: Re: openbmc/linux dev-6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc <openbmc@lists.ozlabs.org>, Cosmo Chou <chou.cosmo@gmail.com>, 
 Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Leo Yang <Leo-Yang@quantatw.com>,  Peter Yin <peteryin.openbmc@gmail.com>,
 "tomer.maimon" <tomer.maimon@nuvoton.com>, Matt Johnston	
 <matt@codeconstruct.com.au>, Tan Siewert <tan@siewert.io>
Date: Wed, 17 Dec 2025 21:20:44 +1030
In-Reply-To: <CAP6Zq1gh24LcnyZF7yt_TYoBMqj=mnkBcZOzkN1g8qQb0fQ8HA@mail.gmail.com>
References: 
	<4ec04355da4aa5595297f31bdd190d4e2c1f4cb2.camel@codeconstruct.com.au>
	 <CAP6Zq1gh24LcnyZF7yt_TYoBMqj=mnkBcZOzkN1g8qQb0fQ8HA@mail.gmail.com>
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

Hi Tomer,

On Wed, 2025-12-17 at 12:43 +0200, Tomer Maimon wrote:
> Hi Andrew,
>=20
> Thank you very much for pushing dev-6.18 to the OpenBMC Linux kernel
> repository!

No problems :)

>=20
> Do you have an estimate for when the dev-6.18 branch might become the
> default branch for the OpenBMC Linux kernel?

The serious answer is "when we've got consensus from the regular people
that it's a good idea".

Though if those people are quick perhaps we could hit merge as a
holiday celebration.

Andrew

