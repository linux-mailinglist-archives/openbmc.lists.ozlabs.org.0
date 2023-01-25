Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A42D67BADF
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 20:33:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2DX81rn6z3cgt
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 06:33:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=b1zriPAB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=b1zriPAB;
	dkim-atps=neutral
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2DWW5D0Fz3cH1
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 06:32:38 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id C270B38990;
	Wed, 25 Jan 2023 15:02:07 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id utNAmPBn3VlU; Wed, 25 Jan 2023 15:02:07 -0500 (EST)
Received: from sandelman.ca (unknown [IPv6:2607:f0b0:f:2:56b2:3ff:fe0b:d84])
	by tuna.sandelman.ca (Postfix) with ESMTP id 2319A3898F;
	Wed, 25 Jan 2023 15:02:07 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
	s=mail; t=1674676927;
	bh=M7qMHV5S8Vl5/Jr8g9orBwq7trJP/rE2pklzM8FyWAQ=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=b1zriPAB2ylRuB8t3XsngOVsJ1dzgPZmHrZD0eTkCpHqTCdtQBgomMZqjirfrArQ2
	 hOFR4F1o9SDvzK576C6qawOoAr3nBenlrrTetWiploNOWwLmzNnrAsrJciPx73V9wP
	 IzMPmj/apUBCYM1SXCvGvEfFGZ7IYATWRfYjfALOauqDnt0+9PKPYKhEXKESp+i7im
	 yA5w7gK0lku3YvrjY/bW0KO1TGF4DUtWiJbCPotiCTWsYQ5pfSTkv8/LM650xcQWl9
	 4+AmNV6UmhdGwv9hqqObA5wZElKa525sMqdpfpiDxy1oGmfc1N2aSTB69Hlo6Pq9Sa
	 8YGyPY/bDBCbg==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id 2488E504;
	Wed, 25 Jan 2023 14:32:31 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org,
    joel@jms.id.au
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] ast2600: Measure the boot
In-Reply-To: <20230125173025.3725606-5-eajames@linux.ibm.com>
References: <20230125173025.3725606-1-eajames@linux.ibm.com> <20230125173025.3725606-5-eajames@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 25 Jan 2023 14:32:31 -0500
Message-ID: <14591.1674675151@localhost>
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

--=-=-=
Content-Type: text/plain


Will you be doing an upstream PR of this great TPM code to u-boot itself?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmPRg84RHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WWZKQf8DYKdHk3JQ6DVkpZvIAU91uZbFF297aA9
CxdXNKhrJTvi2vFr7cjopkxkAvARGGUhU/SzAnVvnpC8DZRTmtL8qL8kfnrCz2wA
knxnJsXGS5bVLt2pmD3S8K2Mp0j83LEZ65nDlhYNINSF9ANmnswq3bYPkQUPFGNI
2kDlZhzgVkNmZm1EfnmeEujMHAilpRZFPqtjQS8lA7yTULfbLs9n66hb4/9e8X3/
HSVhm12hDXWIuvpfkQ6oLR1966/L//cTkqkKseaOcX3X+giDlPtuNq+fLT5u6MN3
eQ+anHN1qEKVatF9/k+h1BRHdFhe8Nu/nZLqTzvCV/1PYUzJh9IHrQ==
=AHTG
-----END PGP SIGNATURE-----
--=-=-=--
