Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F5DA67B
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 09:30:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v16Y5QCGzDqnW
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:30:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LnVbOLBc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="fF/hJeM0"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v15c6vVBzDr5s
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 18:29:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5BC0022007
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 03:29:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 17 Oct 2019 03:29:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=+i1Xf
 mpBtLZbtnShrpPoJu/yrMvUe485qgs8FiCc6SQ=; b=LnVbOLBcW/GFFrtHr//U7
 lEj4gTyXyNT94FuvlVSTMefbM6SSNGT4dTaDIwEdrRNjzZZ2xVCUNxwqQwsavJCs
 snUfEW2hLHci+IPK3rO2WXPw9fRawFFZ/wzEKNBDddOk1onkHIoVd1T2vlr++S8i
 LqrLSfMM44UTMvSQLLb74Suf0GPJNTGGqBhLG8Qv2yrehRt+rTc325HxlG/yRvdH
 ZMYzQ4jllD/LHbXdsM0noz8jTUf2ya23pSQ4q/WZTIZbyUTDw/0enWfZyrlB2ery
 XmFEuoR24BMJ0cch4FM8cVZ4EmgUUniuwq1RWfoo+lC/WII9p0q2zBTBN1Tx0vdu
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=+i1XfmpBtLZbtnShrpPoJu/yrMvUe485qgs8FiCc6
 SQ=; b=fF/hJeM0iTEyf/FJ/J1sugZAaABO09IPKZPsODwLqQ/XxuwmzDgYiMhPJ
 gcr4neXbWXcHuQbbmakXYYBl9kKf8sZma5zvfM6RatDgs4Zwl9uYwibZc2+ikvXP
 44sySAH8rOvmW6NlUoz+WNZaquNhyalb7lglUVTkm3FsQgvuGCBh4FEAyy9ZHjAS
 1s5VRs0IU01SGLiBPuov3n3qMM3nkEN6aBTYsr17gEbrOJ00PwPmFdCFOwEFODvh
 qi7+sbpJpw9x7E+uAu7DwikMA4BK/OU926yQGhM+00hokXx3k/0eUNy/98cgu/oc
 3tH69sG+7ST8EnQmhCLUTUTAYdopQ==
X-ME-Sender: <xms:bxioXXcMEgWZO0RmQksqWQqGp1h2V_HsCpkRJirW7YDQ-E_J1TuSRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bxioXRcuu7A1ighDrqOBJw1FawRJaLn75Jei0tljWT2fantIwr4bFQ>
 <xmx:bxioXbg2-pvs_tH_HzwaBeBvNNIp-awfej__-TQg50EgrkZEpKu_7A>
 <xmx:bxioXdSlUUf7Azemj8WmMqhnITqq77bekucUaNowfo_9x18pTPNlGw>
 <xmx:cBioXZEfrBpWEDXRfL1TSN0W4wGP5QJNKkEAwwx_KDkin-A-fATBIQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 82EC7E00A5; Thu, 17 Oct 2019 03:29:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <f6bfc653-a3c5-4b58-89c3-25b40993ff20@www.fastmail.com>
In-Reply-To: <2fc9ce5d-295e-9d4a-951a-4adb7765e486@kaod.org>
References: <20191017062544.25110-1-andrew@aj.id.au>
 <CACPK8Xe=q_rxYjgiGtY1i0KRmxJiZnbL7E0mTZ=4BMFrsZS_Ug@mail.gmail.com>
 <2fc9ce5d-295e-9d4a-951a-4adb7765e486@kaod.org>
Date: Thu, 17 Oct 2019 17:59:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_qemu_aspeed-4.2]_hw/arm/aspeed:_Fix_STRAP2_configur?=
 =?UTF-8?Q?ation_for_Tacoma?=
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



On Thu, 17 Oct 2019, at 17:04, C=C3=A9dric Le Goater wrote:
> On 17/10/2019 08:29, Joel Stanley wrote:
> > On Thu, 17 Oct 2019 at 06:24, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >>
> >> We were writing the STRAP2 configuration to the STRAP1 property/reg=
ister
> >>
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >=20
> > Nice, I have the same patch in my tree, and forgot about it.
> >=20
> > Reviewed-by: Joel
>=20
> I will merge this fix in the machine definition patch if you don't min=
d.

Yep, that's fine.

Andrew
