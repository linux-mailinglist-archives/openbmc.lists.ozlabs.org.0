Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 983F21CB1AE
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 16:24:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JXfD5xJMzDr9P
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 00:24:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=preossec.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=lee@preossec.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=preossec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=preossec.com header.i=@preossec.com header.a=rsa-sha256
 header.s=mesmtp header.b=xLN4pjbF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NCN61M7M; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JXT13wDkzDr8L
 for <openbmc@lists.ozlabs.org>; Sat,  9 May 2020 00:16:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E3E15C00A2;
 Fri,  8 May 2020 10:16:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 May 2020 10:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=preossec.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
 bh=Aeenli4bfQ0zAbewbyJvrj3cek68sAzXoAur9UIPo4I=; b=xLN4pjbFpT+Y
 iTy4FWf8T9Wvf/HJTEOATVfc94WXZ/i04PKQxGLX3V/rvaPqcD6QbmSA7DJTJn+7
 Rx8yvza+X6Plt0DXGgMU2BIQ/aYAxeNeNbf/ObkpvcwLsb2f7/MVtOcjqziYvcOG
 JuvhhhPe2TSz819hHsEY/k+TCG6eUVQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Aeenli4bfQ0zAbewbyJvrj3cek68sAzXoAur9UIPo
 4I=; b=NCN61M7M88oMfSVfikcToAqucziNmI6OMkSXMZOCGVccMT7YhnzAllBMv
 RKBIByAN8lYUSOxhBptGyvgCbIah10L4V1SFYPigaI1vDtPQO2NjES1kRX0iM6iw
 +yd5X9oEzo3j9rK7iWUAn287km0Ci8Q3n4eC7THFQRGF62KqO23aUSRB+1/4HTLu
 uMj2LmuIqhcgnlK8d2cbfVl0tAjT/Yhcgp4o977Qbl3fn5+SXPVxx9vRHifd1cMc
 1WuTbOfrJGPdGHOJFfTVV5CSJNmCMRetyxCeqcRDBk90VsSBDe5cBFMq8W3C3JDJ
 Jw7eNgSpZyIirlzrTWUmcENXsPadw==
X-ME-Sender: <xms:yGm1Xqz_d3hI67STa3tIrWbfFrFlttiT7hiEVQckGP25w0roge-6aA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkeefgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepuffvfh
 fhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepnfgvvgcuhfhishhhvghruceo
 lhgvvgesphhrvghoshhsvggtrdgtohhmqeenucggtffrrghtthgvrhhnpeeiheetjeetvd
 eigfejvdehvdeugefhtdeludefffettdekheeugeduledtffeujeenucffohhmrghinhep
 ohhpvghnsghmtgdqphhrohhjvggtthdrgiihiidplhhinhhugihfohhunhgurghtihhonh
 drohhrghenucfkphephedtrdduvdehrdefrddvfeeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheplhgvvgesphhrvghoshhsvggtrdgtohhm
X-ME-Proxy: <xmx:yGm1XjCOwZPVhcWxSni0G4f7iW_2npm-xV-lIbO_7-NsLtWD5fG_cw>
 <xmx:yGm1Xr50iksliGjxF1aKE7TBIhHG6EP21nw-uucQ2WiYh4Vw072gMQ>
 <xmx:yGm1XpLDYsVHOQTzNDAtoaBtepQFk52pXDXbCc3HFv6oMoMbODNgiQ>
 <xmx:yGm1XtdEnx3txE8GVw5X9MGUlz0i84x80nRngYUQe9pqKCS7WJzyfg>
Received: from [192.168.1.100] (unknown [50.125.3.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id CB8E03280065;
 Fri,  8 May 2020 10:16:39 -0400 (EDT)
Subject: Re: Update tools (fwupd, swupdate, ...)
To: openbmc@lists.ozlabs.org
References: <703ee8c0b9265cdae7fa7fc2583be04e@linux.vnet.ibm.com>
 <cc83fa1c-1133-4357-ac04-31068c2ce859@www.fastmail.com>
From: Lee Fisher <lee@preossec.com>
Message-ID: <b9642f30-158e-cc13-38ce-d55392f938cb@preossec.com>
Date: Fri, 8 May 2020 07:16:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cc83fa1c-1133-4357-ac04-31068c2ce859@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

On 5/7/20 9:16 PM, Andrew Jeffery wrote:

> On Fri, 8 May 2020, at 03:33, Adriana Kobylak wrote:
>> Doing some exploration on firmware update tools for openbmc.
>>
>> Vikram mentioned that Intel would be looking at implementing fwupd 
>> (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27576/).
> I don't have anything of substance to add, but +100 for adding fwupd
> support!

+100 also.

These days, you should not buy a Linux system if it isn't supported by
FWupd.

FWUpd is now a Linux Foundation project.

https://www.linuxfoundation.org/blog/2019/03/lvfs-project-announcement/

Fwupd is to Linux as Windows Update is to Windows, the main method for
updating firmware.

If OpenBMC doesn't support FWUpd they'll need to duplicate most of the
infra that FWUpd has.

Having OpenBMC support FWupd would be a very good security feature.

