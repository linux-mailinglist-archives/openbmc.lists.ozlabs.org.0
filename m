Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7531A421F
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 06:52:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z5GS4qZ2zDrJD
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 14:52:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=crxLDYqB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ozNEg7Nd; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z5Fl2LpHzDrHb
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 14:51:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D115F5C017E;
 Fri, 10 Apr 2020 00:51:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Apr 2020 00:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=KZ2iJ4iE2wUNa5uISSrt4fhv9z3HSld
 ors5SKeUiEXU=; b=crxLDYqBHSJ83F3nryZ4GR4hO1dh/8+Qy8El1KUzgT7R3j9
 JlGgD9QXcULAof7IE5LWmcwiD0J+onLpL46lTU8tRQ2SnvlkbSsWvxzc2z+S3HoX
 PcnPUCOZbd6ZU3Tj1SbdrpI6ljFyha9spE20wdghdJUyYfbip8PRzpvUWtO0jet2
 zx0phQBgCHIs4x0g/Dxv/bf3jgbC1oYHVO2gaOg/S2Gm8A+82q8S1uD4FmVNWWcG
 Srp2+D1WAqdECHYKk5TSMETk5LnuUv2EJNzk6mYvvKgjMoaXnYpZz05NTpXjGggN
 xjhDWPN706OZwoSRO1hn8lCU6xijRgJLSSMXkWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KZ2iJ4
 iE2wUNa5uISSrt4fhv9z3HSldors5SKeUiEXU=; b=ozNEg7NdfRPZgB8GLamaZj
 4TQdtSIea2SrWbs5RrlrzIcL8RbpjOs0LmssmyezsUWToLQwRBquWffHxgrFR57H
 qVegEXtVasjrM1ad3dr5uz2DHHuKz1JocmDysd6Ih4VzUBIo+XB1CBBtbma/7IkH
 Ra98QlozccQOXS9Jryvd3EktrxFmxslmtCSq6V3yJOSsSQYdabARrjnA/sx31+Fd
 8hL2uuBRT+QWfZP5LOL0eyhPD3yUUi9qFEAbg5grpzL5UtPB8bviOviZs91S0J04
 fdpg24wKiTYSPCYhQxD/zXjw5sDrE9vDrIqE6OJio4SGZLGxjDUBhqShjV52q3SQ
 ==
X-ME-Sender: <xms:WPuPXiaOb5eeTfsMLc3-JoO9D3ARnXoJ05JKZngvn1zyfHwvVlOkqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:WPuPXuH3rCULoA2_xh4PJKSburmaAY9owcAjvGato4cqfaAK966TMQ>
 <xmx:WPuPXs5FSwZeqXhk_g1EwM89-iSliJp340GFAskwO31BGHmEBUEU6w>
 <xmx:WPuPXhLFDRrulZxjzX1OVcXWsf-fouTV0nXLWq5wn-3AVBW7pCGlEQ>
 <xmx:WPuPXtRQcY7ox5_FgIDQH7YpHigdHnOL3b_0iHau6HqjfUJavF5GHA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A70B3E00A5; Fri, 10 Apr 2020 00:51:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <32d94f33-1b98-4509-999b-3972303640cd@www.fastmail.com>
In-Reply-To: <20200406191938.31156-3-eajames@linux.ibm.com>
References: <20200406191938.31156-1-eajames@linux.ibm.com>
 <20200406191938.31156-3-eajames@linux.ibm.com>
Date: Fri, 10 Apr 2020 14:22:01 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_2/3]_fsi:_master:_Add_boolean_paramet?=
 =?UTF-8?Q?er_to_link=5Fenable_function?=
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



On Tue, 7 Apr 2020, at 04:49, Eddie James wrote:
> Add the ability to disable a link with a boolean parameter to the
> link_enable function.

Right, but when might we want to disable a link? This functionality
didn't exist previously, so why does it need to exist now?

Andrew
