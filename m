Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45517139D2A
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 00:20:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xV280vglzDqLC
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 10:20:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=VI+y86u5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=vHpFEBp8; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xV1J6HCczDqLF
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 10:20:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A8B7D4F5;
 Mon, 13 Jan 2020 18:19:59 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 13 Jan 2020 18:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=RpHLrWKYe8y7MWPVF7NJmkko/ziBSpw
 b+14ZSy12/VA=; b=VI+y86u5bcxNqFhy1GJ9a1LPJ00gHFbzCaJtE1h7Yv1gHJd
 7XKuTVYeRMbbz59qxSHcvhRwuZvnF4IiaruX9QT+3q5vJ/FdAEJlvw5k0SoWdtH+
 eJ577ZwAiQSoxaj7BOKJ5Dmj0mid9UfDMWXd6TGE003j3ICOroRV73E9G9lMa3rz
 w3fsP91wL/Q3aabjIxBi+eftzAIkUKOU/e06VV2pFq5+G0Y9BtGZ6dzzu0XRagV0
 /RcYCeyTy+/182srZDO6S63gNXK/z6M3zQNSJNeLbjHRfPxBrTz11CpBL6CpxExa
 dv58zIESiaqy87zCF1oGV7GYnZ3ndwG0fklJcGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RpHLrW
 KYe8y7MWPVF7NJmkko/ziBSpwb+14ZSy12/VA=; b=vHpFEBp8cPq7t1QF/zxhLR
 OEqhN9OiaD3djuDYjWFoaZh2zLrLtsVMCsW+q6hPSDdJbR8E4obst3hr4xn0tzx0
 ZEjJQ9v+JGZFjuioaGU8ZOPowjgWoZ02GTk3pitX9fn7yQ3LmoYmG3ZKdp29FNi4
 KedOFxb5sGjucoZb6kfQNWGg1QfiMXHcOQDFDoT5eM+PbuxMKYk9RCIqAhCfLVVN
 cc4PBq/2hZyzt0Bqd7lErhQbjnHhLWAXreAMdjN+Ux9K9vXe+TKFb91zEIaIGPPC
 gLhfE083tLpTWbgLdYYD2RDYnz1KrfLgej9IyloZf3jddHr8TIMUzAm2Q9f3KJdg
 ==
X-ME-Sender: <xms:HvscXqoTG25VUL0c0KDlCpjwJyFW_2efTHr2HBz2jT22DowbqvCpxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:HvscXk8IlYOYhefn820yQgHjYdzQLE-QRGcF7j5w80ZPjwxlPk1P1A>
 <xmx:HvscXh-NviX-nU5Ud6S7MVyf6Mbd5mIE7FNhoZ0d4559YLwJsr2b9w>
 <xmx:HvscXruPExiVXf_qHyHXexR4v2mdcfj3GisbalPZKpMUR6IO73EL0g>
 <xmx:H_scXhBiyw2hU-l8kuonnztwbuRxeZt1K_zFwpCYtzX-KbrNlfP0JQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B4BCAE00A2; Mon, 13 Jan 2020 18:19:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <3800795e-a89c-40b5-a7b2-4949029286cf@www.fastmail.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
Date: Tue, 14 Jan 2020 09:52:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sharad Khetan" <sharad.khetan@intel.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>, rgrs <rgrs@protonmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 14 Jan 2020, at 03:23, Khetan, Sharad wrote:
> Hi Andrew,
> 
> On Thu, 9 Jan 2020, at 12:27, Andrew Jeffery wrote:
> > 
> > 
> > On Sat, 21 Dec 2019, at 10:45, Khetan, Sharad wrote:
> > > Hi Andrew,
> > > Sorry for late response.
> > > The plan is to have MCTP in user space. 
> > > 
> > 
> > How are you handling this then? mmap()'ing the BAR from sysfs?
> 
> >Sorry, let me put my brain back in, I was thinking of the wrong side of the  BMC/Host MCTP channel. How much were you planning to do in userspace on the BMC? As in, are you planning to drive the BMC's PCIe MCTP controller from userspace (presumably via /dev/mem)?
> 
>  
> For implementation on the BMC, we agree that it's better to do it in 
> kernel (and as you mentioned  - use consistent interface to upper 
> layers, provide another transport). However, given the time needed to 
> implement things in kernel (and the review after), we are starting with 
> a short term solution. We will be implementing MCTP (protocol elements) 
> in user space, along with a low level MCTP PCIe driver just to push 
> bits on PCIe. Iwona is working on this and should be able to describe 
> the exact primitive.

Alright, great, I'll keep you posted on the kernel-side progress.

Andrew
