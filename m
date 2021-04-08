Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35882357964
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 03:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG3FD0lsJz3btb
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 11:14:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=iPHiO6pb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=t6WmJeCD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=iPHiO6pb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=t6WmJeCD; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG3Dz0KXjz304C
 for <openbmc@lists.ozlabs.org>; Thu,  8 Apr 2021 11:13:55 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BD6515C014E
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 21:13:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 07 Apr 2021 21:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=cbCbUty9LA29TklaDjbh94L8MgFBdyl
 HxtG24haJu2E=; b=iPHiO6pbqzJO9vPSPpWyJg5wfAZFn4mZb7eu6kxkoJ5syrH
 EpWK5I5O0k5aGR5dxdmdpMvB1XFq3DQuHZq+4AgU+yxT8cdEW/W9d3wKJA6LWufJ
 aBYZn45WtRtY6obDxGzeYDP+5NuNYJ8glG2xzauSIXLK7+Cr317+Q/FyTafAlTbb
 iXMv9W2IYemQelgKT/lNlBBEd2SkFf5FVKKj1AFb5TR8uHxVCJVKIrnbQjkkA9on
 bbeg9wsbI4HHPOBtIanc/9axe4poygHhpnaBI6952V0hFjrJt+MetlSBfOax6qgQ
 R2wPvHVFJpbw3IAtniAcHgwghFWdKk6fFIVhfPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cbCbUt
 y9LA29TklaDjbh94L8MgFBdylHxtG24haJu2E=; b=t6WmJeCDpIUgIyup7AFTdT
 ZYXPzJ48iuBm3dqMqafmabLmKDJcF4Nvj/ik2uKySU/NQliAXes1rU71s8iJdl2C
 TrNAVOuSMs7+b5lvUmyTmj8ynQn1NlOTqby55E/zfcf15Zo93KexDNXXXrorA1Gd
 ubh1LVlMm5V3brtk4oVwI7HQItfO86FqxzweAMNbdSnLo1eOb9qs7CUtceXsKaCW
 IsNFEgGYeObM9hL/w5RQ3vBjCA7nM6p93A+16vxY2jMfI2qq7GJB/nL8KxCd4uGR
 /kuBBNIvwV7VHxWI1JcohwcJ1LJxYdGWw10QJdnwu7vN2C0TfGG8ngVnKHR3bw/Q
 ==
X-ME-Sender: <xms:z1huYE6r8x604T0kHOzNdV1mwKC6WjBLb6VdM1BPOUJz8A94wbxKfg>
 <xme:z1huYF4ghvFIfHMj1jLoMbeAFDRQ-A4-xzhOwon13N6O6YvimnQJ8rG9PCjYgdCOH
 MT2HC6UfTsuKj1Npg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejkedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpedutddtkeeugeegvddttdeuke
 eiuddtgfeuuddtfeeiueetfeeileettedvtdfhieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:z1huYDeUOKnwCQa3rGTwxRjIl1SDyNSHQW0yTZcnehHI7F0JDM6rGQ>
 <xmx:z1huYJLx13sakwrrvysV9AmOnuOePEo2zZTjegw6xk0M23uoVvvFYQ>
 <xmx:z1huYILL1kjd4r-zJUrQ7hFa4sO1KzKSi2JckjSt0RG9IQF4rdsniA>
 <xmx:0FhuYNXxZBWxZfAKfYkYDSv7ipAsraf1KcPgonWISgXOaFA1IXhIZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BF565A00079; Wed,  7 Apr 2021 21:13:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <af718a56-8fc5-4219-9fa1-fee5bbf52895@www.fastmail.com>
In-Reply-To: <20210310173222.17556-2-eajames@linux.ibm.com>
References: <20210310173222.17556-1-eajames@linux.ibm.com>
 <20210310173222.17556-2-eajames@linux.ibm.com>
Date: Thu, 08 Apr 2021 10:43:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_2/3]_ARM:_dts:_aspeed:_everest:_Enab?=
 =?UTF-8?Q?le_fan_watchdog?=
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



On Thu, 11 Mar 2021, at 04:02, Eddie James wrote:
> Set watchdog 1 to pulse the fan watchdog circuit that drives the FAULT
> pin of the MAX31785, resulting in fans running at full speed, if at
> any point the BMC stops pulsing it, such as a BMC reboot at runtime.
> Enable watchdog 2 for BMC reboots.
> 
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
