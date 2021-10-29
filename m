Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5809B43F55A
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 05:26:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgSWJ1yNRz2ybB
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 14:26:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=DcWjeLR8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=m/zBXyOL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=DcWjeLR8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=m/zBXyOL; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgSVq248cz2y8R
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 14:25:38 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DE33D5C017E;
 Thu, 28 Oct 2021 23:25:34 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 28 Oct 2021 23:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ZRQC6ra6nNe07qcoECknEOjDjLeP+m8
 5SRr7hVBnfhc=; b=DcWjeLR8maMFMk3zA2d7Cc8VGWUOH9HexxY9uV4Pd4ARQ7M
 T4kQ96RLR+nCFrF2aGPHlaR82V7sCOJDdfk+dQpxFZuZ1Qc6QlAAxI7msrl4vioy
 mTJM7EMI15ZFiWc6oMhX2k9igs+ZbKd3jZiI3j+D6wjodUR9yDxBSHHqeta699bL
 WQ92bB5UVSJpoVe2kRAcsKkWsd8671/mDnevq2PPVONmA0cVRyGpkPslpp7GJZAR
 ShMJhaUMBHtdFN921L8sWEsAHCksNjLQCYe3USSW5Lf6DM253N4AaqX8aVHdRqh9
 UkaSpx145E7KoAngAMvgvF2pDBY4atuci+U+yQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZRQC6r
 a6nNe07qcoECknEOjDjLeP+m85SRr7hVBnfhc=; b=m/zBXyOLxTW0yNqVJTC7N6
 9UfTVny0DxGWqSngATKb1IRJrrEzdOhiYm2vrm+kFGblnaXUBNg8qnxRcOi23KWp
 GJoqdv5RQnWVgFFImZVF1WuongX8wqwKuOidhdcrotv/HJ5CxsmsyNZEATWw+J2w
 nvjSIYkTr/8C2l6dOnNC60g2lukf/+tiTsRAeYIjJwjIXqe4t/dCNvSiMTTeHhGW
 t5mqwn/5HPhf9SnxqZzOq02CXAUAbfG+8CdQ9tAJeL/8qmkYhgXT/FXtbKC08Spc
 Me5POF5Jrm15mQpMShoLGpOMjtZn7qn1V+sgFzH/Gm7YpcefSr4cPn9VTmeMpBAQ
 ==
X-ME-Sender: <xms:rml7YSghXmTsWfR8QfISNA_BRlOvUGfqlTdG-xINr0kTAVSiwsubgA>
 <xme:rml7YTAqtNYZ1RKPismJqSmCSBknW5rlJyoMqQ_Accz1s_MZEHmQQ8QJzPbc5Jh72
 NeBqlEjxG9zXkIegA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeggedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeektdeghfevffeiiedviefhueeggeet
 leehffeuveffveekjeefheefvedttdfhgeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:rml7YaFuPcQTeLSjae_PU_9mF9WAGKHwkt51AluYgQ4QHcPg4Mqmkw>
 <xmx:rml7YbQs3J76ZaHjeAdh2bEOmdQABcNhcO01JFG8YM4whd3jlwV7Pg>
 <xmx:rml7YfyEHP7e7ROGTMqm1OllCGJiqJ36aOq96Ad-pEld3nmPgIscDQ>
 <xmx:rml7YQtzIexl1S7VgmF9oVpKJm5lCE2Kk4jV9hk6r7XVfvqY6cqXeQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BFA3AAC03DB; Thu, 28 Oct 2021 23:25:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <e0e5e014-cb45-4695-a4db-e4fecfaf29ad@www.fastmail.com>
In-Reply-To: <CAFaEeaG7ALuM-dLeZ6wYWtgD2oVJyZ1NNVQw+wOv7wmFMw_GQQ@mail.gmail.com>
References: <CAFaEeaG7ALuM-dLeZ6wYWtgD2oVJyZ1NNVQw+wOv7wmFMw_GQQ@mail.gmail.com>
Date: Fri, 29 Oct 2021 13:55:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sui Chen" <suichen6@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: [Request for comment] DBus pcap visualizer tool recent updates
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



On Fri, 22 Oct 2021, at 01:30, Sui Chen wrote:
> Hello OpenBMC,
>
> This is about some recent updates to the tool that could be thought of
> as a visual version of Wireshark geared for OpenBMC; it is a desktop
> app that runs on a host, opens a DBus PCAP file that can be obtained
> by `busctl capture` on a BMC, and draws time lines. It draws a time line
> graph, and draws some design ideas from other profiling tools.
>
> The tool has been iterated for a few times and recent small
> improvements include:
>   - Prompts for the user to install dependencies
>   - Ability to display overlapping DBus requests
>   - Ability go group sensor PropertyChanged events together
>
> Intended use cases:
>   - Grab a PCAP on a normally-running BMC and understand what's happening on it.
>   - Grab a PCAP on a BMC with problems and see if it's possible to
> find a problem form the DBus point of view.
>
> Some comments we're looking for include:
>   - Is the UI intuitive?
>   - Does it make understanding the operations of an OpenBMC-based
> system a bit easier?
>   - Does it address your problems when developing for OpenBMC? (It has
> been helpful for us in a few circumstances)
>
> The tool can be found here:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263

I've merged this now.

Andrew
