Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1A95AA178
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 23:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJYtx4wdmz2xGf
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 07:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=ezStvnDr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=ezStvnDr;
	dkim-atps=neutral
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJYtW0D6Hz2xZw
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 07:23:14 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id A564C1825C;
	Thu,  1 Sep 2022 17:43:34 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QlMzp8s6HM6H; Thu,  1 Sep 2022 17:43:33 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
	by tuna.sandelman.ca (Postfix) with ESMTP id A2EBD18046;
	Thu,  1 Sep 2022 17:43:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sandelman.ca; s=mail;
	t=1662068613; bh=Wn1xIFVcKAK4YpzDp4i76FMT40lWIVnlD62nUYwxHHs=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=ezStvnDr2wuyTJLqaNUqdsuvzDnpuE+y2UBT96oBr+j+802vA21rmDdf5yQ3vDWkM
	 E30KoPIlBw2ELlJZYpJOIrlRzrYp4nOcqUw21AHxeCDuvTv5gSLW/vENMggzZ8WQdL
	 lyGEBPKrtvowMwSeX7zPRmHq5pdqA9FGDoIVSR4j1a5xROZZg9IT55F/pScWrOqgOx
	 9dKT9W7LXp9gkau7A2qS4KpiW7atgfkA4UwrZ39pt11goqlLSxO4B21O1HQUBPCSmM
	 aeIPYRRsr1lMCuMeLe60evbNZxnN49qQEbHuzlEboJ9Hz2HOrFhS/dM+RMgb4H4H94
	 SeTS45agprBEA==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id 75E0D551;
	Thu,  1 Sep 2022 17:23:01 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Patrick Williams <patrick@stwcx.xyz>,
    Joseph Reynolds <jrey@linux.ibm.com>,
    openbmc <openbmc@lists.ozlabs.org>, "mail@thson.de" <mail@thson.de>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
In-Reply-To: <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com> <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com> <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 01 Sep 2022 17:23:01 -0400
Message-ID: <16276.1662067381@localhost>
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


My understanding is that keylime is being rewritten in Rust.
(but, it was a comment made in possing, which maybe I misunderstood)

{Also IETF RATS Architecture editor...}

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmMRIrURHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WUCzwf/dStRkniXbLiTvdqKJtSl0jhk9YCJu8jh
QsqVTwZHw7gz+1Z4YTj7MWccbMQIw4+MxGLXykYyF4ITJY3sLUu1geI3rfRjWt/c
fkniboYGHJLLK2IRf1VifeHP2cdXnta+NFeaKmK50slfMJWJ7g6ve85oisJ0vyZa
rDY7EMLL3rueK9RMHP/lgYYXnBc1BZ4GektIC16FPG5Nuce+otghwz3CnFwuDU2g
cVmh7ajRCgRDLKvp6Jg/UfrZDdtwIls4X3HJfQiW+CjOZyC6W7/TBMhzBYL6MczT
W9NmySr2l1E6EdIWxAm3UPHT8KgeuzkpLkW4i+jRlinkP1OeO2eMrw==
=A2bX
-----END PGP SIGNATURE-----
--=-=-=--
