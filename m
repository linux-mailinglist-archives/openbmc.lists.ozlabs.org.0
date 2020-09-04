Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA125DFE1
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 18:38:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjjzV6GLgzDqm6
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 02:38:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=mXvidelw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=QNWbc0HG; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjjyh6d9NzDqg9
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 02:37:48 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C8C877A3;
 Fri,  4 Sep 2020 12:37:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 04 Sep 2020 12:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=YeTTQsGRqh5g3/LvCNgnAb2b1Vb
 G8fWREl2JVyAx2z4=; b=mXvidelwCLSy1bYhM5qCE4ke/bCAa1dqq+3Jh7gut9M
 kv3xKO8AQMmkMDCKkszYLgetKt/AGBRfl3LbajL9jj6R3odWrwXvqbDQ9GQy8zP4
 tX3LkfOByrwX/b7hBYMnumTw1SbchnjpxMTljENRAeCeEzPhY9ctxGSsp/l+GHUw
 /hfEWz/eeYMt5DJvf/Tv+wl5XJktSQPwKnpCkm9OZ9+DBZ8qfqLvXBay1tcNJvy8
 lWa1N2BWAGPdJ2xUX4tu9Df+96cgyYXBv8Ekh5kgOCaeMldVqT/Y5MCMlL7HLdRT
 J2IexT4Ul1VFtih3XbZVMP9URwU0Y0pHTEfqNwZImpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YeTTQs
 GRqh5g3/LvCNgnAb2b1VbG8fWREl2JVyAx2z4=; b=QNWbc0HGUdxZIqlBl8EUov
 ngBz7efCPkFda0bI+WUfpeuMJffnHTSJJOZhBGk6r4Y73vNTt58IXLTgkBU9V7Cd
 dahcqiZKVlx0DMnBK78v4SIhng2GeeNOk6VzjXgTjeC/+nEj1MdCVEQm4eOUBIQo
 F1Fl+dpX3JmKKBDaNAZmwn2BrglgelWVaf/O2gCUjgEdj2y0WtK2wpcEWL86jufE
 1DlAJTBGbKRYgpEYhn5P0LvUnG+rLzB0Dotk7+2ghdocEHLQYU18cEFJnWGc8mJA
 3hoyHTQcw1x0jB1My1JXiSDUOw2kaHPS0FwC84EtEa8gtAsl1pdNsn0i2u4CAp7w
 ==
X-ME-Sender: <xms:WG1SXwvFTvtdhNqLv6PqD3lpUE6ZmfTikJZXXWEy6NgrQNufMWDLDw>
 <xme:WG1SX9fjqz2qqxNWaW1r4WOGzCmMH55o1uIfC62LaOuhIzdWAXMVuNFuvz7Yj09RZ
 U25tW56w5QX592lpBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghkse
 hsthiftgigrdighiii
X-ME-Proxy: <xmx:WG1SX7yEdyS4yZL0xE_4ksH6IxTsm9guxNCusEoaTBJEBdDzobmeSQ>
 <xmx:WG1SXzPYV5JPXpscSGIMObbblmxKs00Y15QgnpCvZ6F-xQ_RPAYx1A>
 <xmx:WG1SXw-k7AA_xbn87jP9SP2lQEaQViW39dQW7udYxwnhMlQBQrydsQ>
 <xmx:WG1SX1H9UQpNZbaUF1f0OP4vhq0nqegGYdKotSWpylo-1mVEA57Yow>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7BDE328005D;
 Fri,  4 Sep 2020 12:37:43 -0400 (EDT)
Date: Fri, 4 Sep 2020 11:37:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: Resolving service name conflicts
Message-ID: <20200904163742.GB3532@heinlein>
References: <CANGK-S5k=Dy+nf9cDPwNxcU_DELyaAkbmXjsotgpunQscaQ9Bw@mail.gmail.com>
 <e2ff765d96571e247a812bbd8b039b5396eb5a98.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vWfgMjdKllQeoPX8"
Content-Disposition: inline
In-Reply-To: <e2ff765d96571e247a812bbd8b039b5396eb5a98.camel@ozlabs.org>
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
Cc: openbmc@lists.ozlabs.org, Asmitha Karunanithi <asmithakarun@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vWfgMjdKllQeoPX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 06:15:50PM +0800, Jeremy Kerr wrote:
> Hi Asmitha,
>=20
> > To resolve this, the idea is to append the hostname of the client
> > with the service name (whenever the service is being published),
> > given that the hostname will always be unique in my case.
> >=20
> > So, the service file would look like: (example.service)
> > > > <service-group>
> > > >        <name>example-hostname</name>
> > > >        <service>
> > > >                <type>...</type>
> > > >                <port>...</port>
> > > >        </service>
> > > > </service-group>
>=20
> The typical way to do this is just with the hostname only - the service
> type distinguishes different services. So, yes: for better usability,
> you'll want to include the hostname in the <name> tag, rather than a
> fixed string.
>=20
> The .service definitions support wildcards, which makes this super
> easy. Something like this, from our current ssh config:
>=20
>    <service-group>
>      <name replace-wildcards=3D"yes">%h</name>
>      <service>
>        <type>_ssh._tcp</type>
>        <port>22</port>
>      </service>
>    </service-group>
>=20
> Otherwise, as you've noticed, the tooling will just show multiple
> (indistinguishable) entries for each BMC.

Yep, I agree with this direction.  I have many systems on my home
network that advertise "_ssh._tcp" and I don't have problems with Avahi
adding the "#N" mentioned.  Likely this is due to the hostname being
different on all of them.

> Given that the meta-phosphor configuration is to use the service name
> (resulting in those duplicates), I've proposed a change to use the
> hostname as the default instead:
>=20
>  https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/36199
>=20
> Cheers,
>=20
>=20
> Jeremy
>=20

--=20
Patrick Williams

--vWfgMjdKllQeoPX8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9SbVYACgkQqwNHzC0A
wRka7g/9FkSPgrL48c/u9feZ38RLb83UqlVCGHvO43AJ4F/SAhh58aCgM2h1XgII
w5nAaLyRr1Dta6fc2+Vz0HvywM3Y92QwycQaGE/mPenPhjEmwMFgAVYwpKdVah30
eItBc61vY7zlcakxjDBu0AVS2qG4StTPyQm7D8HflqFB8znkP8M2iNyExwUwgTHu
haPS+SVXigkMD9fMOH7JsT0lfiZN2MAD19WFzrboqPAoGPFCimo/8oW0D6r3UAuc
ZZ60ymg3jo7irHZH7+7j8GjIkaF5WKoXmeXmGLrT47bsHADMRnD25axjAxDVeDgL
OUXQ+aLOP1ksW+X4y5CK5aV7Gj5c+Z64MFLZEQhDQYY+146R/xc/Tc9o/haW512o
VV45Km8MSh7xuLYt2CRXCA1qzm5rOHtLczLYLSEHiNVw56Eef0XvzGncTf86UM9h
f+1kNhsiJhGRChjh9rre7kTWYpSQLX1tEqBJiaAA4zc6ecG0yEoEVLKiymG6BB5Z
PDuxtEPbUVU5GXI0WtX+gE/JQnXgp0VOV2R78s4zGT5EywiVM9F+OsFvYqi3sc0s
/xUkyjLGA8WRlFykSw5w64coRyU921OSgGCVyN+cOvEauEfnahJ2wiZ1AqYFUt1+
Wa/MyXvukir4CDSaq7+Em1y1PHWLARMEqoy4xikV+Fadp2LwEWg=
=qySU
-----END PGP SIGNATURE-----

--vWfgMjdKllQeoPX8--
