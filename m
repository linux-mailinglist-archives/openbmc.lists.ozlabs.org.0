Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A82370FEC
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 01:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYN7540HHz300b
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 09:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=X0G96e0V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gwD5sVqa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=X0G96e0V; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gwD5sVqa; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYN6j6Jjjz2y08
 for <openbmc@lists.ozlabs.org>; Mon,  3 May 2021 09:46:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C4B951620;
 Sun,  2 May 2021 19:46:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 02 May 2021 19:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=llRbd
 YF2tDtMP10L62zoYJ85lEecvnRa8VI9DflxbDg=; b=X0G96e0VW3vqUEn1YGEec
 u3zB1YaBCT3h4mMNJ5AkYM14YWlusozgAhyl4gyWHsqyFG9ZHHtM5G2uyQiDLxOC
 NYSQXqYgDC4wrmE3y2PHx5BIaI64CQHc121oNltxWLgLoDfOiOFZOLuKgnZmCxEh
 3eMTjPZPIVXoSd0M4FE7usPgovCLOvEp+vbeOk47dIATdDl3XAyiwJvsG0JdBxJ1
 f9+FScL4ZCbjM/SHnYkC5srfy1HuXyognMQid5gVJV6IMAlCtiLgBYUBPHWT+bHm
 vwrpL4Z/XLe8X9QHVMN5JFk4KNlLvhiQa5/Un74x817IXZNmj38SCVLQ0NuT/bQm
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=llRbdYF2tDtMP10L62zoYJ85lEecvnRa8VI9Dflxb
 Dg=; b=gwD5sVqaWGaNXM6wzj6zmWPOkAzFnZmS1NbLnmenk9U29juF6EC3BIeYD
 HBy6+r8uO3gjtb/5Mj8z4co8j27AZyTlS2nKo0sd6HaAFAzp50tx0+HGJvYItIrZ
 /Kp9yIGKmCugxinqPM+QtUXnQwNABwk58exXddWTnSVFXjUW2a20NRBtpRSrqxC4
 Y+TG/mb5CthjagU5r09BexQAAOW/bR1rzqvo1b2Gfn5IqCVPtyCHl0gpTZymwb5N
 drkii8xZ2K3tC9Yg64rQIGNM8U9WbnYelid/Jf0rkIucafglT50erh5qQsupER0e
 mNs+VvraLun/zTrPqjAaBw5dzrnrg==
X-ME-Sender: <xms:1jmPYL8zJ_g9H_bM98RDDlxMW9BIwzozCnMFm8zGTRUKlnvnQqh8AA>
 <xme:1jmPYHu-OH-L0h36NjXmOrzchaxWsEyF-vzzvjDYx0t31fQEtU6hm5o9yAe9DKAJT
 P2UNAQWFCv5sM2blg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefvddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpefhgfekhfdugefhjeduhfdtgfeutdefheejveetffegudduteejieej
 hfehfffgfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:1jmPYJD0D2FA8V9Z7yUL0O2uB-tCHEWJ5hYux4JWErY9gdpno3Cg4Q>
 <xmx:1jmPYHftJ0Pr0rMM8zToEe1sBMaEdpnKWNih1QXYrQyKHtxJNzmAhQ>
 <xmx:1jmPYAPKUM_1P4Ey_bp60U22fOfITdOSOKHxql-eMiyy6D63yTUkpg>
 <xmx:1zmPYK2QLMsx5HYlJ8A8etJ2Dyq6hchpSo32DUzTIBkguUMwNvBHBg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2AD46A00079; Sun,  2 May 2021 19:46:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <bc91e7df-6ad7-416f-b394-32b1a60facd6@www.fastmail.com>
In-Reply-To: <4b25d1d9-b4c7-1a58-f0a0-b9fd9cd73fe8@linux.ibm.com>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
 <YIwGHYc11MZ6Dxz7@heinlein>
 <4b25d1d9-b4c7-1a58-f0a0-b9fd9cd73fe8@linux.ibm.com>
Date: Mon, 03 May 2021 09:16:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Request new repo for IBM-specific code: ibm-acf
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 1 May 2021, at 15:00, Joseph Reynolds wrote:
> On 4/30/21 8:29 AM, Patrick Williams wrote:
> > On Thu, Apr 29, 2021 at 04:09:58PM -0500, Joseph Reynolds wrote:
> >  =20
> >> So ... does the GitHub OpenBMC organization host vendor specific re=
pos
> >> (perhaps github.com/openbmc/ibm-misc), or does the source code go
> >> somewhere else (such as IBM's public fork in
> >> github.com/ibm-openbmc/pam-ibm-acf)?
> > I'm strongly opposed to dumping-ground repositories like
> > "<company>-misc".  We approved exactly one of those and the rational=
e we
> > were given was they had a bunch of existing code they were going to =
work
> > at getting upstreamed, but wanted a place to be able to interact wit=
h
> > their vendors in the interrim.  We should not be having *new* code g=
oing
> > into that or any other "misc" repository.
> >
> > We have generally not wanted OpenBMC-oriented code in non-openbmc-or=
g
> > repositories that are then picked up by openbmc/openbmc recipes.  If=
 you
> > have a generally applicable library that isn't tied to openbmc in an=
y
> > way, or especially one that already has good usage outside of openbm=
c,
> > then another github org seems reasonable.  That isn't what you have
> > here.
> >
> > It sounds like you have a good definition here of what you want to d=
o,
> > so I'm fine with `openbmc/pam-ibm-acf`.  I don't see any reason we
> > cannot host `openbmc/<company>-<feature>` repositories for things wh=
ich
> > are company specific, as long as those repositories are only picked =
up
> > by your meta-<company> layer.
>=20
> Patrick,
>=20
> Thanks.=C2=A0 That works for me.=C2=A0 I propose a new repo ibm-acf wh=
ich will=20
> have 4 related parts:
> 1. The Linux-PAM pam_ibmacf module (targeted to run on the BMC)
> 2. A tool to create and read ACF files (targeted to run on the build h=
ost)
> 3. Common source library for use by the two items above and by the BMC=
's=20
> function to upload & validate an ACF file.
> 4. Absolutely minimal test cases and documentation.

What? Why? I don't have much context, but I think this needs more justif=
ication.

Andrew
