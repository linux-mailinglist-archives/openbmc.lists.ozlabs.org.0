Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827D138DA3
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 10:22:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x7QL0VStzDqMp
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 20:22:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.40.29; helo=14.mo4.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4667 seconds by postgrey-1.36 at bilbo;
 Mon, 13 Jan 2020 20:21:04 AEDT
Received: from 14.mo4.mail-out.ovh.net (14.mo4.mail-out.ovh.net [46.105.40.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x7PD6FR6zDqBj
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 20:21:00 +1100 (AEDT)
Received: from player695.ha.ovh.net (unknown [10.108.35.122])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4CD1721E406
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 09:03:04 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player695.ha.ovh.net (Postfix) with ESMTPSA id D0D42E03D04E;
 Mon, 13 Jan 2020 08:02:58 +0000 (UTC)
Subject: Re: Aspeed SPI driver upstreaming
To: Patrick Williams <patrick@stwcx.xyz>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
 <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b851479c-865e-74a2-bdae-23f065dd1867@kaod.org>
Date: Mon, 13 Jan 2020 09:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2609554511338900435
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehsphhinhhitghsrdhnvghtnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/9/20 5:43 PM, Patrick Williams wrote:
> Thanks for the reply Cédric.
> 
> On Tue, Jan 07, 2020 at 09:34:03AM +0100, Cédric Le Goater wrote:
>> Regarding the SMC driver, the maintainers are requesting a rewrite 
>> of the driver using the spimem layer, but we lack handlers to do 
>> the read training and compute the timing register value.
>>
>> This is the first thing to address on the todo list. When available,
>> it shouldn't take too long to upstream the driver. Some more info 
>> here :
>>
>>    https://www.spinics.net/lists/linux-mtd/msg09417.html
>>
> 
> It looks like this patch set is still the MTD-only implementation, which
> is useful for SPI-NOR chips but not useful for non-flash devices such as
> TPMs.  Is there any work or thought into how we could do a generic SPI
> controller and then layer the MTD above it?

Not on my side. I always worked with flash support in mind.

> We have some system designs where we have both a NOR device and a TPM on
> the same SPI bus.  What we're currently doing is using the
> (non-upstream) aspeed-spi driver which lets us use both the TPM and
> MTD/SPI-NOR driver, but since it doesn't have the calibration routines
> the SPI-NOR runs at a slower speed than optimal.
> 
> I'd really like to get a generic SPI controller driver upstreamed, even if it
> doesn't have the calibration (the SPI-NOR device in this case is not as
> performance critical as the BMC's own NOR devices).  Is there any path
> to combining the features of the aspeed-smc and aspeed-spi into a single
> driver, or do you think we should start with them as separate and get
> aspeed-spi upstreamed as an alternative to aspeed-smc?

Yes, we should and this is requested by the MTD community which wants
to deprecate SPI-NOR.

> Also, do you have any soft timeline on the follow-ups to this patch set?

AST2600 was done on my spare time this year. I have been working on the 
other side of the system (PowerPC XIVE) these last two/three years and 
should continue to do so.

If a new Aspeed flash driver should emerge, I think some else should take 
ownership. It will be better for maintenance

Cheers,

C.
 

