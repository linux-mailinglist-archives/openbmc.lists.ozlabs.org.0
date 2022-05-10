Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F72521EA1
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 17:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyMPv419kz3cFN
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 01:28:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=KaGV3Iwq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=uzZVfQbY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=KaGV3Iwq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=uzZVfQbY; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyMPW0MBDz2yY7
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 01:28:14 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8BD0C3200344;
 Tue, 10 May 2022 11:28:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 10 May 2022 11:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1652196492; x=1652282892; bh=N82p9aGmub
 p/fbLmi7OobHrzIB7oUEM7bGYvSQw1tfw=; b=KaGV3IwqlTd5dylv2JYvcCO+Dj
 0h0JpAizRxY9bRlpqMwjehUwE8zk0bLiHXgCxu15Nx6n2oe7kdyPeXPfopCt4wTH
 GT9XUq5lIcietxTwT+p+mARW4acXO45EHTaAMMRerTc6fCLTDc8rvPmf7I5LhWdt
 Z1Cn5cY9iOBTIcdOohl8lQ9+JuT27Y6I8lZzimEruqdKy/6RB6eG59ywdnPkJ+4m
 PK2sVMNY9PYvzngOC6+fIKvEknQHx5lf7FObharChUarqMH5q0pBuxcnkT+JanD1
 b936oIEexXL2lYNN66a8R9mGaUqxZBoswHkj7COTiZG82eUWGRjmP/kFQ8pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652196492; x=1652282892; bh=N82p9aGmubp/f
 bLmi7OobHrzIB7oUEM7bGYvSQw1tfw=; b=uzZVfQbYH+THqFKljaisz2b56K0OM
 uhs/qo4mBwF51mLouzb/XDeqFIAdNro09N4JEcrjSEIosA0mqQ9j/TkEXFPK+zFB
 +bJS2g0Wv5igoYVdLoVc91Hd3FYstZ/3U45ZKwNIQzeuJN9xgwAINTtgVHzJEgqC
 7IP2tP42DPrdv8YbwUXh3Rc0QJ3Y8cZ34fn7moYonKPKB3l09MRHADTSQVO3jP44
 9G/4y3AxD3texSsPHhdfyFwNvDeowLA1NZipSgS7i/+73klnOheKCYX+tKYL9QR5
 go857U3z0HXFOfqrtdGDRPYye8rdvoi7/LDYBG/sHlmb7vYWHPpGiAG2w==
X-ME-Sender: <xms:i4R6YpsE0YDtdaqKvXwa-CNx_e1wzZuxQ1-AWnIgIZjFjuu0gagVNA>
 <xme:i4R6YidU_JOT4LYb7fWkJ2Jlt9dCidfP5THiAvaPt6NTSaXizSZB5-QpTfwc9Qoik
 AnFo5jNpPvveqzkkAQ>
X-ME-Received: <xmr:i4R6Ysw2XxMfoRcHg6_6ieV0qEe6TMHm4fEIkPlq6hO2l4M6Ie-s96hYTJctwcUiDjUZ1YguugPu3aoiRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtke
 ertddttdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepgeeggeejtd
 eguedvleffleejhfevveelhfduvdefieefleehjeeugeelkeeggeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuh
 iiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:i4R6YgMJuXvTh6qkYN279uw1G1oCbX8t_cprMdNrNrLO9RJot0WDBQ>
 <xmx:i4R6Yp9M6RCR6T7mcRrU9X_GfamBnFQCFEVye791M0LGfgYns-5fQw>
 <xmx:i4R6YgUWp9N4Lyln9WsfSFTJyZEwYzN6XxYwC3h6GFERBVG2zctkJA>
 <xmx:jIR6YkZXmD4KvfncSVpsfR-3uAXBbtVlFNH2FUODP6LCp6RIhqidwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 11:28:11 -0400 (EDT)
Date: Tue, 10 May 2022 11:28:08 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?utf-8?B?5oiQ5L+u5rK7?= <xzcheng@zd-tech.com.cn>
Subject: Re: Updated CCLA/ScheduleA from ZD-Tech 
Message-ID: <20220510152808.eqghpl424kvhwad7@cheese.fuzziesquirrel.com>
References: <AMoA0gDRIQSYPmveuIQzJ4rs.1.1652154412417.Hmail.xzcheng@zd-tech.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AMoA0gDRIQSYPmveuIQzJ4rs.1.1652154412417.Hmail.xzcheng@zd-tech.com.cn>
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
Cc: manager@lfprojects.org, openbmc@lists.ozlabs.org,
 =?utf-8?B?546L5Lqa5rSy?= <yzwang@zd-tech.com.cn>,
 =?utf-8?B?6ZmI5bCP5pil?= <xcchen@zd-tech.com.cn>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 11:46:52AM +0800, 成修治 wrote:
>Hi Manager,
>
>   ZD-Tech BMC team has  updated the CCLA/ScheduleA as attachment.
>Please help review it.

Schedule A accepted.  Thanks for keeping it up to date.

-Brad
