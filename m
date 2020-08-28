Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B7255A77
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 14:45:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdK8D5J6DzDqsm
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 22:45:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ZORSDl0V; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pi4MDse1; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdK6s57tGzDqdr
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 22:44:37 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id B6E16E2D;
 Fri, 28 Aug 2020 08:44:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 28 Aug 2020 08:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=h9pKZL+4Viwwl/dfgwKUuyn31Oy
 4RnKA5KNmKUQT5WI=; b=ZORSDl0VzEKMYsDKM+9cYFE5F49ouqFMIgGSgFdot6O
 Pwr2T5aKHHN2pEnLofWgn+mtuhYjFC1NZOLvZJ70RRmEYEtq/VtT7nOb03Trlerr
 aR7E+mw46ajXuRSkyUtQXvBxIw3l6+Tz+yHdISAfzQqSeITWaZMwhi2XpBwj2WRP
 Jvhtk+7Oj+uxWlpqAKXX7XENp60C55Fr42awQCaYgunuplxUBJvujPs5EoJqMH1B
 8fr9i6QnqtSnu+9Y9FvxOlv26f4FJcRV77u5Y5ogMZLNLFGlga2DfEOK8AKynOZU
 zSRLHXGtSfl+ft3MNLW35bUhsWgAS4gg8+TnC6MMwrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=h9pKZL
 +4Viwwl/dfgwKUuyn31Oy4RnKA5KNmKUQT5WI=; b=pi4MDse1xn+9tO5bHkBM4r
 uIIAF5xjuV1yMlXUGRC/bgHlgaMQZ5yWJrbE0d+bPAKJmMyKcr8tSg/Ne7opOdxP
 sd6uzq8PpEdXt5D9sM/+t6IetHLZhppTt0W7e0Q+C1HNIGrhhIqzmtNxwHfZ4Q1d
 010EuuvNd8BlEc+LLkxQERHhBTjEXC3hnwtu/+NUaNdq/R90BsNoaU3SgHrWWVjS
 zICzG5lrtDexwAnACJU7gok4BaKrPzFougoHSujTtazse8yW9ZJm4BwZS+ECHOj7
 zLF+Xn2PR8CDHPX1FWKK0yQjCKcxiqqgHiGpXDghH4tidw0ans6UwY1h/SdWJrFQ
 ==
X-ME-Sender: <xms:MvxIX5TGxoqloynQzkqtYSSkjdWEi3aQXMOEh5Q6dMHR33mDH9WQXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:MvxIXyyhcV1l-xBtd4ejHxzVmrdLLb8aZNL62kxMim3cSmrkFX57Sg>
 <xmx:MvxIX-1_H5RKpOEFm0b9Rrjx24b9MNA7xUTMXjA9kLEHcpVEXxTS1g>
 <xmx:MvxIXxDStxfxjoLPdanQeEVCoIsKf_9WN0WDjluCC-Sb6EG-Msp1yg>
 <xmx:MvxIX2YP0aH5EZ4uhaVipe-4Ut4XUyBq-8P3yYlV3FxUQWb31pMltg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03F10328005A;
 Fri, 28 Aug 2020 08:44:33 -0400 (EDT)
Date: Fri, 28 Aug 2020 07:44:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Neil Bradley <Neil_Bradley@phoenix.com>
Subject: Re: Tioga Pass OpenBMC 2.8
Message-ID: <20200828124433.GO3532@heinlein>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <f11b61fdc4c240aea245f01b2318c616@SCL-EXCHMB-13.phoenix.com>
 <20200825142533.GI3532@heinlein>
 <75b5584cca72489f95c2d22c129a754f@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ctUzwJm0i+kwMBIK"
Content-Disposition: inline
In-Reply-To: <75b5584cca72489f95c2d22c129a754f@SCL-EXCHMB-13.phoenix.com>
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
 Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Amithash Prasad <amithash@fb.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ctUzwJm0i+kwMBIK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 09:38:55PM +0000, Neil Bradley wrote:
> Thank you Patrick! Yes, indeed on Tioga Pass the RGMII (second interface)=
 goes to the i210. Odd that it'd get added but no one uses it?=20

Facebook designed the Tioga Pass server and we use the NC-SI path on
that server.  Since the server was designed for OCP, we recognize NC-SI
isn't always the preferred path for everyone, so we included the other
interface even thought we don't use it ourselves.

There was work at one point to qualify the second interface, but that
work was done on an old kernel branch and never sent upstream.  Since the
faraday driver had a large rewrite, I would be surprised if this patch
applies cleanly to the 5.x series, but here it is:

https://github.com/facebook/openbmc-linux/commit/eae4bbfbcb8faa091c089f9a36=
7964b0eacd9ba1#diff-157e77f59ffce03237d949d9318dbff4

--=20
Patrick Williams

--ctUzwJm0i+kwMBIK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9I/DAACgkQqwNHzC0A
wRlURA/+O39CHXn7Ppvd/UqxlQLHHxTsmI9SSLKVG3QzLaIMdVsIVqjMKw7pr7EZ
ZfgYu7isflW2VriHkcWehXRRQaTgyWhX3GYTZ2RhFJe1C9v4Fn1gL9MWy0dgIbbC
xRbVkUgxtoITZIry7LyackrwjtE94eYhSnz5YUIV84McVaxWTFnZ3pLylf+MWEgy
nppkFfenRRg+CnBtqofMtkNHgv9T0wXO7YYOLKVyEMl/tpRtm79Biky04WfP1dxk
yY0sRMDrI57canIFh2AWKp4r5e4FskYY8hIfTmyjFdTkuJJ/gdGWSVgUekqTJOui
eomxdGsbq4n88OByxpVsIyymSJd5MAaLboKiVjTxST+XugVgQoy4Ee+87uLA8j1K
QogrXNC+wa/ZZpFhx/uHzgRKrDzgXIQf9AZ8XUc//jTvzXxCtYYvatGth4NG4K2U
g/x6w8yrhf99g8rgRY5qzZ8Aut8s5nFh5DX6sAvdln6M6zmMm1T39DwxH9jJc37p
VUWl71ZsxGLZm3d4HMsgqz/PtyMs+DdTspLkxLbTukANxz+3PKOFqw/MVrNWm0uf
guXVv/uo6RpCpo264qQm+x+LrF3kb8AAbWTduZB6wLOresLjMaU1d5n5cQ0p3fAm
PO8DsC1uKn5e4FbcYYHtv776esjYPQYOCQR+HJX51PKx9TPViPE=
=ZUlt
-----END PGP SIGNATURE-----

--ctUzwJm0i+kwMBIK--
