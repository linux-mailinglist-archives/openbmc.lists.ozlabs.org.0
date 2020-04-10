Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 286561A421D
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 06:50:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z5DN0zCkzDrMK
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 14:50:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ytGSHH+9; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=PhbTpZcM; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z5Cm39KtzDrHb
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 14:49:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C287B5C01CE;
 Fri, 10 Apr 2020 00:49:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Apr 2020 00:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=rUE5s6rBzb3pjU1BKHJz7Nd9Xsi9jy2
 f4Q7Vwz/5KV0=; b=ytGSHH+9KdWiszzzKvB9tANAy3hfoPmi1R4zFv6LTz6vxJn
 ru4stvq+eKEXn0Y6kYe8wfbFQ0/18OaVm9D3MX96UXublFsI3M7dULsYt8vMqb4X
 wAqiBPeYHIQCH3NGqRQwRn+PVQRzoF6K19UxF/xClZ8zubfaG/e/S+WDXTBvwf3t
 KZ0TAwoOuCN2ZhmcBGGrXm/Ux1CTbA6KKFlswAcFYDtFb1fW3pwklwEYCp9NHGQM
 u62joKLht5zpJO5cBPiS8axeP3WM1m+0XZleD2/noISNxlCZKny81afAlI4nRIXo
 3GZW4B0Vz+rMJwYo65yG5/fW8/oflutniKwvTWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rUE5s6
 rBzb3pjU1BKHJz7Nd9Xsi9jy2f4Q7Vwz/5KV0=; b=PhbTpZcMfYEWzAyKsYZjTj
 ppcwfWRJDV4COyhF1k3SwxIrlwnbi5g7JMWbc2wO8UM3nu+GDCbY2sJj5y+vN0P8
 F31nwxSt+vUOu4Lb9HF/V8KPubu9uKct4tzjLUMPMeZX6Lr1xifqoHYavM1G/p+m
 0nxkjh3W0ehQTmUiEGrNtDDcoj9mnRlJ0crPKxc3Cp+icHlWRbJLEgaCtaXFEUrI
 BYzkoDV9v1JHU0y0DwwMTiAy11Jwn7ACHeO65YRtFWWtPnRV51n/RNiC4NXbDxAF
 xxBKwMXy3O+MKv9RNUAJcTBN9XktDYhwNkVQPNFHEJO7t4XIWlH6UsUBBD1RDyTQ
 ==
X-ME-Sender: <xms:8fqPXrxrtk-fi1whORPwRmWa3NFCOIzwtwue0IpjiOvG3EYg8vzWEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:8fqPXvXPC1pxEQwdusVgSkvOocK9j-k8wi5CsHPhymFGL-jSkMZQSQ>
 <xmx:8fqPXrRjWLZM_5x3mwmGhUzahkoaHvbxH7xlZ0URiUH9izi04hZiyA>
 <xmx:8fqPXmc5eAUel1k7nE9-rbJfJhcgARVrSt9OpvuqTQfFonPCmipvkA>
 <xmx:8fqPXrBlI_Ud1Qv891tXZR8pa4W67lb6cJzyMU4cRprodOtaZT8THw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3799CE00A5; Fri, 10 Apr 2020 00:49:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <7fea717a-50b4-4ff3-9936-80a80a35c51a@www.fastmail.com>
In-Reply-To: <20200406191938.31156-2-eajames@linux.ibm.com>
References: <20200406191938.31156-1-eajames@linux.ibm.com>
 <20200406191938.31156-2-eajames@linux.ibm.com>
Date: Fri, 10 Apr 2020 14:20:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/3]_fsi:_master:_Remove_link_enable_?=
 =?UTF-8?Q?read-back?=
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



On Tue, 7 Apr 2020, at 04:49, Eddie James wrote:
> Both the Aspeed and hub masters read back the link enable register
> after enabling the link, but this is unnecessary, so remove it.

Unfortunately the code isn't commented, but you're making the assertion
that it's not necessary without explaining why. Are we sure it's not
implementing a workaround e.g. to make sure the write is flushed?

Or is this assertion made on the basis that the result is unused?

Andrew
