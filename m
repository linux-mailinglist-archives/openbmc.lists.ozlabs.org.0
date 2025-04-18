Return-Path: <openbmc+bounces-1-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91AA92F76
	for <lists+openbmc@lfdr.de>; Fri, 18 Apr 2025 03:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1744940721;
	bh=d3aUUpSaBSsUB6dgzk6uB7fWSEqOI1hvAL3qzun9RPM=;
	h=Date:From:To:Subject:List-Id:List-Help:List-Owner:List-Post:
	 List-Subscribe:List-Unsubscribe:From;
	b=mqAKsNv8dNCm7Z8BxANjD+vSxE9I2lNufqx+P6gyM6EGPQIivVxBRruHvPTCiV/uk
	 u2Ppsl8FXYRuhfodztmkN0lz182vN27gAZGFpceQZj61AyYoxDoUADa4aS4zgiLHwA
	 hOMIE8Yi7vGMurPGpPoZqvmfQ3nbGpIWXD04MabXWCmTQrleSSbocIqmVBjFlQn5K2
	 EiK/skKmPfHiWT4XtPXX1wEJw2wb/B1EjY13dGZpxa/FZFo1ufeHgmTTZFcWbmMjHU
	 xaiQ1KUbNDGcs95MHS6jkCB1r/J182BpQF1bZ2RaUWDnk9nJmRZFskbqfZULJbkPJC
	 qPD8Bckry+/GA==
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdyJK2L3rz3bsS;
	Fri, 18 Apr 2025 11:45:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744940721;
	cv=none; b=izu4HMZaiWb19ACBmLg9+0qeQl4SNbD/qwjR+W+CcF/49pYm/idUPIydI7kKM+rUbX+rEw1eDgEwkRRT0Ywb5cTfRM4iuDVmwGtn6xOtjyMuyos0pXKvqQAYaZTHO9jrbxRl1JFCgJayuFbKbRQ2IEwHA+xbkKmp4L8VH7tNpFoGwArKNPWCjrLlOuvhCmnKUXW3cpRK6kdlOF+8tAYf75tIE9rYL/CBB3q3Pxnzp0RfP5t38Ma3hNDVWzrcWwZhfesZJabd0901TypZRt3nCG9fpf2qjj2x2m3xeSilKgnT5SGKQCRkUsrYAmuDsbHNH2H+G8D2q4Z5nkk4/vwuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744940721; c=relaxed/relaxed;
	bh=d3aUUpSaBSsUB6dgzk6uB7fWSEqOI1hvAL3qzun9RPM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=d5gwTI3AiaXV7sSYXc6ypAuIUgUVjhTLXBoJ+ovpdCXxHCp3lRG904Yy08hP0SP9mbhBp9g/Uvyzmt+dH55j5D4QYb8nry8Zj/0QxWGgd2ahXgKj/iqW8dWAy7GrnZvrOZ8z/iUsN8K23W9rKb0T9AtVeJUXvYwCnaIQOLKaBIU0IqHzf+lPC1exsmozTS/tMDRfPVyqpbOxrycTRqj80r7gVjR15KHz3XFI9gk2cuhg/SQNNIu0mjPAvm4jw/pyjXaGKcktsw1oGedToMlIKTO9o/Y1siKWHNPmqkid/BqIjZeF4G/0JXMFGEV6Mcnyl5bVoUnaVUWBL5dJLJPRDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lists.ozlabs.org; dkim=pass (2048-bit key; secure) header.d=lists.ozlabs.org header.i=@lists.ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IFeYCdCU; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=postmaster@lists.ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=lists.ozlabs.org header.i=@lists.ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IFeYCdCU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lists.ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=postmaster@lists.ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdyJH6zK3z2ylr
	for <openbmc@lists.ozlabs.org>; Fri, 18 Apr 2025 11:45:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1744940714;
	bh=d3aUUpSaBSsUB6dgzk6uB7fWSEqOI1hvAL3qzun9RPM=;
	h=Date:From:To:Subject:From;
	b=IFeYCdCURcM8hJG6X8gmlF5SjrLiBfsra9B9gK9mhPbM709WaK0iJHBLSst8bqs64
	 MvuKnv4Rt5tzTXfwOJKP5uCMwKwl1pgn5tLeYaa7j2umuRE1y20m+7dYj4Woi+zmXZ
	 GxzFGcYg7mQnFCJSjA6+Am8IJgZaXMUiJ2YeaOpe/U0KF92KCWsnPdaPl1fk7ei0zq
	 G5yDKiD/BoTTz8D3GgTQYbwCj6tsZUMqtn7t7VCc4HSKMGtqEzxl/FL/EEFTE8QY7z
	 gZIFXyteX8YyzxCzL8R+QvOaMXBzBOid1yo3y6E+9Oav/iz/mBt5F7uXwn6FuFYHRY
	 0RBTIGHNy01mA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdyJB5nNMz4x2c
	for <openbmc@lists.ozlabs.org>; Fri, 18 Apr 2025 11:45:14 +1000 (AEST)
Date: Fri, 18 Apr 2025 11:45:13 +1000
From: Postmaster <postmaster@lists.ozlabs.org>
To: <openbmc@lists.ozlabs.org>
Subject: Change to this list
Message-ID: <20250418114513.5359c47e@canb.auug.org.au>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/39fL.dVllwQ40J+b3hpgcae";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/39fL.dVllwQ40J+b3hpgcae
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just to let you know that this list is now managed using Mlmmj rather
than Mailman.  To see how to manage your subscription, please send an
email to <openbmc+help@lists.ozlabs.org>.  The archives are still
available at http://lists.ozlabs.org/pipermail/openbmc and
https://lore.kernel.org/openbmc/ .

--=20
Cheers,
Stephen Rothwell	Postmaster at lists.ozlabs.org

--Sig_/39fL.dVllwQ40J+b3hpgcae
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgBrqkACgkQAVBC80lX
0GwSgAf/WQgnHV4GC1wkLfQC5TXhre8t2MVds07HiknZ8kx7ljjyD1fCQIFVEim7
Y51YoRg+BkBVqZCaWiYld0TtejdT25JbBaUTvSpTnl7fq87NNOUQBmz4p6tRh9G/
c+B7wg/RRAwDO1pwP/IQTutH/Jniabk84AXJ/T/jhf1wgXQphjXvKzF45j/3gPCC
iKe70urKo55cM/RM2iojKNJhnocGeE97Vf2k0uuuAlRNOm+z7uxhBDHS2vOjEOiM
X7vddFhh6Sguwtv7Lrly6MFOYFlxF13KzCurfKGhIFJptC3KCb7yKfBmbF6UwchI
e/N3IVC68X94w5XxQZcKXvIm/zaodg==
=UKb2
-----END PGP SIGNATURE-----

--Sig_/39fL.dVllwQ40J+b3hpgcae--

