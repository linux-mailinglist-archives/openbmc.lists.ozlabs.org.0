Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E7CEFCB
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 02:03:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nHcg4QSHzDqLC
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 11:03:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="AAdUkUpi"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ERgoH7UN"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nHc030DdzDqKS
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 11:02:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F28BF21EA0;
 Mon,  7 Oct 2019 20:02:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 07 Oct 2019 20:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=ysfrZ
 6d03RrkNjJk+9+skbTzI8yG296dOdr15suTdZA=; b=AAdUkUpijppDfAElQX4IV
 0PAm0sHay+ffJxE1lRP+eFSols3U2t1mOQjrYGM10my1RZib44aRuPUlJatAp5VW
 2N87qavcN55qS1G462IG4RAAzTKEr1OEfGnEFcptN2jidJhnHzvckpxjFwOfpUNw
 hV4EQ5y4qb3zZsbmIpyt+EFxsc/pVQ6qw26nn5KEBLbS2BrSFwOEmmdU5XxXN083
 cPRqTco58FuEC+TzMU54+AgavTUeQWp5qk/NOk9e66tkNcZFk3IqT+laudC+EXMT
 aRU9Hz8p6+BmZcN3j499pFjpoB9A/7Z52qCGCiZ8Q1vfidfYHTcvOvaZft7Z7Nfv
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ysfrZ6d03RrkNjJk+9+skbTzI8yG296dOdr15suTd
 ZA=; b=ERgoH7UNIzfL9izUAbA0EBfUr8jPoiN/NZcHRMqM9PtOJ3PAekQcRBhEm
 0R/UIgA2uNB3sqUedcw1xUHiBt8tihDe6EVOCoh8JB02DUZBwBxX+fFRkF3V1wTW
 i1q7RhdBP8bgaYmconF8RZgh4x2ZyriNt6GqExqXk5cuigHUe+o1ODR8iGDd25Sp
 G1M3wE8KsMcBRcKe+7wGfE5uyuH02kVtYOWUydvmLFBlJUttc0i3qt5nXJbdRETm
 SOVrTxq/QMJcZTxzqFZVgiBaIqPp73wn4eALVvydgJQh0+DrowD1wjuKAH9UPvOT
 puombcIoA5bEpclmPZaDzIzXcCEpg==
X-ME-Sender: <xms:LdKbXZ6wzeIku1bOyZi_V2TOg452AwRvOsMA41P6ncAkSyD7vIYqgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheekgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:LdKbXZcHnmZRsm6DVSsQoMBf5f_WA-OVWxDUcesL5Nn7hKHM-o-CXg>
 <xmx:LdKbXUG6bCSnbCGJDsveFeQnTms1Wsdg5M-L7QUyiZ33OBqfJ09Q3g>
 <xmx:LdKbXSRpGlH2__1u8L5P2LtzbImlhI6lsiU5ZasxIPoMZ-K8EC6Dag>
 <xmx:LdKbXfub4PGC873H3PBy5or41mSV2wN12v5hUBS_64NEhKZpwGH9rw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 08183E00A5; Mon,  7 Oct 2019 20:02:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <6b0f7cb8-85cf-4909-8853-9f8bbb59829e@www.fastmail.com>
In-Reply-To: <CAK_vbW2_rSU8O=r+vMrJ8XVA_H0ZDi-Q9n4OaiJ1TKWqNJ7U5A@mail.gmail.com>
References: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
 <1ba3bebe-1a93-4848-a2ed-979e31c7b708@www.fastmail.com>
 <tencent_34EA53595EFE6AF25F53F427650E7D1F1708@qq.com>
 <tencent_AEA99F5038687CB8AB0765B1F867C9EB4C0A@qq.com>
 <e3883ab8-7318-4033-ad4c-94018bb0dac0@www.fastmail.com>
 <CAK_vbW2_rSU8O=r+vMrJ8XVA_H0ZDi-Q9n4OaiJ1TKWqNJ7U5A@mail.gmail.com>
Date: Tue, 08 Oct 2019 10:33:34 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brandon Wyman" <bjwyman@gmail.com>
Subject: =?UTF-8?Q?Re:_=E5=9B=9E=E5=A4=8D=EF=BC=9A_how_can_i_use_ipmitool_to_inte?=
 =?UTF-8?Q?ract_with_openbmc_which_boot_from_qemu-system-arm?=
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 5 Oct 2019, at 04:02, Brandon Wyman wrote:
> On Sun, Sep 29, 2019 at 9:06 PM Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >
> > Hello Liu,
> >
> > On Sun, 29 Sep 2019, at 17:04, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=
=82=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> > > Dear Mr. Andrew and openbmc:
> > >
> > > Thanks a lot for your helping.
> > > because ipmitool use udp, so my previous changes for qemu cmdline =
are
> > > not right. i change it as follows:
> > >
> > > #qemu-system-arm -m 256 -M palmetto-bmc -nographic -drive
> > > file=3D/home/openbmc/openbmc/build/tmp/deploy/images/palmetto/obmc=
-phosphor-image-palmetto-20190926123057.static.mtd,format=3Draw,if=3Dmtd=
 -net nic -net user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2=
443-:443,hostfwd=3Dudp:127.0.0.1:2623-:623,hostname=3Dqemu
> > >
> > > change "hostfwd=3D:127.0.0.1:2623-:623" to "hostfwd=3Dudp:127.0.0.=
1:2623-:623".
> > >
> > > and i run:
> > > #ipmitool -H 127.0.0.1 -I lanplus -p 2623 -U root -P 0penBmc power=
 status
> > > and i got:
> > > Chassis Power is off
> > >
> > > it seems ipmitool works well together with qemu^_^.
> >
> > Awesome! Also, thanks for following up your questions with the solut=
ion,
> > that's a great help to others who might try to do the same thing.
> >
> > Andrew
>=20
> Interesting. I am curious why the QEMU readme or wiki pages do not
> have a note about how to forward ipmitool traffic. Is that something
> that should be updated on a wiki or doc?
>

Are you talking about the upstream documentation? If so, why would upstr=
eam
qemu documentation be talking about IPMI?

As for the OpenBMC documentation, it's probably worth a mention, and
patches accepted :)

Andrew
