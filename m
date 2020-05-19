Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 129001D9B95
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 17:46:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RKwt6xHrzDr5R
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 01:46:06 +1000 (AEST)
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
 header.s=fm1 header.b=Qb6IJ2IT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=epEJvd/Y; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RKvg36zbzDr4N
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 01:45:02 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 73A7E5C014B;
 Tue, 19 May 2020 11:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 19 May 2020 11:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=GimC9z2DCgXEuzpKF6YnkrtFBCR
 GGab066ROPS+SO7k=; b=Qb6IJ2ITRVf9XrR4gXQkFt0ZpF7kSDcGS9En4CnPbP4
 hpGiPO+lsfJP9lAd3Q6FUgKxZkg0NMsVp5MCTZqKTLqzGzRIN/ENMo0Z9TtS08HZ
 Sq6Nj3i/jZxhMBUJP0VmZ6/0eP7kMK6og/6NBu0Wl9KLvGYhM1twJ1jHDVx2dkpD
 LzEZzVh/sef7PIKjto3WOBECnphl3erK49U4i4OzalKRMvX5RLSymn0jjPUGLzlF
 uiS3EC/R0SMGoQcI643UOioXaeeCQFctvLsPdcX4GpvUQ2JTVGRBGWQwoDHznM6V
 hdg1yP1Sgp2SvqNGv/HUTcATFc3Mm9eDUOX87bWOzfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GimC9z
 2DCgXEuzpKF6YnkrtFBCRGGab066ROPS+SO7k=; b=epEJvd/Y1LlldFV3O/Mb4h
 RQ0FXpK+wdA03zxjGFcfF36d/jBIZIpWa2F3XJqZcLcwxjqQMGRf6WODtOcCNpbw
 bhJSvGRTHmzpl2h6xAasqATG7s8zR9CEr+I4BTYm/dl6eslxPPwoMNOXsM5+Yts8
 69Zhe7JWhQQ34HemhUlMqlp7x0+LlXKoqUrdbF5ob4ovfQ1hsbzskGn9Jp2t+fpk
 HBVe2TC1/H3I6if9/O0+tU5eFuh7p17Kp6sPKiIc0CRoLfd6qhrY1iWotGpIBP6G
 fShN0yZGj10x84lhita14MA4COsLu20EdhZslM7woaVIaJbKICXU1liQnecDakJw
 ==
X-ME-Sender: <xms:-P7DXtkkR53O0hb_uvAHp_GM0GtpGfJwMHFPPjMQFdi0L3fl71k3cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:-P7DXo3CZ1Dg3UP-PKXWu19kihrKsfzYzHjEqUujSisu-YvIppcOMA>
 <xmx:-P7DXjrcVAyq_VDjy-CnQR1H09HQLAnWeP7j0fo994enisvvOLjFMg>
 <xmx:-P7DXtlMWRSVWPIK1qp78mNYH_S_Ogviu_c6j529cvxL-ytoPrcXBA>
 <xmx:-f7DXk-68RM9UmlmM0X9_Ch0-DoNwvjJEdxPr6VcXqWLdszgEShTyg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6F34E328005E;
 Tue, 19 May 2020 11:44:56 -0400 (EDT)
Date: Tue, 19 May 2020 10:44:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ben_Pai@wistron.com
Subject: Re: phosphor-bittware repository
Message-ID: <20200519154455.GK1166713@heinlein>
References: <5c119dd93cff41c993e0a16a3717f5a4@wistron.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6K2R/cS9K4qvcBNq"
Content-Disposition: inline
In-Reply-To: <5c119dd93cff41c993e0a16a3717f5a4@wistron.com>
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


--6K2R/cS9K4qvcBNq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 06:47:48AM +0000, Ben_Pai@wistron.com wrote:
> Because the 250-soc card needs to adjust the io expander to get the relev=
ant information (e.g. temperature, VPD ...).

Is this IO expander on the i2c bus itself, like a mux or hub, or is it
some specialized register set to switch between logic banks?  In either
case though, I don't know why you couldn't create a kernel driver for
controlling access to the various logic blocks.  If it is like an
i2c-mux, there is a number of implementations of that in the kernel
already.

> I think a dynamic detection function may be needed to handle the presence=
 of the card and dynamically adjust the io expander.

I'm not sure what you mean by "dynamic detection function" here.  If you
just mean detecting the presence of the card by a GPIO or i2c probe
call, entity-manager can handle some of that for you, I believe.  You
don't need to put the card into the device tree directly, but you could
instead do some kind of probe call to ensure the device is present and
then manually 'bind' the i2c address to a kernel driver.  Entity-manager
already supports doing this.

> On the other hand, I just want to be able to integrate all the functions.

I think you're going to end up duplicating a lot of code that already exists
in the kernel this way and that is why I'm trying to steer you away from
it.  Just as a simple example on the sensors, we have two
implementations that can already consume Linux-hwmon data and give you
the dbus objects "for free".  If you go the direction of putting it all
in userspace, you're going to have to implement all the i2c activity,
hwmon-like polling, and dbus objects all yourself.  This isn't a trivial
amount of code.

--=20
Patrick Williams

--6K2R/cS9K4qvcBNq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7D/vUACgkQqwNHzC0A
wRmXuw//Qv8awVRXFq1hJtPPbAjjXm4WTEnHnzWM6SlqnjVa1zb7OcRZlO4HTVuz
dp+D7EZAgazJcGqAFoJ4MGIE1XL3tf51rt12iPXyysf1gSUV1vPRcWevjiSlbmdf
ajx/1qOybAQUeV91mtRyTftv+l7GAvT/hrLv9FrCcsanUSH20BTmz5H3JMXQODil
cvkBEUIurcHkehyHALz9rjrH7tL5SLhLjBK3uun3HceWIzzI9a3juZnQaULHeZdU
4xBCyoj+CAgpfE6G1t83YxhRTXW6BWlD7mdn5cYo6SDimUMPrjDiSJ3YagjLWEpL
Eauzcu7PjlSGLAacy32RrhlOv9LLvj4QFv//yiTkqW8CsRqMDUSdLP9KyS1qbHgZ
oOoi8auU7nw8Sj9nlyGeAvh5IkYsGw/ld+cSJG4DTIvOZmuSgcGdGD9+QPhoSIPv
OqNnAUjg5CmuI+dszOItNdP8Ovod2X9wDUUQz/mwSTkqiiiS2SJOXrCXTNSpz3U+
wmiYUUgGQyo/zlhA/35UIah8mVSmR6ZJp3dFebTIN1TvoIL2JwrGMWIGWAZ4AWdb
BG+WuqTMhkG9IapZe6iBcHASx0qlpI/sKuDIocr+7N1HnYpAkCYiVbFN7yyt4htS
zIg/reQT+ITtJimV0mw84oCqbAQ3MKrzA+1zPHgUB+Ens2/xpMQ=
=3hFL
-----END PGP SIGNATURE-----

--6K2R/cS9K4qvcBNq--
