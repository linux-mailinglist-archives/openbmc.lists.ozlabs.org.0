Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1033325A6BB
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:27:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhFrX2PFyzDqd0
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:27:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=cHRYYSGK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=uOueACqG; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhFqm2LQhzDq9y
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 17:26:44 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EB6C95C0191
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 03:26:41 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 02 Sep 2020 03:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=v0PcbAaKCadDwraM6auTAjJzchaVHsk
 5f3VPZNsE7W0=; b=cHRYYSGKbc1oyW6oVVVjVsi685FF1igLX+0O7UJViWW5Can
 r6sW7ydTWLVnyqVQyoi5XW3nCnvwtlnrtP+wg7B3qSTjLrIKF6x5jmATMfTzCTd8
 5A4tz9iC/l6mH1pRRysgcDxtgK9j/QViimRyVGxRRJXIfSCsaaeRHROXoqTZGmHy
 Jl0TXGPNiI+XPTXiTsgoH5UNayXAtMM9Dhb/ot9122QenepCH6EiONSkIrlMWnNg
 pvASVtHeejaUB/DTSpv0v7kSlnBRyjjNdS3yyApP+2R97bgNiMjcAcLwblwwTtem
 iRVUDpH+vtfjk0gzID8RVPjpNvA/nMzy3oa5NAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=v0PcbA
 aKCadDwraM6auTAjJzchaVHsk5f3VPZNsE7W0=; b=uOueACqGy9GijK17EjiVK+
 qm5BE1m8wgDTnTVnnZ3HY+wIXGErdy3FlenUOfByox4SKchWqJyYCcEqMJMsFeYG
 eOmd0gmNgvpv1KCvEk18P7E+LDfhbfnpOIIMQ33AVMdZJ7TszIjPl+wX78SfBXky
 HuOe6xP54hweYyQFoRXTviNDJo48VDdh4PeCPpzfhyn7/rCSrsd/H7iaUjDfqB6z
 c+6x2iG5lrojHbZYoww04E5UV85uJQ4o2eOxHQreZVt/5/oKKs8y7N9khJUvcmID
 g+AfPC9TBbyYh/+dpjZ+Qe8Is6+f7l84UncXrg4z8zC3B3qSdnwTOgGJPxZ6UwFg
 ==
X-ME-Sender: <xms:MUlPX4caNuwFVcccAisWvErkOO7K6AgJJoo3v4cQobsrC4SVxzhLhg>
 <xme:MUlPX6OxSP3PAFGHfbPsYmxlm4vEpjUXTkpzWe-AjY1o28VJaUfOfZkpEjLE5v7SE
 2slNM9keGKYZWxXaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhephefhfeekgfekudevheffhe
 eihedujeefjeevjeefudfgfeeutdeuvdehhfevueffnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MUlPX5hsMDsQNbsM52JN06et8-4ML2Ttf9YmrVqWFuIQgNr8FiUn2Q>
 <xmx:MUlPX984MuZDI9Dwxv6dz-Hxl97CwmU38EEnQpLyGQON8Q61a_gqEQ>
 <xmx:MUlPX0tVUi7oFM7AT-6KT1qzhJx088SCVlb8n2IOWdFITiucqEopqQ>
 <xmx:MUlPXy6vRkhVJMl_ZbHIyXvUktRAtbhA_QxpT2rcIMDPaBHv1PFYiQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 60C48E00AA; Wed,  2 Sep 2020 03:26:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-248-gcd102cb-fm-20200901.001-gcd102cb9
Mime-Version: 1.0
Message-Id: <8d87aa4e-e02b-4652-8156-f429e6ae3f86@www.fastmail.com>
In-Reply-To: <20200902071736.2578715-1-andrew@aj.id.au>
References: <20200902071736.2578715-1-andrew@aj.id.au>
Date: Wed, 02 Sep 2020 16:56:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.8 0/3] i2c: Introduce transfer throttling
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

On Wed, 2 Sep 2020, at 16:47, Andrew Jeffery wrote:
> This series implements per-client throttling in the I2C/SMBus core as a proxy
> for per-device throttling, and then patches the ucd9000 device driver to
> throttle commands such that at least 1000ms passes between consecutive commands
> to the target device.

Ugh, typo. To clarify, the delay is 1000us (1ms), not 1000ms.
