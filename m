Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD430B581
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 03:56:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8bf4M2MzDqxH
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 13:56:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=2nLERSC/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mj71hsVI; 
 dkim-atps=neutral
X-Greylist: delayed 602 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Feb 2021 13:55:59 AEDT
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8Zl5lz0zDqTk
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 13:55:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2C24B58042C;
 Mon,  1 Feb 2021 21:45:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 21:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WrUVzEbtCkPPqnnaNqFMPSGFScn
 dLJPyFDEHXQguuPQ=; b=2nLERSC/bgCDGtyAAJa/LNxRXU7QhFtqZGqS4Q1wW5o
 YwiAVnzwawUmU9VVpP5/A9YHC7dCcd7vpzSqVx2pshjEUpah4S/qf0lJ5xGKMX1N
 aZfmS2zK6DAY6ov15dBwsKwqKCWq6bFTOB87rrB07F6f8Brq6WnlLJsjOO8PfvbQ
 ZboETfD0G2NiFBdOAqVB+SPybhxQcHs+dGacfXzXY+Bh0mKlTTAkxJNCD7uL2MFa
 XUFzQXET/H5Cj2FOH8EDGLywFg1AJ5SkrUBWz8QjgXDsAVmgkQ7yALEmCm+CzkaG
 ZS/5qa3Do9rmYN//eQFHAEQgXN/gTFEOTmPsVu8Sefw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WrUVzE
 btCkPPqnnaNqFMPSGFScndLJPyFDEHXQguuPQ=; b=mj71hsVIN6nK57CSCq1mIn
 OGX+YzMslqF4P5yvqr2ofOF8LM5MSVneUaA/AK1hFpf83mxo+cK8ns6D3d4CSJgg
 8XcKEolscjgGSQLq/Rpb9kgQdoMdBP8olb4/BKedoDRbrzsqkvLPCfUmqr/BSQ0O
 bTKcA0lIU7SqLkEyxDo5TqJyOd1ppMIrlygkzh0beOI++BnuaTKGBGd3vvW1dIkU
 Vz4eY3uvQ4RGxWEvgnpiu+Xy9BsaaQVDFHah52F9OPQqhuuNfylzYcZdaZ4c9U+r
 txfKgkxcJh/Jqqu+BkyJA0F682m91/JY6vahv6uxhF4ewyKh0UDRpcC2iLS2NN3w
 ==
X-ME-Sender: <xms:4LwYYEFTWa0D8ZqS9wRbR66uaFKzcp0Bgp4ZPH3pEnETbmIpMNDBZA>
 <xme:4LwYYNX0tnXOMz43j7Q42uIbiQUHEcvChcEZMHarBrhR_adDKtrBoBTnmFGHEzTQN
 LWqETnQzQTETkrDiI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvhfejueduveeuteegvdevudffteeu
 hfeuieejfeffgedvteejkeehleekuddugeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecukfhppeejiedrvdehtddrkeeg
 rddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4LwYYOL0meCB4X8sjiSfeD3MBu6ycEBGYv3b2KVog5ef0MLWNv7QdQ>
 <xmx:4LwYYGG8y_SI_OChj4iz5rpbgyn1ZvSfjIv7dkGmVnyr928BSQqNbw>
 <xmx:4LwYYKUfrknO--kylO8TAA0ySCKMKiRcjx0JFfvvlZWZktqcyzF2wQ>
 <xmx:4rwYYGS3PJjQEU-_WUESaII4eW0BniOz4CN_0opd4poraTUjMOrRYQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FE951080063;
 Mon,  1 Feb 2021 21:45:52 -0500 (EST)
Date: Mon, 1 Feb 2021 20:45:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Progress Codes in BMC
Message-ID: <YBi83kwe6SZqkcq0@heinlein>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
 <YBVtvlsJJJ4faFpt@heinlein>
 <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="urxjqKMRcg96mtSq"
Content-Disposition: inline
In-Reply-To: <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
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
Cc: kunyi731@gmail.com, anoo@us.ibm.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, ed@tanous.net, gmills@linux.ibm.com,
 vishwa@linux.ibm.com, Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 jason.m.bills@linux.intel.com, vijaykhemka@fb.com, wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--urxjqKMRcg96mtSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 07:21:39PM -0500, Brad Bishop wrote:
> On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
> >On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
> >>
> >> There are multiple sources of the codes - on Power the power sequencing
> >> is done on the BMC and that is considered part of the server boot so we
> >> have both those applications indicating their progress along with the
> >> more traditional progress flowing down from system firmware.
> >
> >The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
> >You just write the `Value` property. =20
>=20
> Ok.  Do I have it right - on any application that wants to post a=20
> "progress code" you would just implement this interface on a single=20
> (arbitrary?) path and continually write to the Value property?

I think it is even simpler than that.  You just need to make a dbus
client call to write to the Boot.Raw value.  This might happen from your
boot sequence on the BMC-side or from PLDM for the Host-side.

You will want the phosphor-post-code-manager application running, which will
listen to the PropertyChanged signals from Boot.Raw and keep the running
history for you.

There is also phosphor-host-postd.  Currently it has an implementation
that looks at LPC to get the post codes.  There was a proposed
implementation [1] that added multi-host support and I think support to
get the value directly from dbus client writes to Boot.Raw instead of
the lpc-snoop method.  Then there is code in fb-ipmi-oem that writes the
results of some IPMB messages into the Boot.Raw value[2].  Looking at
this I'm not positive that all the pieces are all there, but I think it
is mostly there.  Maybe check with the author on 1 to see where it is
at.

This design doc might be useful too [3].

1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-postd/+/36509
2. https://github.com/openbmc/fb-ipmi-oem/blob/master/src/biccommands.cpp#L=
76
3. https://github.com/openbmc/docs/blob/master/designs/multi-host-postcode.=
md

--=20
Patrick Williams

--urxjqKMRcg96mtSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAYvNgACgkQqwNHzC0A
wRncww/+K02caxkq4MIj0RL7cjZaz1Xh/4uoSqXFKeBc7ICeJasWk+OSMoRl9lSB
1smBOcBpO9idhnwvKTjcsnn9ux+A2BEKZ8M0PtBzioBCHAVTL93Q6jX+xeWUK7/d
PUSMwnHXxsMtu8d0nTtGC69mac2QEeb/mOGLMCBP+3WVjEsD9Xik5AkGnjbVwLwe
QasUaQnTJCSpoeKIy7ii6+QWHoRx5D83omz4fXKTldvHikJtYe0NB4rCIKdHgz0u
xm2pxW9LFil4aSeCpv8qsl3xUIniZ5TDZK8D9nQATBE5Az06nyEuEBf7NcX41Rhy
CILOahjTfh0wQ6mX2NWlG/cVFmc6v/Tber+uT/hrMyeXCytnBGEWelgEzSquZNcB
CKsomJkekcYiqAZxaKG2NMV62kZW5YTfPY28GDYTUPn1c8T1aiY5N1g04r3qRGsY
HYBgxdWBxIq/k4A5k0k9aD/DNXgwsPk6QXP7TIJKLyJyu8+iKGEwj3KkQdLi9FcC
pKPIJa8j5dfBkM1uiqcthsUrVNHpFEvG+OCB13EzdQom/ykVoKAS4hb24Uzz9+5t
bVX8N8VwqG45WmcvUkmTsDKuL6F75jqeCJ4PCtDSA23bmlt7Q+mERTN2VEmWfzZ4
0YsH70ERpYDove1hGMs0A/5dA7IdBDQRaGEsa9Qc+nSCTwuPwKw=
=psLW
-----END PGP SIGNATURE-----

--urxjqKMRcg96mtSq--
