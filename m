Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D64CC672
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 20:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8hPf4lJ4z3c4k
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 06:48:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=iZE/9kjW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=EtOImSt5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=iZE/9kjW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EtOImSt5; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8hP8295Kz30Ks
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 06:48:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C650C3201DFD;
 Thu,  3 Mar 2022 14:48:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Mar 2022 14:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=juXN9gSEVN61nl1jRV2ZuQIT1fRfAQQHXzQ6xz
 DsT/g=; b=iZE/9kjWAl/JQfEqHsTEvtz2jbnRe1/z9O13DEo25dGvIjslZxV3gj
 6ZrfA6cWDu3OzDynekPqOHoy5Z/QcteexXyj1W5DnjKP3nae12JOVdxb+dL6a2Jx
 79xFSKY30GP1lh+VMPA8Dkq2bMWEnVPxODTuPmydQkMdbwRqLwMArj3SPFbKzuFe
 fhzEYKPQRm0trJWQbbNM7ubIvX4H54ZqXKjyMLrSJGhT0wpVzeLl/RkVToPusLK5
 hDy+JdBdXDaOQURcg0KlqX3clvWAW47Xshhx1OuTMWvetw/ktVbHWCVwobgw8/4O
 hOdMSfJ9+zZUGOCS3DiqJxNmYFkXI+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=juXN9gSEVN61nl1jR
 V2ZuQIT1fRfAQQHXzQ6xzDsT/g=; b=EtOImSt5hh5UjEn0WZ6Bce8UrdY8kpoNl
 cQT6RiUwihj1RGFFAtRAaJsZgaChKjsGUxQyVD/uExvxoQMTg+/2VuauA2pKVXW8
 IsoLooDGtY9AqINu0Z5wocW8ZZxXW68wMEhhzHWqp8HnQN62pFVtrggkmc7X5otb
 Tjv+OC1vHo9Hlv0IEHcFMfw1cXzyw2fo7+rTGOTNZdl4CH8Aqi4g/POve8Z+grUE
 Fsbf0E+2x0MnHgSf0Ho8fIeFgRh3V7i2dwvUxgiFM+ox5zt1+K96SKyTyGl34HYs
 1c58BhLcyyyYYTGs+EAcRL761LiMMWRMVjQYmLvL9yM7s9NEjA3QQ==
X-ME-Sender: <xms:hRshYsJN2rABn_vVhQ30Pd9_ljYwj7bACQvmUr_MmlfvTCSQiuh6Bg>
 <xme:hRshYsKDnaHpJHpcFLNIFDRxOZx3MVtS96NZo0DZpkllekoIR-5scp5QeUBiTULJ8
 tIs2M-d3vP4Nt7OeeU>
X-ME-Received: <xmr:hRshYsu9qf4GAWcaoudGPO1ZKYugr7aYVNQlgnxCIYiMMzJRyZI3banKf4PHVubrJs4nkcUZLtGw9SIqPBB7JCLac9Q_9A9B69zxAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudef
 heelfeehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:hRshYpad0TR6LvCEU6TIzPDRD0R3RMXCtHnRXwjtxyT6sv4K0LVuyg>
 <xmx:hRshYjahYGcS7jknZL1szRut7rU6nPq6g7ateFmWMKXsMdqvZRjl6A>
 <xmx:hRshYlDEqcdF4J9RBEeWXTLLi-EQtt4jcvAQfVKvOtNVwzfA4e0eCA>
 <xmx:hhshYilfLuvRdFwm-F7rlikm1eZCNu6oIMGXsdUHJobE1HjDzZ-DiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Mar 2022 14:48:21 -0500 (EST)
Date: Thu, 3 Mar 2022 13:48:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Sandeep Kumar <sandeep.pkumar@tcs.com>
Subject: Re: Issue#3500 : Redfish configuration backup and restore function
Message-ID: <YiEbhAQEdJzf706i@heinlein>
References: <MA1PR01MB4129D8A087F671A505589AB487039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tnwWLRNOKdPAT91k"
Content-Disposition: inline
In-Reply-To: <MA1PR01MB4129D8A087F671A505589AB487039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
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
Cc: gmills@us.ibm.com, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 anoo@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tnwWLRNOKdPAT91k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 07:54:30AM +0000, Sandeep Kumar wrote:
> Hi,
>=20
> While looking at the issues list, came across this. We would like to take=
 this up and work on it. Any help to getting up to speed would help.
>=20
> Thanks,
> Sandeep.

https://github.com/openbmc/openbmc/issues/3500

It looked like this was an issue that was of interest originally to IBM?  T=
he
design was abandoned in Gerrit and there appears to have been no progress a=
t the
DMTF on Redfish interfaces.

Gunnar and Adriana, can you weigh in?

--=20
Patrick Williams

--tnwWLRNOKdPAT91k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIhG4IACgkQqwNHzC0A
wRkuWQ//ZmT4pDIFZIqv9XZWBlMM6/lUa/O5ZWpTBoLhHf8vz+aiPvg3UDEVKeio
Q+GxQ4gOr0DRt24FAZnmj9xrnPSPTQ2DRkWu+ylgS+/2jzLS4R539e6wBOAE7bYF
dwaPl3yzl0E0hXeWMQuDN1+QOXYdmQgJ4IgJjjH0II8f9ouyNCzy0nJt8RuPPVhM
BQ0VbrJViIatboKxVYYqyJ9TGNaCia533XaBBnv6qAkcRlHDufXBDCO1Uzq55/7F
4LfckJ3fna8a2Zox3vITOd3RPM2XOpqkDsJxlf3P5D9aRRs5RUTFpyyYnhLrnugH
6DZHYZL5KM7ay4Pea65dkjgebfpvaOv5NzykMG5styz02Us2qg0p9sLOI7TGGR6Q
hgTQJYSUX2vm0Rz+EIZ+VFDTdsESb2mYEz6rWNmu95C9rNO9t87VFIQ57xo8cy2b
JtqVw5z9rOvpqsHHsvG2xV6AIV31LYfU5NIeEYhD4gkpK+Qwv1SFA9SHXFYCtUNf
8vAxdb5ZyACFvnZVtPq9c4CyFgtuRMAGEi1ebD2f+S96B7hzDwA3bMtr0WfhfaQk
L+Zv31iQiCfK++Mp3+b8PpivA4WMDNhH6+T6nh8Rt5JZhY9tLg5tw/GYTw+gfoWH
0GeDB2/88IzfW8OEefqsiWCgMX3uVCzN1HbWn44+rhr9HSXPTAM=
=Zf3+
-----END PGP SIGNATURE-----

--tnwWLRNOKdPAT91k--
