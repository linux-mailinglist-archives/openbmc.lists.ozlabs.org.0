Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA875169B23
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 01:15:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QjJC5SrpzDqJf
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 11:15:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=NKwUoqu0; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=d7w/EFOF; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QjHb6fQlzDqNW
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 11:14:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 841222134B;
 Sun, 23 Feb 2020 19:14:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 23 Feb 2020 19:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=JVdsNXvCBQV66UBKq36kcGzm2zD1kXk
 7gptvwd+RbJM=; b=NKwUoqu0fbsZf9muDfco9h3lJ8a+QuXNl0SpOOcs/t4PQ4V
 O4nMpBlOEjtzwDpKwwimGsg7IsYLzmjwVc9S/a4jo8judBpAY6D4KRopXWB04O8G
 AJIXEDVGj377hL9Hrfzt9aJnib+dPRM6D31ewkwL5wvC3it5tex2bsFnoY3MUkcM
 hvvMBz8kdlW1+F5nlOPJqI+fCZa7UPfQgGSQhpg/oV/RODsSgkOYX1oCWWoffJxF
 21GCXiI8LtlMhBAeowLmqql8GAdAmvBubMDyU0yCywQP/uhNSJ1Pk2/YRJC4bwTM
 MaPU1NII4Wtm2eF43/2V9YnT4hqlqIM/Pi27fhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JVdsNX
 vCBQV66UBKq36kcGzm2zD1kXk7gptvwd+RbJM=; b=d7w/EFOFZVcx5gZR6qBFT9
 P1cikx8ZyBJdCgYLsvxS69Gnh/43sZeuxZ7HqJ3EySKAcB+ClWXWRcH+bw5IrrsK
 tOWO3mMf/4s3Y4+D1sdtemtTIFtfLu/ew2VZmHJ7k5bOOPBgdOryjl92mxsiogg6
 V5FVtYJ9718w9Xdg+s7vl18b/QckBmbIeMKNFutnJMXBLEIQbKOB12tOj7RnMJ4M
 YxUBPkeJq5CqBooKpKzasdVEGNE+OoQOSHTQrhJ8SVo7daXbtphM2d8We1gvW+mL
 0sM9sF3TpQaSOqOyf49Aq1Cah5i+zxIpFFOxyYGA2fEuRZhnU46YmgZeJ1O9AWEQ
 ==
X-ME-Sender: <xms:eRVTXv0PUpW70Xb8sIRwbM1ywijHRoKRANYfuArhSGMjHnhRy4qCwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeelgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:eRVTXgbBgw4gxYNtqOz16nChzNkw61nBKJPDgKBIdhWr9Mu9UKBocA>
 <xmx:eRVTXunw3889dzXVzsTvqTHWjgDkzV-GHpTGq1e8kK-ThO4ky1O95Q>
 <xmx:eRVTXhz_w1JaoVf2CfrmHWCRVjnPO5mV6pCJXbK_pBDPZkR-IvXiDQ>
 <xmx:eRVTXp39v-chJNWhbucZZIB4x1WrmNlFJLLquusya1oexNW4BRnQpg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1A4EBE00A2; Sun, 23 Feb 2020 19:14:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <db64d727-02eb-4414-9624-dc174f2cb01a@www.fastmail.com>
In-Reply-To: <97f984a2-e975-c620-7fc3-e3b7defb75ea@gmail.com>
References: <20200220203546.GF41328@patrickw3-mbp.dhcp.thefacebook.com>
 <97f984a2-e975-c620-7fc3-e3b7defb75ea@gmail.com>
Date: Mon, 24 Feb 2020 10:44:28 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: sdbusplus commits missing CLA
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



On Sat, 22 Feb 2020, at 06:40, krtaylor wrote:
> On 2/20/20 2:35 PM, Patrick Williams wrote:
> > Kurt,
> 
> (Not a lawyer)
> 
> > We have a few commits for the openbmc/sdbusplus repository that have
> > been floating around in Gerrit since early 2018 and seem to be stuck in
> > "missing CLA limbo".  It appears that there was some discussion on the
> > CLA at one point but I don't know what happened to it.  I don't see a
> > CLA from the Bosch company in the Google Doc folder.
> 
> I have not received a CLA from Bosch, or an ICLA from the developer(s) 
> referenced.
> 
> > https://gerrit.openbmc-project.xyz/q/owner:mark.jonas%2540de.bosch.com
> > 
> > There was recently a request to revive this work because someone else is
> > finding it useful (and we've had a feature request open for a long time
> > on one of them as well).  What options do we, the maintainers, have in
> > this situation?
> 
> We cannot accept/merge the code until resolved. If they cannot complete 
> a ICLA/CCLA for this submission, it should be abandoned.

So "contributors" can DoS the project by authoring patches and not signing
a CLA?

What happens if someone forks the repo in question and applies the
unaccepted patch, and we end up changing the bitbake recipe to point at the
fork? And if that's bad, how is that different to consuming projects that don't
have a CLA (e.g. Linux, u-boot, qemu etc)?

I feel like this needs a bit more thought...

Andrew
