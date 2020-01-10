Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5313645F
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 01:29:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v3lH4dfCzDqWv
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 11:29:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=E2FWbmXJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=FQM1Q+N/; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v3kS3pJ3zDqWv
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 11:28:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3314921C29;
 Thu,  9 Jan 2020 19:28:45 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 Jan 2020 19:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=WYt0OG0HwC2u1DLwDLW+CPEm2gItk7D
 9ABXilPK1O7M=; b=E2FWbmXJK0pLG+ZvLGk7KtnJlFwiMHccdESxzCMMVx4hwpX
 zdQGkCQK9H0H1LDOsRpce4YYl6gfa55klWL24OtUII/PHtCegB8Rb//KDC/7JsaM
 R2pCNmFNgAZqNE7wCLWSnPZJR47jK3bVXQvSRWRoa7kXQ5trfF9HNtez4WiJfRtO
 8Tgv8YWMpUJA8QKuZOMawQ6jkHw7zdYpKKiafMztFLq/UXmqQXo9MH2J4c++k+e2
 7fSPRjUWS5qMrf1S5eDf1w+KI31s4k/QJ59Vz2wIlb0s4auH67FgelWQik6jp9pF
 rNJPDhWtqHw6CrjSfimAPLiYy73a88AQQYPrEDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WYt0OG
 0HwC2u1DLwDLW+CPEm2gItk7D9ABXilPK1O7M=; b=FQM1Q+N/E/m2MN0uPOSCSV
 7xicqJ8p5cgJGS3iS11BEBH0wIkxO+npc/p1fd/b336xKREUUvIZbsBj51IfsuZJ
 3n/aDs2ZUnOV9tk5eX/0qokGQ+ihiLPEkM1Wwi49Qa5bqRZLgBn3E67NlSakhaJD
 cZbv1IdQCpotegRTlqvWdarasobH+1lhN8QFupebDLgn093pvfmeuPCkzeLTF0/a
 Wip2L5zSSQpCQuhsWi0Pl4bDEa1/zz9IaZP1sBMnG+DKbt1YCSgSxV3TVBV/pPlJ
 YiCezd4MbG2Sf9UPJqLDUvIS45qHxRRYACU99WQG9CClaE22B4dZ7GR3Vzlpm7vA
 ==
X-ME-Sender: <xms:O8UXXt_ierHqE4cbYdINJNFoU97CmVxjkSOX8rmQ01B-k7MvkJpOaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeivddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:O8UXXifCMOcRq7vZ90t_bZDc9Ss300MrTCj0fLdY0k3mecl_WhWL_A>
 <xmx:O8UXXnLTVZuszd1NFeh1_8kpv5r10kQ6-Mb8IVsENOsV7rhix1sC9g>
 <xmx:O8UXXijqoxYgb_RpaAoLSiU0td0qRfoabmGOpfgoL4r_P_T7X7nv_g>
 <xmx:PcUXXpy7FQV3Ycy_CliFr3yDrqJHO1q-p_ZwWCxCmSoFr0NTHQOlxQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D05D7E00A2; Thu,  9 Jan 2020 19:28:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-740-g7d9d84e-fmstable-20200109v1
Mime-Version: 1.0
Message-Id: <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
In-Reply-To: <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
Date: Fri, 10 Jan 2020 11:00:43 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sharad Khetan" <sharad.khetan@intel.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
> 
> 
> On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
> > Hi Andrew,
> > Sorry for late response.
> > The plan is to have MCTP in user space. 
> > 
> 
> How are you handling this then? mmap()'ing the BAR from sysfs?

Sorry, let me put my brain back in, I was thinking of the wrong side
of the  BMC/Host MCTP channel. How much were you planning to
do in userspace on the BMC? As in, are you planning to drive the BMC's
PCIe MCTP controller from userspace (presumably via /dev/mem)?
