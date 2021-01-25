Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDF301FC0
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 01:38:36 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DP9vt1HM9zDqqK
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 11:38:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=MuLABF2l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=QIWADdpm; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DP9tp5rClzDqnR
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 11:37:37 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B0515C00EF;
 Sun, 24 Jan 2021 19:37:34 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 24 Jan 2021 19:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=fkLyi97l5+zUuRrUsy4kxcy0zSjumPC
 qRs6foXKJuhA=; b=MuLABF2lADxvsHmxS8sCQ7QzLj3UY1pswxxuheUo1/Bpegk
 1VmuiFJ2G5xiRgAJ8+BJma4e3pOrq4bjuUzzviwRXAcmCqihMF6XKZaaZu6RKxRH
 GvMRHCqqfaWVSoyZ4Sg/SjELWWbeZBZK7+AT6CYYxjIqcJbcS3mKyYwzuQ9sKrDN
 CwMeVyD0KIX8tjG+18JiiWEitq+Sq5Of5xDSpoAA5NGPjCU7gocrXhUoHc+7s71M
 oihBycPfFtSacIgIUjPaUyRt/JZvuRv4Lu60XHZ++0i8lXW4+m4vfe0sVqyE8dHi
 vv5DaDxBoEoBrzhQ4ASfOlJq5EqxV7PZ/AALACw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fkLyi9
 7l5+zUuRrUsy4kxcy0zSjumPCqRs6foXKJuhA=; b=QIWADdpmDyEwrSJ85qEkjb
 2W4jitiKEkyH48HU3HlxCm+hfVqzOE2VNH5vgWFxqEi1LjA+0dIEUJ8W5MTJcTEQ
 PuYrD5eC1ts4G4Lz4WpQWmRemhkg6z0h2Q+HiMHgzRbH5qFrDnW0fbqrRWIpZCaA
 S+XK7SOIICRQR+nXpz+VmkZO+0pyxE3AgIDctTRrtNVI1zzmpJF/1prGHjfJUrd3
 0HZ3kjP4/nkboXi/3lZJ98BuIDAdRhhVHHn/v9eghxq7umT9ycwfOxLrPMZmLwIC
 1SvSaoGzD1tG6g3R7LIY5arNevoPdbTq41cClA9zlIYbTTOgrfLHuj3k3OK39VbA
 ==
X-ME-Sender: <xms:zRIOYEFm9T_P_rovcXuU47HqWpDahlxhHtnflQCuKOECKDnnNmDiFA>
 <xme:zRIOYNULPZ9p0TsSD4oa_qlU_7n5rSIzi-N3g4BgRQA5w6czM-fw2VJBYMqRxqSOC
 5zLY58igjdEFapqgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhephefhfeekgfekudevheffheeihe
 dujeefjeevjeefudfgfeeutdeuvdehhfevueffnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:zRIOYOK_WzvMSlrHCNGvebzgSsCyvTCSkwLEwc1N33_iBU3DG4mzjw>
 <xmx:zRIOYGErsdmuoYLYwYP3kC9GSWgbuTxzJSOszGr_n5yyLYi8IG0ZAQ>
 <xmx:zRIOYKViGDWSJYrslMGDmErtxrtMTlad4cYP1YySr1CP0HzsyiZeBA>
 <xmx:zhIOYDc3-OQhY416UJGEqpNF1jsvzq2FO-DXQC2l5ix01_8mab3VBQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D7854A0005E; Sun, 24 Jan 2021 19:37:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <55dafd98-bf28-4e5e-a8cf-649eaea61323@www.fastmail.com>
In-Reply-To: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
References: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
Date: Mon, 25 Jan 2021 11:07:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: request repo meta-tyan
Content-Type: text/plain
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 23 Jan 2021, at 10:32, Nancy Yuen wrote:
> We are bringing up some Tyan machines using OpenBMC request the 
> creation of a meta-tyan repo.

Bit of a tangent and a drive-by comment given that I haven't been involved in 
the effort, but is it worth using this request to test-drive the new gerrit 
owners plugin?

Andrew
