Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02845906D
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 15:42:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyVP33b5Bz2ynk
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 01:42:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=NJN+Id+A;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XgE5lVSb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=NJN+Id+A; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XgE5lVSb; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyVNc1RPKz2xtc
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 01:42:23 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D4A2D3201C48;
 Mon, 22 Nov 2021 09:42:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 22 Nov 2021 09:42:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm3; bh=HrVLrTrijrrIMIX2xlFEYxNKwpvNPo2aiJWIdNho
 LCU=; b=NJN+Id+A5tUp6RhfRhJTIjNVG0jN71ppumH6rIOjkV+BlRPmgioVOVmd
 yq5079L7JLrGZysR/qHkMpwKpLtI8QoR9/YTStKEWncp0KslE6AtgdLqf+3LzuO1
 SnwfVNUo0DJ2tZRi1uCkzaIkaV1NL00DXfZCo883pQVgXWummKGMDhfFMJuO0Vfs
 qvQu8NGzMD4VjivDoQf+vECBJSyFT1ksXCVmb1CqA9v+B2x7trZhe3T5nnDb26Qw
 ZtiHKNYVSJr8uc8CFRAicfQmqTpfk6PGM+JGamm81FD1h/ft73vMOISEU+Qzmasn
 rrtMi7R/PTjzbdMh/o0WTu39k8++Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=HrVLrTrijrrIMIX2xlFEYxNKwpvNPo2aiJWIdNhoL
 CU=; b=XgE5lVSbQZ7QP0sFA9+KCCiAICmgr9zSJf9qJiQFYW3Z/QVkpgJ4cXNn6
 iqMXezQ0vBOTKIbfpvXAgDmLqEhfcfAUFKum2RNTSz1uSQHFzNRldRxf9GyZ57Mu
 ykrvEbPJbw28IZMzYDKGpXlWiVquMcRTFhTLlIqK+8TlcYR8ddf7E9py6V1NI5rG
 7guygm/76CmRFVofoBpTMLv8WhJoZ5xnkijAYJLGXkYixfcma3VzCGlVIzoe9bIN
 T49tIXWNAA/U3uSYm6huVrhOiZqAqq0GOuocYmzD0H9rClOCsXeq2tMePBMsY7YH
 6VtBzMBy8iHrV38QwRcW28gcGMYTg==
X-ME-Sender: <xms:S6ybYaX7agHGU-qJWbseAeFuW_C-AqWJjlHrrUu_1vPUknL1I0ZAmQ>
 <xme:S6ybYWl_tRK8BYMS2pwzZFliqmye3U7VGOnfsG8KaObqUVFPwH_QW34CqYWq34Xoy
 Upf4cylB79ebI5p1Og>
X-ME-Received: <xmr:S6ybYebt64Hz4nXBGxveEavzrrRneeCl7HsSZoMPKxjwuQHMuitFK4Ly>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepgfetveetvdegudejkeeiheduieeuvdevffeltdfffedu
 vdfgkeejtdeujeevffffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:S6ybYRVbHFJA86L1mFbIN7IqsPRWyd26kEKXyldMCnqLqLCPE4ivAA>
 <xmx:S6ybYUlqh9lbi1MsfGEml3qwSOrkpf2tvv32dw4kqhN3sv9ZLTnrgA>
 <xmx:S6ybYWdzWBKmFVEVpA-K--u8pXSi3WMYJe6y5erOU7J7X3uFfez0aA>
 <xmx:S6ybYQvUmYLFCBihkTb-s8ZEzXQT8ag7LAXmW-JRvFFAdiaVbD1A5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 09:42:18 -0500 (EST)
Date: Mon, 22 Nov 2021 09:42:17 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Buddy Huang =?utf-8?B?KOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>
Subject: Re: Quanta's CCLA Schedule A update 2021-11-12
Message-ID: <20211122144217.hqbmgjgm442ydlpw@cheese>
References: <HK0PR04MB25631E61E0E742D187EACCC69D969@HK0PR04MB2563.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK0PR04MB25631E61E0E742D187EACCC69D969@HK0PR04MB2563.apcprd04.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Cosmo Chou =?utf-8?B?KOWRqOalt+WfuSk=?= <Cosmo.Chou@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Nov 13, 2021 at 01:19:12AM +0000, Buddy Huang (黃天鴻) wrote:
>Hi team,
>
>Please find the attached file for updated Schedule A of CCLA from Quanta.
>
>
>Sincerely,
>Buddy

Hi Buddy

Sched A updated, thanks!

-brad
