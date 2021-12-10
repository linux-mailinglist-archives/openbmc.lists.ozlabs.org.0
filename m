Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4DA46FA1E
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 06:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9K7C5N6Jz3c6Y
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 16:23:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Oumy5qaI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=j2PA5gdh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Oumy5qaI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=j2PA5gdh; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9K6k4Wr1z30Hj
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 16:22:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E6DC33200953;
 Fri, 10 Dec 2021 00:22:49 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Fri, 10 Dec 2021 00:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=jmxNvrDUfjI8bB/yhepxTRr3uKn/o9E
 x/wMKg/Mxvvo=; b=Oumy5qaI0AWyTpvj/urPN20vGdDidXKOLckpSwQKmiwua67
 yh9whag12bfOD0gZbZutVqlpPcVb9qlrTdacySDx6VQP95AA7Sn2jqLRHryBCaQ8
 iz2jH29uucQdYScZi0vK0/yg7R66dlJDEwrkosHK5cKQmQ2lXn+Kp65oxiivnho4
 wGVknbGRQr8NjwqUMnYsIfwWgsBiqA1KsSswqh1ZDReCY0FkgQ1eEmf2k5ZVcz6H
 wUuJCVv3UlviLmNGZ4YkbTQiZ0i8Q8tmpqwxUTiJgu8M3wzsKlEFjk4tKX3ts7Wn
 ks7xW7VXbPEAesFjeCg6y5eZoZqe5AAaMz2OqpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jmxNvr
 DUfjI8bB/yhepxTRr3uKn/o9Ex/wMKg/Mxvvo=; b=j2PA5gdh0pfI82oqI5RMiI
 JRtwBVmPVbUeewoIeKEyjI/Y1VfIUaqINmX6PpIFmI0NWgiA55oAdq4cs8V4GiG8
 IsTc25fUfluF2qwla6Q0JfidVZ8zqQEyy37TuGWSBC3Heu0vu37eiczoo2pqipAA
 M9cVF+RfDudHq2e+92NVC8uJp2Nhu7R85v7hj8pwRM7ZNFEj6ojhsYi8xtw7IbT1
 6w9tlIkHXJff+oO+m1vLuLgghnSBiqeTkEZINcxybJkkdKF9/ntJfZRF1No330hj
 XkImL19CpJu7Hxdl5i27v3CW6yq10YwEpO0YZJDIH3d8tqL+xgJdEnn5hIhZ2WZQ
 ==
X-ME-Sender: <xms:KOSyYR5G_x7JIALiPn-3oaW5x23jyIo8pO1xtEERMOxP-VJswnL4hA>
 <xme:KOSyYe7qTXtNtkZLl7OBMiC6MTURj8aO1y9Z9z1iTb6qxovWfmfzK8B72cuD1qir4
 9tAKhYfJ3cXHY2q_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:KOSyYYczB3A_ItlG3MTW-3Z3tv41521AEa2-gJJN4vPxkDVu8zPGZw>
 <xmx:KOSyYaKmswIICvABJ0NbIbD3koIoo_QfASlEb_617sI2Wj2nHuQBRQ>
 <xmx:KOSyYVJDz-Or_xDOwHEcusPzED2wMxpLR-z9vIvnarmdHy1B2rymcg>
 <xmx:KeSyYTgkaLwYKAumiIU6nGg6CtmD9X4kh2U1TvfmsOD_sZPAa2Ut4w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1D5E8AC03DB; Fri, 10 Dec 2021 00:22:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4514-g2bdc19e04f-fm-20211209.002-g2bdc19e0
Mime-Version: 1.0
Message-Id: <4a3271d0-e568-451f-b02a-a5adc3eb1016@www.fastmail.com>
In-Reply-To: <HK0PR06MB214509C7CB3F68DB550690068A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
 <1639071097-7076-1-git-send-email-dphadke@linux.microsoft.com>
 <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
 <HK0PR06MB214509C7CB3F68DB550690068A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
Date: Fri, 10 Dec 2021 15:52:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>,
 "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Dec 2021, at 12:19, Troy Lee wrote:
> Hi,
>> -----Original Message-----
>> From: openbmc <openbmc-
>> bounces+troy_lee=aspeedtech.com@lists.ozlabs.org> On Behalf Of Andrew
>> Jeffery
>> Sent: Friday, December 10, 2021 7:35 AM
>> To: Dhananjay Phadke <dphadke@linux.microsoft.com>; Joseph Reynolds
>> <jrey@linux.ibm.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: Security Working Group meeting - Wednesday December 8 -
>> results

>
> My questions is how does root fs being verified? Are you using UBI FS 
> authentication support for this purpose?

Verification of the rootfs is TBD, though we did experiment with dm-verity.

Andrew
