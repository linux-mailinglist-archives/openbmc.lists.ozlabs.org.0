Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFEC3760F1
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 09:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc1kH70pSz306F
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 17:08:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=WXyJPMT4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cl9pdSrn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=WXyJPMT4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=cl9pdSrn; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc1jw0xl4z2xg5;
 Fri,  7 May 2021 17:07:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id EDB0F58124E;
 Fri,  7 May 2021 03:07:42 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 07 May 2021 03:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=q+VAC568GzCcDMwNCnFEDtF1412nCnb
 auFVwJbsbwuM=; b=WXyJPMT4ZWdAIyCkoeAsXwq6dmXIAnL5Lagij8d9NaJasTp
 gMEmdzxHWb5kxAsNbRM9HZfddh6ttG/sYDs25cvmWO/DXtPFO71WpRWV4+TKnSyK
 8prGrbS6mOX2+RGbXZLRGcY1W5IvZrvBvVJqgSSWqAGz+EkMVQHmkjDuWejNUAeI
 S6zaf4Eul7CQReOrFj8pH8og2xJ94egkn/O8UlP7YgnYiPZypwUgGjZrPa44F2kI
 A2yRR1/ZyI6bAeWbNiwlg+DpD71rUWY1eBgBwFSN59Mib/gtqRBlw9Jra5e+jJOz
 AE/o3AOF1t4f/8Zd7ga/cFPJX8sBenpmOpV/alg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=q+VAC5
 68GzCcDMwNCnFEDtF1412nCnbauFVwJbsbwuM=; b=cl9pdSrnMTdDTAhtRs2BaO
 N9iFPUJjIFO6QorSloXzuKZjTCF0hRy5y107XXN6gOTYanFVn17535Wmeh5nquEJ
 jnfO5P9I7Xm/IrDMmscjRNCMYL4n00cHPbjtF7OrT7S9vN3zERiVAQtAreYOtShC
 7l+PXGTBbBe+ZaRBs3Fo+ge+UUgoA9YsUsglS0X+/LoiXPFm87j4AwGoAZi8NjK1
 6LNY82X9i9dH8j3oEbmIVFB8gggDUuYSSN7EU2QvDOW4pgryfGe8+I13LrR1gTHo
 VAIhHB8/yhOlZ+RVR/Aqw/1i8jYbEPceUmBpX2TX2mFAxE5rScClOqKlEUGDFftA
 ==
X-ME-Sender: <xms:POeUYFPapsp60JK4ld9l76Q52_r5FtzkegSOpGSteWeHzuVqhodTfg>
 <xme:POeUYH-jq7cZbWm0b-wWC0WiwvHRg4-KSoT_7OdSF5Zn9JgeZnuFOsRvXC6wRqNTz
 6DwxbeGkw7LkfcyNw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileet
 tedvtdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:POeUYEQPbTt891MALMQcYNL3pwsR7mMmfv4MKkhIwfbgGY22uK10xQ>
 <xmx:POeUYBsEupgfUrDCQoIlYbStqtchVo1wFEpcHZxDeQcBikgoqdrb0Q>
 <xmx:POeUYNfFC5bh8udiKYhNCDCWZxX0CdMdKSBq0zGJg46uRIka1_SHRA>
 <xmx:PueUYA_TEcYpIFl85kGI-8qemAGULjMUmk-0ps8PDAmplNLkx0Kkxw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D246BA00079; Fri,  7 May 2021 03:07:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <e895e05b-fdcc-4192-befe-500c386ac64a@www.fastmail.com>
In-Reply-To: <20210507065918.GE23749@aspeedtech.com>
References: <20210506100312.1638-1-steven_lee@aspeedtech.com>
 <20210506100312.1638-5-steven_lee@aspeedtech.com>
 <fecc9021-ab4b-4047-a664-47b1bd867cb3@www.fastmail.com>
 <20210507065918.GE23749@aspeedtech.com>
Date: Fri, 07 May 2021 16:37:19 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_4/5]_mmc:_sdhci-of-aspeed:_Add_a_helper_for_upda?=
 =?UTF-8?Q?ting_capability_register.?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 7 May 2021, at 16:29, Steven Lee wrote:
> The 05/07/2021 10:13, Andrew Jeffery wrote:
> > > +/*
> > > + * The function sets the mirror register for updating
> > > + * capbilities of the current slot.
> > > + *
> > > + *   slot | capability  | caps_reg | mirror_reg
> > > + *   -----|-------------|----------|------------
> > > + *     0  | CAP1_1_8V   | SDIO140  |   SDIO10
> > > + *     0  | CAP2_SDR104 | SDIO144  |   SDIO14
> > > + *     1  | CAP1_1_8V   | SDIO240  |   SDIO20
> > > + *     1  | CAP2_SDR104 | SDIO244  |   SDIO24
> > 
> > It would be nice to align the columns to improve readability.
> > 
> 
> Columns seems are aligned in my mail client(mutt) and my editor(vim).
> I paste the above comment in Notepad++, columns are aligned as well.
> 

Ah, it's probably my mail client then. Sorry for the noise!

Andrew
