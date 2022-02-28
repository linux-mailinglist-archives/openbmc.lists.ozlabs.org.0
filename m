Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5B24C7DA5
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 23:43:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6wQ81Y7Wz3bmW
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 09:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=N1tfI6Iv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nLqzwZ8+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=N1tfI6Iv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nLqzwZ8+; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6wPd6PYcz3bYF
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 09:42:45 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7ED285C00F2;
 Mon, 28 Feb 2022 17:42:42 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Mon, 28 Feb 2022 17:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=QViDf3z30mujntdg1/FwKoG/0YZmwGW/qvst0X
 vgBoM=; b=N1tfI6IvTL/2r8JGRYHAN5W5znpAPBw1mEN3EUJ/ObmU9yAaDqGVV2
 66QlnfK7qYtrz0iurVXp1dPQrPNakN1D61SIeKdGdfaXtAO0p7H5GiNUMxxDlhDU
 f6I+OXRkFta+zQgmH/i7tvu7HyUMrfETjS/aayyEQF8DoWwk5Hro/gcE4e5F04gK
 X0P4qdyRmTxuq7B08uzuCOtE+BK5P7tzGQGtFOAeqvutrMV33Gl331ZtxZIYg7BA
 DgJdGCycrT46pbKDrl1GptpPvGcEvXcUb2nE68bMBZgFwbncfBJdqQd8KLzN4OEb
 hSmcbxLrYp3lTNe+QzRYNc73WTvGHYZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QViDf3z30mujntdg1
 /FwKoG/0YZmwGW/qvst0XvgBoM=; b=nLqzwZ8+0nBXSaT1OdRFtHbTTDpZnw9J9
 ZAcl+i2uCyGVjIQK12jH5kATHA/RlNp6wQmMJcB1NI8GKGqclS4yd6mY8nnayjni
 6kJ9dW3FmDKj8bwsT9oBQVE1lCj2nWfKC2vDtKQmXETzy7ZE2FlZBa3Z6ZKj+1h6
 0ckXCLBGRdXTwkvBXC4JruqiOHFx/ECC18cOQvQdyRGzSdtjgK9DpHR9DFvYu+Em
 ADmfmx8BsOc+Oso2mMzjqJ/0LsHhY+q6X0+0BCs8jBKG639Bl6thJ822zqcpznOw
 wIxym0WYzL2c4R7pxGOnKDD3ZMiPBAPnWBEdGhk23fzapnn5NS2dg==
X-ME-Sender: <xms:4U8dYm6Eiu2Zs67LOv-Hukkykr0l7_IMKbHlKMgDX392EDV6GUzIDw>
 <xme:4U8dYv5SU1iHhd64dfEE3ej686LtnAxR_6O1DodTtoiU5p7WkSixbLsoU-a2SBc70
 Q7wvqIltwFEoLO6gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfek
 fefhfeekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:4U8dYlfikjWo_IuPjMm0pBnRNM8FN2C-ymB8CVEb6Zue3Lm_kQsMiQ>
 <xmx:4U8dYjL1-yW1vHCoKK_4wVPLjQZlSDAD8vPCrPPBRUl1kadfCuo-pg>
 <xmx:4U8dYqIW7izmf0jDPLK3Q5HyXSOlnpmp6YGSr7K0KSz_Z2Pn7ABicQ>
 <xmx:4k8dYsj_-Yi2uzPCYvZPdoaE6PaqEImqrZmHzL0BJ_gUYuPIKle4BQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DB7E8F6007E; Mon, 28 Feb 2022 17:42:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <f55a6b27-00a9-45eb-8162-639370fc6902@www.fastmail.com>
In-Reply-To: <e3e8d6a8-43ee-d0f5-d5dc-babcad5147ef@gmail.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
 <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
 <e4b7fc2b-511a-46f0-8a6f-001c16ebe712@www.fastmail.com>
 <483b87d6-a9aa-4f64-9bb5-04874312a97b@www.fastmail.com>
 <e3e8d6a8-43ee-d0f5-d5dc-babcad5147ef@gmail.com>
Date: Tue, 01 Mar 2022 09:12:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alex G." <mr.nuke.me@gmail.com>,
 "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
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
Cc: U-Boot-Denx <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Simon Glass <sjg@chromium.org>,
 Christopher J Engel <cjengel@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 1 Mar 2022, at 08:42, Alex G. wrote:
> On 2/27/22 19:29, Andrew Jeffery wrote:
>> 
>> 
>> On Tue, 15 Feb 2022, at 13:55, Andrew Jeffery wrote:
>>> On Tue, 15 Feb 2022, at 13:42, Dhananjay Phadke wrote:
>>>> On 2/14/2022 3:13 PM, Patrick Williams wrote:
>>>>> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>>>>>> There's a key-requirement policy already implemented [1].
>>>>>>
>>>>>> [1]
>>>>>> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/
>>>>>>
>>>>>> Board code can patch "required-policy" = none at runtime based
>>>>>> appropriate logic.
>>>>>>
>>>>
>>>> [...]
>>>>
>>>>>
>>>>> Isn't this jumper proposal just like the TCG Physical Presence requirements?
>>>>> This is a software implementation and requires a particular hardware design for
>>>>> it to be done right, but it seems to be along the same lines.
>>>>
>>>> I'm supporting idea of having control on FIT verification, just pointed
>>>> that it maybe done by board code by just patching U-Boot control FDT,
>>>> either the "required-policy" property at /signature or "required"
>>>> property in individual key nodes.
>>>
>>> This might separate the logic out in a way that's acceptable to Alex.
>>>
>>> Let me poke at it.
>> 
>> I've thought about this some more and adding support for
>> `required-mode = "none";` or similar seems like a massive footgun given
>> that (as I understand it) the FIT image as a whole isn't verified. Only
>> supporting "all" or "any" seems okay because some verification must
>> succeed in the context of the keys available in the current stage.
>> 
>> After some internal discussion this effort has been set aside so I'm not
>> going to pursue it further for the moment. I don't think it's easy to
>> proceed anyway without feedback from Alex.
>
> Don't let my thoughts stop you. I don't think there is a perfect way to 
> address this situation, and we don't have to. Code can be changed later.
>
> As a general preference, I would like to see a single decision point on 
> whether to verify/skip. It can be changing `required-mode = "none", or 
> any other similar solution. Keep in mind that the FIT is the image 
> you're trying to authenticate. It is completely different from 
> "required-mode", which is part of u-boot's or SPL's embedded dtb.

Ah yes, I wasn't thinking of it that way, so maybe it could work. I'll 
consider it all again, but we also determined that we could get away 
without this functionality for now anyway.

Andrew
