Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867917AA7DD
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 06:33:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=R+K7lrPy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsKCT2VkPz3ccP
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 14:33:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=R+K7lrPy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 10621 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 14:33:06 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsKBp4DWyz3byP;
	Fri, 22 Sep 2023 14:33:06 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7504A71B;
	Thu, 21 Sep 2023 21:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1695357184;
	bh=8YhJXVZbP6dpiyW7g8fmW82LVz5b6CyHIGSx77XYF/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+K7lrPyYUJBRH6oCed7c7Uh3zR6NY2mxFM8Jzu3HDl0p58goA/QDt3biPMGB5JtD
	 Uh7UbkX66lCSsd3zUVDwcRhpuXJ/LLTlXKEoLMMwBJ00M0u1CqngDB+Vz1PpDjEbTY
	 Hd+28RTTMeDZkSeVpVLJc+mYhfZYLQjF5ifG+FEY=
Date: Thu, 21 Sep 2023 21:33:03 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] watchdog: aspeed: Add sysfs attributes for reset mask
 bits
Message-ID: <06a2428d-e1f3-4ecd-bd42-f3e25ffdbced@hatter.bewilderbeest.net>
References: <20230922013542.29136-2-zev@bewilderbeest.net>
 <91be26169ebbddf3c05cd19626478246cb72a72a.camel@codeconstruct.com.au>
 <85ddf493-934f-75c4-7a3a-728289c1ee09@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <85ddf493-934f-75c4-7a3a-728289c1ee09@roeck-us.net>
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
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Joel Stanley <joel@jms.id.au>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 09:24:40PM PDT, Guenter Roeck wrote:
>On 9/21/23 21:16, Andrew Jeffery wrote:
>>On Thu, 2023-09-21 at 18:35 -0700, Zev Weiss wrote:
>>>The AST2500 and AST2600 watchdog timers provide the ability to control
>>>which devices are reset by the watchdog timer via a reset mask
>>>resgister.  Previously the driver ignored that register, leaving
>>>whatever configuration it found at boot and offering no way of
>>>altering its settings.  Add a 'reset_ctrl' sysfs subdirectory with a
>>>file per bit so that userspace can determine which devices the reset
>>>is applied to.
>>>
>>>Note that not all bits in the hardware register are exposed -- in
>>>particular, the ARM CPU and SOC/misc reset bits are left hidden since
>>>clearing them can render the system unable to reboot.
>>>
>>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>>---
>>>
>>>I'm porting OpenBMC to a platform that requires that the LPC controller remain
>>>un-reset by a BMC reboot.  With this patch userspace can control the reset
>>>mask of the Aspeed watchdog timer, with a few bits remaining unexposed so as
>>>to prevent some almost-certainly undesirable situations.  If there are other
>>>bits that people feel shouldn't be exposed (or conversely if someone feels
>>>strongly that the "dangerous" bits _should_ be exposed) I can adjust
>>>accordingly.
>>
>>
>>Is there a reason this has to be managed by userspace? It sounds a lot
>>like a property of platform design, in which case exposing this feature
>>in the devicetree might be a better approach.
>>
>
>Same sentiment here.
>
>Guenter
>
>

Yes, and indeed the same thing occurred to me, too, though unfortunately 
not until just *after* I sent the patch...I'll rework it as a DT thing 
instead.

Thanks,
Zev

