Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B0A2E9FF6
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 23:23:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8qrp1QVnzDqRc
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 09:23:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=YHnV3J0E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cRbiaxsl; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8qqz0nkbzDqT7
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 09:22:21 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 745E35C0114;
 Mon,  4 Jan 2021 17:22:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 04 Jan 2021 17:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=XpZKCOT+lpiYiMzlRXjaVM37cxl
 pO/aFr0XSqyeAJAI=; b=YHnV3J0E4nFS2V1IHvdo2spSZfj0+3Yg4GJe+7oxOPg
 01QNYaRwpP5eQxAl5iHb4JI0l8miVuuaPGn4hSmDw8bxUgNuNgqkBgxkVTuxwKUV
 hSuHQzS6hCb/K+qZzWcl3zM2To7OHu+t9/4aHe9B5YC76t9H2BtkDrELFdMHxSKM
 cvgwtq2M5voHuLUFk4xQ2sJIHnEhuk5MttSn8v+OhecCtB+0c5TGELx+djC5VZQP
 9yILVYZeGFVR1CD9h6f4J8yigimQ+0gtvnWyWhTNjndN50V6jSVFqiVYokGDcACc
 ibUv5ktHv4qXJxmLd9m2AJu3IuJP7J0dj8ttHpZUXPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XpZKCO
 T+lpiYiMzlRXjaVM37cxlpO/aFr0XSqyeAJAI=; b=cRbiaxslqQw5Mj+IQVPcaV
 x09zd9lS3NpTPTPdAWDBS2w68hAe8miZuZ3O2koWLB+DhwpC8OPN9/uPexEsIn0P
 ktxPjK68I4ryfRG38qVdchqvG5JmsjgzeuMR+MMs3BSSC2Hke0RqY9tXvDbCu+Ll
 Qtoi6OrFPWztn8bSP0n9bXBsRAOpNMfMFPkI0Fav66IynKnxYV+ieev+733So6bf
 vAUxuTWN55Az6joQVkSHiNceGnGg90HkYi+T+2nAa+WmejzQQGkOmB8/JQCrPTvY
 GHoScIochSlVYb62/LMS+jGfmi5Wn26kY6MRXGhpOtxOfqFva84Eok8Nw2lK5LPg
 ==
X-ME-Sender: <xms:GZXzXzNYkDLmNBVUhQbSLxWRyRCcB1oCk_N2y8F9D34IdgSVpsfRQA>
 <xme:GZXzX3kSTJuzHYpkrTnLbjz7e8jRDDcem5jFXb0gomBl4hzIG18qCtsf-8ZDHesEz
 6ts-ZcY8_E8B43YIcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedgudeivdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejiedruddvud
 drhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GZXzXySLWh84_m1Mug3HKvfet36o65IeIQESsk21TPMKzRyFbMI1Ug>
 <xmx:GZXzX7CePWTrq5aLnxjsSLm2FLR_Si3MWsHVuDGFiXjNGhohhqlPiA>
 <xmx:GZXzX5Q02d1V9fb7O5jGEE3JPjRkBGE26aXEJGNHDajN177m0qEqIA>
 <xmx:GpXzXzvk1jK5V571S7QmcBjpyt0ANgeYCQ1SfFLusFcloKQd7xxY6A>
Received: from localhost (mobile-166-176-121-52.mycingular.net
 [166.176.121.52])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9833A108005B;
 Mon,  4 Jan 2021 17:22:17 -0500 (EST)
Date: Mon, 4 Jan 2021 16:22:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Subject: Re: add a new yaml interface definition
Message-ID: <X/OVFwJ9589BhkXb@heinlein>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HZJorKx4+KnQFLeR"
Content-Disposition: inline
In-Reply-To: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--HZJorKx4+KnQFLeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 09:14:19PM +0000, Mahesh Kurapati wrote:
> Hello,
Hi Mahesh,

> I am trying to expose some of the discrete GPIO signals, and methods to g=
enerate audio and visual alarms for our management software.  I will define=
 two new yaml files describing these interfaces.  From the training video I=
 understood that I should use the sbus++ to generate the cpp boilerplate co=
de and make it part of the library.  I will extend my daemon code to implem=
ent the actual functionality as explained in the video.  Where I am stuck i=
s on how do I add my yaml files to the phosphor-dbus-interfaces infrastruct=
ure?  How to do this in my yocto environment?  Please help.

You can use 'devtool modify phosphor-dbus-interface' to modify it within
a yocto / bitbake environment.  `devtool` is a common tool from Yocto
you can use to modify any recipe's source temporarily in your build
environment.

You should not need to modify sdbusplus itself for this, only
phosphor-dbus-interface.

There is one catch for adding a new interface.  We are using Meson now
and Meson needs to be told how to run `sdbus++` against your YAML to
create all the cpp/hpp parts.  There is a script `gen/regenerate-meson`
to assist with this but it needs to be able to find a copy of `sdbus++`.

What should work is:

   1. `devtool modify phosphor-dbus-interface`
   2. `cd workspace/sources/phosphor-dbus-interface`
   3. `meson subprojects download`
   4. << add your YAML file >>
   5. `gen/regenerate-meson`

The step 3 is the magic which will download sdbusplus into a
subdirectory inside the repository so that `regenerate-meson` finds it.

Let me know if you run into any trouble.

--=20
Patrick Williams

--HZJorKx4+KnQFLeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/zlRUACgkQqwNHzC0A
wRl+Xg/+OZJGXfzQphd8yLLNTRnXApVfuuuu2lhHq+zSxkOjlDSWyFjZk+t7VE8s
7HCeo9+DREzVzZTxExXVQezafEQU5+s0fc6pbwGsvDXj/qdAhJuAF1Xs4N1z1rL7
/FaRPsKqeWLhy5aTsOIuDGS8BlSe7rJiFK7mlzreX452uNFOjWDM01zIwMvhUoK9
MnPKpQ0vcO4gJi2Lmtqp27AxkcqW/mdJPBoTTeQG+l/Z+h1jejsLqgVsLmlCxnqw
nLCqaDcxQ837BzQ/eOFk3zKLNZOCAyi7mSQxEEEiX46IQPxXCWw1uWpTgpuWka3T
hOl/EUXyRJbAa6ue5Wc793Wo0I+L0ygvT7F/9BF81y/RAq/OQ5VarlbauXfP3F+E
JCxhFSsjMB9eyxjFF2FM1nu+bP8rwlTqoS/84wqQbq6ItGHsGCYaSpFKLepmEGBN
YSinj2TRvKfi+AMQ5jg5+wkyiC4DMYtfXZQgPUcyHhcC8H9sgy7hmPFlBiIKaVcV
wyj/nk3PfGPoGqcP38pV7RbwRGjAWx5Z0pDYmBwtD0rUq8m0T2hRoeaTd6HDVnXy
6oObal6aO2xbI4Bv3uwvfz5euDBNudinPtAYJrdjLVwG9OwgRhgq6RnBo7v9dxPU
OZ9PECR4SGxyuVoTlVEvWNewaVyc1H/GfdEG2lYKvfsQciwn9A0=
=taQA
-----END PGP SIGNATURE-----

--HZJorKx4+KnQFLeR--
