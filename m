Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F105A91A63
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 02:04:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BZ1D3RRdzDrBk
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 10:04:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="XtZVGl1t"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gmZD9cAa"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BZ0j6G4jzDr7W
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 10:04:21 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 59E5921236;
 Sun, 18 Aug 2019 20:04:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 18 Aug 2019 20:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=KWb9w
 M2pKWnSVxrFoW+RPjIPdR9E8XLRx8If0rx/zvA=; b=XtZVGl1tB9UrPkMEBmw+9
 OiUddQ9OERDZCQKqPDzJwhq7ULFAH08SHIJWITx3bNWLRCEFtPVA6EWQyyUiw4/2
 XXuq8os0hIaw0QMUmx6+4VrNu5UGV4Ju1Bw5BK1lCGaZxe47ZxaS2jjD0cnqHPnj
 flBCu6z4IUrjqBlnSfbmB7zYorK6G0V3huRRSYYqbZzd2J3DLJhIbrDzQvLucRwe
 ydSPT/twb87EaI0SvGgigMdi/+C4kJu70J1sFf5k/QJdE+GPUBPLTbX5/UtkG9yy
 ai9MgFC+HC5Nqe7MvYAwoh5zJKrM6J45m4Kx8LcL8BOkpiVHMf/+Owy0oDapLAC1
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=KWb9wM2pKWnSVxrFoW+RPjIPdR9E8XLRx8If0rx/z
 vA=; b=gmZD9cAa8XaJ6Kq+ztdIcC0YNmuDkXh2PmzwjTmKtU4V9cgQsKSjP9g3w
 XlXkFkWO2GTDnOMlolvDQO+P3vJwWp9n3ukB8Oo9ss5G6Dt9enAX7HHyGm0UtCNp
 F22E/VL1nclRwg3N53DAX4aNEOLtrhdJPSyyUW0iCyfGxDr7i20TPae5BuJTbwG6
 XXzu/AToUf8z7FkVbjZ9gwbLHXqiIf4hDGAP7mr0I1jJdg0JHhMhFgriiSfojJ6R
 8ZqnsF37bpEtlFcxXpyn4P3ChTRaoHqOWPOpa4drbUwpIymM/ZolRRzGY2OU+Zqw
 u+2BoeQozVP++ZrMNO1TQAt9qflhA==
X-ME-Sender: <xms:gudZXQP1ooXsjoCoWw71oBIm6QjUKcZPgmoOP6MUu-qEPwqwtmF-Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudefkedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:gudZXcyb7fYCfUevupRle7KHCEUGunVwfy0IA9QBtH8SmdZ-TuFilA>
 <xmx:gudZXZWzpkrXf7LLJgwR26geuiui4-mILyOFBTrxQl27-E0o1R2gbQ>
 <xmx:gudZXRRrT0QCJXgZ1YEqioMd2yZMQ134oVzy8KpCWxHQWplEYExMuQ>
 <xmx:g-dZXeryqBjO3vUpR_GXi8VvpyOhCVjJlZD6TYK2KVUE7osWzCI90Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B6745E00A3; Sun, 18 Aug 2019 20:04:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-869-g2d94aad-fmstable-20190814v1
Mime-Version: 1.0
Message-Id: <bd45e219-8dc3-40e4-b8ca-4dbe3569a469@www.fastmail.com>
In-Reply-To: <668549D6-5649-41E7-85B1-C9D73713118B@fb.com>
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
 <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
 <668549D6-5649-41E7-85B1-C9D73713118B@fb.com>
Date: Mon, 19 Aug 2019 09:34:52 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "Andrew Geissler" <geissonator@gmail.com>
Subject: Re: Policy on Tools Posting
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Is OpenBMC more=20
> minimalist =E2=80=9CAlpine Linux=E2=80=9D or fully loaded, ready-to-go=
 =E2=80=9CUbuntu=E2=80=9D?

OpenBMC is a meta distribution, in the same way that Yocto is ("The Yoct=
o
Project. It's not an embedded Linux distribution, it creates a custom on=
e for
you").

OpenBMC is intended to be (heavily?) adapted to the requirements of your=

environment. It exists to provide a set of tools that you can pick and c=
hoose
from in developing your environment (platform)-specific BMC distribution=
.
The hope is that at least some of what the project provides is useful to=
 you,
and that we can work together on making better tools for everyone in the=

community.

>=20
> What=E2=80=99s the dividing line between =E2=80=9CCore OpenBMC=E2=80=9D=
 and =E2=80=9Cstuff you need to=20
> find or build yourself=E2=80=9D where the OpenBMC community is aware, =
but=20
> hands-off?

There isn't really a line, and that's somewhat the point. I think the re=
ality
is the project is a lot more fluid in that regard than you're expecting =
it to be.

We're helping each-other out by coming to an understanding of everyone's=

requirements and trying to develop interfaces and tools on the common
ground. This way we can leverage our collective experience and
development efforts.

Andrew
