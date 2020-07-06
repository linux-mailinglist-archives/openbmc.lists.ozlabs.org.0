Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6D9215123
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 04:18:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0TlJ0s2fzDqRk
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 12:18:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=MS2tNCMm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=gxcZMK4O; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0TTG5LFzzDqCK
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 12:06:41 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 30BF05C00E9;
 Sun,  5 Jul 2020 22:06:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 05 Jul 2020 22:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=SoGv2Ubtg3iNagNdOx2Wj8pBMpbmFt6
 jx/B93jEVOKc=; b=MS2tNCMmG3PF84/usPYdHfJ0E8UQmlurB8b5vYLLaRMe1Wv
 vGf/gAImPF/SpLksEOdBtlmLeD4TRPxQkAJK80MKl28aCg0OhpcruiRW3ffp+YXv
 IzamC5dgnN7NwwUASkdQ7nVV73D5CQNOSFkSpSrAUQfv9LE4fqjenKPPEY+tI4zh
 W2qXq1ieiYZbMRDnwFPf9Guiu6BdyILC8ACU2I1PbqrO3NJD3BidNc+QTINI8LZr
 ciUCgAJWWkdbWGsHz2e7hx++fnEeyaDS1GJxzj5XARxUrtFACLbm+ohrwmsBige9
 VyyJKJkSar8RIUUAPFfy0u1rgXimXxve4kMvMUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SoGv2U
 btg3iNagNdOx2Wj8pBMpbmFt6jx/B93jEVOKc=; b=gxcZMK4O1lfOhdh4CpGaSV
 U2TcNAl9kPUJgSiYfFbHI3xJhqsqQw7PHCutc4OMOGxBF2obzlgfubBp/OddTObH
 612qEVu65ybrE02X33Ect91PRzZ5OmasdY4L0wUpoZDSWQeQ4ftdVQHcKbCp1Ur/
 cj3+Yk1Cf2tnKN7Li7rjFzZFgli/TjcSa0Jx6E4//8HN7WQxcCzbNQp4fUyJvpN6
 kDbDi+oJXbykWtRFbxgvhia1i4VcdKXwxLZRuppIeu4f3mZjubKmmuuOx65gqa1O
 wfvZGvNliFaiDeEk74jVZvU8HgZW3m+AbRQKLte+sZphmi4vAu11yS7rih5o2TOA
 ==
X-ME-Sender: <xms:LocCX_XohJBjYarhnQb8iRjBsaZB6M7X488wk05UQ9OhPJjvtYe-5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:LocCX3lqtXHAmHLbIAWKXd_GsS3lP8c7VwoQpJRTcUywg8EvitW-Ug>
 <xmx:LocCX7Zj03QCRrrSbQ77VAKYpKPtDyHLg0md4uL7eO5Vlpi7bwZ8iQ>
 <xmx:LocCX6VkQq6SUh_7WNoegTlf6DjAMegZTwTX6YHvGz0tnhCHU61pMg>
 <xmx:L4cCX3QTxU8JKTKL8_1fjjlX6AlcMgOi4Zs9h78tef6uOasxKc87kg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8318CE00AA; Sun,  5 Jul 2020 22:06:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <c60ab529-5c64-48a3-bd74-9aa623a5be40@www.fastmail.com>
In-Reply-To: <20200622154542.20930-1-eajames@linux.ibm.com>
References: <20200622154542.20930-1-eajames@linux.ibm.com>
Date: Mon, 06 Jul 2020 11:36:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4]_leds:_pca955x:_Add_a_software_implem?=
 =?UTF-8?Q?entation_of_the_PCA9552_chip?=
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



On Tue, 23 Jun 2020, at 01:15, Eddie James wrote:
> There is an implementation of the PCA9552 on a PIC16F microcontroller.
> The I2C device addresses are different from the hardware PCA9552, so add
> a new compatible string and associated platform data to be able to probe
> this device.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I think we need to bikeshed the name a bit, and that might be best done 
upstream. I feel like we should be putting "ibm" in the name to avoid the 
haziness of "soft". Another company could do the same thing with different 
choices for things like the device address parameters.

Andrew
