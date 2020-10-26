Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1972985FA
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 04:50:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKLTb47vgzDqMk
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 14:50:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ntOTlpQE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=axXiO/CL; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKLSg61b1zDqLY
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 14:49:55 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D2C45C007D;
 Sun, 25 Oct 2020 23:49:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 23:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=8r1bs
 Un+4zDqJw93oa0gq9wSVfZCOJvqmac6bQiXV+4=; b=ntOTlpQEbdYpx1mcMYLjr
 +u3I87OxMogSFsreedwhH/p/ytmuzgz4rHREPgXCeO6JBnaC8qsHq/3ePf+9I7vv
 cCuPECmpC050/5nhJf1CyDogxZnmIrPcfpitpLxdt1IJjscWhgggeMdq6Y4VHgBU
 jq4PcJ2MZi9ss8Iy62vCc2Xb/NbO5gqXAWw97HK93Jd4RjwqLm+Z3GFLdxDQxmH8
 lPeiY76kDFusaGhMT5nA4Kj6R1KLgUTjRFFszsjI83RceSVD4QmLvqcwrnz2dgb0
 O02PZEddMWE7zQkhLS66JeeVSLfo4ruHuEXjOqbgkS2CQO9eVOLgwlp/zLDtBNUT
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=8r1bsUn+4zDqJw93oa0gq9wSVfZCOJvqmac6bQiXV
 +4=; b=axXiO/CLLmr6PtIaObbxCDbqwRYXQkRdnR1QZhX+X5aRZbw+AGCU0NKPF
 5NvZ16iKNAY+6VCRNvL9jqbLjJLqWLAM/e3Y4e+OITGpPepBbffgVtsEU/cIZe8u
 l+itle+j7PI/6tU0GhT3g3miAlc3nRpKp0AotBzEK3wJWeDTsRrEKaP3IMeR8DV7
 oM6vSx141SEUY4AQkzvpHz+pBKcu69Heah/A988vYHArr700hAJTJM/vicc0lHjj
 AYHmWSblY05EL28agyCi3XEOgm/gNkc/2zzTAGaSJhwLatfRuqkSbil+i3sgWLNc
 yA/RXbAS7Fd2AqMxD/bVCNwGX4vsw==
X-ME-Sender: <xms:X0eWXxOtOZEsXYXjDLzg8YPYCBNGX5K0mOQXDSJlEkj-ZNfMxiTmig>
 <xme:X0eWXz_fh_b44Md_sslkPuBx0TRS_qnrsErXLQNN-vAgaZtJqLt5u2PSVVZZeaa6o
 wiI10BGHU3Koij9-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:X0eWXwQA4XGlvePvS_qxWataZ_REPT08fZ10sOhjyFiTW_Y27cYzvg>
 <xmx:X0eWX9sFZGN2WYT3MVPeZNhscY5GAX-ZfmBTCEzfdySOmif8JBJnrg>
 <xmx:X0eWX5cEAbtN0lGJLa7vunfvhHvF8DtP0JQ00WeHbZBxXZPhCIUvEQ>
 <xmx:YEeWX5HRhei8zyoxu5eYNxQvarNgCpNTxwXqGbf-88wJKQq90RiXlQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 95808E0508; Sun, 25 Oct 2020 23:49:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <e1202a91-f187-4ff5-84b3-bca583067df9@www.fastmail.com>
In-Reply-To: <90526515-D0E4-4B36-96C1-2E5C05539029@gmail.com>
References: <a9e18e05-4dde-61cd-a25c-c4072bfc676f@linux.ibm.com>
 <90526515-D0E4-4B36-96C1-2E5C05539029@gmail.com>
Date: Mon, 26 Oct 2020 14:19:31 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mike Jones" <proclivis@gmail.com>, "Matt Spinler" <mspinler@linux.ibm.com>
Subject: Re: systemd clarification
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Bruno Cornec <Bruno.Cornec@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 27 Aug 2020, at 01:25, Mike Jones wrote:
> Matt,
>=20
> Cool, I will have a look.
>=20
> I also found there is i2cset -f.
>=20
> I need to find out if it is atomic wrt hwmon. If it is, I could use=20=

> PAGE_PLUS to get around hwmon mucking with PAGE. Not as general purpos=
e=20
> though, and some of our devices don=E2=80=99t support PAGE_PLUS
>=20

Bit of a late reply, however: Both the chardev and in-kernel paths acqui=
re the=20
same bus mutex, so you won't have transfers stomping on each-other if yo=
u=20
constrain yourself to a single read/write command through the chardev in=
terface.

Andrew
