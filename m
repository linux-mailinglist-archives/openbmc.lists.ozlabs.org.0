Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C232529852A
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 01:47:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKGPf6g22zDqMn
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 11:47:02 +1100 (AEDT)
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
 header.s=fm1 header.b=Yez2ikO6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=TMV7gh5f; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKGNp56lRzDqM7
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 11:46:17 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 557E15C0129;
 Sun, 25 Oct 2020 20:46:12 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 20:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=dZtFHWGGjjozPib16huc+46KKLRJfaY
 2dVJ3RxzrKqI=; b=Yez2ikO6h8kucrtA16z6/TMrOOaZAB7sDj7vXyE258rjwDV
 F9EswBhrdoDGKbWuhP+kMmEY7cYCTDHsbpv/LQkwdpItZ9cm42Ays0FcE5OEl2tC
 No/LxJxPviEHKdx6oEj/YsWbRuhedWR2R2hQM8XO+PFeBSWZxua38uLhIwkgo+km
 7JSQVubGePZxz4axuNkBiizlAVreu4/81kIbsCNK8g8dyEpYOjg51uvUujtrL9FS
 3EtBasPJK8wrl/7zuZBqoviIY/Oqu9Z5rDoh64u7TWOHMM/A/gtq8oh8EYqGhkye
 tUxE3tmj9jJ5a9QYZqx2XkcEv0QH5YuVWReh4Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dZtFHW
 GGjjozPib16huc+46KKLRJfaY2dVJ3RxzrKqI=; b=TMV7gh5fKrEa3zRznTEJDS
 eGF9GDeCdPtUVyBMrHLkvQYLC12B+UYOm8EvI8ng4HaRMmlPT2cXsaNMnsY7MwXK
 asd+LWcLhPzUhcPaBq6z/y+dWQQf9iqFxDjH1HWDHf4N+sHH4d9oK0Soy7xvNuul
 xOvLcgEUFHEqUg/fid5syI47pCLfLFowZtWA//smvICnDJMqooRDRaRVW18gTQuK
 Puwy35gn4yFtg2vlAo9dxFpzMEkYCn8CyQnibFHL8u6ibqJSGiMmR7Rz7iX22oCc
 zm5w6fpiD3ZIN3l9EB+GtFa56g3DhLed50RKITj+oxKrF9WJkgMUbv6ganzUXlaw
 ==
X-ME-Sender: <xms:UxyWX9pJ-q-FqD5Pxza5sMbHxzG9yE9bJqYRkmR3vLBH_5eMJq-M7Q>
 <xme:UxyWX_pp2TTEwxEFiG9JurbcLRBZJfr-yFG7T12dsx85mk8L62vNuHT4cYT61TM6l
 um6EDtgnJm9S9aLSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:UxyWX6MToUv1pFXXHCmNgfjppgh8uKaxJvMPTgXKfJXeqe2r96XG8w>
 <xmx:UxyWX446YaTj0fmSZQwhVyAE77e3ltJDcPmboxlfFh3g7o4TGJXBNA>
 <xmx:UxyWX85GLbMq6qbz1s6Gp1htlkRUF2yxgb-IE78HSgUNuaU3Ddp3Ew>
 <xmx:VByWXxUiv9-MVjva6iihOfqZ9w3ftdU4ATM4emEYJKhew2a2vFJsAA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8E756E0416; Sun, 25 Oct 2020 20:46:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <8b37dde7-410c-49dc-a8ac-8c1ae1fc1ca4@www.fastmail.com>
In-Reply-To: <CACPK8XeE8Hri-Ct0f9BYpsp1zv=_X7p-P14TydE2G-FijpeUqQ@mail.gmail.com>
References: <20200827133002.369439-1-andrew@aj.id.au>
 <CACPK8XeE8Hri-Ct0f9BYpsp1zv=_X7p-P14TydE2G-FijpeUqQ@mail.gmail.com>
Date: Mon, 26 Oct 2020 11:15:51 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.8 0/3] MAX31785 Fan Controller Work-arounds
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



On Tue, 1 Sep 2020, at 15:51, Joel Stanley wrote:
> On Thu, 27 Aug 2020 at 13:30, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > This series works around reliability problems with the MAX31785 fan controller
> > as observed in the field on some POWER systems.
> >
> > I'm the first to admit the patches are not elegant, so feedback there is
> > appreciated.
> 
> The way you implemented the loop took me several goes to grok. I
> finally got there.
> 
> 
> >
> > Separately, our previous workarounds have run aground upstream as the hwmon
> > maintainer was unable to reproduce our observations on the MAX31785 evaluation
> > kit. I've recently received an evaluation kit, so I plan on putting some of
> > these issues to the test myself. Ultimately this will help determine whether we
> > have issues with our fan card designs or whether the controller itself is at
> > fault (I have to admit, given some of the failures, it's hard to see how the
> > controller might not be at fault). Basically, this paragraph is my excuse for
> > not pushing these patches further upstream for the moment; I will re-evaluate
> > once I have the results from testing against the evkit.
> 
> I would post this series upstream so Guneter has some context for
> future patches that come out of your investigation.
> 
> >
> > In the mean time, these patches resolve issues we've seen in some system
> > deployments. Taken together, I've put the driver through an unbind/bind loop
> > of over 20,000 iterations with no "loss" of fans, where prior to the series we
> > typically achieved only a few hundred. This feels like a significant
> > improvement, so please consider merging despite their ugliness.
> 
> Do you want these in dev-5.4, or both 5.4 and 5.8?

A bit late to respond, but can we apply these to 5.8 as well? I've experimented
with applying the same workaround as we did for the UCD90320, but it looks
like a bad idea: We're not actually monitoring the UCD90320 sensors at runtime
and so this hides the scheduling latency/jank that the I2C throttling patches
introduce. This jank is exposed by the fact that unlike the UCD90320 we do
monitor the MAX31785 sensors. Decreasing the jank by increasing the upper
bound of usleep_range() to e.g. a full tick leads to unacceptable latencies when
reading the MAX31785 sensor data (one read blows out to ~2.8 seconds due
to the caching strategy implemented in pmbus_core.c).

Cheers,

Andrew
