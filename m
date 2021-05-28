Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C92393BD1
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 05:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrqRr5cKnz3035
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 13:10:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=kEY0l6ec;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IIZNB9ni;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=kEY0l6ec; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IIZNB9ni; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrqRV4VJ9z2xy4
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 13:09:41 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C96E5C0120;
 Thu, 27 May 2021 23:09:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 27 May 2021 23:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=wzCKa
 XbDRwMTkDQy6mESQuygomI35i1M34gI35HqCiY=; b=kEY0l6ecFdTETXBv/1c5n
 f1XcrNGgP3d4/Q5wSpGe5eAPqc6piL5yODL+X47YfYdAaXOMmXq904dV8vC4tb7s
 3x0A7036p0IxUGj7HKBjFYRnRxalTTEDMuZlX4L9yXFwYSun3hm/Ppb03orPrZRk
 7QYKcklTUxQxXGdLCZSqhM8lsNgr6XhcaLJMVVloCFLHoDmSskoxy/cJ4R/Tl+Vo
 oq2fLhkepoiK55kqy35FdvTKV3ok3I1Efob3tx6dy1nbfQKrvZa0zihwW2j8lEf/
 j5fJEKQ0Hr9DNCLqtu8YlQnRXFcgFQg0xutEUYb6CF5Jo2wxwfxMHR8sRlp/0z05
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=wzCKaXbDRwMTkDQy6mESQuygomI35i1M34gI35HqC
 iY=; b=IIZNB9niTyHoWhVt2FrlZL0gyRiCViuMnSD3sWyQJniJTylk65dpImhJo
 MNJBxvyK4udtTYCeKh6oQ7sy603w7bNDdxl152bBM1p3LbGL1Q/KFJh6C7cs6e7M
 08lcWxadWDXEkW2fBTHtr1o+yzhTfq/pJWDk+hMu460OrIlxRuvaDR4ezvG5roP2
 olrwsoU4Zlk4LKb+m/hPjOvXHAJahLRoodNPNUH2VBvulGCZJ40dL/AvGLNKhGo6
 aYzB/Aztw7JvOi+r+iGswNlHlrStquSwWhkSj96btEdmHw9oosd/Dx5OZ54YpLRd
 feiCEiXgl0rOOqeo3gJZmMLrJYIuw==
X-ME-Sender: <xms:8F6wYNcLXQNQra7UnJDSm3gIcVuDGqgfALocvqzAFflu5Aw9yzYO6g>
 <xme:8F6wYLNQa6ubfaC_yyGyzVzo5qoJ-d67nUrsv7T70_d7iieTrBiZEQdSdRvAp3Wz5
 FygITIQWAK40jhM1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8F6wYGiGlv1kg4bHXvQVN9ppGHnTMMzQfNOrr_zf3Ye6yRIAhDampg>
 <xmx:8F6wYG8WnJIN8GLfdMXEAFEjCbtt1OwKR9ZE7AlpAgOqkT96rDkEug>
 <xmx:8F6wYJsLNdXGnNt3MITgVw04oPKqMnG6G_ywo5Me4AS7F7jhXXBGRg>
 <xmx:8V6wYH0IN1uoMZiohX6_QvI0asduStM1yQX7h6OMHHFhKNPGQYUo2g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6C5DEA00079; Thu, 27 May 2021 23:09:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <84217f2a-8351-48e9-964c-de34f4496c67@www.fastmail.com>
In-Reply-To: <dba5a6b8-3873-422b-a36a-32b39b2d560b@linux.ibm.com>
References: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
 <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
 <YK+XA0umnkj1EveY@heinlein>
 <dba5a6b8-3873-422b-a36a-32b39b2d560b@linux.ibm.com>
Date: Fri, 28 May 2021 12:39:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Security Working Group - Wednesday May 26 - results
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 28 May 2021, at 00:34, Joseph Reynolds wrote:
> On 5/27/21 7:56 AM, Patrick Williams wrote:
> > On Wed, May 26, 2021 at 01:59:57PM -0500, Joseph Reynolds wrote:
> >> On 5/26/21 8:43 AM, Joseph Reynolds wrote:
> >  =20
> >>> 1. Followup from last meeting re uboot, kexec, sysrq-trigger on AR=
M
> >>> architecture.
> >> We re-hashed the discussion, added new information, and added new c=
oncerns.
> > Could you paste the minutes here when you reply to these?  It is kin=
d of
> > hard to have any discussion with the rest of the community when you =
have
> > 2-3 levels of indirection to get at the words.
>=20
> Thanks for your email!
>=20
> Yes, I've waffled between cut/paste of the minutes and summarizing=20
> them.=C2=A0 I prefer to cut/paste, so I'll do that consistently from n=
ow on.

+1, it makes it much easier for people who can't attend to provide input=
.

The other thing I'd like to see is attendance / attribution of=20
comments, that way I know who I need discuss particular items with.

Cheers,

Andrew
