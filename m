Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B165858D952
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 15:23:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2DKK4P3nz3bc5
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 23:23:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=RXmsUL7q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=2607:f0b0:f:3:216:3eff:fe7c:d1f3; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha1 header.s=mail header.b=RXmsUL7q;
	dkim-atps=neutral
X-Greylist: delayed 354 seconds by postgrey-1.36 at boromir; Tue, 09 Aug 2022 23:22:57 AEST
Received: from tuna.sandelman.ca (tuna.sandelman.ca [IPv6:2607:f0b0:f:3:216:3eff:fe7c:d1f3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2DJx0kFKz2xGK
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 23:22:56 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id F218F18A6D
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 09:36:02 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9_Zv7pi-KPVd for <openbmc@lists.ozlabs.org>;
	Tue,  9 Aug 2022 09:36:00 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [209.87.249.21])
	by tuna.sandelman.ca (Postfix) with ESMTP id B43A418A5D
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 09:35:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sandelman.ca; s=mail;
	t=1660052159; bh=8oTG0wA2ycN/OV3RXKp00pzRUFs4arR9cQTEAz8tjDY=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=RXmsUL7q8990QBu0KcJTGjpxKQ47kJSg4UacXDgj5wlI/m7mLAg1naG1/OAZUE76d
	 Nh0nEslVJHcsh14JZ21y031LjYUattRZXfDfM3p7Sz65M9f5heVARzfFjJPgTDf2Wx
	 wRvH5A3GZPaxjuFo7n4yF1KbPeflAHl4A0Iu4CyRMnPO1rD4bQmbrvdhPptev94IV5
	 xEYaDjie7s1iMBPMqAi578JkkxEWQ2LGvkVj7cMwzQxPGE4D0OK57MxXmoMNbNV5LP
	 dgiBZapknAlrtDsaw+Ypq2jpB0sTyKNIdtpATH2t7pgRYGWryYcSzy8rf5iNw+fiwb
	 c5rLJW+Xgu9BA==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id D18EA45B
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 09:16:52 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: openbmc@lists.ozlabs.org
Subject: Re: Referencing non-public datasheets in commit messages (was: [PATCH v12 3/3] EDAC: nuvoton: Add NPCM memory controller driver)
In-Reply-To: <6d1576c9-f105-2aff-4497-2c2e7bed2f3b@molgen.mpg.de>
References: <20220610084340.2268-1-ctcchien@nuvoton.com> <20220610084340.2268-4-ctcchien@nuvoton.com> <YrDIimW0gW1j03WG@zn.tnic> <6d1576c9-f105-2aff-4497-2c2e7bed2f3b@molgen.mpg.de>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 09 Aug 2022 09:16:52 -0400
Message-ID: <28431.1660051012@localhost>
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


If I need the datasheet, and I need to sign an NDA for it, then it's really
useful if I know *precisely* which datasheet I want, and to be sure that the
NDA actually covers that datasheet.   So knowing the exact details really
helps.


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmLyXkQRHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WVbNggAjEnmGzub4g8qfes445Hlf0AeKR+KszWX
VxF/0Hayixu18M/Vt7al6rtNFQjkcibDDU4CwuVwffPcagFq/13N7TCxBU2e3jnP
E0l+XiJFTulFlmc1Rf006A6xJFS83X0gFAg2f3XxxiayCS0BzsSmveW7IVUR/S1Y
Kxj0ema1T59F4yMtChjYE5FWazzZxksT2QgAnASTAz5wxetM1oNaTbwBjO+FLrJK
cpmhKBgvUBGw/QACUBeo2wYD47MTwghdKNAKDk8hF7IuMTCyWAwa0n2Aek5LYrBY
Mq+OtspzEWI1Z6hG0DsseC94N+n3UPh17C8a6X3drUzwNMo+RHBsCw==
=ofXy
-----END PGP SIGNATURE-----
--=-=-=--
