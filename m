Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FE2F0A85
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 00:58:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDYhc0FPSzDqR1
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 10:58:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=MFJdahdv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gcYrWdlI; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDYgV3kZBzDqQQ
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 10:57:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 660F61CB7;
 Sun, 10 Jan 2021 18:57:53 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 10 Jan 2021 18:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=nKotvv5rgXdYv2pNMg28lbjUtruUwEy
 2tUzoMCg6CeY=; b=MFJdahdvbRkcpVunf3LlHSUx7G2437ms12qQH3CpskZmxdz
 JVjQjNfTXRzByHJt1FMdNTKcTj8Fgkezga9m9SC99t22yAAUYykGIzwJ2JcKJIjx
 iM8fsi77EsHEWXpr3hvs1butBovFPFJni0WS1kn3kIT8EupimVootoKUQr76Q/0I
 RO/Z+SxZVe9oVmGT13dWdJm9TIrypiXdAuaLbBT2kqDifJlXlNiq/yaLJytFCtCs
 YuMTodlWmsEgCJtokPE8Ixi6Ws41YkQxw6YfCiU2GOJWcLzmi6U57l6gSNS5gEp4
 /L7wncIJrWnIpO62DWVDliDjLFlJImC1mVtAiTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nKotvv
 5rgXdYv2pNMg28lbjUtruUwEy2tUzoMCg6CeY=; b=gcYrWdlIr9y2ThKmkliDI6
 fj+wTNz+6IDsMcTT/maSYKNKYVIZgwuKEbj2w2KwSzP/KeGg5jVZ8LpwQxsO4u8z
 tvy1ZrsZnXvStHL8Cn8kKF2eRl5Y1iPbB3nBaZJflQmn17n+SLcQjePKM477MN2V
 /2Scs741ApEwEP4tlVCn2sCn5fhPvFIf4xlRNUb8cyDyA+1vnUqznVNi6ljE0bYT
 jjqyw7UdC2ptM07EkDHVvL9XruHaolZ/0ftzeoXpGKJLkzyUPAlhnLNSACStlkE+
 sioIbGoiOiRwh/sF0ly6UbfsFmZjaZnxVZXdqZM+HFcBOCIpWpBuLY8kB6r8AtzA
 ==
X-ME-Sender: <xms:gJT7XxXK8PeS_T70ijl56nO4YfLYnuSuHt45tLYqhVZDgDqLFhRozg>
 <xme:gJT7XxkFZ7Boln_Bvr7NPQNYtoh2MRw7eX4DjFO04bK21Nmin7SLEMMk8N4u3P1J-
 v-xpDSeMdXCPzAI-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepleekgfffkeetjefhtdffgfevjeevvddvveegudduffduudekhffhkeev
 gfeitdffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:gJT7X9b53QI780Zg2ib2ACt_mhNMttrn0UuylXIkZ-pz3cntY1dVgg>
 <xmx:gJT7X0UQJdHv5fGTN1lSddR1vhvTZHQDkNHGraKpsJtS9QXeZ_yUaA>
 <xmx:gJT7X7mvRWuMJSkqTZTGKLHXi4I6IiqJyvdn1dgVAFdh-NwnnQLEYg>
 <xmx:gZT7Xzv_MUtTSJ6iQYP61F7aqSXAMFb257I9txqe264EJhKxTE5lnA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2D54EE00BD; Sun, 10 Jan 2021 18:57:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <d8ba7ea8-58d6-4a38-9770-5be4f050067e@www.fastmail.com>
In-Reply-To: <a25a3990-b180-9579-b934-62f4d3a53e3b@amperemail.onmicrosoft.com>
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
 <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
 <a25a3990-b180-9579-b934-62f4d3a53e3b@amperemail.onmicrosoft.com>
Date: Mon, 11 Jan 2021 10:27:31 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Thu Nguyen" <thu@amperemail.onmicrosoft.com>, openbmc@lists.ozlabs.org
Subject: Re: GPIO pin is reset to default value after release.
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



On Wed, 6 Jan 2021, at 12:44, Thu Nguyen wrote:
> On 1/6/21 08:12, Andrew Jeffery wrote:
> >
> > On Wed, 6 Jan 2021, at 02:57, Thu Nguyen wrote:
> >> Hi,
> >>
> >>
> >> Current I'm using two difference GPIO libs gpiod and gpioplus to setting
> >> GPIO pins.
> >>
> >> I can set the GPIO pin to expected value in a service. And GPIO keep
> >> unchanging when the service is running.
> >>
> >> But when the service is exited, the GPIO handler is released then GPIO
> >> is reset to default value.
> >>
> >>
> >> Do we have any gpio lib which don't reset the GPIO when the handler is
> >> released?
> > No. This is a property of the GPIO chardev interface provided by the kernel. libgpiod makes the kernel interface a bit nicer to consume in user space, but isn't where this behaviour is contracted (i.e. any use of the chardev interface might result in this behaviour, libgpiod or otherwise).
> >
> > At the moment the way to get the behaviour you desire is to keep the line handle open.
> 
> Yes, This is what I did at this moment to keep the GPIO pin unchanged.
> 
> But the GPIO pin will be locked and no service can read that GPIO pins 
> when is is locked.
> 
> >
> > The deprecated approach is to use the sysfs interface instead, but that's strongly discouraged.
> >
> > That said, your problem is something I have on my to-do list to address with upstream. I'll Cc the openbmc list whenever I get to it.
> 
> I thought about a GPIO service which will create DBus servers and Dbus 
> method to set/get/release the GPIO pins and keep that GPIO pin unchanged 
> until next setting.
> 
> That service will handle and keep the gpio line. All of others openBmc 
> services will access GPIO thru that service.

Bartosz (kernel GPIO / libgpiod maintainer) already has some half-baked code 
along these lines:

https://github.com/brgl/libgpiod/tree/topic/gpio-dbus

That said, it doesn't solve the problem of needing GPIO state to persist across 
reboots, as the moment the D-Bus daemon is killed the line state will revert.

I think it's desirable to solve it properly with some kernel trickery rather 
than using a daemon in userspace.

All this aside, Jason's approach of exposing the lines in terms of their 
purpose is also a good idea.

Andrew
