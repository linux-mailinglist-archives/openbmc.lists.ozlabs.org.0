Return-Path: <openbmc+bounces-26-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6EAABA10
	for <lists+openbmc@lfdr.de>; Tue,  6 May 2025 09:11:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zs8hp68r6z2yZS;
	Tue,  6 May 2025 17:11:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746515514;
	cv=none; b=N7REmGAo8AeunUo23qopJTYAWf40QEF8pImzW0Vag+9+ZQxZRQ/6xd3GzFcRmvsFmWJh+5nl9EkZ75ILurjKCLnnefFhItTkCKdqoijwPt8YT/Qej46fYJs2cw3rBfn57Y1UVWVoqztysUsJ+Lhsq8y0Oql7sk1dTqQ0gq7wA338F/VNU4gg+7IpnqEnQMcgF3VE2+0pKFpqmqfwADHLc3l4xoWNnsrXm7TyiiPZN78Eii4pTl5Ly/v4fHMgXd3mn/AvJ9Da974+IZBCEFBhPYG6Qg5eSiw/sI+W8e6YZ0DlacwQr5gDxF254jrPhXUM7mcTON6qh1lJ1YotFD1Hxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746515514; c=relaxed/relaxed;
	bh=aJdWD+enchej4gwEv0/Rrv2m9mTWicyRJ70QrCUei8g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OFRRABi78Ij24/Nb5VGebph4Eg9F4FurW8JkFv4Q9FjSx+i5H+qHH4089HfOQ03Ssg8WQl4wH2F0evDDHm7R6PXXbq32N5tpA1ZR9sCncPwGI/B8o5cH1feXJCTFK2lOIm7pMj4Rgw1+gWAPqBlexrVbBJn2obdBrtKso+t1rRm7j+Z3rZiE0N4J+Xz6sWCcAUhGBZ7G6oKY1FAjGwWmqsSbowF6I9WoBODNSpGXHHP0UL3CjADWXpGOxaU4MptluF2WM3z+CIUhPnEn63vVvo3b/6qyC2v9UyVxvT0R1brAYYw5neMNHnY4sAOnDAy+oFK1nciIAscdyUdgJXtG5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AKoWyVww; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=AKoWyVww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zs8hm43VNz2yYq
	for <openbmc@lists.ozlabs.org>; Tue,  6 May 2025 17:11:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746515510;
	bh=aJdWD+enchej4gwEv0/Rrv2m9mTWicyRJ70QrCUei8g=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=AKoWyVww6/24ptY0BcGQlNvmhG5R8k12/tas3wJyV0BD7tkUYHsFuaiTwCPPSfrPF
	 tvXHvd5rnQoNlwaymnxlKMXuITXlQSvoTIn9UdS/zqKhfWH7OtX/9+paotVtIAjhte
	 IaRFjpehf/A+UnfXDi4tHOZ87/f+kE8Eit1pSCCcMJqfkISNnHzxOerBBHhVVp0Qa5
	 tDiIBV17DhEemAW0dfT4wUmvCFQq7mxGQVT2UaSSW9CYrglqmfoxkk6neVxPPzVbzn
	 kewZZQMjLVthvfIfzBy+38rpeYEjpvi+pKmO4l9yy+hGjNFuj2v4Haa64D3FX6Ikzd
	 xGgGXaWZ4CF9Q==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3FBBD7576E;
	Tue,  6 May 2025 15:11:49 +0800 (AWST)
Message-ID: <a57c7a15a49884ea3b6456e828c4fdf272dcec9a.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/3] Backport MCTP Over USB Binding
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Santosh Puranik
	 <santosh.puranik.ibm@gmail.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Tue, 06 May 2025 16:41:48 +0930
In-Reply-To: <db114c381d4f3c37b50fd66bb934e9b8c2008e16.camel@codeconstruct.com.au>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
	 <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
	 <db114c381d4f3c37b50fd66bb934e9b8c2008e16.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Wed, 2025-04-30 at 11:58 +0800, Andrew Jeffery wrote:
> On Mon, 2025-04-28 at 09:43 +0800, Jeremy Kerr wrote:
> > Hi Santosh,
> >=20
> > > This series backports the MCTP over USB binding driver and associated
> > > definitions.
> > >=20
> > > Patches 1 and 2 were cherry-picked from upstream linux master and
> > > patch 3 includes fixes needed to backport the binding to 6.6.
> >=20
> > We'll want to have f5d83cf0eeb9 ("net: mctp: unshare packets when
> > reassembling") included too:
> >=20
> > =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/net/mctp?id=3Df5d83cf0eeb90fade4d5c4d17d24b8bee9ceeecc
> >=20
> > - that should come from the 6.6 stable updates, but doesn't look like i=
t
> > has hit the openbmc tree yet. Could just be a matter of sequencing vs.
> > that update, or you could include explicitly.
> >=20
> > (Andrew or Joel may have opinions one way or the other)
>=20
> I can take care of it: There are some other related changes that need
> backporting as well as they haven't come in via the stable trees (I've
> just pushed recipe bumps integrating v6.6.88 for openbmc/linux).

I've backported several fixes now, including the one above:

- https://gerrit.openbmc.org/c/openbmc/openbmc/+/80040
- https://gerrit.openbmc.org/c/openbmc/openbmc/+/80041

Santosh: Feel free to rebase your series and re-send it after
addressing Jeremy's concerns.

Andrew

