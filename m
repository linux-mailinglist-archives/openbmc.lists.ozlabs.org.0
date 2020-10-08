Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27F286CBF
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 04:27:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6FV163vZzDqRp
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 13:27:37 +1100 (AEDT)
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
 header.s=fm1 header.b=aOX7Dz5j; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ERjsesqZ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6FT95f3FzDqRG
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 13:26:53 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 64B785C018A;
 Wed,  7 Oct 2020 22:26:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 07 Oct 2020 22:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=fLy7VsYV03pS9kHd0xFkkPYP8An+6oF
 keeoD0pXvlDg=; b=aOX7Dz5jAEAOM1AamUiJUh0xcT5GLLZ9OhyZv07de3vaOuh
 5Ue1M0o94WaqwPKeDcxb/rEIG72upDq8ssj0FmxKyjWAKmXENQvf3PDJ+rmUWIbM
 L3W7t4ceI7DLjRygW5BereOp5zEcO5REOAziDaDNdfkv6Snu3dEbdWtrLWmimsMf
 PpsdrYdm9434vNFjmoWeCdFNJw41zDEFWsd52/p6QD2Nf71pmz5m8i1vH8i8DajX
 +UPe2Y1W4lwsaibvICHM38DwdVsuKsxOqRKzAEIvQPxh2hxSKEeu+jyG17dLhcBn
 ika17aPahWLMEy/hQJ86EnYbTZtOnybUmook8dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fLy7Vs
 YV03pS9kHd0xFkkPYP8An+6oFkeeoD0pXvlDg=; b=ERjsesqZQq/AdwBgl0uwm1
 Z4BcqJI4jCdeSpVhBPGaNIyTBC7hEvm47MHCzh2zqUEGM5Sc7YQbOLgmgJNapvWp
 vtcj402qT7mArhiQY1dIiaNZTKtNTxWbDCxP49cPVeU4Lsj/IkUzc5pzudL88nhH
 5h/lb/oIxmPoPi4n+oPdpyzgiauYv1a6aSuQKb8mWv5hS36Bfk7f+/y4t/WtutEG
 EWSRr4ehEd1V9r5hWIrWEiCvuJqspsbbXMD8MpdbCBsSdW7/62Mh7curplSE75L1
 s1CBwCSksUyl2C+p6FfhcXtcwcHliCYZfCxwam2WA1d2yzj7u4p0IG0o8+cb/LSw
 ==
X-ME-Sender: <xms:6Xh-XyIb_ceRRruBaFkjIVIRLsGzuOx_rlv6FaJ9GBGBORb7iThpPw>
 <xme:6Xh-X6I1c1R60LevwPKoYkEvphuJvD4_ApzPqS5PIiUdCgiZ7nt8eTh3rJKt3BzKm
 NJQW7veCaSdVrPDzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgeejgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6Xh-Xyu69VvWGzeGuLgVX9cVzYG2ZSpSqKxGUbPRUg4g0AaVS2E18w>
 <xmx:6Xh-X3ZSahv9ag_5RyrdJWTmqEwKezxFZTdlE8Qruw5ctHUc7k6_kw>
 <xmx:6Xh-X5bkZscH_TW95whYmseOKnjch8SWQAe2Saxbt2KlIwr5dynSPA>
 <xmx:6nh-X726Vz-W14WIFbyCao4sgakR-xlf6PtXjHXLEB10W-uze6RiyQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 95D9FE019C; Wed,  7 Oct 2020 22:26:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <af4b095d-d99c-4c3f-b485-83257804d65b@www.fastmail.com>
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
Date: Thu, 08 Oct 2020 12:56:28 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "James Feist" <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Heading out
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



On Thu, 8 Oct 2020, at 04:51, James Feist wrote:
> Hi everyone,
> 
> This will be my last week on the OpenBMC project. I'll be moving on to 
> something unrelated to OpenBMC. It's been great working with you all. 
> All the repos I maintain have additional maintainers who will continue 
> to maintain those projects. I'll begin removing myself from the 
> maintainers lists shortly.
> 
> Best of luck with the project,

Thanks for your contributions and hope you enjoy your new role!

Andrew
