Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E12F4070
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 01:50:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFplK6NKNzDr41
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 11:50:37 +1100 (AEDT)
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
 header.s=fm1 header.b=IABl46UZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=j23btZvs; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFpjL5vh7zDqnf
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 11:48:53 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CCB1D5C04B4;
 Tue, 12 Jan 2021 19:48:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 12 Jan 2021 19:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=suZBaOfZ7rKgnilHKIEKkugC2HfKh0z
 E4ViYUGQFhu0=; b=IABl46UZfd0u/T3hgKtPuE/503m0+Q7eQ4An9bcRCpB7EoO
 4rWXlimvAutFVg5cxIGSwk6Whiz7NnzJg5JXP2v63q0IvwRVnhA3QyikO74tY4b9
 5SSx4daCOZaWnyiGAEz0NwqPWmDoM66pT7gYrDqms8tDiq0bTdl5D2kOSZ0rzrvF
 CgEYaECMHy+B7YnI4S78ci32MJjThFUZwJjUj01QOS6v2yU8GK6ECwV4+hU7fVRo
 nanNF9ftvc7Cs0WrUwSpz08HfB2B0UOXepB1iHfZwUyhPIIiUVgv+fHdkuxxbmT5
 hoksKnfOtj5LdbZZcTLa+laraDyC+E8+uOF7JXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=suZBaO
 fZ7rKgnilHKIEKkugC2HfKh0zE4ViYUGQFhu0=; b=j23btZvsPfOgJDRJT6dSv6
 dHZL54VjRZ7SZI4k9U37axq3SI69xVAdwNbSVVTOTQjf6248WtB4g75S4kAwHjsC
 uglNkK0GpaVOyGod5jiSy6Z6m3Y3XDoa9s92rJZKOKNZPPDXq3wXj7WOpnEyWutw
 tpGMc2MO2iQuyT6AsWtMT1lQ+1KOfZEeBTVgt9Xsj2gAn3ecxduLS/032+U9TgDd
 TpwunRXp8dgOLEeKMns6R5bgvwwmWt7AnZo+k5AF2tUf9/zsBbvCr5gQdlGSXJC/
 +Jfdff1kIrx5G/5UHWlS0/OlJyyOQUshXF4ZJP4aKrdSc5I/Pv5WM/1KdnkQJFFQ
 ==
X-ME-Sender: <xms:cUP-X0_a1zfbjzib0espUjgLytKgX7oyDz36nFfeEqddw1FTRDCHjw>
 <xme:cUP-X8sJ1b8oPi9de7WxTSprcKAd8QzCAFvaSNw1XWbVY3f_099voywudAyc2EqE4
 mG8Kd1BRtCAqsTRUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cUP-X6DlBR0059Q7oZlzWGjcBfyEuIS71coOsFuChi04Hy-1XBaEAg>
 <xmx:cUP-X0fxM1xcosakhaLl0m0-dkTT0U6blPEaG_UkakBFP-3J26YAHA>
 <xmx:cUP-X5NJmyi3bJrLSKAthzkDhp7nguz8jHrLMhPqrshitRaJjn8r1Q>
 <xmx:cUP-XwaLpvr_LWXadm9WzeyL4Twt_wFRY5yccrSpr4cLI5g4Vjudew>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 378EAE00C7; Tue, 12 Jan 2021 19:48:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <a93a5dd8-3969-4fdb-b25b-b4d5d7fcdbd9@www.fastmail.com>
In-Reply-To: <3C0268AE-8BAE-44DB-BE4D-C91FD8968D72@gmail.com>
References: <810c6160-b75f-4b89-b482-28664ac775f0@www.fastmail.com>
 <3C0268AE-8BAE-44DB-BE4D-C91FD8968D72@gmail.com>
Date: Wed, 13 Jan 2021 11:18:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mike Jones" <proclivis@gmail.com>
Subject: Re: READ_EIN/READ_EOUT
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 13 Jan 2021, at 10:04, Mike wrote:
> I did not fine use of the commands there, so unless the command comes 
> through an interface outside this code, it is not used.
> 
> But I am curious why sidestepping hwmon? Is thus a replacement or addition?

The rough justification is that developing a coherent kernel interface that 
catered to the various features offered by different regulators is hard.

I don't like the approach but I don't have the (regulator) experience or time 
to help out with the problem either, so we wound up with a userspace 
implementation.

Andrew
