Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3071CDDED
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:58:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LPG46FXXzDr5l
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:58:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Xuwrqnk2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Fl60IX5r; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LLkz1CltzDqKs
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 23:05:15 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 637B44BE;
 Mon, 11 May 2020 09:05:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 11 May 2020 09:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=mzMPoWAOfSmoJUTxv1JnelwNPyl
 oiNTWRyJvJ73YAa0=; b=Xuwrqnk2XGj3Mkye0O+ivKLZ1wcfyo+BlnjuLll19GC
 xUIWC7c1ze6dqdRRjKaoP60suekEgi5MYwD1IJp4skq04iTa/f14+IMF4xmMXL41
 rSesnfpIKWndROs4LH/kKgrB1STsHhVS8RvvmjTsxdC8tjwhN4cQqpiQpKC/rWBY
 vIFael+uBhS/AL2+7SqTgeYSeql1GNKxIeVP3Q3fVZRdzOB1Ies/5H2ttZMVVLNz
 akMKtU2+MzNvg+wPhZFDO/Iavg/EwgtLFTPFu6avt9pVnPgmF7QlMVqjETj74l/j
 E9M92ObJV/pBqm1PW/YLLpC0nRHblLNXeV72T0C4RGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mzMPoW
 AOfSmoJUTxv1JnelwNPyloiNTWRyJvJ73YAa0=; b=Fl60IX5rd9OqU76q9s6bVX
 V+8a7X32rn5aUpBPp7cp14umWBoxocJd7ZYo8Tc8IaAglmG7y2xb/cSlRP0v2YD0
 /oy74cuqSTIko5v5i7+9wTEMdy2BswLBDNyJaBHry9nK5bInqv3K/+iBidEDGkUh
 xUqzWRR2F/GHbKhZI2CfYOwdyslYukYFVoRUpTI/BrFLzu6qtEzaRB2sLT+UtwIy
 ui0K0plIPOXqqgA3HHAvp9c6m9p4ifGsSy03N3ihncTzr2B34O5gz8RZDUrVS7Jf
 cAURMkTAWD358UtKynBjKevO5L5QfaoOWFMmYLqPM97LrzW2oY1yYTK8Ow/EQUDQ
 ==
X-ME-Sender: <xms:hk25XmStiLLOSf2sI897ECkuybrqqtWOSkCV3ZFMpF-EjmM__aIMyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucfk
 phepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:hk25XiPN82mGxS3517y9gH9pOIEBs_IriMXnSHyiXQbv_4YGY4CcIg>
 <xmx:hk25XhV-bmcIiqX1SLT4jdd6yG-GgogQAn1jBHcAA_z2F5NIvGr8yw>
 <xmx:hk25XqaaaD_fl_6ybrHMX38tWssyQIz5xS7Vq6rUH7qih9zArC43Tg>
 <xmx:h025XuoCCgxMH78_5_jenaRvHlzXTB0cvV6tf-QPYAl70q4D1Nmo-g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3FB8E3066297;
 Mon, 11 May 2020 09:05:10 -0400 (EDT)
Date: Mon, 11 May 2020 08:05:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ben_Pai@wistron.com
Subject: Re: phosphor-bittware repository
Message-ID: <20200511130509.GD10214@heinlein>
References: <b7e1bb0b82394f8ca3a193cb9ed5c218@wistron.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline
In-Reply-To: <b7e1bb0b82394f8ca3a193cb9ed5c218@wistron.com>
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
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
 Claire_Ku@wistron.com, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Ben,

On Thu, May 07, 2020 at 06:07:44AM +0000, Ben_Pai@wistron.com wrote:
> Could you please help to create a new repository for phosphor-bittware?

Out of curiousity for others who aren't aware of what 'bittware' is,
could you describe a little about this repository?  It seems to be a
hardware vendor, so it would be interesting to know what the BMC will be
doing with it.

Examples:
  * What is the overall purpose of the code in this repository?
  * Is there an existing architecture that this code will be following
    or is there some new design that you are persuing (and needs to be
    document)?
  * Are there existing phosphor-dbus-interfaces that you will be
    implementing?  Are there new dbus interfaces you are proposing to
    implement the functionality you want from this repository?

--=20
Patrick Williams

--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl65TYUACgkQqwNHzC0A
wRkpnA/7Bms/kIX+7coAGFlCMm8znRuSbmvmlqFVohoWyW7UEAC4c7QK28rk2DYg
tg8HXAgrOivU0jqnS3WNcVLOHhSt0rLi6CQ4UE+aIUszCDkyRiLs3EW3e1udsXxz
KUtU5xH4KYE7dC8RQOk5b+ibR6GGddMJRPbSrrA3QPMIkMkWj/Xm74bhs6yPAKJL
nppw+j/wctxQkHwdrKIySfyGZCrqZ0wSIZEJmTwYWOloom9LSH0YsMre1eiFWly6
rYwHiFs3z93fMByyFZn4/eYsirtOwaqu7E8UxfCW/FpAeOImhUcqT54EbBxswwNK
gCbYSwyCgc8oKkRIJYwNKMe12nqOesIfnGKvHZCWlobfEi7j7e1F7T6hV49b9VrV
5GFtf/kOFYUNMhLaS6B3HrWH7g6MG384Tb02cY3zTvIS1OUuwCCZXNccriuq030H
+aRoGekgtsc0jIBVbov01KzU+fTCDrRENl8l3BRPsbJqkj0w14q3XmdFLzZLyfC9
J5WKEEtvwTcgrYoFwyWoN4nkEzarTLd5ioxlg+gEaHftgnH1axYo3FSgJhRB31+L
Tq+Xuuv+FWfLivY586OnjljaU0/tesMcSAob74oLX8b91t+mKrNQ4Q5bNMwXbxOc
OaNa9joJ+VZTACY/wPuKhvGh79fLouzOQJWb/9QknFbFHmfgerw=
=uA8B
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
