Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656043EEBC3
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 13:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpplw2r48z308G
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 21:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=L+aG8djy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TroVICNt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=L+aG8djy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TroVICNt; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpplN4ktQz2yxx
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 21:31:43 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EF8F5C0098;
 Tue, 17 Aug 2021 07:31:40 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 17 Aug 2021 07:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=iExdrkZ6hz7xS99rR0fK+H3G1uHvCMp
 haqhZ14xbo1c=; b=L+aG8djyLKm13+wkdILKbZ4/4TbM9St4T82j+JU7K/3RoKb
 GZuKO3ANHzy4+Rqr8DBNYh/HcepsJPV3UhxBs3iVzNpJOCe/L6gTHCQJMYeOxyCd
 Mb4z5Z8QfBYtHvpaGaDduiSzWFpY1CONGpzsbLt3TRPzH8hVd9xd4PYsPiWLv+rD
 Opd42sPwnz6It6v8R1lkhFYMq+7B9M4YIuM8G8dmhLHYLYQTZR+BKyH/Hy2ypWoR
 TySK94hCU8mZKcP5sss/PDh4YDgNdGxhlrLv2166EKhdh6voQqeVl4F1KtuBdOd6
 9gsE2eo3kcHF5Ye4gQP661crOof0BKgg1izN2gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iExdrk
 Z6hz7xS99rR0fK+H3G1uHvCMphaqhZ14xbo1c=; b=TroVICNtdDA7w9lv2bK9Jm
 3hdPKVz8rcgHqh0dKqL6DCxtQJIeCFq9smTWF5gyBtEl7XnISmF2qIK59E3f1Bzp
 DrYmTLT1gCAVScihAlKdM2tr5PPItJG+ZGumz51bpayONH7Fl+4Pl95ywFFhjOA1
 cvu92q6NUAv8YVWVR73AOZ4P8fxZp9vhWFJWjcxTXkWQwXjDj7NvQQ8UmOdcRH10
 HeKrzuBFgKtoyQhbjMIBoEPib8b8+eewEg7Hz3nPBzc9D90zYPgQ88/YO7wXd2pQ
 fQszDny96yVISBu00kEsrTJDyTuMLqiWBLlvZZeuJkh+SFCvSmYyPjZXS71yGSRA
 ==
X-ME-Sender: <xms:Gp4bYSYaZnFyPaBvmtVttLN5Oc6z1XCH3e41Y4I2Vfho6tTpkf26LQ>
 <xme:Gp4bYVZi9VofZDQ13dgeHUX2-tdOOPzbz9t3olfcTlC9J_TGdPGnnUqMRZ8qCqWyJ
 J9jwjsw4XpuRSh4gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Gp4bYc96fGOJQG0VTXy1IuajVCnmN5-QbfbQ0Y2cEP177dVxSnmyCw>
 <xmx:Gp4bYUqwDTBhMSoM8os58bk6A-TumilotcR_mYvTn1zsp34halNQsw>
 <xmx:Gp4bYdpPsq52yoqxSONwz1PpjlXwarjSAOtfF6F2JtKVEb2lQIPjQQ>
 <xmx:HJ4bYcSCipxh6aXmgpgQVISWyuI4b-O2IqsjnRreqKB2MaMnik4PAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B5E2FAC0E77; Tue, 17 Aug 2021 07:31:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <66823be3-bf61-4d1d-8dd8-6798f51dd701@www.fastmail.com>
In-Reply-To: <DM6PR08MB5514BD820BCA7BCD3B810BFDDCFE9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
 <DM6PR08MB551464D29CE9BD91FFE1B20ADCE69@DM6PR08MB5514.namprd08.prod.outlook.com>
 <b133d936-c788-1800-7b72-e197b69387cc@linux.intel.com>
 <DM6PR08MB55145A59C44D48FFD5B70C26DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <878c1c79-662f-468d-82d1-a890a8aeab2e@www.fastmail.com>
 <DM6PR08MB551444C4EAB80473CB576740DCFD9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <aef11e4c-0b18-47a3-8116-36db990b998c@www.fastmail.com>
 <DM6PR08MB5514BD820BCA7BCD3B810BFDDCFE9@DM6PR08MB5514.namprd08.prod.outlook.com>
Date: Tue, 17 Aug 2021 21:00:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_[x86-power-control]:_press_the_power_button_for_a_long_tim?=
 =?UTF-8?Q?e_that_can't_force_turn_off_system_power?=
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

Hi Chris,

On Tue, 17 Aug 2021, at 20:47, Chris Chen (TPI) wrote:
> Hi Andrew,
> 
> That means I'm able to choose one of following 2 options to achieve 
> pass-through behavior when I using x86-power-control package, is my 
> understanding correct?
> 
> 1. Add code to re-enable GPIOP0 and GPIOP1 into a pass-through function 
> after they are requested as a GPIO function in the x86-power-control 
> package. (Or maybe to create a script with "devmem > 0x1e6e24BC 32 
> 0x0F000000" command that will be run automatically after system up to 
> change register directly.)

This is a hack and should be a last resort. Even then I'd avoid it.

Certainly you should avoid shipping with /dev/mem enabled.

> 
> 2. Modify pinctrl in Kernel that will not disable GPIOP0 and GPIOP1's 
> pass-through function if they already are configured as a pass-through 
> when they are requesting as a GPIO function.

Perhaps, though maybe you should follow up on whether you can drive 
GPIOP1 when it's in pass-through mode. My recollection is you cannot, 
at least for the AST2500 and earlier, in which case both P0 and P1 are 
effectively inputs for the purpose of the GPIO controller despite P1 
being a physical output. This behaviour is probably more confusing than 
it is helpful.

There's also option 3 which is to emulate the pass-through in software, 
as I outlined in my previous email.

Hope that helps,

Andrew
