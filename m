Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E544B168C
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 20:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvnR75Qc1z3c7f
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 06:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=CA9fwp2z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=j6RngMuM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=CA9fwp2z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=j6RngMuM; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvnQh0WPjz3bWG
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 06:50:03 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 981FC5C023F;
 Thu, 10 Feb 2022 14:49:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 10 Feb 2022 14:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=GCYLL3OukQ/jVUWfZroQc8Wso39UeLlWkLq93PwrlEU=; b=CA9fw
 p2zQb3RY0zLKN00D5S2rANwjbgmt9UN8dz5ei7KVynLwA2oCRGqS6M3wQJtFErfz
 V2E9r7le0mWYVxZcGvcOq1/AZ/sNPTro++kW56NPrVdutHMm4dJ8FP8ZHXNUEixS
 +8nCHvdA2hvNXC8xUmPNCqP0OABl+f/M2dKsodZZxSnJpXaq+gIKj9uhtSfY+C86
 93cGORIouC9Oa6goOeprV+m2F6/AoYd++0vF9R0L19YvpRyxojLaxLYpU3+QuB2t
 36Kg5n0Jo+bWmlt5vXiMsZ3KyLbiDjRHe/4Zn/DsgxGdZgi+kTBXbqaqjlYhcVVX
 MSxM2t9TN0iecf9/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=GCYLL3OukQ/jVUWfZroQc8Wso39UeLlWkLq93PwrlEU=; b=j6RngMuM
 FKHrLInNHuMEWEiKrpXj1Cp91kz3+iNwK2G8RJkcv8T2WkLw3Q/4dkAUJEBWdJaG
 lcFiBPBnocwJ0bR9OUaNOnp7tcmG7aHVPg9LWJThUGBCgIbtaYj8u+GkrlVXdjo3
 1gkFlk8t2zpiT1PM44DoMmqHZOGjyyZu0BpytBGNP4kHO7YnsqYs+97mO9pUxlNA
 JovGEvWUO2YgMBgsZKa3VqC8XCFfjDBvKuLrrKLituphyPNWIZh0sFKzEwelHxEb
 GEFrJY90EjJfoM5ASVrbHYvecdHkYIQ3ZenmLv1jwVONQSZ0ztzC+YpLE5P6mC1B
 Ez5OkxSSP1xrvQ==
X-ME-Sender: <xms:ZmwFYtgXOmHknVzEnEG5vGGQoadiX-VVwj_oMnWsg4Y0UVqrQnxYXw>
 <xme:ZmwFYiBTPioNu2uMpvkSXD9KaTRCHS3BL-yslRqr7qTEhacGlbt13feGC99wHa4wn
 OlBic0IzRTOrSdUyMo>
X-ME-Received: <xmr:ZmwFYtF8GFRvXO2mEMED3wYP_QW26uJUsSZmAlNk6k8F2Xs9yXTp61awOskYFydpLvPhg8XQKF1jm0nRZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddriedugdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlfeehmdenucfj
 ughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgrugcuue
 hishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomheq
 necuggftrfgrthhtvghrnhepfeelfffhgedvieekgeeghfdtveekffejudejvefhveduhf
 effeethedviefhieejnecuffhomhgrihhnpehgohhoghhlvgdrtghomhdpohhpvghnsghm
 tgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgt
 ohhm
X-ME-Proxy: <xmx:ZmwFYiRXIGLc4JfUZqTHWLwII6MnILn3jAFTn7IIoukQZcg-0CevCg>
 <xmx:ZmwFYqw2g5-GxWdIdVXNVB7k_wHy8Qy_Q-OWPGi2qL46dQgB6jfAQw>
 <xmx:ZmwFYo5rc90DBordG1SrWhMNVlhZGW1D0PcZD9qEcony2NyvjWPhUg>
 <xmx:ZmwFYgYDMA75Ovsxrad50PpUQ_wfoJ2IDxBFW97UVOZaribA5subCQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Feb 2022 14:49:57 -0500 (EST)
Message-ID: <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
Subject: Re: request to add Gilbert Chen to CLA repository ACL
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Gilbert Chen <Gilbert.Chen@arm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 10 Feb 2022 14:49:57 -0500
In-Reply-To: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
References: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 
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

On Thu, 2022-02-10 at 12:52 +0000, Gilbert Chen wrote:
> Hi,
> 
> Can you help add me to appropriate CLA repository ACL since I want to
> submit code changes to gerrit but the gerrit shows "OpenBMC CI - User
> not approved, see admin, no CI".
> 
> I have been added in ARM CCLA.
> https://drive.google.com/file/d/1i0SkfLvR9_loRTZ0zZmC6L_sDOZyQjZB/view
> 
> Thanks,
> Gilbert

Hi Gilbert

I created arm/ci-authorized and arm/ci-authorized-owners groups on
Gerrit.  I put Samer in arm/ci-authorized-owners so he should be able to
add additional people to arm/ci-authorized in the future.

Before CI will use these groups though, you'll have to submit a change
similar to this one:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/46093
