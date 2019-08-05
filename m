Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E898116B
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 07:23:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4625l13WFrzDqWp
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 15:23:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="hHJW8Kkv"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E0YpddyQ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4625k61zHSzDqVP
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 15:22:15 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 4859A2102F;
 Mon,  5 Aug 2019 01:22:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 05 Aug 2019 01:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=NDMfE8gqp3fGUAH0ELD+9mfcWZ
 xuyT4NNAqYoyTVo3A=; b=hHJW8KkvF4a5ljHGkA3DDz1yI5FmWjEhSSiHMmzGVQ
 4OL/GwLb0osl1WwGWFH0tiHX7ypeNMFbDh7ggzlaiUufA1vlsLVIq4/Ik+bxgs0V
 Un5Ucs+2wGvAqojc7FXtlk2TCGDlkaCWTKl+4e2ejEHj1VccYFmE/ihyXxaC8/ec
 OfxWCXfAfzidVrR2+DAoKa9jWRnV1NeMnmvw2LhKtmr9QbjgS689z7NJGoJV/nuX
 UiCUUqW0cGY2Lj37KYTZvzl6ixZhasLlxfC1DLuvgsNedHn15BGzeScofpTzpKEN
 hORF+wRama4b4pYgAKMPfM/QItPgCiR7Ebvxexq9Wrdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=NDMfE8gqp3fGUAH0ELD+9mfcWZxuyT4NNAqYoyTVo
 3A=; b=E0YpddyQ2xlNsWED+yhCqUsHcXCja6byAtHxluCwGpT/fjiliTjz2rPG7
 FuNpmqCRR9ldxE4N6QPphBDl+RQmz87/wBioGX/0R8OvYfnMvxpMsl2E7W3tB4ZF
 HUy0BhCesSRke1KnGQsy79SD20e8un3qHTOM5RQuqSxt36P4KudtV06iZJ/nCqfy
 xGitEqkrdfzn/O76EXV3Ok1jPBlKAB4zk3B+CsBOYqDpMsyiV3Fels6W4g13SKN6
 IjO+yV2Wm6T4GxmWEbUCXBX+vEuufN+fLXEL9fq4vhL88lY4/2I1EeFDqe3y07Zd
 HtZVHERhs0pkfGNqhZaBjTyK/n6Gg==
X-ME-Sender: <xms:A71HXfWMd7CceakzTWZPianfykiTq5fkcPRD65AhPVANaPevVkfbNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtiedgkeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucfkphepudejvddrledvrddufedurdduheejnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsrghmsehmvghnughoiigrjhhonhgrshdrtghomhenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:A71HXb0XjJSysnP1wDrB-ZPEyt34XVF1a9h5WdIG8YLIfvSR5gmdzA>
 <xmx:A71HXWbW4KZwVScoWXrknTnOI6frcq2ITCc0ReBwu2dNrIUCHizQoQ>
 <xmx:A71HXer2YTfSAd0YW43otfsGY9I_5948ch3TNqGSWR7RVN08eKvkKQ>
 <xmx:BL1HXeEuiwY5T8gn2Y1gcgnAxJmx5mQHBPexRqcsxIB0-f1bB4lngA>
Received: from arrakis (unknown [172.92.131.157])
 by mail.messagingengine.com (Postfix) with ESMTPA id DDF83380085;
 Mon,  5 Aug 2019 01:22:10 -0400 (EDT)
Message-ID: <4f6cb0a1c1fdc3aec683b31aeb9e53b4a54266b2.camel@mendozajonas.com>
Subject: Re: Calculate BMC MAC address from NCSI NIC's base MAC
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>, Tao Ren <taoren@fb.com>, Jeremy Kerr
 <jk@ozlabs.org>
Date: Sun, 04 Aug 2019 22:22:07 -0700
In-Reply-To: <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
References: <2819fa0b-82a2-0103-1451-6a41a9410339@fb.com>
 <CACPK8XcVdNMoksCc0OucgLw2-b7MWTNMyWwww-1=o7anC230sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-05 at 04:29 +0000, Joel Stanley wrote:
> Hi Tao,
> 
> On Thu, 1 Aug 2019 at 21:15, Tao Ren <taoren@fb.com> wrote:
> > Hi,
> > 
> > I'm running Facebook Yamp AST2500 BMC and its MAC is connected to
> > Broadcom NCSI-NIC. When CONFIG_NCSI_OEM_CMD_GET_MAC is enabled,
> > BMC's MAC address is calculated by adding 1 to NCSI-NIC's base MAC.
> 
> This would be a good question for the NCSI maintainers. I've added
> Sam
> and Jeremy to cc.
> 
> > This adding-one logic doesn't work for Yamp because Host-BMC MAC
> > offset needs to be 2. What would be the preferred way to fix it?
> > For example:
> > 
> > 1) adding a device tree node (such as "ncsi-bmc-mac-offset") and
> > send it to ncsi stack when calling ncsi_register_dev?
> > 
> > 2) adding a device tree node to be parsed in ncsi stack directly?
> > 
> > 3) adding a KCONFIG option so it can be parsed in ncsi-rsp.c
> > directly?
> > 

Hi Tao,

My first thought is that since this is an OEM-only extension enabled
just by that config option, that perhaps a Kconfig option is the least
obtrusive method to customise the increment.
Any thoughts from other users?

Sam

