Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BEA4D0D
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:10:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBpd0V1PzDqRZ
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:10:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eNts76j5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VvvlXpLY"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB7l35tYzDqVP
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:40:18 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7BD743C6;
 Sun,  1 Sep 2019 20:40:14 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 01 Sep 2019 20:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=3QDfdOw1Nqn/5eWNETQm80We4E/SERy
 HyupyDEEN+8c=; b=eNts76j5fQcMQ+nWAXs1BXFWqh2vcwxJNfy0gnQ7/u2s6y3
 At9l4gZX/iEdCM9+xffSLXQ+8Dj/hTbzblF/ho4EpZij1z5ijDE9eR+BHRPw57T6
 EjdEIQW6pvv5p6HNzrYxNl7dE5Q0QBL4g7uxqcka9xnpLcUpAz5ffvvB1y/62rcY
 3/W7yK7x2vuy6OSrd1D4vB9q3zwHB9y3Dp0wrnaMVCTiKBt504Ry4ZSPjw03ApOH
 2CptcJs9X8h3Tur8jQ6uyds+OJhq7b6ARj+iXVZdSiah/TrrX8vHx/Wrs0gdrPJX
 cLiwlKFGopAuCaZ+db5y3HaHcjFjcmKARY4Pwgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3QDfdO
 w1Nqn/5eWNETQm80We4E/SERyHyupyDEEN+8c=; b=VvvlXpLYnrlvPZdq245AWQ
 aylkafiP+x3HIHcSW5yPKPKUNBkXyd/echTMIrqVs0ouzgKh5B0hKyRv58CAnqo3
 fGaBOeExMHyb+mTc3WjXKaa7elto/o6xy11Oe6F/frpbzXQsUTsfkqkahvLkkiIt
 ihnTkiJ4GM0y+XCksd8oxA/alXmw+MRlhMV1DwTcRZiKTUCwmofTzSJu7R0ksTPE
 LSB1YwmJPCjq0B/jTr2ng6Xuck7bEGrwup+ICEBVe7PJknbgbbR20EFzsFJ3kuBi
 3eyORqzTaR4kyAff24yCJpo5sQEzOxWFKn7qDCjsdFWBll5W8WEgl4aMEwuelNpQ
 ==
X-ME-Sender: <xms:7WRsXXg6psqXp_fXWT9XqCDeZ7UZTrnP3T48GnvlPDgYGvrGk5klAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:7WRsXXhqxs3YVgVhIPYJ5-aENRItJb4AeV5Yv0-P_imEsY-QQhdcIg>
 <xmx:7WRsXd3_EmZDlZNuay3S8K66BP-a-pyOMKD9Sz8hkF7Zmu5OCWcWgA>
 <xmx:7WRsXSh8duEqbp2VlV6yynOtmEMA3rmZ-xFJqd1aCGWB_r2HYmjLKQ>
 <xmx:7mRsXSm5smKd17EOWZUzaq5eVh5nWcmLby55BLG5SVwdNQuMrooRJA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 430F9E00A3; Sun,  1 Sep 2019 20:40:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <0d60235e-399e-4c86-b29b-1306f44ea22f@www.fastmail.com>
In-Reply-To: <CACPK8Xf73LHALPzrpn3y=2QkxHV7Fzpi8FbB+BTEx6qW=UTEHA@mail.gmail.com>
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-3-andrew@aj.id.au>
 <CACPK8Xf73LHALPzrpn3y=2QkxHV7Fzpi8FbB+BTEx6qW=UTEHA@mail.gmail.com>
Date: Mon, 02 Sep 2019 10:10:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.2_2/5]_mmc:_sdhci-of-aspeed:_Drop_redun?=
 =?UTF-8?Q?dant_assignment_to_host->clock?=
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



On Mon, 2 Sep 2019, at 10:07, Joel Stanley wrote:
> On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > host->clock is already managed by sdhci_set_ios().
> >
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I assume this went upstream with a fixes tag?
> 

I haven't sent it yet, was waiting for Adrian to review my v1 upstream
before sending a v2 with this patch included.

Not sure it needs a fixes tag, but there's no reason it shouldn't have one
either. It's just a code cleanup, it doesn't fix a bug.

Andrew
