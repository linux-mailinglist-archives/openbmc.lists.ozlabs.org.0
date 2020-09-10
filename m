Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90263263B7E
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 05:36:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn4LP4txWzDqbY
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 13:36:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=MMmGOsZQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ivNNtwqM; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn4KS2S7qzDqSh
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 13:35:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D5875C0190;
 Wed,  9 Sep 2020 23:35:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 23:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=QYpVQ
 FnzGwFD2lN+mqBskTT/8FQ1zcks0aSrVRcbzfQ=; b=MMmGOsZQtvcPy84W9plly
 FbcMybI0vND4trvsMKNdI6ykFsRAY1Orrea3b6hSwPzCJuXu+2KbGGu1NFEP9jcO
 AN9EjKuEyWqA6W9lmEjOFDPklY889Vq/fPc7MSMz3Af3O9qWYgReYUV3HEY81TBB
 AKcgiarSuMrVAnZ8IiwyJH+7C3HyJmXfQoYF2yjVoLzzgd+K/ZgS1FYRn+LTXYfn
 7LU97vC2jqdcpEZ9b7gzX7JAq4IWVuK+ftC6aB2Gj17IDrDCRcmlQ1OVQmOocAOd
 dwxuWqC7RJNEETDOXKy8Ec40Tq7VXS7bSdeud7qXpl915IDNvhNhPKU7bVYxJjeG
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=QYpVQFnzGwFD2lN+mqBskTT/8FQ1zcks0aSrVRcbz
 fQ=; b=ivNNtwqMTKYFRRA6DEHv0zh4Z9vZgpA/5qqR1EhEQfbeIDVGP9/yr8Wec
 0qcCc1fTa21/gduGrACgT2Pn3r0BUu7geAJBUjZlhZLA4VpsARnWNyPHNMDVWouk
 bxq/fLzBlSQBWA20vFvpiYkBn+8T9PnhPHjuEuh4fUFATItjr5I3Edu966sZdkOR
 zrHrlLg4BvrRYl11YO0nlrEVa+BPso0i/3r+n6tm9ezKmxHP6RRTC80XSgqgnNGA
 klx7KOlEBYEu0mM9UzG1pTYz4111kJE9OmeZLaA5ZchzAyXg0YRD7ICc21qWHSJW
 540znQ5iWTjZfDGIUQ3l5vNJIpqDA==
X-ME-Sender: <xms:CJ9ZX-VThbsqRzmMqwxG8Tf5S4IiQVq37lfnTiMrGSyiFH2VVx-1_g>
 <xme:CJ9ZX6mSNtZte6lWF1jU9tvZ5xDP9UrPcOmFGttcSSi8tRxNrwuqisoW_elNGnZdE
 J0Gq-KQ1ToP47bsLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedthfevueekjeeffeegtdfhtefgleeigeejheeufeduledvgffhgeef
 teeuffevhfenucffohhmrghinhepphhusghlihgtqdhinhgsohigrdhorhhgpdhophgvnh
 gsmhgtrdhorhhgpdhoiihlrggsshdrohhrghdpmhgrihhlmhgrnhefrdhorhhgnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:CJ9ZXyagLPb3EifPbTKWXqiH_B7H4ZTwTrS1uc6kZRn5xj0LkyHSOw>
 <xmx:CJ9ZX1XAzcQxf6oByOMGLBEPZtJKY7yjFEwOi7K0sQK8ilRqQVgBmw>
 <xmx:CJ9ZX4kGB-eoXGM9Lk6wp-RR85J8JQIQNNlqM-CKQp8w_avH69jRiw>
 <xmx:CZ9ZX0uhmtv2dbVWJV3DsKu_JxEsK88cBoDNMfyF6Lc5u5n6S45D6g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EF3EBE00A6; Wed,  9 Sep 2020 23:35:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
In-Reply-To: <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
Date: Thu, 10 Sep 2020 13:05:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Gunnar Mills" <gmills@linux.vnet.ibm.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: How to comprehensively search the OpenBMC Archives
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 9 Sep 2020, at 07:52, Muggeridge, Matt wrote:
> I am impressed Joseph!  Thank you.  That certainly highlights the=20
> lengths others have gone to for a comprehensive search feature.
>=20
> There is a lot of very valuable content locked up in these archives. =20=

> I'm hopeful admins will agree that comprehensive searching of the=20
> archives needs to be made easier and more accessible to the masses.

Maybe we should set up a public-inbox instance?

https://public-inbox.org/README.html

lore.openbmc.org?

Andrew

>=20
> Matt.
>=20
> > -----Original Message-----
> > From: Joseph Reynolds <jrey@linux.ibm.com>
> > Sent: Wednesday, 9 September 2020 7:25 AM
> > To: Gunnar Mills <gmills@linux.vnet.ibm.com>; Muggeridge, Matt
> > <matt.muggeridge2@hpe.com>; OpenBMC Maillist
> > <openbmc@lists.ozlabs.org>
> > Subject: Re: How to comprehensively search the OpenBMC Archives
> >=20
> > On 9/8/20 1:51 PM, Gunnar Mills wrote:
> > > On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
> > >>
> > >> Is there a more comprehensive/reliable way to search through thes=
e
> > >> mamil archives?
> > >>
> >=20
> > I used the following (bash) script to download the entire openbmc em=
ail
> > archive to my workstation's storage.=C2=A0 (And then I use my local =
search
> > capability (grep,=C2=A0 spotlight search, Windows-f, etc.) to locate=
 the desired
> > content.
> >=20
> > - Joseph
> >=20
> > wget --no-check-certificate
> > INVALID URI REMOVED
> > 3A__lists.ozlabs.org_pipermail_openbmc&d=3DDwID-
> > g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> > 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> > OhYZN2fNFoROxHeM&s=3DoUgen4rG7u90Uby5812hA_y0dDnG41oD1ZuA4K7K
> > NiU&e=3D
> > set -x
> > for f in $(grep '<td>.*.txt.gz' index.html | cut -d\" -f2); do
> >  =C2=A0 wget --no-check-certificate
> > INVALID URI REMOVED
> > 3A__lists.ozlabs.org_pipermail_openbmc_-24f&d=3DDwID-
> > g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> > 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> > OhYZN2fNFoROxHeM&s=3DAVV8sFghgocf1nC9Vf7UGQtg9m1A63Yeux7DAywt
> > cRs&e=3D
> >  =C2=A0 gunzip "$f"
> > done
> >=20
> >=20
> > > +1. Could we look at moving to Mailman v3 and like
> > > INVALID URI REMOVED
> > 3A__docs.mailman3.org_projects_hyperkitty_en_latest_&d=3DDwID-
> > g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> > 14MxJzMR9PZk&m=3DtjRnWO2f8md0hwPIF4dbkqaJbj-
> > OhYZN2fNFoROxHeM&s=3DHWwrQzEzVNtANfa8DBfvdGnK_2nRlSp-
> > peNmEl1y6n0&e=3D  ?
> > >
> > >
> > >> I have been using google to search the archives, but have noticed=
 the
> > >> results are not complete.
> > >>
> > >>
> > >
>=20
>
