Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53317309F45
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 23:47:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTR6c4ZhCzDrQH
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 09:47:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=joZOUhRM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=W08lUX2t; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTR5V2GpCzDrB2
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 09:46:36 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2F21C7D8;
 Sun, 31 Jan 2021 17:46:32 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 31 Jan 2021 17:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=b2GEVMxnG3gmGHa4MrY5cofQfpPrKSc
 HSbPWpuBOZaQ=; b=joZOUhRMrt2HgB6oXORaNa1d57FjVgME+U1cs4unmxkxlkO
 Uzis92bmRjIqkcsBDTNsBnHJ7Jel2alRU7rJiNLVU4atSWqkI7bqCCyw+zI6e8KU
 R3YDr5sOKBcEB4EsDGkpmmvaUpZ6/wW5vhEmX3xxBf9P21dc2JWy6iWuwdMxBmMQ
 8nEQN7X1XAAcjhXhfNBdy8BLxzC1hxLZ9sC9js8YznXw0eRUGMQfFT0af2pNOhI2
 /xTzOXD/Pzujv20MoTwXULDaDfgp6troA3o6Z61dFKDCYJFa2er6EJO1Y/PYvowo
 fNbeS21GFXCEP/N6bAXhr99qQtItEfmvgDMlaPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b2GEVM
 xnG3gmGHa4MrY5cofQfpPrKScHSbPWpuBOZaQ=; b=W08lUX2tA4Ae1WTMICFHmL
 DD9AUMmtgaoidNL6v4s//qnxP2t7qXEQ7Bahqi1LhVGrAl5LDLE8tVhQL5RRowPs
 N+pbcsCuxolJBizjVS53gTrwn+WYZJvEvf8M4yknKKz2zbYH+P53ycg1mLFaWttS
 ebeky3iLoToOcMrKqhDlP0fA4PwVt9lVQGySnq7Ew5PNloQT+KFouG4P2i8q8lRo
 dAvqvvWin5bSiag55ubfQepXC3LHmlqDiHK/VSJKw+bV57TyLswkQ0ts0PPx1JQ3
 7butxLK64/mAqtIykLXRyqy7VinVMrZPeGDUbBI7JuUuViNdtbdRbR5vfDpqsTIw
 ==
X-ME-Sender: <xms:RjMXYE0ukTwejrAG8o_MoW8Lakf3HPpgduGYxZV7AV-i8iiEDtcMvQ>
 <xme:RjMXYPEAXPZLkWbW7oHylmwdeJAIIsSQLJice8s2qA1vB7Gvwp1Eg099L46eSM8Rj
 xG4LdFGiqOIdjtcgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeigdduiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:RjMXYM5EkWHiq6Lj8d0PtEiv-MnCKfG1Dsg3hghmNCLACg-mpuObXA>
 <xmx:RjMXYN3LdmXC412kFWJzYUGAO1ML0ie5TukTwDJfHr7jGm0229d9iw>
 <xmx:RjMXYHEfvcD83bng8CoZKxHSAtaLzj9byPs4romU1U0AEIENeRN59Q>
 <xmx:RzMXYKPtiNnIUA78PelRpMNIyjY7bZrdIjhHjKJXTAhT1RZOa1WUDg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7FFBAA0005D; Sun, 31 Jan 2021 17:46:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
In-Reply-To: <20210129175435.2241080-1-msbarth@linux.ibm.com>
References: <20210129175435.2241080-1-msbarth@linux.ibm.com>
Date: Mon, 01 Feb 2021 09:16:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Matthew Barth" <msbarth@linux.ibm.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.8] pmbus:max31785: Support revision "B"
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



On Sat, 30 Jan 2021, at 04:24, Matthew Barth wrote:
> There was an issue in how the tach feedbacks of dual rotor fans were
> reported during any change in fan speeds with revision "A" of the
> MAX31785. When the fan speeds would transition to a new target speed,
> the rotor not wired to the TACH input when TACHSEL = 0 would report a
> speed of 0 until the new target was reached. This has been fixed,
> resulting in a revision "B" update where the MFR_REVISION of "B" is
> 0x3061.
> 
> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>

Can you please send this upstream?

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
