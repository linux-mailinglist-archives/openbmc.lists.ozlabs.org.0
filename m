Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFB3493E03
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 17:11:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jf9ch58HSz3bP1
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 03:11:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=i7WJSqgp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca;
 envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256
 header.s=mail header.b=i7WJSqgp; dkim-atps=neutral
X-Greylist: delayed 607 seconds by postgrey-1.36 at boromir;
 Thu, 20 Jan 2022 03:11:08 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jf9cD2Mqvz2yMt
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 03:11:07 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by tuna.sandelman.ca (Postfix) with ESMTP id 9BF7B38DDB;
 Wed, 19 Jan 2022 11:07:16 -0500 (EST)
Received: from tuna.sandelman.ca ([127.0.0.1])
 by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id MTcbHvJM498T; Wed, 19 Jan 2022 11:07:12 -0500 (EST)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
 by tuna.sandelman.ca (Postfix) with ESMTP id 7B8B738DDA;
 Wed, 19 Jan 2022 11:07:12 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sandelman.ca; s=mail;
 t=1642608432; bh=/pNvWqwtkogEZ9uux5UMHJcspMrtoggA1f6nWSplX8Q=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=i7WJSqgp32Lef6xjMcxaLYA3kv3SEJdnGFDBwSINNLJ8jitfORoBA2Z7grIWmXZIu
 QyUcJh2k7X2VaQ3phWWuLPhFKU+Bqcragdb4CXJdeNkufO0ekLzBLRxeaadEF4JQWl
 1wzQKQH3atfCQt+CskIHBYCTzGUx5N4expRfW1dS4ESWS14VjBAkYJqg9bJh3w/ctX
 ME+IkUp0ERN6lGHzL13qIZqo1Usweofkztl6xg/FHpEiy9ksG7B2MeFZpIz5aDAQ8v
 B6m0ueJ2xg7xtFkti4WynJoWYrGsYYHGD3EfJgpNJBq/pXxbUYxR6UExUAqY7PGUuT
 lv1w23rmFRTJA==
Received: from localhost (localhost [IPv6:::1])
 by sandelman.ca (Postfix) with ESMTP id F40CD2A7;
 Wed, 19 Jan 2022 11:00:49 -0500 (EST)
From: Michael Richardson <mcr@sandelman.ca>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday January 19
In-Reply-To: <c8c1bdcb-bf8a-c266-53c2-51f53fbe44ea@linux.ibm.com>
References: <c8c1bdcb-bf8a-c266-53c2-51f53fbe44ea@linux.ibm.com>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 26.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;
 <'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 19 Jan 2022 11:00:49 -0500
Message-ID: <2307.1642608049@localhost>
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


Joseph Reynolds <jrey@linux.ibm.com> wrote:
    > We'll discuss the following items on the agenda
    > <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>,
    > and anything else that comes up:

I went through the effort to become a CNA for tcpdump.org.
Lots of stupid marketing overhead as mitre thinks they need to tell your
marketing people what it's about :-(

It took me many tries to generate a valid JSON file for my CVE reports, but I
did finally get it.  Unicast me when you get there if you need help.

--
]               Never tell me the odds!                 | ipv6 mesh networks [
]   Michael Richardson, Sandelman Software Works        |    IoT architect   [
]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rails    [


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iPMEAQEKAB0WIQSk7ZHEG9TCGBNASfm/sjw/rPYc8wUCYeg1sQAKCRC/sjw/rPYc
85WyBf92hD3v0sIbSBUaV2X+8F0cvbsNe8e6Qst53P8XP24yceh3Vdcglc6vnThr
VSDMP8VSVLYsdtnJCMk/ABPDkQQnlgMfVEbxNXebLE2CucSlhmVJil7GgBpFMplE
b/k516y5PeWsaI2p6RDvwIBEIohvA6gbVgGpAyX5/SLER++NDUv/2MWxxkZgU192
eVba901jx12O6BECAtLfQyrezt+3LWVdq7OvIvZ9HfKjdCa73iw8EfB4ItLVkm3T
W52Kua8=
=ls9l
-----END PGP SIGNATURE-----
--=-=-=--
