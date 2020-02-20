Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E527516632F
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 17:34:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NgCP0Xs9zDqQM
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 03:34:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=qFLLLuLc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=yMW4KsIP; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NgBh3GFQzDqM1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 03:33:31 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF6805D5D;
 Thu, 20 Feb 2020 11:33:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 11:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ww7ShP2iTgsRjbU9MHH0K48dkJF
 xQBPFgR7CiaZRzxo=; b=qFLLLuLcuSTVh9bnvq+tPejePaWZS2wyh8z79WZlurX
 JKvNRE6Ir18ZVVkmIFDUq+hW6DOrPL+XCI3pGkpcolKO3Wlct6WPK5xkSFp8+w0N
 7Af/NqjU5JOYZ2OBHN1JohYTJXU0fJ8l5QQtlFfRv96erXMw/hJq7gxMQQ3XbnPz
 fSmJJPz/8/aH2nyWH5Gbo9kX3E/fC5nj+IRtCHZoH764Aet5/Xd4u6qSskja+Ooh
 p8MS2e/Q6J8LMPIrSoM1vY0Sd9kQDVW8awdOm4B/tqrOxLET/RZstNKxXFObaunu
 BjDThYUbM3ZqUhGRvq9Z/lqEjjhaRm1hPN3NXr2j54A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ww7ShP
 2iTgsRjbU9MHH0K48dkJFxQBPFgR7CiaZRzxo=; b=yMW4KsIP3nkaoXXuYj0B3Z
 8h9C4Je/caAMs2YW8o6ONkWI0nEfYJKseSpNbiGFxBs7DDNtwRBmJHj4CxcqG10n
 1iZpsrYBF2XYAFmzOAWcWVt5Mw3jLEPUWQAAN+sR2McA0sud/0/E7dp0uOspviDg
 fqomqUnMm3tWKAFQT1rObe8vNS+ZG8xnLmH4bE20riA3LmP0CzDLcd8qIQz9lOKV
 03aa6qhLlDOaxnCJfDWog7ScqVpPe6SnoHX8QnwmUDGOr1CDo2jP6r/Th4HWptbr
 Z4+EkolJ3R+mRsCZS9whgR3+t1GaHeZ7jsjA5gIv1qbLSHCl5DsF2whkPQm/w3Zw
 ==
X-ME-Sender: <xms:17ROXtfQ15vvEqFHrTFrXmVjyNKnaEQDPBaSH1CoGuZDqHVJVhpTew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:2LROXid8iT2BdbJA338kipSl-yFMNs7uwJ_E5qg08m0f4kSoSYH_zA>
 <xmx:2LROXvFIlO2kwbxo1nAdJAbfWyZHpFwsavCdaD-8t38dMhcJud-e6g>
 <xmx:2LROXkU0S39yM35oRzuZ2LP5ivoUQELKzpgVIs_BX64KTWdP7GpvLQ>
 <xmx:2LROXtMdICzEKI7NUIM-s9uZSS1w5pYkXgNkcbM0JK0HgANMpoPjSQ>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBD6C3060C21;
 Thu, 20 Feb 2020 11:33:27 -0500 (EST)
Date: Thu, 20 Feb 2020 10:33:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
In-Reply-To: <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 12:07:06PM +0530, Vishwanatha Subbanna wrote:
> Thanks for the good discussion on this.
>=20
> Patrick, I see you mentioned the TimeOwner in your response. TimeOwner was
> another thing that was disliked by the users and I had sent an email coup=
le
> months ago asking if anyone still needs it. I did not see anyone saying t=
hey
> need. I then proposed removing TimeOwner feature.
>=20
> So, if we want to make it simpler, we would want to:
>=20
> - Remove TimeOwner concept
> - Remove the deferred updates to Manual / NTP settings.
>=20
> Please let me know if you see anything that might be affected by this ?.

I tried to provide history as best as I recollect, mostly to be helpful.

As I've mentioned elsewhere in this thread, Facebook servers use a
Host-owned RTC.  Unless someone can speak to non-Power servers that have
a BMC-owned RTC, this might only affect IBM(*).  You'll need to decide what
impact removing this feature may have to you and your customers.

If you'd like to put together a proposal and seek feedback on what the
potential side effects for specific customer classes might be, I can
certainly do that, but right now I don't really have enough information
on what the "new" design would be just from those two bullets.

(*) - And OpenPower.
--=20
Patrick Williams

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5OtNYACgkQqwNHzC0A
wRmuUw/474c/HBRl3Ozd10mnPUq7SdJ378WnX0ntePgAEoYsqC/y9itQVj2D92XS
SnV1SE7Jg+Bwk7EstErb0Uim3UlrEQHTW2x2S/yfTA1BlX+CeTB1Uc4iybBTgn/T
zzhXg3YuBcg16JG+VLzyl2yI+qVIGUoHlbKzcgrMykrnND470KLuMaTIBOHyqUu3
BTMjJh4+UAnYJBjsM8VmqS0ugbocJsBgHQQZKKchg/eCb9HotfVMuVc9WBSppdJV
aCT3FNcMm3a4U0e6d9wLsJ4UQPKlFN25b/W0fPuBpnhcMiH9HQQHV6ZuB7EErt15
B6GMzL5S0CxQdUdIJD294cF7l0jVpo6CXidUrEDCwKQ1VOCq0BSlIwRx+8cAPt47
qxjkdnvqJIjkxw0sxiQndFVpC6+12Oi0H1kHg4PNdD1m8FhsQ467niiJXiSVDRnx
QmyqICf1d4QayU8iRBKw7A3JgqDXRYR+WnxaFb74lfV3HkxZQwrv1T//EDpFt1LA
H0yy7fgguxmRzHWE9gnSdF22FDZzQOhfDDJHNCyG7UdA0ASjeHe20q01iCOqyFeQ
mRqNliuS9ikgGQASBoRwcM/TDw3ta5ukJMcodfL4qpVB+dRTW9ORq2NtfCBZjKiB
VpdW3MYng+we6JV1yu4fzp6eCsPCh/9HL0FFWmA4hHZGalRvIg==
=lxyG
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
