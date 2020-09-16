Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537426D05E
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:08:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJjt6nH8zDrh2
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:08:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=ALcw/T7I; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nJ0LaxKe; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6q1czFzDqrM
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 74DA15C0E90;
 Wed, 16 Sep 2020 13:08:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 16 Sep 2020 13:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=dtiVuPrhY4fM+yxIT5k73SedT01
 6IFsfvutS8b4ivCI=; b=ALcw/T7IV3L6jSqso+4VUiLJalZKSi/cIfBalR5sfm3
 U2fwNW2UKWuGIiTYqvSHv31FexVAFOLIMkUoXiCtSWiyH7bEybg0XZWBFqAEyEbL
 8ykzQfxrpW+P1fBHlCfnsSVT0/KBHtoYGxsG+88p7VbgbCDW9XBl9BcVJ2uGrK9V
 YAHS/Qbh2K/Ls2ZWdwS9K5rR9tRSanXAzliO1XSj3AOW2NSpSxEBySK2BtclARIx
 /HItCrTWCC7lU/eex+Xr7nhQ2Kyiav5pXP7u5KchQqi4DEu6zCVUCf101k4p1B5X
 9zpHomJQ8M66GzoZvWPgGLdh7hnZzoPowE/9ZS6LmYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dtiVuP
 rhY4fM+yxIT5k73SedT016IFsfvutS8b4ivCI=; b=nJ0LaxKeNg+brG81OuHRVY
 Jxfo5MuoSSo3UtfmQTXGhgqszd2UUXtgGA1OKgjXaT2EIn1QZBS6zTDiul7RDHIC
 LOMG2c8uYc7Bc5meSPp+HCeSWihcMapBgfcF4MosOqHeD61SNJaGk6rqTzKQD1+W
 +z/faQMlaVVoasn2v479H6AItCgJTiNOlwmfdIFbKqHWClbhOJzEqmqPt97pWhCh
 byrd1BITNXuQE+exOO6LnjhDP5dISuBbvvmttLeeAH+XYmfxSKKZC46oh054PC/i
 1WwBaxjCCPODpT+lSChoQnCKxgASkMP7SEeA8+exU/r4GFeGRrdkLUDH4/2wWh9Q
 ==
X-ME-Sender: <xms:fkZiXwmhi0XUi8m6fyActIDyw_YRquNnfUoXNMrePQV-eY6fEhQcew>
 <xme:fkZiX_3CY5myIPZ-hBhJxGa8dm59MJHeLyHVA_wa9L0l2GBhTClHW2t4SShYzmdBl
 3_iVXxj8JzcrYuuuRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:fkZiX-qrRQ9hwC-gekyYjdgiuX7KOfpz0TNyUVLo6rI1TjzH6dsGMw>
 <xmx:fkZiX8naucXOw-iVwT63MsAmBZ9gWWpNTRhGN9jtHhldUPNBWFCc6w>
 <xmx:fkZiX-2BQmaUxocXN8q8Iqu87GyZetJkk5TZZ2VI8CVsFhYpDHn8JQ>
 <xmx:gEZiXz8WPH1yt5onuNmRrEV7WJA4tl3r8fquYi9aSxquh5IKXyjTmA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C4A51306467E;
 Wed, 16 Sep 2020 13:08:13 -0400 (EDT)
Date: Wed, 16 Sep 2020 12:08:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
Message-ID: <20200916170811.GC6152@heinlein>
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline
In-Reply-To: <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I would prefer we implement Units in dbus-sensors.  Reasons below.

On Wed, Sep 16, 2020 at 09:24:19AM -0700, Ed Tanous wrote:
> On Wed, Sep 16, 2020 at 8:23 AM James Feist <james.feist@linux.intel.com>=
 wrote:
> >
> > On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> > > Hi,
> > >
> > > We noticed that dbus-sensors doesn't fully implement
> > > xyz.openbmc_project.Sensor.Value interface: there is no Unit property
> > > for all the sensors, defined by dbus-sensors.
> > > I believe it was intentionally, but I still wondering what was the
> > > reason?
> >
> > It was originally as the information seemed redundant. If the
> > information is needed I'm fine with someone adding it, it just hasn't
> > seemed to be a high priority.
>=20
> Considering we've gone this long with no impact (considering the path
> can be used to lookup the unit) I wonder if we should consider
> removing unit from the sensor Value API?  It doesn't seem used.

The redundancy comes about from this list: [1].  I don't really recall
why we went with that approach where sensors were required to be in a
particular place in the object hierarchy.

I think we only "got away" with "no impact" from the lack of
implementation because the particular implementations that work well
with dbus-sensors also didn't implement it because dbus-sensors didn't
provide it.  That's kind of circular logic as a reason to eliminate it.

>=20
> >
> > > I noticed that in intel-ipmi-oem units are determined based on object
> > > paths, but that looks ugly since there is well-defined natural
> > > interface for units in dbus.
> > > Lack of the "Unit" property in the interface breaks some existing
> > > logic.
> > >
>=20
> Technically the way the interfaces define it, both are valid to use to
> determine the Units, and both would need to be lookup tables.  Is
> using the path any more ugly than using the property?

There isn't really a programatic way to define and enforce object paths
presently.  There is a programatic way to define and enforce
enum values.  The enums don't actually need a lookup table, if you're
using the sdbusplus generated headers and bindings.

If I were to guess which of the requirements would be more likely to be
changed it would be the object path.  There are very few other places
where we have such strict requirements on object paths (though we do
have places where the object path has meaning).  The current definition
is a bit ambiguous by what is meant by "the correct hierarchy within the
sensors namespace[2]", but the current implementations seem to take this
to mean `/xyz/openbmc_project/sensors/...`[3].  I don't know that this is
particular convenient for a multi-host system or any case where a BMC
is aggregating sensors from other BMCs.

Unless we get some stronger definition on what is meant by [2], the only
completely correct code is to look for the type at all the various
segments of the object path (ex. "fan_tach" could be found at
/xyz/openbmc_project/sensors/fan_tach/node2/fan0 or
/node2/xyz/openbmc_project/sensors/fan_tach/fan0).  Using the enum value
is far easier in this case.

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Sensor/Value.interface.yaml#L37
2. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Sensor/Value.interface.yaml#L3
3. https://github.com/openbmc/bmcweb/blob/cb13a39253848ece442971301ade9c09d=
98bf08e/redfish-core/lib/sensors.hpp#L56

--=20
Patrick Williams

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9iRngACgkQqwNHzC0A
wRn1Rw//YWoRIscudl+VSPI8Ud318kLMGV5gkiM2LQ7Hmjiwv+b1PK6d3Yjj/TOe
mKlieezBLGfh+WDrFg3VnBNmNJbUOT4gKKudkvqGqUNYAW0zGR8YUifOVITW7F2i
KL4m3Krce4B3mwyTf2PtqDHTuqETb4jZSlK6pLyghrSSn5H9t7n8tbqqWMWDMvuZ
I/TdcRBZ5Y0ksgE/6ygbvAjl0zwxhFoSo1ixkEnLDRkPobZCENJo7w+UgKkNNVQm
WjPsIuNPg7CcpjVn+P3sxaYYUUe6jJ84pFQI0RjCAlqZRgWBwPm2xr0ME/6Pr3Xx
DLk646Xp1DsxdcqLzs+qlXGsvlXpS32hP96M456AzeRNrhb3YlwnWZVovZnI4ITg
y//oN8Gn0RLi6d3dJBlmkBTo4/E6sE3AG922OgbAt2TUgGyngBerbYR0wgi522Vn
hwP0/vWuR30dIS9E1aLuNFqp9TbPGgEA3EQlJfr8WfOA7HlszAcPT4XBoRvagqVZ
g0Vklnq21eyjOL7Mg91wDJiWrNDheorOGLymCjk18eMk3ZwyU5c2+YjBm6BYrg8x
KmB5/jAIpcD2ppFxCNCvOsTYkz5rPzTHrGR7Bj+oWnzoex2k5NrzD4A4/odV+2Ar
lDhozi1/9RdInJeLsYIMEnpV9q/GdLkocd18vgZx96ip/DLsg90=
=h+Gu
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
