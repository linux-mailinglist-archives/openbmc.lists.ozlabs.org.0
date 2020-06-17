Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0B1FD656
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 22:46:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nHDS0qMBzDqx6
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 06:46:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=nK+e5OfN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aSJ6h0jV; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nHBr322szDqyY
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 06:45:22 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CEFD75C0184;
 Wed, 17 Jun 2020 16:45:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 17 Jun 2020 16:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zebnbVtQ+aol5NRDsMPGLN+QFnQ
 huV/vRtHfTqend8c=; b=nK+e5OfNWn8U3Xk6+SPOzAomI57FYvAtvId1SW2xhJS
 J/qgJjSpJ2ZL63E5nFLGBr5VgyU8qQv3gIynRRiK6D3MhUhlGpuqIrKMAwxUcWGQ
 +MU5YIZHSvU3YfdgnMHob1tXN6X4BIX+6WNV5uExwnVqfwb2m7GzpyFgna9y6CfJ
 Wackne6HsgKcv4gcUbVTyP6QUPe2kU/2hsR2Ad/gmMba0/bVcxH2UbyQJ3gGhuPu
 iYlv7/RflcumUvSCMgB+s8HNBGdI8wLVfXf53bqyiEoD53Zw0c0QB84bFcJlnsvJ
 tmVrbjRuGV6n8fe7AicSTF+M5Tb2g/NumUU4W0lkuhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zebnbV
 tQ+aol5NRDsMPGLN+QFnQhuV/vRtHfTqend8c=; b=aSJ6h0jVQIB3TqbLpnqFlg
 3n/22lvF711I9D9EPRxqU0HBbewTckONMF85LUQKVfnGDe6qTXExLdKNFTO4pcd0
 g6scPr17RTX6VxgATbMGrtErRhR6YT9FoFxhSkJhWcn4QjGBsp8JNVg71CIXbxqI
 wIE5LKZY94Dg4FlRaK5mfoSVUGPa535NUu4XB/k30qTF4XzizkLVKI1lv7DL0HVn
 gDQst8G/sQXGSYsZTXeu3grs7n/oiLSebkgYovs9KjduqLj7ng6riRBf7us7v7Bu
 PbQO/oy0dSWIqBHkdnqYhhY3zR3DMR7g4uE9M70276+NElqUZw5XVD3MttjaXBmw
 ==
X-ME-Sender: <xms:3oDqXkHhHNO-w-jK8Hzo3b1nNJTg4GtCswxpE1YyaKYrla2apv0adQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefffffvdfgtdeludefleefvdff
 kedvfeefueelveduiedtgeeuvefgtdeiueeuveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:3oDqXtVqjiOzMXb1Qdum_zFWI2vLjRE7ddk0-kfx07ee5YnLxYKdyQ>
 <xmx:3oDqXuIyW0HlEYRlASLbPDSxrPkUXSqo-YpXUf4XRu08UvttbrF87A>
 <xmx:3oDqXmEix-y_gsu2q20ooPe2d9lv30_apEMsT6bhASeGNMFxe8LFyw>
 <xmx:3oDqXnjKi53joY_aUkbUvv3ekAbdl3HRSvqrKAsUTunIsmDpMMoGag>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id DDF4930618B7;
 Wed, 17 Jun 2020 16:45:17 -0400 (EDT)
Date: Wed, 17 Jun 2020 15:45:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Redfish EventService Implementation
Message-ID: <20200617204516.GE4618@heinlein>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline
In-Reply-To: <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
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
Cc: "Puli, Apparao" <apparao.puli@linux.intel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0H629O+sVkh21xTi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:38:47PM +0530, Ratan Gupta wrote:
> Hi James,Pattrick.
>=20
> >> Can't we do this already today by defining a simple errors/metadata fi=
le
> >> in phosphor-dbus-interfaces and calling 'logging::report<...>' on it?
> >> This will create a record on dbus in phosphor-logging.
> >>
> > I think the original concern was with supporting on the order of=20
> > 10,000 log entries, having this on d-bus seemed impractical. Also the=
=20
> > free log rotation the journal provides is useful. Now modifying the=20
> > logging::report<...> to conditionally log to the journal seems realisti=
c.
> My intention was not to re-implement the logging, my intention was to=20
> extend/use the existing design which we already have it below.
>=20
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-=
in-bmcweb.md
>=20
> I was trying not to bring the Redfish specific stuff in each individual=
=20
> repo, instead each transport can listen for
> Dbus events and write to the journal which goes to their app specific fil=
e.

Good.  This wasn't clear from the earlier email.  Thanks.


> As we are in agreement that we want to use the journal for persistence=20
> and log rotate feature.

I'm not convinced there is agreement on this.  There has been
disagreement about even using the journal for phosphor-logging use since
the beginning and I suspect there would be less agreement on another
application using it as its own IPC mechanism.

Just because a hammer can be used to insert a nail into a board doesn't
mean you use it insert any pointy thing into a flat thing.  [ Just
because the journal provides log rotation and persistance doesn't mean
you should use it for every feature needing log rotation and
persistance. ]


> ***** As per the Redfish one of the requirement is we need the log for=20
> most of the Dbus Property update/interface added as they
> are mapped to some Redfish Resource and the bmcweb has to send the=20
> Resource updated/modified signal to the
> Redfish client. ******

I don't know Redfish well, so bear with me if there is something obvious
I'm missing.  But, the first part of this "requirement" doesn't seem to
follow from the second part of the "requirement" to me.

Sending a signal of a property changing to the Redfish clients is
straight-forwawrd; Redfish should subscribe to all the appropriate
dbus-events.  I don't understand how this implies any sort of logging.
Where does the logging part of this requirement come from?

> We have two options:
>  =A0=A0=A0 1) Each transport interface listens for the Dbus signals and w=
rite=20
> it to their app specific file.
>  =A0=A0=A0 2) Each openbmc repo must use log::report for each D-bus prope=
rty=20
> update/ interface added.

#2 is absolutely unworkable on the surface to me.  log::report is to
create a error entry (xyz.openbmc_project.Logging.Entry), which creates
a dbus-object, which would cause log::report to be called, which creates
a dbus-object, which ...

Even if what you meant was something like logging::log<info>, this seems
pretty heavy.  I'm not sure this is something that can be inserted into
sdbusplus, especially for the ASIO-based object servers, because in many
cases applications register their own callback.  For the sdbus++
generated server bindings we could squeeze it in.  But, what you're
proposing here is essentially a "journal-as-dbus-monitor".  We'd
certainly need to make some measurements on how many kB/s worth of
journal entries this would create because I suspect we could end up
burning out a NAND flash with as many writes as that would induce.

--=20
Patrick Williams

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7qgNoACgkQqwNHzC0A
wRkYUw//a07hvWuaKXHgQ2rpYBIp0gfXO2Na5HVLrNnI3RwRvOPZJDNcikEhkjsm
1/wfqWkgWQtWiu25B0lmKXIvqVx8s5beXMntCoRs8IuQ5BexdcYv86dNmGpLPNlQ
dwx3YIaKI6njbcRAuFO1Kxdh2g4z3msq7RoZ6t4CPxzmFEEO/G5Q6bt0D5Bf4hN8
gcMgg+vP+4Rvrh19TaTnLXDJg2TvSFHMoANzGHZYJ99qqLA72Vp6GdOMU4JCDS1H
Zj0bcgNqcvzE5rbYYO7NVoP8O2ETswl5uj7OptPF2JGQ0sSf51adSxA764ySwT2z
mXgYG8ldGsdHcRKllb4NIbrLm7SwdDHlQxfTbERoEEDgzZkcsm+oDyQBVOkeEMiH
iV8UeTVhP2pXeT6ZAeiVuED2YYV87TUM1DwuyUbMqlO0QGs1CicW/sVoGL/Sf56q
pmhr+k0qd4I9/uikAgwf4L/jOaNsspwKBLOx230Mw5KKZujtUxgnN5ExgOMvi7tW
UgMbXBd1PrnYPt1HkCf8FMGt560fJ13SZo9RmtXwEP5xcpDX5eYUBSQEEMiZBQ53
pVmAiKHCEjeRYg29U5K4GxluZO0NgpNQSYv2PB6bS67zPcsGuyomH1Y8lc7Jgnig
MRCiHrSavE2E2FWja0N0vC+SDex7mRteYyJtASJN2EOwaKfsR4o=
=F/7Z
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--
