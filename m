Return-Path: <openbmc+bounces-678-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B70B8D3F2
	for <lists+openbmc@lfdr.de>; Sun, 21 Sep 2025 05:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTrq55t0Hz2xcB;
	Sun, 21 Sep 2025 13:10:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758424257;
	cv=none; b=FnJzacTafXbDglmT/+pISMn2Q6HD6H32EjxYbglgooNfGi6zd4A3jm1JZPC/PnIaNNt0hkRg4woXE5zHCGYz6rQ6/5PaWPyVWh5D0H/awqc8I5/e4mM67CqjomdnR5/tGT95SA6XCbfe0w8ACYerY+L/lsVS3X2TLlK+Byd3wKHMSraeGu7L6MD/JAzasjOIWwePldMAtCEV68eQBR1jIUav4QNlZsNdiqPQkDQY47KKP1/fbqiJ+wcjH99QjQkInyr+upgQyJ34XUfTfBx91pNwKxD7v7sCGkr9oeEWgNViq2TRrkEtXkq6SGc+YGVIcCmNZ2rKsSal2t3RJK0syA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758424257; c=relaxed/relaxed;
	bh=lsDbFEf0dhy0vUkwMu7eDwacdbi4o1lqsQE0ed+3CTY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MS7DqoOx10lGONyxYu9oHab5bjkw10BVyaPcOWwavz5oxQjUQ3r8DJuWh091g9w6sFwjsC2nsR5WNWE7BViEJUeqm/1HtCfxSLayU8ZPtT2loCntGODJ91/Bzbi9DTOmuNrt9Kjt9aQLC6QEa5hVxostCQ0FmdgryjhRAsdT75XzvSPYnrjFJkjl2jirNTG2DtS+w46Fddw/GxKqNjH1XNOo0npympnoV83weo+jXkX09YOORDNEKMmM3v1O+bk6a0WR407dmJICpI4Cgsh8+/VBcMoKs2lXbR7siBGu3SukQSZCpDSkVnhtpwqCBPEYxj9WZJ1DBTFfhTPLA0WiXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=BMctK1hR; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lLC+BaPg; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=BMctK1hR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lLC+BaPg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTrq34CtTz2xQ0
	for <openbmc@lists.ozlabs.org>; Sun, 21 Sep 2025 13:10:54 +1000 (AEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id EE701EC00B6
	for <openbmc@lists.ozlabs.org>; Sat, 20 Sep 2025 23:10:50 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 20 Sep 2025 23:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1758424250; x=1758510650; bh=lsDbFEf0dhy0vUkwMu7eDwacdbi4o1lq
	sQE0ed+3CTY=; b=BMctK1hR+7UarNqBOQlggkGHJNDOSf0ZJgRwOrYYArDHRk7S
	UbpyJZcO0EYzq1ZOUB/ah02pFiCJjrijCrzYp2DnrHEl8dI5KFy15cen5CKhSaZX
	p5s20IFeR2XVL+v9yCm80tZj/VgIGEB2TRhGopXzuUEGeVwdYvCofpDrvGWeb0Qf
	OclD/H3BrQUSQqDT8RHIoNdtWw92rsgBMiKN1UimApg5pCVyWgdIRx7L52kOhyV4
	pP1JtsH4y9+8IFcezdS/xbZDD4oWFM1KaybKfoGukQb/15SHtw8yBvSRT+Ynyb2z
	mLG68JGI4YJLuip1OMHuwBd0ywOdgx/pOE184g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758424250; x=
	1758510650; bh=lsDbFEf0dhy0vUkwMu7eDwacdbi4o1lqsQE0ed+3CTY=; b=l
	LC+BaPgvP6ghDev2xI/SMTafD1aEk8AxToLjiEi2K7zJkJV1p16GcGPK744kRpAT
	Y097phWHmYhbR4h2Wz/SEYVMRcTsKouZHka0USx1AcW6PgnEGFx2Y8IBCrO/CnDP
	Y7xUkVTQwVtureY9JfqATXOt6hOf5MHWmwN5iL7PF9jINfwS5vXpl1QhsbkdAnru
	5xHt4C6hqba7dfa6zwTgNdyXUs+/BUFYarK4MbbolVMkFWyjFW8z+ic2y2bTlwiB
	lCMGxn/ezMfBCRVPZOJIXB0wE0MSB3lkZTQJfQZvMGSkepKRF28UTyI1PVfgMEzF
	EC/CKjUUtZWS7Nglm49yA==
X-ME-Sender: <xms:umzPaGjJUlDKH_uFDk2j_iObaiK03N4JymuodQQw-KQAASPftuGUag>
    <xme:umzPaJCcNexVk046MbtJwXdib5OAPFQZQ6N47cBdCZ8Mc93X9CnzFYBQmBjsELeLi
    lcLLv3HulPlzqUJ5EA>
X-ME-Received: <xmr:umzPaHeKslq0d0Pm7wbt6IKtGeSDxEIdL6CG4zDz_UwySLs-YctJhkgO_DA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehfeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
    cuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhr
    ohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrd
    ighiiiqeenucggtffrrghtthgvrhhnpefgtddvueevueekgffgledvjefgudelieeltdfg
    ueduveeghfekheeuheekhfetffenucffohhmrghinhepshhtfigtgidrgiihiidpghhith
    hhuhgsrdgtohhmpdhsthgrthhushdrrhhspdgtohhmmhhunhhithihqdhmvghmsggvrhhs
    hhhiphdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilh
    grsghsrdhorhhg
X-ME-Proxy: <xmx:umzPaBfURH_SaT_c1DiXkubkBARVY_GaMXBDrCzsW7JNTobn_Knr7w>
    <xmx:umzPaLjkuT_P50bCttnFi-UFBSx-wpTVQsVKzWXhEsgFHEg34396eA>
    <xmx:umzPaNS7Qp5dMUW1FUYW7jkGDtQ7Gce6b0Qv5kgHoErno0qu6RzXeQ>
    <xmx:umzPaMwQLi-gpNdDLYoSa_SoLH5rJxAOF_eKxrtjR0tynLhI4zy8pg>
    <xmx:umzPaHdHdtT5MBPcuv0A3lBh9SmRHJ7n2o5hE7D6XOmJSQbNNU4n9mTX>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Sat, 20 Sep 2025 23:10:50 -0400 (EDT)
Date: Sat, 20 Sep 2025 23:10:49 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: On Code Reviews...
Message-ID: <aM9suaMKrCk9PY-T@heinlein>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OH0DBr32yC5Bqo91"
Content-Disposition: inline
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
	FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--OH0DBr32yC5Bqo91
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

This email is long.  I'm not going to TL;DR it.  If you contribute to
OpenBMC you should read it all.

# "Upstream is slow"

One thing I hear from many different people is "upstream code reviews
are slow".  I see a few reasons for it seeming like they are so:

    1.  Code is not actually ready for review, based on how most reviews
        and maintainers operate, but the author isn't aware and doesn't
        know what to do next.

    2.  The bulk of the reviews are done by a few individuals and they
        don't have the bandwidth to be quickly available for code
        reviews.

    3.  We have some listed maintainers who are no longer actively
        involved in the project.

I have some proposals to fix all of these problems (later).

# Data on reviewers

Since we collect data as part of the TOF election cycle, I can share
a finding.

    Contributors        Code Reviews Performed
    ------------        ----------------------
         79                       0
         45                     1-5
          9                    6-10
          8                   11-20
          6                   21-65

This is very disproportionate.  50% of the commits were reviewed by the
top 8 reviewers, 50% of the commits were reviewed by the remaining 139
contributors.  80% of the commits were reviewed by the top 23 reviewers=20
with 20% of the commits reviewed by the remaining 124 contributors.

If we want code changes to get merged, we absolutely have to have more
people helping with the code review burden!

Note:
    This data reflects what we consider "high quality" reviews.  That
    means you didn't just give a token (+1) but you left some code
    suggestions; a minimum of 3.

    It is entirely unhelpful to go through and give a token (+1) on
    commits without actually reviewing the change.  This makes it so
    that the maintainer still has to do all the review and will make
    them stop trusting your reviews.

# Data on commits

I have another tool which can collect the current state of code reviews
(more on this later).  This is a report of where we are currently at:

=E2=95=AD=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AE
=E2=94=82           =E2=94=86 Community =E2=94=86 Maintainers =E2=94=86 Aut=
hor =E2=94=82
=E2=95=9E=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=AA=E2=95=90=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=AA=
=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=
=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=AA=E2=95=90=E2=95=90=E2=95=
=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=90=E2=95=A1
=E2=94=82 <24 hours =E2=94=86 3         =E2=94=86 1           =E2=94=86 2  =
    =E2=94=82
=E2=94=9C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=A4
=E2=94=82 <72 hours =E2=94=86 64        =E2=94=86 15          =E2=94=86 66 =
    =E2=94=82
=E2=94=9C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=A4
=E2=94=82 <2 weeks  =E2=94=86 73        =E2=94=86 24          =E2=94=86 92 =
    =E2=94=82
=E2=94=9C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=A4
=E2=94=82 <8 weeks  =E2=94=86 43        =E2=94=86 38          =E2=94=86 132=
    =E2=94=82
=E2=94=9C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=
=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=
=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=BC=E2=95=8C=E2=95=8C=E2=95=
=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=95=8C=E2=94=A4
=E2=94=82 >8 weeks  =E2=94=86 97        =E2=94=86 34          =E2=94=86 588=
    =E2=94=82
=E2=95=B0=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=95=AF

Legend:
    * "Author" - There is something wrong with this commit that needs to
                 be addressed by the author.
    * "Community" - There has not been any review of this commit; the
                    expectation is that we have _someone_ other than the
                    maintainer do an initial review.
    * "Maintainer" - The commit is "good to go" and has at least one
                     review.  It is now waiting for final review and
                     [hopefully] merge.

Yes, we have almost 100 commits that _nobody_ has looked in at least 8
weeks.  No wonder there is a perception of the process moving slow!

The vast majority of contributions are in "Author" state though.  Even
commits under 2 weeks old, about 50% of them are seeking action from the
Author.  There also appears to be tail of commits where once they reach 8
weeks old, in all likelihood, the author has given up.

I've heard from some people that they don't know what to review and they
don't know where to start.  Clearly, we have plenty available for review.
We need to figure out how to make the connection.

# What's the solution?

AI... AI is the solution to all of our problems.

Just kidding...  But, I have been working on a solution for most of this.

In Discord you'll see a new "openbmc-bot".  This bot also serves a website
at https://openbmc.stwcx.xyz/bot .  Feel free to pause and go there now.

## Change reminders

First up, to address the "I don't know what to review", openbmc-bot will
post every hour 5 commits that need to be reviewed into a new channel
`#code-review`.  If one of those sound interesting, follow the link and
do a code review!  You'll make the author happy (because even if you
give feedback, it's better than their change going to /dev/null,
right?), you'll help reduce the review burden on others, and _you_
might even learn something new about the project.

If none of those sound interesting, but you have some time to review,
follow the top link in the bot and you'll see every commit that needs
some review.  Just pick one and go for it!

The trailing comment from the bot is "And there are XXX more...".  Right
now we have over 200.  Let's see how fast we can get that number at
least down to double digits?

Note:
    Again, a reminder that doing a token (+1) isn't helpful.  If you
    really have read the change and the change really is good, feel free
    to give a (+1).  Don't just give a (+1) because you think you're
    somehow helping or making someone's day.  Make it meaningful.

## What's going on with my commit?

If you have a commit in Gerrit and you want to know what's going on with
it, go to the website, enter the Change ID and click "Change".  This can
be a either a Gerrit short ID like 12345 or a full I-number.  The page
will then tell you what the bot thinks is going on with your commit.
Maybe it is "Awaiting Community Review" or "Failing CI" or "Pending
Feedback to be Addressed"[1].  Hopefully this gives you a hint as to
what the next steps are.

Maybe you want to know what is going on with all your commits at once?
Go back to the main page, enter your Github username into the "Query"
box, and click "User".  This will give you a report on every single
commit you have pending on Gerrit, who is responsible for the next
steps, and a ballpark of how long it has been waiting in that state.
If the change is in the "Author" category, that means _you_ are expected
to help push your own commit along.  Maybe you have feedback to address,
maybe you have CI is failing, etc.

I know one status that might be confusing is "Pending Comment(s) to be
Addressed".  If you have a comment that is "Unresolved" in Gerrit, your
change will get to this state.  Usually that means someone gave you a
code review comment and they're expecting you to make a change.
Sometimes that means someone left a comment that you disagree with,
that's ok, but we are expecting the Author to drive consensus.  If
you've responded, mark it resolved or reach out to the commenter or ask
one of the maintainers to help you out if you're unsure of what to do.
The net is when there is an open comment that means the ball is in your
(the author's court).

Lastly, there is a Discord slash command: `/obmc-review-status <id>`.
This is the same thing as the website but in Discord.  Feel free to run
this in `#code-reviews` or open a private message to openbmc-bot and run
it there.

## What else can openbmc-bot do?

Off the main page there are a few more options:

    * "All Open" - This will give a report of every pending commit in
                    Gerrit.

    * "Per-Repo Summary" - This with show a table for every sub-project
                           in Gerrit with pending commits.

    * "Project" - This is like the "User" query but for sub-projects.

If you are a maintainer of a sub-project, I think the "Project" query is
handy to get everything in the projects you maintain and see if there
are any pending commits for you to take action on.

## What about maintainers?

We do still have an issue of unresponsive maintainers.  We've had some
informal discussions about this in the TOF and I think this half we
should take action.  With the "Per-Repo Summary", we can see exactly
which repositories appear to be having maintainer issues.=20

We are absolutely in need of more maintainers.  We've already documented
what the expectations and requirements are for becoming a maintainer[2].
This is a process and it takes time.

A big part of the requirements is that you need to demonstrate knowledge
of the repo _by doing code reviews_ and one of the biggest needs of the
project is people _doing code reviews_.

My suggestion if you're wanting to become a maintainer...

Pick a repositories that you're interested in and make it a habit of
regularly checking out the "Project" query for it.  After you've done
a few of these and you feel comfortable, ask to be added as a reviewer
to the OWNERS file.  After you continue to be comfortable, find a sponsor
for your addition as a maintainer (owner) in the OWNERS file.  Of course,
it also helps if you make contributions, but over the course of doing
reviews you'll probably see little things that you see could use to be
cleaned up; start there if you don't have any "big feature" immediately
in mind.

If you see a repository in "Per-Repo Summary" that has a lot of
Community or Maintainer pending commits, it's probably a repository
that could use another maintainer or three.

# What's the deal with this bot?

I'm currently running this bot on a system of mine.  I might move it to
the "Gerrit Server" at some point in the future.  But, if it appears to
not be working, send me a message on `#infrastructure`.

I wrote this because I see a big need in the code review process, I
wanted something practical to write in Rust, and I've been doing a good
amount of "vibe-coding" lately anyhow.

The code is on Github[3] with a very unoriginal name and very little
documentation.  Feel free to send PRs or open issues.  If you want to
tell me how non-idiomatic my Rust is, that's fine too, but go ahead and
do that on Discord.

[1]: https://github.com/williamspatrick/gerrit-faster/blob/c6266398b3d8e220=
699d5b76867e82750fa163f3/src/changes/status.rs#L17
[2]: https://github.com/openbmc/docs/blob/master/community-membership.md#ap=
prover
[3]: https://github.com/williamspatrick/gerrit-faster

--=20
Patrick Williams

--OH0DBr32yC5Bqo91
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmjPbLcACgkQqwNHzC0A
wRkx+A//UQEFWNj+BZPgfRkmoYRhCNd1xd5f1X3em8CijuZJNXcrzl0/4vOHYZiF
YEi8GX2e1EDc4waUMT189OoWLWHvP0NIRx6+gJq1tBtXUnHILXiYGaa3UNHCUgAT
Pz8gqi0YKy6SgMAsykRYn9agvVhUgD/JvXl5wtkPwvcjMQiAb8lzgG/SUkgUKFcB
eAMhdK77U/gkeY7gjTK6qzH5LDizGyt2tMX0T/z7e672QLyDVwMfcmSqmO6p9lLh
1cq6SBFlDlFAmioPkTa9wkkktAHCGgohSs+XPnHTXgk6Mb8/YotPJSeWQdfvLIcl
RFmCUxMgkeFwlLM+vlxzx+ljj+Ytts3mzziWmfrUh90X8IlH3bXFu0q3ol+D3n3w
Tu/Y9Ljdye+chIblLpJiHmBVVwN0CLrIIOqM8oVYq8bcsINBS76l9FbZLO+Ikoi7
X1mcKbTWN2gIi9gw/5SDLCHDFwMYciv5ji3kso7LhBuFIBxBzeIfv6su3vqf9sQg
A4rnSK9Hc4PBiQSM4BQq2bLwkPsjkCM4FiQ+NYgyPhEGYip+D4gBwtrkMlxN5AfD
QP69pLmmRQOMfJCP4HKZ8nOADrv40FxmdtCnSqrgrKk93l4IprVUl4kYQ9HgDgA/
btZ54Y5IeKeHThO4FHlIU6M+NwuZ6LHYiemMLdAWpzyscKMjbXY=
=51CQ
-----END PGP SIGNATURE-----

--OH0DBr32yC5Bqo91--

