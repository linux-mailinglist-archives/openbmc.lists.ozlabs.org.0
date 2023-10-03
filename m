Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D77B6282
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 09:31:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YfWNxqdZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rYGAKl+a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S08dM5l0Rz3ccQ
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:31:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=YfWNxqdZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rYGAKl+a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 448 seconds by postgrey-1.37 at boromir; Tue, 03 Oct 2023 18:30:49 AEDT
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S08cn1Tlxz2yVl
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 18:30:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 97BC55801BC;
	Tue,  3 Oct 2023 03:23:18 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Tue, 03 Oct 2023 03:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1696317798; x=1696324998; bh=FB
	NoJn7AO+0RF4pMfQLchcmc4tGsm8rfO7xGbY+S0Rg=; b=YfWNxqdZbkMDRfT2pN
	aP9ZdFgV/PhnUDdcIzqcFNMs9Ohj9BRGrJ5rTW/11qcH1XY2EyAYWrAlZhq1ip5i
	6vQhyR1Jl8cE1JtXWBFViEuvY8EwwkgWgOo5gumWb7cpWKvh+DVfgibo7AS4um4J
	g++GTdn1pv4EKJd8pjRzX/cZ1TM0TLhq2gvkjxB5DbEPZq01T/EU1nMDnw8pgiPJ
	RXGzWC1w6a+sRE/5zLCH3ABDgvf+HSawQ/wr6F3qZDMHpAskRUnKAvc/uofBjEOK
	dYcEb57Q4kulZpPIaqa690uY9/YFAmAMBdPyHc0kI+hjQReB+LS1q/e1tOikJnZJ
	ImQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696317798; x=1696324998; bh=FBNoJn7AO+0RF
	4pMfQLchcmc4tGsm8rfO7xGbY+S0Rg=; b=rYGAKl+ah5bkYCSUdgBSlEPNRmN3o
	GYOHMi1vF2XXDnWMUHV1eZ8k/7zDqOmzWoG51bkQ2W5Yf3Q7++3kMtnSBVryqg5V
	uOXwRjmAMCLXlCFHh/W9RgyH0SDkendigf1n0mTg2mL1zw1VhbROn2F6Xp3FOm0n
	7juBU/3dZIksZjIRsENxsw41PgKywf5zdTRuSnBu9V9NB8/tIIdsR/rRMe4ZzfA+
	mccAzQcHW5/yHl0d5YJmr88/cTwOqrETJDgHM2/h3djH2cpyI1XLxN/7Fy9Ow85x
	BgWXv8J9WuDTKDM4lErgYUg7Og8YGA8lxtyUReovslfJkNWc54WPtzg/g==
X-ME-Sender: <xms:ZsEbZQDBZDuJgxVMipqwASBeVRTdc7sAtICyeF7AZUR4LHHYmrI5OQ>
    <xme:ZsEbZShJQgN0WquvZX9i79xygt5kvFCsIPa6uVBr9x9wFkL5yGQky_vJU0renSvaC
    6fE8OGqnNDNvGy0xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfeehgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhepvdevvdeiueetheeiffdthfejvedvteffvefghffhueduffehvdekfeev
    ieeujeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ZsEbZTluMwmBanalFVR9Es_hYG-m0yKxiWo-9no_P9Wz95ReykreTg>
    <xmx:ZsEbZWyQXG-D9tG2Hq4qLl-qfmqFQi20_kONolqa5rr9y2z4TTaDEA>
    <xmx:ZsEbZVRK_pvaJI0_AcC7xXJiKogcdf-j4C0L6d7LnzGy3rcUPmeZow>
    <xmx:ZsEbZWLdOdHexW-OiqofN5B-5_yQSHK9LLTs12xIdoVmo4SZnvrurQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 054F51700089; Tue,  3 Oct 2023 03:23:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <1fd97872-446e-42f3-84ad-6e490d63e12d@app.fastmail.com>
In-Reply-To: <20230929120835.0000108e@Huawei.com>
References: <20230928123009.2913-1-aladyshev22@gmail.com>
 <20230928123009.2913-4-aladyshev22@gmail.com>
 <20230929120835.0000108e@Huawei.com>
Date: Tue, 03 Oct 2023 17:52:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jonathan Cameron" <Jonathan.Cameron@Huawei.com>,
 "Konstantin Aladyshev" <aladyshev22@gmail.com>
Subject: Re: [PATCH 3/3] mctp: Add MCTP-over-KCS transport binding
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
Cc: linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>, David Miller <davem@davemloft.net>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Jeremy Kerr <jk@codeconstruct.com.au>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Eric Dumazet <edumazet@google.com>, Joel Stanley <joel@jms.id.au>, netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Fri, 29 Sep 2023, at 20:38, Jonathan Cameron wrote:
> On Thu, 28 Sep 2023 15:30:09 +0300
> Konstantin Aladyshev <aladyshev22@gmail.com> wrote:
>
>> This change adds a MCTP KCS transport binding, as defined by the DMTF
>> specificiation DSP0254 - "MCTP KCS Transport Binding".
>> A MCTP protocol network device is created for each KCS channel found in
>> the system.
>> The interrupt code for the KCS state machine is based on the current
>> IPMI KCS driver.
>> 
>> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
>
> Drive by review as I was curious and might as well comment whilst reading.
> Some comments seem to equally apply to other kcs drivers so maybe I'm
> missing something...
>

I doubt you're missing anything. I reworked the KCS stuff a while back to make it a bit more general. Prior to Konstantin's work here the subsystem lived in its own little dark corner and might have benefitted from broader review. Some of the concerns with Konstantin's work are likely concerns with what I'd done, which he probably used as a guide. For reference the rework series is here:

https://lore.kernel.org/all/20210608104757.582199-1-andrew@aj.id.au/

>> +
>> +static DEFINE_SPINLOCK(kcs_bmc_mctp_instances_lock);
>> +static LIST_HEAD(kcs_bmc_mctp_instances);
> As mentioned below, this seems to be only used to find some data again
> in remove. Lots of cleaner ways to do that than a list in the driver.
> I'd explore the alternatives.

Yeah, it's a little clumsy. I'll look into better ways to address the problem.

> 
>> +	if (!ndev) {
>> +		dev_err(kcs_bmc->dev,
>> +			"alloc_netdev failed for KCS channel %d\n",
>> +			kcs_bmc->channel);
> No idea if the kcs subsystem handles deferred probing right, but in general
> anything called just in 'probe' routines can use dev_err_probe() to pretty
> print errors and also register any deferred cases with the logging stuff that
> lets you find out why they were deferred.

Let me see if there's work to do in the KCS subsystem to deal with deferred probing. I expect that there is.

>
>
>> +	if (rc)
>> +		goto free_netdev;
>> +
>> +	spin_lock_irq(&kcs_bmc_mctp_instances_lock);
>> +	list_add(&mkcs->entry, &kcs_bmc_mctp_instances);
>
> Add a callback and devm_add_action_or_reset() to unwind this as well.

I'll check the other KCS users as well.

>
>
>
>> +	devm_kfree(kcs_bmc->dev, mkcs->data_in);
>> +	devm_kfree(kcs_bmc->dev, mkcs->data_out);
>
> Alarm bells occur whenever an explicit devm_kfree turns up in
> except in complex corner cases. Please look at how devm based
> resource management works. These should not be here.

Ah, I think this was an oversight in how I reworked the drivers a while back. I changed the arrangement of the structures but retained the devm_* approach to resource management. Let me page the KCS stuff back in so I can clean that up.

>
> Also, remove_device should either do things in the opposite order
> to add_device, or it should have comments saying why not!

+1

>
>
>> +	return 0;
>> +}
>> +
>> +static const struct kcs_bmc_driver_ops kcs_bmc_mctp_driver_ops = {
>> +	.add_device = kcs_bmc_mctp_add_device,
>> +	.remove_device = kcs_bmc_mctp_remove_device,
>> +};
>> +
>> +static struct kcs_bmc_driver kcs_bmc_mctp_driver = {
>> +	.ops = &kcs_bmc_mctp_driver_ops,
>> +};
>> +
>> +static int __init mctp_kcs_init(void)
>> +{
>> +	kcs_bmc_register_driver(&kcs_bmc_mctp_driver);
>> +	return 0;
>> +}
>> +
>> +static void __exit mctp_kcs_exit(void)
>> +{
>> +	kcs_bmc_unregister_driver(&kcs_bmc_mctp_driver);
>> +}
>
> Hmm. So kcs is a very small subsystem hence no one has done the usual
> module_kcs_driver() wrapper (see something like module_i2c_driver)
> for an example. 

I'll probably deal with this in the course of the rest of the poking around.

Thanks for the drive-by comments!

Andrew
