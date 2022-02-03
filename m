Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4754A907E
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 23:12:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqXwW4rx6z3bb9
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 09:12:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=L14h8rIP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=T0WkUk0w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=L14h8rIP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=T0WkUk0w; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqXw64xxvz2yMy
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 09:12:22 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C951D5C0175;
 Thu,  3 Feb 2022 17:12:20 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 17:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=2/Vymd2EILYmcIALnx9HSiNVDhaYrJdmSZcXjZ
 NdH+E=; b=L14h8rIP7CayT1aiXw3tXL/QJzImJiEpZ7XOJ+nakPqy8vgVVt5Gbx
 r98pFfe6Qj1ak2CgVW/q0GwjLEsZrqHCEvB9n8tD2rqqQRMfz7AhJY01yUuFYvzs
 8bt+ecfEvHm+cgK5RtLBMU9/x4SdNrta1evww+3p+yENItum3ezQXG2KctvNTnc/
 VXA5dw5+qtXR6aP3CmuZmhyKsCeKnOJTUZPDEuCKl5UhkSkPa4Qlt4u2Qsvt60qr
 bcyI6izoCuacQr7Q2aCHvCKIOYOZeePWF01w/LVZ6DyFg8IpIzSTX36RgQi7ONFC
 qlU457pJvyclm4nIhEBoykSP+wiONI+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2/Vymd2EILYmcIALn
 x9HSiNVDhaYrJdmSZcXjZNdH+E=; b=T0WkUk0wtzQnV1bxyHMMEaOT1h6llDPQQ
 LyYZ2X+RXBIo/zWJaLVSdQIBNFhAzeamz2Vf6bmjCKoR+eJHDyUUWgb5AwUSigan
 SKXYxXnNHlznPFrFZwWm4cbiDBplEXfYYee+8nFXl3sZ1v+Dif/Ud3EpMI8un3Vc
 2gIt86ABiReAS4zXk/4Pj3JEvuYDMPM8VL7BxupWrTxjb8zW3flgtDJ9R9WEC+ED
 dUI8o+dFKNsxiwcMHuXyWOhz8tsedS5zAQfUlnCKL3+2lB24OI6FYpIN3dIuzoku
 kU0u9jeO7Lm4ctoD+YFF4oIxJ3R3Luf/D/IaonAJ5D8hB5KE0pyDQ==
X-ME-Sender: <xms:RFP8YWwXB4iLrfJToQ1rCuU0LnoHkpjvlpdaEg0HmkMMaGbXQDhi4Q>
 <xme:RFP8YSQdltE7K4fYu43JpG_FgiarKmdPI2O8fbpozLn2maom6ptM_BQ8l2VpqYOGy
 kdO6l-T8knLqcny7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:RFP8YYUYqSeXxxRYXv7cG_eMUBC1wh137_LVcsrYfSZfSqKZDRQy5w>
 <xmx:RFP8YchahgQ_77jFHxzELSmblRxc0CkOXSzwe6PSjUjn40zU-Tl6yg>
 <xmx:RFP8YYAbaP9qt4KAtoV4iS1aE1MCXv44M5Wv3gvXHFFfUln6FDMmcg>
 <xmx:RFP8YX9Qa0JXVYOA7FTxWs9s0LR9P8aXVfTMVbARWQfK6lUfFI9-pg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8DABCAC0E99; Thu,  3 Feb 2022 17:12:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <a006b9dd-aa29-435a-870f-b58c30adc1a8@www.fastmail.com>
In-Reply-To: <585eb304-8cb5-563e-d8f9-feb5f336c50e@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-7-eajames@linux.ibm.com>
 <4bd0324e-9226-4072-8cb2-81ae305db55a@www.fastmail.com>
 <585eb304-8cb5-563e-d8f9-feb5f336c50e@linux.ibm.com>
Date: Fri, 04 Feb 2022 08:42:00 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
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



On Fri, 4 Feb 2022, at 02:31, Eddie James wrote:
> On 2/2/22 20:17, Andrew Jeffery wrote:
>>
>> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>>> Hog the GPIO pin to reset the TPM.
>>>
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>   arch/arm/dts/ast2600-rainier.dts | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
>>> index aae507b4c2..d0e82d1512 100755
>>> --- a/arch/arm/dts/ast2600-rainier.dts
>>> +++ b/arch/arm/dts/ast2600-rainier.dts
>>> @@ -108,3 +108,14 @@
>>>   	u-boot,dm-pre-reloc;
>>>   	status = "okay";
>>>   };
>>> +
>>> +&gpio0 {
>>> +	u-boot,dm-pre-reloc;
>>> +
>>> +	tpm_reset {
>>> +		u-boot,dm-pre-reloc;
>> Do we need this in the hog node? Seems like it's only necessary in controller nodes.
>
>
> Yes it is necessary, the SPL dtc compiler will cull anything without 
> that property.

Are you sure it's done at dts translation time?

My understanding is the driver model core will only instantiate drivers 
for devices with the property. This suggests all nodes are retained.

I used uclass_get_device_by_driver() in the mach-aspeed patch which 
will forcibly probe the driver.

Andrew
