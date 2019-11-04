Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2AED847
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 05:37:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4760Qj16X4zF3YP
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 15:37:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="eAGdf5jL"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Kb1Hon/L"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47600d68fdzF3vR
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 15:18:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4CB434A3;
 Sun,  3 Nov 2019 23:18:38 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 03 Nov 2019 23:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=yxXAnWn4xOnJIbDKZWY0+iUNzNyG+Mw
 52nuFhTdIHjU=; b=eAGdf5jLxvNZm0hkXtnoA4QuZMdD3jfIxQQR/ZBlhGIRfJx
 xXJdjzWdaq4mMQCUWl52PefQubgxhV/aU6RK+Decd6VpCdHYsoM0+CW0JVRVoczh
 IE6rhyxIEPLsf95zTIGAEhIwJKodWno29fA6f9icbBN4f7BXLyOikffj0oQc28D0
 5XwdG7cSEiAq3r8MaG/i1wa7Z9nMArFmS1tD5WQ4z2hgCSKWs9QcfI1tNhYfT0gG
 CgwOspaURZ3Ktj0AWXq8GTV8SRlgPnVfrQxkOf1J14ts4aQtWMD7ChxQ2tyoC/D4
 NX0JjHBqthMlKw8MUwYKI5MQ0pzOIOBgh2pFpuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yxXAnW
 n4xOnJIbDKZWY0+iUNzNyG+Mw52nuFhTdIHjU=; b=Kb1Hon/LZ2WC75ghRofA2K
 JRyNHb0yJQtWLHNB34j8NsXrLsZKgKrOfa3vZ6lmvuuM4+Q0QZFAPOYbtoR8Uf3s
 5vh4dsCDbpZCKydNgd9BrbBkezyQm3yupw5CXmhyRQ9C34g6K+4XNIoXS1ZSYtzP
 2WKYUDiTJbRU7klEPSNrNn1S2XGufcuOREdrMwI63pizeDwHtTeqmaAP5X7f2NOU
 lUX1aKF6K1TpISyl04uWhsmX7fMep7MC7ZaNFBOZT4hNUyQoxGuT12WuIzcq3+if
 lgNoMx7GxoNcaRROkjyvK0sbYhjbX/x/cylmCObupz9rodYcGwbN6hkS+asfZ4hw
 ==
X-ME-Sender: <xms:nKa_XTUFkMdPnL9NxB7CZkLnUI86jpVEVZfMwIDlKNy3tbpw6C-hIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:nKa_XQfJLCIGAvRq0uUo8zF-fjLIg7OSRwEU_Pokw1duAt6UOCWoIw>
 <xmx:nKa_Xc_yTYbJUj3mGBC13ETj10PsWdzm1xa-gWE-uHlpDevh2qefxQ>
 <xmx:nKa_XQYszZxCXLwshoYo-eR8gmdiPeDKa50oXRXJsijFRDlny0pRlA>
 <xmx:naa_XRo7n7Q0jwWiIkl0OjAP0ZZEFBYE_EHsB0rpMRtj6MkjmKlVHA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D3BEFE00A3; Sun,  3 Nov 2019 23:18:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <1d264972-83fd-4b5d-883d-5591bcb5bc2a@www.fastmail.com>
In-Reply-To: <CACPK8Xdu6eEqAa7kRgBEkfEMeTBD3_yAr+YzVxGEA53sdYmEgg@mail.gmail.com>
References: <20191104040226.24376-1-joel@jms.id.au>
 <734758c8-66a9-494c-9dff-e7d4c57fb1ec@www.fastmail.com>
 <CACPK8Xdu6eEqAa7kRgBEkfEMeTBD3_yAr+YzVxGEA53sdYmEgg@mail.gmail.com>
Date: Mon, 04 Nov 2019 14:48:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3]_fsi:_aspeed:_Clean_up_defines_and_do?=
 =?UTF-8?Q?cumentation?=
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



On Mon, 4 Nov 2019, at 14:41, Joel Stanley wrote:
> On Mon, 4 Nov 2019 at 04:10, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Mon, 4 Nov 2019, at 14:32, Joel Stanley wrote:
> > > Some of the registers lacked documetation but now can be properly named.
> > >
> > > Rename FW to FULLWORD so no one thinks it means 'firmware'.
> > >
> > > The "enable DMA" comment was setting the FSI access direction for DMA.
> > > As the driver does not yet use DMA it can be removed without effect.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> >
> > This appears to go on top of my FSI series which goes on top of your other FSI that is a rework of my other FSI series. We should probably start merging these patches :D
> 
> They are all merged, 

Ah, I checked the tree just now and they weren't there.

> with the exception of your alignment one.

What?! How could you not merge that masterpiece?
