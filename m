Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E64111F6
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 05:54:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vhGj1yrwzDqQC
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 13:54:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="doh/LxEm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="d5PfAPIm"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vhFv3NKWzDqPG
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 13:53:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE09B231CF;
 Wed,  1 May 2019 23:53:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 23:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=Rg3HD
 FWzJp2sb+vgfP1XFpLhSx1yFSABunpbD0ImuGc=; b=doh/LxEm/6NQsZrEf2upw
 JlTAojK1W/mPdPhK/ETuVg/XS6Ssh4Aol6+jyIc7jaKUuKfeNFNQQ7Ln6r8N5q0c
 RFn5xi9fYW403pkrXhZyEvCUKDWuLG05tQLBcyFXHCIClxdwROENUi9fnKGdAXd6
 deWC95qhuGoE1s9RPXTO4e1qTDSnlMuxm1Fo7Eqah1duS4modK848oMmrfEpJnSS
 hoI9078kOKl6H7mzKNNEtDKskGCScj1ogaQwDM8DHKigO6BEXTGc2/clWLunirYl
 sVbZMKj/pwFsiSoUepGV9lI7QwcPrrUaaFCEXTqIG/Ncr6q2r5s8IkymKAK/5Ql7
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Rg3HDFWzJp2sb+vgfP1XFpLhSx1yFSABunpbD0Imu
 Gc=; b=d5PfAPIm1FtMnKdgRwj7N5M9rObxsySN8JXGfHIwLU/UVuLZkEZCzc/Ia
 /rA2jpJi/kCeAaMQbAmkUODXtS3c47tCZBHog3npJVkk6Tz0A5pmA51peXkkFkLg
 idr67rehe/9AlHVocH3PHel/0J2x+GmXcIDDIk17XGd/88GFCx265vC5RI+/WJv+
 1OvSEHf5MmyvLjbJF9Bpj5L5JFCLkwQhtWgbUrTBjepMzAdV6CviJrpkW8iHsG2L
 uv+7YjH7yCheC+c7SF0RZuZO6/BQF4J3LRo3DuTFyl7B+RgV8o9sQrVBRkOL+ZP4
 reweuWfJSOaTbBHSFfKzZXeg5ImVA==
X-ME-Sender: <xms:z2nKXOCS76ovqPNtEWNX9uiEk1kAzlw8BvjRAGavhRlxPnKRrD1zhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieekgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:0GnKXPiJpQ8ZEF8oQt_QgzUmmZ7gJ4MVF1LWQ1Qclpvz_TZsCMEMiA>
 <xmx:0GnKXGmc-hEKq0cMlZTngj9OWb3uCGiRh0HN9ZApiTiJ6v-DCaUmVA>
 <xmx:0GnKXLr8Juj590Bpv8vT1wbTLKM2cCnJfdZ8uVwyhkTnYQz7rw8n-w>
 <xmx:0GnKXHjFYMhOtK6ywOBbbDmatWRCjusZhyHkol8PGyGahaitL4BcQA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D45C17C6D9; Wed,  1 May 2019 23:53:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <0e8fa572-e01b-4c42-8544-a8a564256315@www.fastmail.com>
In-Reply-To: <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
References: <20190417133941.22962-4-clg@kaod.org>
 <20190417133941.22962-1-clg@kaod.org>
 <OF33F9274D.5DFDAC84-ON002583E0.00758962-002583E0.0075896A@notes.na.collabserv.com>
 <a8ab1055-64c6-4763-b244-2a17e70a10a1@www.fastmail.com>
 <d3ca43d0-0b47-bcd4-c2ae-d70226b5d12f@kaod.org>
 <090455f7-21dd-4e96-888e-1b23592bdfa3@www.fastmail.com>
 <a914efb5-758f-b586-15f8-460ea6cbb225@kaod.org>
Date: Wed, 01 May 2019 23:53:51 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Milton Miller II" <miltonm@us.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH_dev-5.0_3/4]_mtd:_spi-nor:_aspeed:_use_memcpy=5Ffro?=
 =?UTF-8?Q?mio()_to_capture_the_optimization_buffer?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 19 Apr 2019, at 17:39, C=C3=A9dric Le Goater wrote:
> On 4/19/19 9:23 AM, Andrew Jeffery wrote:
> > Hi C=C3=A9dric
> >=20
> > On Fri, 19 Apr 2019, at 15:32, C=C3=A9dric Le Goater wrote:
> >> On 4/19/19 3:03 AM, Andrew Jeffery wrote:
> >>>
> >>>
> >>> On Fri, 19 Apr 2019, at 06:53, Milton Miller II wrote:
> >>>> About 04/17/2019 09:20AM in some timezone, C=C3=A9dric Le Goater =
wrote:
> >>>>
> >>>>
> >>>>> aspeed_smc_read_from_ahb() only reads the first word which is no=
t
> >>>>> what
> >>>>> we want. We want to capture a CALIBRATE_BUF_SIZE size window of =
the
> >>>>> flash contents to optimize the read.
> >>>>>
> >>>>
> >>>> NACK
> >>>>
> >>>> This justifcation is false.  The routine reads the whole buffer
> >>>> because it calls the _rep routine and takes the size.
> >>
> >> It doesn't AFAICT looking at other drivers and also from my test.
> >>
> >>>> In addition, the comment just before aspeed_smc_read_from_ahb
> >>>> tells why memcpy_fromio and memcpy_toio are broken on 32 bit
> >>
> >> That might have been the case on Linux 4.7. It doesn't seem to be=20=

> >> the case anymore. See below.
> >>
> >>>> arm, and this is still the case judging from the recent bug
> >>>> reportfrom a Nuvaton user [1].
> >>>>
> >>>> [1] https://github.com/openbmc/openbmc/issues/3521
> >>>>
> >>>> Andrew, Please revert this patch.
> >>
> >> I don't think you have enough convincing arguments for that.
> >=20
> > That may be the case, but having seen the pain of the original corru=
ption
> > problems that drove the ioreadX_rep() implementation above, Milton's=

> > protest combined with my initial, briefly nagging concern was enough=
 for
> > me to revert. Two things here:
> >=20
> > 1. We've run without this patch for quite some time. Despite odditie=
s,
> > the existing implementation has been stable
> > 2. With patch 4/4, you've resolved the 4B corruption problem. This w=
as
> > the immediate concern, as it was impacting teams developing and
> > testing OpenBMC master. I appreciate the effort you put into hunting=

> > that down, the root cause was certainly not obvious.
> >=20
> > From *my* testing we appear to be stable both with and without this
> > change, however my concern is that *my* testing is not complete enou=
gh
> > to be confident that we're not going to hit the subtle corruption pr=
oblems
> > that drove the introduction of the existing code.
>=20
> QEMU would have caught this regression if SFDP was modeled. It does to=
day
> if 4B opcodes are forced on the mx25l25635e. Given the time the team s=
pent
> on this, I would say 1 or 2PM overall, QEMU is a good investment.=20
>                                                   ^
>                                                   |
> Managers are you reading this ? ------------------+=20
>=20
> > For some additional context, I'm now on leave until the 30th, and Jo=
el to
> > the 29th. These patches have been through a process that has proceed=
ed
> > much more hastily than I would have liked, and that's lead to where =
we
> > are now.
> >=20
> > With that in mind, less change is better, and so I have decided to b=
ack
> > this patch out. It's a risk-based decision, not a reflection of the =
effort,
> > desires or technicalities involved.
>=20
> Back to where we were before, it's fine as it works.=20
>=20
> The optimize reads are just reading the first 4 bytes :
>=20
> [   14.130480] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
> [   14.136664] aspeed-smc 1e630000.spi: write control register: 001223=
02
> [   14.143326] aspeed-smc 1e630000.spi: read control register: 203c234=
1
> [   14.149750] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
> [   14.181561] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.188894] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.196230] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.203558] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.210751] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.218067] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.225397] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.232722] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.239912] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
> [   14.247232] 50 41 52 54 50 41 52 54 50 41 52 54 50 41 52 54  PARTPA=
RTPARTPART
>=20
> with memcpy_fromio :
>=20
> [   13.779087] aspeed-smc 1e630000.spi: mx25l25635e (32768 Kbytes)
> [   13.785255] aspeed-smc 1e630000.spi: write control register: 001223=
02
> [   13.791762] aspeed-smc 1e630000.spi: read control register: 203c234=
1
> [   13.798326] aspeed-smc 1e630000.spi: AHB frequency: 192 MHz
> [   13.815420] 50 41 52 54 00 00 00 01 00 00 00 01 00 00 00 80  PART..=
..........
> [   13.822759] 00 00 00 1b 00 00 10 00 00 00 20 00 00 00 00 00  ......=
.... .....
> [   13.829946] 00 00 00 00 00 00 00 00 00 00 00 00 50 41 62 cf  ......=
......PAb.
> [   13.837266] 70 61 72 74 00 00 00 00 00 00 00 00 00 00 00 00  part..=
..........
> [   13.844597] 00 00 00 00 00 00 00 01 ff ff ff ff 00 00 00 01  ......=
..........
> [   13.851788] 00 00 00 03 00 00 00 01 00 00 10 00 00 00 00 00  ......=
..........
> [   13.859105] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.866433] 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00  .@....=
..........
> [   13.873759] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.880951] 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ......=
..........
> [   13.888267] 00 00 00 00 00 00 00 00 00 00 00 00 8f de 9d 89  ......=
..........
> [   13.895591] 48 42 49 00 00 00 00 00 00 00 00 00 00 00 00 00  HBI...=
..........
> [   13.902917] 00 00 00 10 00 00 05 a0 ff ff ff ff 00 00 00 02  ......=
..........
>=20
>=20
> I should have added these tests in the commit log. Sorry about that.
> We will see later on. There are no hurries for this fix. Optimization
> is still being done.

Milton: Given you NACK'ed the patch I'd appreciate a follow-up in light =
of
this data.

Cheers,

Andrew
