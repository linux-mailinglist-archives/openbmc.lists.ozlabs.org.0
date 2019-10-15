Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D080FD6C67
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 02:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sbcs2yKnzDqtr
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 11:18:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VgIR6hip"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZLEcihnM"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sbc84R2szDqtr
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 11:17:59 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7B74F565;
 Mon, 14 Oct 2019 20:17:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 14 Oct 2019 20:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=mePN5
 Gf1LGlWcWLHqHvUfksWA/p6BZeXLDbh2dWxrws=; b=VgIR6hipbcNhFH0Noc7wt
 qlNrpYx7v9cfxUzgsoRKcu9jbynrBFzMlbW82Ut6hqgWJI8IdWkBWmwBlRaVIf/o
 NRblyVRPK+/YCyGBuz0o00/+aoMJVlecho24eEZh1Jyg/qYCIfjw8IH/6pB4Psto
 ABp6AB1TB2rrew2vMuO/wXV70meCAuq937x8xSbofQc8M3bFiCuY1v5Og9y1hGLk
 hQKxvXA6veTVyAES23y5A3yUNkwyooLBVNxLJvUeGLjOuRvKgbgr1EfS6EIf6OxL
 ci8uFGGdSJXSqo9/KW49KWn1ai91yQHRoXYupVDQ+wfbRYKzl2GwaYw3MUNxQDs+
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mePN5Gf1LGlWcWLHqHvUfksWA/p6BZeXLDbh2dWxr
 ws=; b=ZLEcihnMk3HHIs0tIJREzNzBtsqklmFpV5etBJV+CfQG3giU/WcrHkAM3
 JdXPTlU845ghUzxdRh8t5xdeiyLD0mLQlYl7q45FlujcVOxoCWNauOV5Es2KnGga
 FUiHQqH9CZ2cdGU/mFuSYnc12PJM5ZRXYDdBbAqY3bYQhNn1s9Gu2412cTM+fpNP
 Fsp/nDoDy2O4Zr9TY2/yFa9VOCegT8ujdlc2KSUBWM85oUSqyVY1Ui/WEXVTaUdo
 wIvPLoOm8ATpCmVll5NZq9BmAJPAeIUsrEuxd0D7Mls5DdaB2m4Bia50ayYLV3Qz
 mow+CaCtc4TXXZjZtTLu7ROvefWqQ==
X-ME-Sender: <xms:MhClXVbgDS-9o55iV_Kq6zFMRiJ0ggZ0TqVKMrux_4qoUaQF4-06HA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedvgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:MhClXVxa_gfl5j0eu6FoLto6GbCgm8ODky8HUxFtP7OS5G_cUT5F_w>
 <xmx:MhClXRGgbRCNadV3nlo-vKVtu5JWft2h7XaCK8Ue1CLKK1abKf6Sxg>
 <xmx:MhClXWqbBQVWU9s6BHV8f5GDucySIkhap30fICjUGgMkXXi5jaxlbg>
 <xmx:MxClXZOrcXpNe9kDRLwm8cJ_bAtv41M0ptGObhDcvdwF3fiuoO_46A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EEF2AE00A5; Mon, 14 Oct 2019 20:17:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <96244da0-5a24-4327-9375-76a8ae9ccd3a@www.fastmail.com>
In-Reply-To: <F0FC6F8E-DB1D-4EE6-9EFF-C553112FD55C@fuzziesquirrel.com>
References: <20191014004433.28180-1-joel@jms.id.au>
 <de89b084-be95-4113-97c4-40c62d8572c9@www.fastmail.com>
 <CACPK8XeTmFK92XnTvW1Skjj3y8SnaKDsPoaLoC0utQQL6KHMUA@mail.gmail.com>
 <F0FC6F8E-DB1D-4EE6-9EFF-C553112FD55C@fuzziesquirrel.com>
Date: Tue, 15 Oct 2019 10:48:50 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.3] fsi: aspeed: Add debugfs entries
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
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 23:18, Brad Bishop wrote:
> at 9:11 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> > On Mon, 14 Oct 2019 at 00:49, Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >> On Mon, 14 Oct 2019, at 11:14, Joel Stanley wrote:
> >>> From: Eddie James <eajames@linux.ibm.com>
> >>>
> >>> Add debugfs entries for the FSI master registers.
> >>>
> >>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >>
> >> A bit ugly, but:
> >>
> >> Acked-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Yes. We will keep it around for in the 5.3 branch to aid with
> > debugging, and drop it in 5.4.
>=20
> I=E2=80=99m just curious.  Does the need for code like this go away af=
ter FSI =20
> bringup is done or when 5.4 rolls in?  Is this just a statement on how=
 it =20
> was done or that it was done at all?

I think it's just a statement that there's no plan to carry it indefinit=
ely.

However I think it's fine to keep it, but a) it needs to evolve a little=
 to fix up
bugs in the face of multiple masters as pointed out by Jeremy and b) we
might be able to make it less tedious. And with that it could go upstrea=
m.

Hopefully we won't need it much after bringup is done.

Andrew

