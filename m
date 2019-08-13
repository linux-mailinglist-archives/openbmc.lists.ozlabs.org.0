Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4608AE1C
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 06:54:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670kK60B4zDqSx
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 14:54:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fty6xNZd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tbxDHmsA"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670jj1lbczDqL5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 14:54:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D334B22025;
 Tue, 13 Aug 2019 00:53:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 13 Aug 2019 00:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Qjtv8
 cNYCNJgEQ4edI+wPd4jz70hl0q/0BTaEhi0wCo=; b=fty6xNZdyEWPjRE8B2Rxh
 1aZeWa8Vw8ImFzahig6isjM8Qp2YfhPj6W1sVLN4JXoea3MDnMEZsdZaNv/VV6zY
 GUO+or38UdJxxSWnibKUd4HezmN5sufsrplkyt7POYjhNOTShj3fkbXIVMSqFNaH
 jfeWB+16DQKaJ+SRx1p3msH5mPDCpC/kZmjesVv/t60UGWGbc2QEf7TsoJmgpB5F
 QXOeWA9vqsHYxpbTp5mP1pbCwb5W6vvDiNGmpd1CFviKyRRY231bxPleHiouN9dm
 1fQVixh9I/ZR2VIeO0AuQfSXhvhYrORXXNGcG4Ea4toj5Gm6mVKXhg7KG1PR160w
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Qjtv8cNYCNJgEQ4edI+wPd4jz70hl0q/0BTaEhi0w
 Co=; b=tbxDHmsA+dM35K9H6UcnNUgmDTqpqxshIi27L9nRc9zYhxFZuZi6RNXXj
 fGSnMJLvJ4699gqJSkkYmhcaFsqNIZnONiVUU/HzeMl+Bfqc6lOJv2w2tl1pK669
 Xv3kfoUzTUp7ZtS37+FFrAFueCFZG4dp+ySHkHUZrW9acRpSb4P4FqRt34RhuMuc
 YftMIj43VNDYYBMU9gMlPs4KhDOq7yOy+VaPUNKrf2mu9xOzacG8zyuUay0v7kKs
 +X3agKljUom/WhHkyStdteKBy93Q6K1IfNfCq5gPhjFurUotHIfvXQZiJO8nVGJf
 RJgrQdJVg8eYArQ035joWC4ShCf1g==
X-ME-Sender: <xms:ZUJSXfjYton3x8fTMqjx_UoYmCwXWsegkwI72J9WC0OPB1NL6BijWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvhedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgu
 rhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ZUJSXRVn3MhiSY0nyAxFuTA2IlsVpmJTaPTHTMCl8ITwbUSe7y5s4A>
 <xmx:ZUJSXbK5niSV0AqSEyqLQIN3Dcr_fEdRyGiNEkMEaqxcyc3ekdJSgQ>
 <xmx:ZUJSXY3fD5yshv_hd4SkZxA1rcK0WsqcTlMuGdHBzdt4XuaEQTHh8A>
 <xmx:ZUJSXXAH6tuJ3QcM3meJQCtyvosBy2vLF2X-Za_wfSxBWSjy7AT_HQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1F613E00A2; Tue, 13 Aug 2019 00:53:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-864-ga937f03-fmstable-20190813v1
Mime-Version: 1.0
Message-Id: <13f8bb86-eb14-4f8c-b03f-3912aa601fe8@www.fastmail.com>
In-Reply-To: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
Date: Tue, 13 Aug 2019 14:23:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Policy on Tools Posting
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Wilfred,

On Tue, 13 Aug 2019, at 10:28, Wilfred Smith wrote:
>=20
> 1. Are there guidelines/procedures specific to submitting command line=
=20
> tools and utilities? I have heard that there may be a repository and/o=
r=20
> path dedicated to CLI tools.

There's not much in the way of commandline tools that are dedicated to
OpenBMC right now. The obvious one is `obmcutil`, but that lives in the
phosphor-state-manager repository which isn't really a spot to add other=

assorted tools.

At a real stretch we could put things in openbmc-tools[1], though that's=

not really intended for production code, more-so helpers for development=

and debugging.

[1] https://github.com/openbmc/openbmc-tools

>=20
> 2. The specific tools I=E2=80=99m concerned with at the moment are a D=
-Bus=20
> enabled version of fruid-util

Maybe this could go in phosphor-inventory-manager?

>, ipmb-util=20

Not really sure where we might put ipmb-util

> and sensor-util

Maybe phosphor-hwmon? Not really sure, just putting out some
straw-person suggestions.

Are there descriptions and example usage documented anywhere? That
would probably help us sort out what the possibilities are.

> as they=20
> currently exist in the facebook/openbmc repository.
> Nothing to write=20
> home about. I=E2=80=99ve removed anything Facebook-specific.

I guess at this point it just depends on whether you think they would or=

could be widely adopted.

>=20
> 3. I presume the correct course of action is to submit Gerrit patches=20=

> for layers under meta-facebook unless instructed otherwise.

You're talking about the recipes here rather than the actual tools? Or
are you proposing putting the source for the tools in meta-facebook?
In general we've tried to avoid that.

Cheers,

Andrew
