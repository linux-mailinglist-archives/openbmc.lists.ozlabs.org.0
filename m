Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DE111644B
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 01:05:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WNkh6bPGzDqNf
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 11:05:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="p7yndwBm"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YuQToN/M"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WNjr0G3VzDqM1
 for <openbmc@lists.ozlabs.org>; Mon,  9 Dec 2019 11:05:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 87765894;
 Sun,  8 Dec 2019 19:04:59 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 08 Dec 2019 19:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=SHvchBjQ5h0G4Bn4vFVdPxos2HV1buZ
 xgV7OFqN1C6Y=; b=p7yndwBmPeV+JrYZ1afSGt6TLH5OJQFIPTJt1P+x18pkoYU
 KA2BLx6aDV42VoIYHn/FFEdGU5V9Yg9cRehlACr/i+9wVN0RbhIIuzq9K8KkxZv6
 OCcCEYCQphL0DibOZmhyLD4WNQoLxODtHgFScFW6x51SlkbRi16QoxSUW4WokgNg
 7g6Tl+4JEXV2bDpA4HwRXFkxTDf9SirAq36cP+GuwNJikNRUvtsJSPszQfZYPGlO
 kMbzssujwOVqZtq1Mp85FwRzKfCaqcyypAl0e0XPH8rmhtq0yS3EamOH5KmfxEtD
 tPOh65eDW+irmyqlCLutvPiQOA6ITTXRS2ndF/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SHvchB
 jQ5h0G4Bn4vFVdPxos2HV1buZxgV7OFqN1C6Y=; b=YuQToN/M0yhHV51DAkHDjO
 pAkP3yQcciTxlkzJceSQTa2WQRXrxy381YXZMNR7EzJ4m0PDTXzDFSSAJlP0XTcK
 vG4/t17jGoT+MZ8i99QP/H6Jd+sUF/91OwscTzfEU+BO7XnlEK8ol7Mw27KOnTaJ
 ShHB47foZZkM2JZkjF+hEl6BtWxNMqdTqw5qCMqwTabfZChBb5eSDWmKGTyql5hm
 bGhVdGqpar3hPB0qNNCo4modgwgPLm62zPI5IfFaxpI0x30bmEbVB27fPW6r8rM2
 8ghm4Z+3VrbEyAOg02oXY82OZXYGbyoCyho51oAyzAMCaVqiWAcnW31D1OcFcabw
 ==
X-ME-Sender: <xms:qo_tXcmtaNSxqx3l_x_6KCE32iSMbyHrnqdVlimGVc783moYUVwdRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehoshhftgdrihhopdhgihhthhhusgdrtghomhdplhhinhhugihfohhunhgurght
 ihhonhdrohhrghdpshhtrggtkhgrlhihthhitghsrdgtohhmnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:q4_tXSqwPGQ_qz4Kp1rRvIR1XYT2_9AkGZ5wtQ-KAFNjC3vuD4IeQg>
 <xmx:q4_tXe4wQLxQbA4lBRtpbsHIxnTj-wMvWD2ybWsuxcECphHMAf-YhA>
 <xmx:q4_tXRUtn1n_Ffprqa2yZF4dB_NoxQQ7hGS8B4-MS_EghLZtbGBiTg>
 <xmx:q4_tXWk1rWpTMSvPlTVk9UOQhUrFQUvd7vMfa-icx3Kxpkv5P_wuaw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E32A3E00A2; Sun,  8 Dec 2019 19:04:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
In-Reply-To: <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
Date: Mon, 09 Dec 2019 10:36:11 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Project metrics
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



On Sat, 7 Dec 2019, at 00:03, krtaylor wrote:
> On 12/4/19 4:33 PM, Andrew Jeffery wrote:
> > 
> > 
> > On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
> >> All, I just posted the project merge metrics for September and
> >> October. I will be updating the company/developer lists for November
> >> and posting those shortly. Enjoy.
> >>
> >> https://github.com/openbmc/openbmc/wiki/Project-Metrics
> >>
> >> NOTE: these metrics should be used *very carefully*. They do not
> >> represent the total contributions to the project. We value
> >> contributions many that do not show up in these charts, including
> >> reviews, mail list involvement, IRC involvement, etc.
> > 
> > Given all the caveats and the lopsided view the graphs display, what
> > are we trying to achieve by graphing the metric of commits per company?
> 
> "What gets measured, gets managed" I am a firm believer of this simple 
> quote.

Okay, but my concern is the lack of context. I think we're putting the cart
before the horse in that we as a project need to decide what we want
to manage, determine the appropriate metrics and then perform the
measurements rather than cherry-pick things to measure and present
the data without context. We need to know what questions we're trying to
answer and there is no context available for your data as far as I'm aware,
certainly not at the current revision of the wiki page:

https://github.com/openbmc/openbmc/wiki/Project-Metrics/f15759a7ff5c61fa6713b5602dd0f40820b84d0e

> Measuring a project always improves it. That, and I have been 
> asked to start gathering metrics from several of our contributing 
> companies.

Where did this discussion occur? Can you provide a link?

> They appreciate it.
> 
> > It's also not clear to me what the inputs to these graphs are, for instance
> > whether changes to Linux, u-boot, qemu or other major projects that we
> > consume and contribute to are included or whether it's just repositories
> > under the openbmc org on github. If we're excluding upstream projects,
> > why?
> 
> It is only for contributions under openbmc. Other projects have been 
> excluded simply because they have their own project metrics. For example:
> 
> Linux: 
> https://www.linuxfoundation.org/blog/2016/08/the-top-10-developers-and-companies-contributing-to-the-linux-kernel-in-2015-2016/
> 
> uboot: 
> https://osfc.io/uploads/talk/paper/31/2019_State_U-Boot_development_report.pdf

Sure, but delegating to the upstream projects' statistics buries the
contributions that some are making that are driven by working on OpenBMC.
Often contribution to OpenBMC is by way of improving the kernel. Disregarding
this contributes to the lopsided view that your graphs present.

I'm concerned that we're trying to create a stick to beat contributing companies with
rather than working to find ways increase contributions for mutual benefit. Competition
works as a motivator when community members feel safe to take it on but I'm not sure
the community is mature enough for that to be true. Adding the context for your
statistics might help remove my concerns.

> 
> *Really nice* interactive openstack stats gui: https://www.stackalytics.com/
> 
> > Where are the scripts to reproduce the graphs? Can you contribute them
> > to openbmc-tools?
> 
> Eventually yes, if my employer will let me do more upstream. :) But, the 
> data is publicly available, you can get it yourself from gerrit. Simply 
> go to our gerrit dashboard and search something like: " status:merged 
> AND after:<date> AND before:<date> AND NOT topic:autobump AND 
> owner:<gerrit id> "
> 
> I appreciate your feedback, I will make the specifics of what is 
> measured and how it is done more clear on the project metrics wiki page.

Thanks, but please make sure to address the critical issue: What is the
question whose answer the data from these metrics supports?

Andrew
