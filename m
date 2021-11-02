Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F75D4438BD
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 23:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkQ6s36Zvz2xvL
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 09:48:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=nRqKoKbq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OLXGy7++;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=nRqKoKbq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OLXGy7++; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkQ6T6qyBz2xCj
 for <openbmc@lists.ozlabs.org>; Wed,  3 Nov 2021 09:48:17 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DF0BF5C012F;
 Tue,  2 Nov 2021 18:48:15 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 02 Nov 2021 18:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=9oGCiNLaB+K/B8qcGJgUYMXX0jUBeuh
 4crQEHqfZxdg=; b=nRqKoKbqkls3Q+3NKTyY8V8ltMnV9VlHiWD4ep6UUg/UsNi
 S1LhyLy9Rn9xOI2f0g30N2se+x7XOQx+baVwK4J7pKeIgSLdLx/UT/I+BLh1ZqJc
 lA4GNfL5LJWTwtLEZ5SeEbNS0ADDty2nFooCTfX11GwAdmyAQNO9CoSk9rqpUvvi
 4b5gGJdFeqWAuWlDAga4H3AwjvoCkQga0IJIFdya3mEKLWrqj/ZHCNDgEmG1uQxi
 pWgqvyAP905KzRXehNzbZ0tz4lUKAheLbbuIapQQPhk2J4C5/f4c53b48iOiqu1m
 kktwdcosgNPMSirsXK2HtbOs4oCnceo21Vy2BQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9oGCiN
 LaB+K/B8qcGJgUYMXX0jUBeuh4crQEHqfZxdg=; b=OLXGy7++QnAqcymCOfGLmi
 lLTGRnAhQrSchaEaqIaznTntVyAwCwfPKKG97zuG22fGjnAsMwIcFGffORdfH3dJ
 ZA2riYUVtFt31hTnnS5DPCh9xSpLizKXyzhwE4Sat2/t8ZsyT+Z6x/rx5iqF6bQo
 FiXwpG9egCDKzO9yJ/Xqv+/QFTLxEAZJexubLWUUMX8sJoy0ApCLTzzqk7IJf/5R
 2P6qiwLR11UnNo8C5SRc0b45aXG35eyxIyPxGwURuUnwzDww9Aa9iELX54+l3UWd
 s09JnSes3EJOatVRhDTCriFIeZWSLGQ3ZCn3TqJpLKmTYfZgCNBwfS2olOjV8I2A
 ==
X-ME-Sender: <xms:L8CBYfSAEV-94mzCzEwmuGovvtRO_Imdt9kh5H4GBqxv6P6D3zICeg>
 <xme:L8CBYQw8NfXTDIinoqiWgutx9pvlSbir2ShW_5e-lMcZ41cbksAaE02KgeFTrTo6f
 ZhCJvi0L78U6l7Dgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddugddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhephefhfeekgfekudevheffheeihe
 dujeefjeevjeefudfgfeeutdeuvdehhfevueffnecuvehluhhsthgvrhfuihiivgepuden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:L8CBYU2xDfZkvHyP8xIBtMB4T1aX7RKRpEUhx9ioMqZeV01a_3jWSQ>
 <xmx:L8CBYfAX_469Wrxw62T35SayWppA6nI8tvqWWutGVPAHLSkAmTMt4Q>
 <xmx:L8CBYYiVon-J9IymYebF-j-QPFMXEVd9k76utb6iwbYphd2meYcZEQ>
 <xmx:L8CBYWdkqD309kuo0_XfYWUg6e2fNs11aXARvrt_4TMpUMthmQ_ljQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A6A3DAC0DD1; Tue,  2 Nov 2021 18:48:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <a2ab6e03-9bf2-4b7e-aae0-7883fa325265@www.fastmail.com>
In-Reply-To: <e41ba66012487dbec35d73ed82fcc95a8a2927d0.camel@fuzziesquirrel.com>
References: <e41ba66012487dbec35d73ed82fcc95a8a2927d0.camel@fuzziesquirrel.com>
Date: Wed, 03 Nov 2021 09:17:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>, openbmc@lists.ozlabs.org
Subject: Re: documenting object associations
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



On Sat, 30 Oct 2021, at 05:04, Brad Bishop wrote:
> Hi all
>
> I recently submitted a patch[1] that tries to establish a mechanism for
> documenting our DBus object associations[2].
>
> The patch has been merged - I am sending this simply to highlight the
> change and to encourage everyone to document your past, present and
> future associations using this mechanism.  In case you missed the review
> feel free to reply here with suggestions for improvements.

Seems unfortunate that there's duplication :/ Is there a way to resolve it?

Andrew
