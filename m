Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5A487998
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 16:16:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVmym1B2Vz3bPD
	for <lists+openbmc@lfdr.de>; Sat,  8 Jan 2022 02:16:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=JE1RjsfW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=cZmfok4w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=JE1RjsfW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cZmfok4w; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVmyC412Xz30MG
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jan 2022 02:16:02 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E73FE5C00D2;
 Fri,  7 Jan 2022 10:15:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 07 Jan 2022 10:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=/4Moo3uLsjLcmzgqGmDjQjZf8q
 c4Ekw603L+U0SgOD0=; b=JE1RjsfWIz0WWCw0TwY1RYTTvQ83WBU0hqpVIk3BfH
 OXSSP/JtHDBgdTYIiMfsL/qaohYw4NxRNb33QILsjutUWNwG2ZNsl1UbHajCJOGK
 LEKi8Xh00r1DaWfKW31xNqNCmDC/FfVNrJKe+y+m3nktVQmXJv3lRnnHcRT6Axuq
 NP3gyRkAjsVlKw47Oexkh/aYkshdN2fzMknMHdd5biIyAWDm5lXWZKCfxlr2elEv
 5Dtwu7aGB5Xf7siCIsBrs1dZg5j0xh8ZK0uj1ZCecYNf+kMr8LccptDIyh2Wk3uS
 o/E3HTgv90MD/Ew9Doz4xUh2ZjwryDHrXeCQnEMjpAHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/4Moo3uLsjLcmzgqGmDjQjZf8qc4Ekw603L+U0SgO
 D0=; b=cZmfok4wLTzTekXbXkW/nbQrUzhJ6M1eOiE/dKtrq+kCQUHQI7d0WfKsc
 JDewVMDUvPn65mhX7ItS10KJcqQRI62YJyMkVF0ilGXF914IowI883arWco35n4r
 QwS0WaFJdaL9wx2ubHDFUZE1N+RU7jJEqRaKrm+vyAJQhYW+1/OolzlfIzOZvFaQ
 TPn1Q9UHSPrWk7El9yfO4vFK6IlBSYYl7vVmhLQDlf7AtAJzPkfdPVwQ5mhMP8uU
 MXocdgStm5kx7/NazDn6iZkujt7FrsfICyxfZOsaS3Ztcgm3dik6SEKmgnPN8mcU
 4tzufIruaDhVOWJqNoGttB9xP0uAg==
X-ME-Sender: <xms:LVnYYT7p8MpfAuGvGgIuikQmpkYaDDPQe-3W-b5IjNOMAv-OjpQrVA>
 <xme:LVnYYY4fP-tLEf4eRbNctSOfNnLMxCU_87SiYNkeY7iLUknVDVLcEEAqQM6qPipdb
 6vgFHmtD-veP56PgYc>
X-ME-Received: <xmr:LVnYYadbghIOKS9tE19QU1gW7NeRcrbw4D5IE9eiq1CMt3MjPlJdHKZ1PQNCnOHToDT3YSLBHiF94miXRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegvddghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
 ertddtreejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudejfeetke
 egiefggeettdfgjeelleeutdehhfethfetudefkeeuieeifeefgfetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuh
 iiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:LVnYYUJ8sJShE-UC5HG2mJ2-OEmXeUMxZWTXcNpULsDaxraTB6VkyQ>
 <xmx:LVnYYXL44-NRGpexbZTAsba-4wnJGHLCNrfHabb7JjeAimMXXLGVqA>
 <xmx:LVnYYdzQRT92k0gcOW_K74UqEIFrHjnE00086k6BkcEL3tgsU-D6Sw>
 <xmx:LVnYYZymKnqSPqs7ZaEIyJFjf_nuySs-Iq8c6obsjswCAdAASjWCxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jan 2022 10:15:57 -0500 (EST)
Message-ID: <c83418a2f4768d3015767e54ec99309a3f5b2718.camel@fuzziesquirrel.com>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E8=A6=86=3A?= removal of company specific,
 general-developers teams
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: _ Syan <chyishian.jiang@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Fri, 07 Jan 2022 10:15:56 -0500
In-Reply-To: <6FC1B644-6DBE-43A0-950E-1FB386EF5B84@hxcore.ol>
References: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
 <6FC1B644-6DBE-43A0-950E-1FB386EF5B84@hxcore.ol>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2022-01-06 at 21:31 +0800, _ Syan wrote:

> In my view, the initial requirement is that the Github team members
> could trigger Jenkins CI workflow.
> 
> Now, permission seems to change to Gerrit group members instead of
> Github team members.

That is correct - this was the original use case of the Github teams.  I
just wanted to make sure they aren't being used for any other purpose.

thx - brad
