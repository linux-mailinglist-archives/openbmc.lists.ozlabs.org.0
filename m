Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B12A467B93
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 17:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5JR02Qrjz3bWw
	for <lists+openbmc@lfdr.de>; Sat,  4 Dec 2021 03:38:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ArLkupHj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ArLkupHj; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5JQb3Hncz302G
 for <openbmc@lists.ozlabs.org>; Sat,  4 Dec 2021 03:37:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B1BDB8266D;
 Fri,  3 Dec 2021 16:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44260C53FCD;
 Fri,  3 Dec 2021 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638549457;
 bh=RaQUeM5FjKYkPEE/kCPfxJNphXuR9R0Uk5864sf6S2M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ArLkupHjT5pr4EvSwZ2qdKt0GL4gc7v7rXuPWG6a5Fb9+jjIQpKKkCiOHcBLBBIcZ
 oCnb76jPjqlqzYFsFgLQwGb54TrcL6UmNpnqtTqDok2ph0aDpzA+Jm3lhMeO8wIyF9
 LVD0bfQhTY2eDl008epTwItD8C+F0qFbGS3gkXdQyWNqJY42ZkY/ED8pZ71nLwTM2K
 uaJaEyGo3s7Y+9ERKN37+m2lEIUdNmQVNQKiwzTixlkUjx2vlV2j8QPnUeD4jamwfm
 mhIfQdC9rDcf6CBr3iC8xcwjLHDFAyOV1fErsDd3M9yJFteAfAjfG/g2IrhC59pocr
 oldKQ2sS13dZA==
Date: Fri, 3 Dec 2021 17:37:34 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sui Chen <suichen@google.com>
Subject: Re: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
Message-ID: <YapHznDoqJ+wjx8m@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, joel@jms.id.au,
 andrew@aj.id.au, tali.perry1@gmail.com, benjaminfair@google.com,
 krellan@google.com, joe@perches.com
References: <20211203023728.3699610-1-suichen@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LHJ0t05wcta78tCq"
Content-Disposition: inline
In-Reply-To: <20211203023728.3699610-1-suichen@google.com>
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, krellan@google.com,
 joe@perches.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LHJ0t05wcta78tCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 02, 2021 at 06:37:25PM -0800, Sui Chen wrote:
> Add I2C statistics such as Bus Error counts and NACK counts as sysfs
> attributes so they don't need to live in debugfs.

What has changed since v1?

=46rom a glimpse, none of my questions to v1 have been answered or
addressed?


--LHJ0t05wcta78tCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGqR8oACgkQFA3kzBSg
KbbJUQ/9FR9iFKVBIJx91SD9MXVjmtU8xgFUs8hXfXmN6gNe9QnzRtcO4qas2tKI
Flxo3yz9ocPpH/Gb3SG1Kwdv9Jze5gOL1nLrml8zVUiJa3JsrnQmqQVSZOpPLcpE
H/yKLGu1FH4ALjSAsg6tJKyc1JJqdbhBqqhWCQXTjB1RNN7FpNzy1RlxwsKUNF47
ZKMJ3A7ADX+wNpRAQg/k3UFkN5kNcGyuRhHg+4hQyySjrxaraaAZBOhjLiiAtTuj
ahkNbwvUHnZeO694UMK/0/xQAEGzgan4ryrNo32I8nautczhk9DWPLTxVJIfOh4a
3bhjhtBVo7EQ1wM64jH0cp2lvJ6588syqk7+rI207YBa9zIkZTjuH4w/9678pinX
Rpbwpn1M/nQpdjds55QGYaSVMbzGoQRh25PN4xHkyynRAd37aOdUp2JCMgqcqLoC
s9fTyXDEzwDiZEKKM5uG9+JmQQjiMZ4dhdk9D/DY+36mfQ10Rw3W9QeJ0JGqYTCW
h7aswLDb1Q+PuwEKnlAC2pe1g6bIA5igjcPGdMBi6B7zpQXGyKJP12TlPpTex4s8
GTGqHx2zIP0mGgrLzfRl0M2RZddiDPSAhGVMoa0lq/EXRN4Qqse59VdJZCB814tC
TCG9sBXqMFbuFvwQOzOfiyjQoyN/6Fs850U4EJfTjMMAohnn9iY=
=LdTx
-----END PGP SIGNATURE-----

--LHJ0t05wcta78tCq--
