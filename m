Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAE2283B7
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 17:26:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB2WM3KJFzDqk9
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 01:26:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=TyZ5hJGU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XFx4+SNC; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB2N831nvzDqdT
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 01:20:24 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 060995C00CB;
 Tue, 21 Jul 2020 11:20:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jul 2020 11:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ZsGkphRfAM9Z+ac7H+BcPAFR9Ja
 7bJ2ekabDDgIhCA0=; b=TyZ5hJGUw+O15kkqHNJ5H6ruEDN/HpVxCwyQ+Pqvldo
 KGJ0m3huGXLojhQNlZQSHhDWpOPlwCROmnpFXE+9Mqe+Kp/Kyixudp0xsfp8i3kF
 vJ/iqTmEODPu3ndY+A8v1qA6RiDQzwxaeGJG0WURyPCkZYfcPqdmN0BBmwdvDiu8
 xgEy8kNdpc+Bqw8+jZe67/wgnkIX4YplPx4OQOrQNAc0qAU7LjFtfy5oh0excM5C
 GYO/SBgXjsJFaXL7hI08/kZvfxSwMnumIIUz5+01b/orU5HbjzTBzT5iKHS8rU/x
 IKWRJ1/XTtDmMHnKrQtWrj1HsdFkj+HdcUyOd0UypCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZsGkph
 RfAM9Z+ac7H+BcPAFR9Ja7bJ2ekabDDgIhCA0=; b=XFx4+SNCNMgG438QqSN2Bp
 WWV1rQhuwZ4bqTOjJie9B/CLuwx2spG1ybGaTjC+Sd64FTFjL2EMHkekK1KYm5VX
 xyD2SvaF7soovaNbGHIzelVWvXHpH6vu61XC6jUAgUszKCV/rnB+lur52tgV0Ems
 PJN4bnO5iEpL+31Z+TYySLMGUou15DvfI8/Vm+QAM5rFPr4+sDBCLnipruW21ofR
 GM/WjfC+ctl8hqzlpEFM/Z3tE1jEyv17/pp7z93aoSN3yoHNzBtIiw+OP9YxqZBv
 Y+grd+dXONURDhrar4YGTXf754JSDOg6t1lXgzEJctzE3Czat2gUc2ko6QKqLZ6Q
 ==
X-ME-Sender: <xms:sQcXXwjYTJt0PUNShrCs6l2x1DoQu2dbshqNQWbWghiFg_SXPZ-voA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeigdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucfk
 phepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:sQcXX5BHJYnaQoXapSqhhJ3CINRVVLOOGTgOvE50SQ-rfOBalByAbA>
 <xmx:sQcXX4EwS7PHyqMKrlU7h3F4De1-yR69BchpMCed3ZQxbvmL-kyWsg>
 <xmx:sQcXXxT5Zr6wFrJ4h0f-h6vJf7h5Xp8vf7Cm7K8W2ke71Ns4MQCrzA>
 <xmx:sgcXX-qSNAf_MASb0GDUA9ljyBOKwH1TjLnzGnv-F3XIqsuQ9uS8jg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 668C230600B2;
 Tue, 21 Jul 2020 11:20:17 -0400 (EDT)
Date: Tue, 21 Jul 2020 10:20:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Manikandan <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Message-ID: <20200721152016.GL3922@heinlein>
References: <20200720160013.GB17117@cnn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z1OTrj3C7qypP14j"
Content-Disposition: inline
In-Reply-To: <20200720160013.GB17117@cnn>
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
Cc: openbmc@lists.ozlabs.org, velumanit@hcl.com, kuiying.wang@intel.com,
 manikandan.e@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Z1OTrj3C7qypP14j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 09:30:13PM +0530, Manikandan wrote:
> Approach 1: << run the multiple process >>
>=20
> Create and run the multiple phosphor-post-code-manager process to handle =
each host postcode history.

I would lean towards this implementation because I think it is more
flexible in the long term.  Some multi-host systems are hot-pluggable
such that you do not statically know how many you're going to have.  In
some cases you have cards that take up two or three slots, so you really
don't know the correct topology until you've done discovery.

--=20
Patrick Williams

--Z1OTrj3C7qypP14j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8XB7AACgkQqwNHzC0A
wRl6BQ/8CMgoUFHDdnLAOLcPFallUOQawjCLueWWD7k41w31CgsvxsAmddjmYnmc
0pLoDGHBaaZrXFi0AuP81erVbYSO7ZR5kUCAXdIYR2Zjx6wm6IXQ+ssf4gX6B2eT
poguG2NyI1w623BjFEMuhlABkKlL8ZyPmrSTKdOiK1BlUxrizrarHbB/XuqyUWYm
/DD1/jUU4k1cxNV8ASNkIGRPint6QRYZ7D9gEGygL17ep4uRYDEwe0m+JMia/9ai
TfKOCe/lC5cauMNEA6OU06cjWCIKnr19KwrZE/s/RTTLx8e+20VPO2JB5o1dEepp
K4duJV2+LY1UXkXB5/P2H2ZKNtcN3MMeOA/F1Wy2uzHjmHeETp00aVDB/1Y0JeLr
3nyF03O4HYtB6coog6+dop36IWeh7MVojwf1TLdYt38IjxiAxHdIaXp2sTDZb2pN
laUbjNrvU03UAUShZ9VILslyQe0p9QgAy3kyI9AmzP2vqcpXcuW7rVoZ6tR/w8OV
J16PqT103OEAgWPdkTSq1LBqq/JGldXERBwkHSKsiNY5J06cdePp91Y9Trbt1X/5
a2pDLBdLFJF1pe6KJMN3Ya3uVzu+k6ek7ZGSLayPvbE+MZz0S3RygUMeLkqC/Znl
4eSr2Wbhga3T5RXfMRz6M9njIiTE5+49DbPKk/a6LUsCE34FRmo=
=P46P
-----END PGP SIGNATURE-----

--Z1OTrj3C7qypP14j--
