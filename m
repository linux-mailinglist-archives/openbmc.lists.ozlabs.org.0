Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F996202DDB
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 02:18:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qqkQ4J9HzDqbW
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 10:18:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=VOrZvafM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kR92LdqX; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qqjf6dZYzDqb0
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 10:17:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A65022026;
 Sun, 21 Jun 2020 20:17:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 21 Jun 2020 20:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=4oCFoxHR/cCJBs8H01/ZdOOuzwlLMAS
 elgyFLtJfuTE=; b=VOrZvafMPcwOL03zm/3nrLsJj8WwnVP3cxTfr/u19nudsuZ
 lrS24zNc1WU98dtpV04LHp2sjOsblLWNkMoU7I0xatczx2NU5m6BPFcuGIeOkFWZ
 5IJeY9mX32U95MXifL03H1PH/sreJcPYZgRBEb3UUjZzeviTk8NU03SdacDFnUx4
 OPQ+5rV9t+1E8VUpLTP5ai0DazLqEXiwtBiSTR3qN//dgucHb02AL3EjQC6JfhPZ
 Opfiy9YN5PBIxzT6P9kUmn9jgL06Qmmqo+rcxKSZm2Z7dWvOkqmzIfhUyRLMqnWQ
 rkoyXC0Y3sG5EZkPlYzLxbPXPW++62gONegbPfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4oCFox
 HR/cCJBs8H01/ZdOOuzwlLMASelgyFLtJfuTE=; b=kR92LdqXhVBvCR7CxBpgmh
 9EySajvMUJ3a85Ad8dKhJnXYDAAhjh3yXXx4SfmD8+d4HBihsL/Km+0z9uA87x60
 srVgIS0/TH9vyS8bkXLLd5/688rEJSnZOrH9uPmffM87pr2fmDpS4goFq5oJfeee
 Z9B/ftOOyxct+6NyC69vOCLE7QRxzzeKlsecZLxnd7P56W9oa2l0HrfUP/dcIjsx
 lhmTyHJVmPLg6KuENCN3hQYgHMZg7srHiCfMjhZotwDiMoHUxp3+xbE+J5Rh1dAb
 DtBuo9K5jOW1bxBX03gfg3ifLbJ2NqjA0ZnYXU3uvBvDbeMG43ftT13mOTUlUjSA
 ==
X-ME-Sender: <xms:j_jvXuXN4Lq3yzd-GVSklT2A9JFteghXtmyIZTQK40bk6FyT-OFh1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeetfeduheeuiefhhfeghfejkeevffej
 jeekheetveekgeehhfeiuedvffefgfejtdenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:j_jvXqmExTc_nLialh1ESv6i-ydecBwFysu_mKkjBKt6PZI_hEqimw>
 <xmx:j_jvXiaqdQVRzZ9FxRXMzcYtB06e45Pgo4jJk_StcXfDu-Evmlt6tQ>
 <xmx:j_jvXlUC4x3hmPUIoB7-t4HdDcCMO69ykLQHfu9OvRSIbw9p7Xm36w>
 <xmx:kPjvXmZ24QuoN7uAAELV7COmGZwhuarvZwNWkwDlflFejwl5g9Drwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8D4B8E00C5; Sun, 21 Jun 2020 20:17:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <f39e6012-a717-43e7-9393-9e3c00dfac34@www.fastmail.com>
In-Reply-To: <DF4PR8401MB11459191B8F682B8DAB4707A8F980@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB11459191B8F682B8DAB4707A8F980@DF4PR8401MB1145.NAMPRD84.PROD.OUTLOOK.COM>
Date: Mon, 22 Jun 2020 09:46:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC - how best to do meta-hpe commit
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
Cc: "Shaffer, Scott" <scott.shaffer@hpe.com>, "Cisneros,
 Jorge \(George\)" <jorge.cisneros@hpe.com>, "Rodgers,
 Renee" <renee.rodgers@hpe.com>, "Chung, John \(TWN iLO\)" <john.chung@hpe.com>,
 "Chen, Gilbert" <gilbert.chen@hpe.com>, "Newman,
 Edward \(iLO Firmware\)" <edward.newman@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mike,

On Sat, 20 Jun 2020, at 01:07, Garrett, Mike (HPE Server Firmware) wrote:
> Hi Brad and all,
> 
> Thank you for creating meta-hpe.  I'd like your opinion on the best way 
> to do our initial meta-hpe commit.  Its currently 168 files split into 
> (1) a machine layer for our DL360, (2) a BMC SOC layer, (3) a common 
> layer for elements common to HPE platforms.  I know the team prefers 
> small commits but would like your thoughts on this since it is more or 
> less atomic.

Right, smaller commits are preferable.

It does look like you already found some boundaries along which it might be 
possible to split the work: your machine/soc/common distinction above. However, 
my guess at the best course of action is to push the one big commit you have to 
gerrit, which at least allows interested people to get their eyes on the code. 
From there we can figure out how to divide the problem up if necessary (for 
example, if you're carrying kernel patches, how we can get them into the 
openbmc kernel tree rather than apply them via bitbake). Just be prepared to 
iterate until we can digest the changes.

> 
> I assume this would get committed to 
> https://gerrit.openbmc-project.xyz/openbmc/meta-hpe and go through the 
> normal Gerrit review process right? 

Yes.

> I've looked and not been able to 
> find good examples of other "1st commits" to see how it's been done in 
> the past.
> 

Yeah, we've had similar questions come up in the past and I'm not sure there 
have been any good answers. The key thing is to try to get all the pieces in 
the right places; get u-boot patches into our u-boot fork, get kernel patches 
into our kernel fork etc. Maybe we need to add an "Upstreaming your changes" 
section to 
https://github.com/openbmc/docs/blob/master/development/add-new-system.md

Hope that helps,

Andrew
