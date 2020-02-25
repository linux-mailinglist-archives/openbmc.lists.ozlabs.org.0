Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2516EAC8
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 17:04:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RkKD5BQHzDqKs
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 03:04:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=M4QrWDkj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=wGEkI72d; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RkJf0HrWzDqKM
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 03:04:17 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9672C7AFE;
 Tue, 25 Feb 2020 11:04:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 25 Feb 2020 11:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AcGymb41SWErV99HIr+apy326X2
 iLplWOqBLFL+ANZU=; b=M4QrWDkjpK6F4nNUepSiFemXpd+kV23YQPs9nQ0K9b4
 nxN3MPi7NxahsRtox3uFkQBLFOikpFvTz1d/83qv6s3684aGoKQvyJdtIsMjUju3
 gelugcnhcc88YhWmhNpgXbsWdX9OEB102NdqBKSyWvrMHNMAXdW8Pd6TGTDxQTzC
 bvaHOswS61P5AiT/YWlJAiCPW+0mHUAgmuUXYSAM/TDjmP4xMLLfiYOJ5Z4u/4D4
 zAC1upUtM0d3BIysgSM/za4YEN4C1HiLKwbvnlO8SV9Yr3KAlz+EG5240LnUMZAA
 LsE7WVtaNvnTrks3NqY7KSjX+AOgS3L9ecPMORPmPRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AcGymb
 41SWErV99HIr+apy326X2iLplWOqBLFL+ANZU=; b=wGEkI72dLgUUobbH10ojZP
 D/vJ6Qvn1esLa65iNdnN/k7nFoprphauM+JBJrcevp7JDJ+C22oOncLSNDKm0aQb
 7GOCil2mpa+BlSYo9puNAfzC9AQLrmrD/Q1tI6gxDl1EVyobuZ/a1Zk7ApYxCUxv
 ZAnjtRQkizFz8uytfkjZlFNo9BvK09oecNJKJrhWKJrxnYVLFBoQCvl+wS2ZbI4i
 N8FArAtFRS8sfsts5p76AWkyICIKOY4+imLWhEQhFrlNVrJ6QQBnEbem1w9NOBRl
 4Ny+HirBYHrZgN3AFaoMMxWYIFNtLUNFtc9gbLnRQT9U4ZeIJCc48eNWrRpENsNw
 ==
X-ME-Sender: <xms:fkVVXrqO0FUI0m28lyEs99TcflVTIG-4VIu2TVTPObeWDgrWVXnjEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledvgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:fkVVXtQ8Wj0bEhtj2AH4iOm77McDnnI43zaQ1NWW9l1nxmHdzTCe0Q>
 <xmx:fkVVXl1Z66vl7n9CLH3Cc7i5lfo-fmjbo5LNR7uJXI5n8lIzjV4sFg>
 <xmx:fkVVXpBYx0Bo2xexUPhvie4BaY2QHqv24YWJdXZ5JiQrCamyJe1Y4A>
 <xmx:f0VVXhJfh5Ta6nN59daocK8ST5QsDWI19HrRCe1PJkeHiowlAp1JOg>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44BB1328005A;
 Tue, 25 Feb 2020 11:04:14 -0500 (EST)
Date: Tue, 25 Feb 2020 10:04:12 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: Re: System Firmware states on D-Bus
Message-ID: <20200225160412.GM67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <9CA8B63A-991B-49C2-A8D1-83D1CCB6C46A@gmail.com>
 <4fd6c84c-8d57-b907-5aad-9057476a3be8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xtx0sNU5lZ46KfgK"
Content-Disposition: inline
In-Reply-To: <4fd6c84c-8d57-b907-5aad-9057476a3be8@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xtx0sNU5lZ46KfgK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 07:47:42PM +0530, Thomaiyar, Richard Marian wrote:
> Prefer D-Bus conveying details in finer / better manner, rather than tying
> it towards any user facing application like Redfish / IPMI.

I agree with this.

Define internal D-Bus information with the most we have available and
let external interfaces map this to their constrained subset as
necessary.  There is no reason to limit our own abilities because of the
management interface du-jour.

--=20
Patrick Williams

--xtx0sNU5lZ46KfgK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5VRXwACgkQqwNHzC0A
wRmmZg/9FBwvGwHVX8oEu4TtD511DRXt9MfoQgc4ibYMisRWpQy8Z99d8mCD2i53
a4wTNJ+xs0Mx/vh5TgpRgzuLEGGQoFMGOiTw09ukA71tnEbF1PD3GQDvpKh7tf94
CyZGi/x+Ub+moQekgSlgJc+t58cqiz5lMMn94JxXGFQl/CJm41lNy2fljmj51GuH
AXwdfzbtNEFQu9PhmlnBCgr2zFqVV9vqfP613rTESukvmvWe2yrf1LxNUPkb0l+p
DxereRi2Zy/3/2eTenvg5NqJCjob8LSvkegmt0sdEXwwxxU+kUMQ4HJrHbdQhGaj
SiS2GJ85P0ymR2281adsTVgYEx9EwGZ4GuK/WrTZoGD+IYzSZbgt6iAnAwlwCMHk
llNz24btMjpynolIU9pfANKLSK6S6wTYG3Ppqwer2g3hFXkznusjKf4I2cbcQnbB
GuXZ64JFTPPFYkUYckOK1HfjpGQdCUbW5nk/FUobD5Y2YD5HFSDaNf1kbqiDhnmd
X3uEIKJXl8n5Oj3camZ5oR75swwXhViZjayasscYrzStyqYli8brGma3imOfIhS3
Etpz8wfpJYXTASSpCKweip5oKE5ZaTHIciqNpj0ZH1y4B7m77kLqo2uxdI+BjHOj
QvpOMDWnibK1ZOno29lwolM6U4pZF1UyQDejTTcGb5i71TK8nAQ=
=ZnQ1
-----END PGP SIGNATURE-----

--xtx0sNU5lZ46KfgK--
