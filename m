Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BCEE414E
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:56:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znK13NwszDqdd
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 12:56:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Xs5+Hz0X"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="qdJWPsFo"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znJ21DklzDqdS
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:55:30 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A53954D2;
 Thu, 24 Oct 2019 21:55:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 24 Oct 2019 21:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=zj6aj3PObKKewl1FsUfHQDJ1cSY/ukA
 KKtPToPn/SBg=; b=Xs5+Hz0Xb0JaAlt4FprBjRKNIu24jCz4S0c4XrUU9KcscTb
 X8oNkBNSDnla/7wfkhBaOblvOfgZrWWoVGCEabmHsjlhp37nRiK9sme6wCcYi9dw
 MADVWgdcuEUzpm5PBfE0rrxJGJt3LwiemdEm308AI8IwZyOtmOfNx+uSj83a8wHV
 eXDnXLW29KnOzi/GCjOwYylVECP6c7mP6Mp9WDWHpNwa9CO69wAclk5gUcWO//bg
 4uJ0qAHwnLI8CLRC4oSL4NH7Vibv1rC9P8PvkHUFaEIf0W7VqsjPZypWJk4sisA/
 oN8SHAbY4YaD7VYJHhe3eKtE0oUg7VGezW9Rx1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zj6aj3
 PObKKewl1FsUfHQDJ1cSY/ukAKKtPToPn/SBg=; b=qdJWPsFowwDBBull9i70a9
 urhxT1CJeX/+GhPtGOSGY37Q8QNeNXy7cNx4KWiZxcqldjNePhi7Uk5+e408M9WW
 veCp8rt8zzhoK8lc69Sv2FigYMAi++mC4iuo6QJEupacOUjPFFFZKWHvfFkwwN2+
 Udhwww/asJYOfvOYnBQAUYoIM8eal4mHOufCCeC2Pnd4vOi4tmSIND3f2lJCRTQM
 8fLszKjEv8ykpK29TZThndzAINp/Qo6JQItgilyoRYh94e0qk7RhJr1Qwjd39QIo
 1sfrL1hVdnNRNYnz9Mc4t8aw6BWMVURp0564K6dpWG8TLqinWXfFzZ6VHRRKj1OA
 ==
X-ME-Sender: <xms:DlayXVpjiPEoAP_HIbVM5fdpd2aAWBmfdNGP9Vz5fSltO_565J-tWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledvgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:DlayXXdGhafHNjhBIsSVad9qDlJ2ksQzBVS1EGwMSc7U3uVokPr01w>
 <xmx:DlayXUxy9MW2LwrXKDhG0ISUoIXhzDn0oYtmkq0M_xtu95irKXwQeg>
 <xmx:DlayXddK3ZT8TcKIyugkdOCB4KO-eo2VTXl7XHRIq880p0VhEFsVKQ>
 <xmx:D1ayXcbeercCIkaroT9U_EjX0VcqGBR-4OzBN90D5VecxA03YnQYZg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 96663E00A3; Thu, 24 Oct 2019 21:55:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <901482d3-97eb-4bf4-9559-b56497d5fed0@www.fastmail.com>
In-Reply-To: <20191025010351.30298-3-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-3-joel@jms.id.au>
Date: Fri, 25 Oct 2019 12:56:19 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/7]_fsi:_master:_Change_default_divi?=
 =?UTF-8?Q?sor_to_14?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 25 Oct 2019, at 12:03, Joel Stanley wrote:
> We were running at 127, which equates to a bus clock speed of approx
> 1.4MHz. This changes that to approx 14MHz, which works on the EVB and is
> reliable on the Tacoma systems.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
