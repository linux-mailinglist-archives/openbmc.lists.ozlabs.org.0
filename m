Return-Path: <openbmc+bounces-308-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB21AF0844
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 04:06:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bX3Ch4F6tz2xlQ;
	Wed,  2 Jul 2025 12:06:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751420988;
	cv=none; b=GLcSvDCAcny4+7LjX715m9ckuOdNSItrWBwaqGcZ7lQmJzR1rPhyghlXcQlxJu0XYkYqGOIu6WN1FavZJAcj24r0Fb/bWFBpeSiPtSgJ1O8vFAmj1gDe21Id/n0pMMiBbUJbjDph4LBWyQ0E/6Q0zFVCAicWCKgtLCWFHY5zNxYDVfzfoe1xUFDRVL1nEuxQBBC+S+737SJnrUNUKtfE+K1BWDmi1dF7Po/4URZncYzyEfwGjFCOBcHkAMraI5mCa6xYXMbh07qKnuU9j5ngG5Xv9cMmFbXiADY8gB/RSejxmMNWYfv033vDetYZ5FTvAQVNCp4xcZ8MhscGghbj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751420988; c=relaxed/relaxed;
	bh=VXy2MXucUAwAMgC5dNJmBFgEBpE/G+rOGr+3LXVk6aI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RAfqtnN32zNe4TimHCHZw9sTtI7v+3H6NO0nVKjFoVOcIbEw2T6XZ1vau5NsiSxR8gKHlT66hxVV4hJ94ifmgfaoUxKfyAWOSWUC/XYB2Tc4EqGQ4eclQhQb9PuX+9OwXXz+sPgc573bvdgujv+dY+eT4BrBBxiEcCaytltWKVRf+cLxSemEX5FI98Hk9Hqc/AqaqQYhXcb0NWTw6bc7bR0zwarQHwvfsS9zUVEZJI5ZvPmy84nOahHQfLjLqOMrnHLE/sgJCCepPNHci49thmPxfiOADek6u7o/jnoIeykOpdFBfxFh9r9AZbCLEgHxwKkWmIS+9cXmUoTDlfSfFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=iXCwWXhA; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=iXCwWXhA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bX2rp4RBLz2ypV;
	Wed,  2 Jul 2025 11:49:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751420970;
	bh=VXy2MXucUAwAMgC5dNJmBFgEBpE/G+rOGr+3LXVk6aI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iXCwWXhAX7kvp+WmecSmDvMABSElLwxyLBGeKfv2dDg1Gcgpfj5hKrSnmws6ZLb1R
	 DABcqEU0X7HWj/7ljISDwX0L5ZCQnOGNdM3C9FjhbVREbzawRplseisvHGhBEEroBN
	 QJzxvUWj2UNlZns1FvY8CVwUs7vXTi8vvTWBAafQRd7qVQbJpILrKtllUu7jqeKJf9
	 7gNYgrYkn91JxlEENNexeNZ2ALl920WNEwNikaLvF8ZFhp57LIOzm9mxDbtptBT+N1
	 aWVBT2VI1buaPvqQXHxKdYIY/N2FR2/Yy9rcdxUbL5P3z8F8gqIQJgJMLAjVRbJBPn
	 lbHYYp+9BsI3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX2rT6Qxqz4wcZ;
	Wed,  2 Jul 2025 11:49:29 +1000 (AEST)
Date: Wed, 2 Jul 2025 11:49:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702114941.5bfe1e5a@canb.auug.org.au>
In-Reply-To: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
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
Content-Type: multipart/signed; boundary="Sig_/olnj4gvN==N6hy44f10+yNA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> Could you add the following to linux-next?
>=20
>    Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
>    Branch: for-next
>=20
> This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
>=20
> https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@co=
deconstruct.com.au/

So, does this replace the aspeed tree
(git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
for-next)?  Or sit along side it?

Either way, who should be the contact(s) for this tree?

--=20
Cheers,
Stephen Rothwell

--Sig_/olnj4gvN==N6hy44f10+yNA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkkDUACgkQAVBC80lX
0GxEeAf9GBf7tmaV5IVqLypKCi0Vd0YU0OiupwyekgLXR6FnI/jA2pB5AbHCe5mt
sKYyqctFxEMqPaS3x5GZXHMea/kJ899u+RbkhQNUwGHIf94SJfkhatNbvDveAZzD
LfQWG8VIwar6MCP/wH8LH4q10lMRaZPGHTf//iLr+rSPyhOKCTmXYEh3IhWa55ZF
pEQ7TeOyXnd0PZIKcTmpuq95fKJyV9UX5W08XXHC4crCLitT1mNA4ydgwwpS+eRk
WEr2keM3r/9RyShdN02dTkgzH2b/YJ8X1LjSMJyM/o3EjNbuv7+CcZQlgK8Flo4B
0Jf0++FNkD8ktwVo1JPp4Ir+815Cbw==
=pNgw
-----END PGP SIGNATURE-----

--Sig_/olnj4gvN==N6hy44f10+yNA--

