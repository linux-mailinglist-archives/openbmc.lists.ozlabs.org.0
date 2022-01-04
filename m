Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 027EA484863
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 20:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT2P16fK0z2ynm
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 06:14:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=JMJfqrlo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=UWjPemOi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=JMJfqrlo; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UWjPemOi; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT2NZ4KHWz2xBT
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 06:14:22 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 4AF78320204E;
 Tue,  4 Jan 2022 14:14:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Jan 2022 14:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm1; bh=fOeXal7dd8TAFocSTJbEd04Fj8Zqgf2o7M8pabob
 QrA=; b=JMJfqrloNNJgVHiJp2zPdcY/LMkRh6ERMX4SZQG7NHka4Y1oH1Jk5pWu
 9C8xyylJ3hUSuPWk8hqbsqevTtXF7Cv5sCx6fZAzOGuTI8GzcBVpOI7MfeA+WZgI
 hrHG1vu6esQee3J0WY71n9+YH/Nzpq2WoX0pJHsekz4dmY05UMcwB2Y44VbL6wIm
 XDO3Er6kyysYj01dAYmfdrKqS/mJBrhKr8YRROSppPZaxpHcKCNHOXVhLvAc8+7S
 EXkQXO30Ay4YwFwwsJvVUBqVPGqK1/oSf9e4M4IuX51aMlom2dqWMRlwYJDwVhk6
 goqxcg5hyV3PKsL8ITRbof6VmGupDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=fOeXal7dd8TAFocSTJbEd04Fj8Zqgf2o7M8pabobQ
 rA=; b=UWjPemOiJbKBvma8mbJ7UFoDhObrsaWVfGHutplj52LCV/7K7sObdvGX8
 7Qv9POhW4cHL+WxMwoHlQDc5Vw0t6BC4vTOyNQRXetO+/ISiwWglLIMJZBQTBDDz
 ggxKxNMbD1jR1HmIdFRR7ITkvt8XE6C9TwOj4tgMMHiTh6hNLR3Mb9cdBSSnLyph
 Sg8aNcjcOdQQ3QO6xjGd9lGFYXejRhkxlWsWbSyGSt0snUUcpPjLRc/H2nHqS+jQ
 d4vsvFYNtOWH8mQXFo9zqeq07X6bqxcHUx7S+KdTgN0Eb2RFBCWI0JpzayQr1LDi
 IeoItbqr/q9Vw5sXMErMMVtj6PdEw==
X-ME-Sender: <xms:iZzUYf8AFTMeHwPOHqYUXDxDfr-RrhAIGi37K9b-JCIJHUpBA8Axug>
 <xme:iZzUYbui4POmx6TONl3c3f-IZQIbzyaEMsrYNQl-7F_SXYhCMwxfu4w7l68tFhw5K
 BSQslfIxyzXo2OtxQE>
X-ME-Received: <xmr:iZzUYdCjnc5Mv8gA8Cy4bzcTXv_YQikD8sAypG1YkTLJ6TKnYPZnU5bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeurhgr
 ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homheqnecuggftrfgrthhtvghrnhepgfetveetvdegudejkeeiheduieeuvdevffeltdff
 feduvdfgkeejtdeujeevffffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:iZzUYbcL70LT9PhYYRmZvwKLhpS4xGuNTg19y32dpogL1M-IZqw2hA>
 <xmx:iZzUYUMrRv-2ZAWt_MPmwJJMMTiGApOchG0yNDMOPwlWYbwBVVo7rA>
 <xmx:iZzUYdk5aTiql2ttkQtb8vMSXmjRUkbXpvT9tPz8ET5AZFypxIOlRA>
 <xmx:iZzUYeVqbZBPMUslHeRCcFrw5UtI8EAGpJLmbKVqnclF87W3TK50rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 14:14:17 -0500 (EST)
Date: Tue, 4 Jan 2022 14:14:15 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: openbmc gerrit, jenkins and opengrok infrastructure updates on
 Dec 28th
Message-ID: <20220104191415.hvnppuy6wrboweru@cheese>
References: <2D95E09C-F2D2-4595-98E9-4ABAB29E5FC9@gmail.com>
 <CC0ABE74-E2DB-4C5C-8E75-831C1C0D1C7C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CC0ABE74-E2DB-4C5C-8E75-831C1C0D1C7C@gmail.com>
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

On Tue, Dec 28, 2021 at 08:54:45PM -0600, Andrew Geissler wrote:
>
>
>> On Dec 16, 2021, at 11:21 AM, Andrew Geissler <geissonator@gmail.com> wrote:
>>
>> OpenBMC'ers
>>
>> I’m going to plan on doing some OpenBMC infrastructure maintenance on Dec 28, 2021. This means gerrit, jenkins, and opengrok will all be down for a certain period of time. I’m not much of a system admin so I’m not going to provide much of a time table other then I’ll do it as fast as I can :). But probably best to count on not having these services from 8-5 US central time on that day.
>>
>> I’ll post to the #infrastructure channel in discord when I start and end.
>
>Updates complete, let me know if you run into any issues via the #infrastructure channel in discord.
>
>Jenkins was updated to 2.303.3
>Gerrit was updated to 3.4.3
>OpenGrok was updated to 1.7.25

Thanks Andrew, for keeping these running and up to date!

-brad
