Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294B488E2D
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 02:42:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXGm81cC5z30MQ
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=RZFAZBkL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XWGHyluz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=RZFAZBkL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=XWGHyluz; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXGlm38fgz2xsS
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 12:42:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 56E103200A47;
 Sun,  9 Jan 2022 20:42:10 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Sun, 09 Jan 2022 20:42:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=DnmuGcQjnmjNhmFzC9D3Vb4TZvmm43w
 HFg8tU/xFRXQ=; b=RZFAZBkLDY1uU9TM/iyfu4r3t14mJsSZ9Px9v2HBQAw9um1
 yJcvLgi49UVIvduXoK5pbgHBb2437YZXcmgD2cAeH4zozsytGO6pZM6bVTxz6Vb1
 Xm3UygIx1GIwT5rkAPV+uXFX27NeudBO3I1OVfvSjYQG9si8jdY00cz2urDt9SeQ
 tUqRw8gevLTpcBTLaQRrqxLN6DrVaOZAEpCzlyz135pRyvUebW83vHF/Yofey/ps
 RckjX00na7Urg1sJhYpQaEMDRdkBMKT2N2rl4ZXHGjPobqndO6a8Ok0Np870P5gO
 6xexca3xfYZS2umGgsMhYwpkQF5aikg7MJT7/TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DnmuGc
 QjnmjNhmFzC9D3Vb4TZvmm43wHFg8tU/xFRXQ=; b=XWGHyluzStpRbjXy0d2Fur
 A2m7xpfcsDcsDjoRGbA5hY088zZfSNSdxetSYoDfVzLB48f7xM3mj411OtcEDOX1
 DtVL6Bzod5t6GoY0/37KNrooP53UdfSKXdHEMF/zLk1QHFjL0mDAns+1PW5zMpEl
 BEK52G6Y1I5GO8svWNwVV7iTCvfmAu9dekB43vOfiUn6e2+6d55rdRXWMKjP78qa
 xFfhRU/1Vm1t74YAXncInw+r4LMm18Co15CaJP/DMIo+O1DMIIXSM21wNqQ/kgN5
 8KBiFE8+gkok9ZQZlW3ARDbsPpsmiCo3gfGCi4bMU3XctlZi7pgIsVOiv4WnDmYA
 ==
X-ME-Sender: <xms:8Y7bYfpirpD1nQbWNaQ-Ah22BizhH3yFRuG3k6xmd-DzDWyeuNyzGQ>
 <xme:8Y7bYZrcmpkqInSrbF0PVu7qgCHkbosDPiM3xzdtAcv0rP4zPPczRzHl_nIHheodO
 ntTJGSJsi8McE-y7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegledgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejvedttedtgfdvtddutdfhueduvdev
 kedufeeuvdejfffhveeftefgkeehudekkeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiipdhmvghmsggvrhhshhhiphdqrghn
 ugdqvhhothhinhhgrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8Y7bYcOhemom-osq8JSp-9VpFdaX94V-nCKBzD61r8geBF2hzNTCqA>
 <xmx:8Y7bYS5-MwI5-zEMMP7sKvLkWFgarCAgG4Ql0pEfRQo8A7zBDFyKWQ>
 <xmx:8Y7bYe7R9aU2tApq8g_ZBHJormD_8iCrZZcJq-qMNtV3CXkwl5AIPw>
 <xmx:8Y7bYbVIAPRaHswLiCxTpjnzVRfKtL96EWqLgx-EOQoXSgetuWsdNA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B2AACAC0EA2; Sun,  9 Jan 2022 20:42:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <eacc4cdf-467e-4f98-8254-a530c1145203@www.fastmail.com>
In-Reply-To: <70ab9923-a976-46b0-8ec3-bbdd689c50a8@www.fastmail.com>
References: <YdiCUiwh1iD4ycr8@heinlein>
 <70ab9923-a976-46b0-8ec3-bbdd689c50a8@www.fastmail.com>
Date: Mon, 10 Jan 2022 12:11:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming TOF elections
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



On Mon, 10 Jan 2022, at 12:09, Andrew Jeffery wrote:
> On Sat, 8 Jan 2022, at 04:41, Patrick Williams wrote:
> ...
>> The most important data that people will want to see is the list of individuals
>> who qualify for voting in the upcoming election.  The current draft (for
>> approval with issue #9) is found here[4].
> ...
>> 4. https://github.com/williamspatrick/openbmc-tof-elections/blob/main/2022H1/rollcall.json
>
> How are the following terms derived?
>
> * highly-productive
> * active
> * emertius (sic? emeritus?)
>
>  I didn't see mention of these terms in the tof-voters patches.
>
> Maybe I didn't read the associated documentation closely enough?

Ah, as soon as I send that I see [1]. Still, it defines 'Normal' and 'Highly-Productive' but not 'active' and 'emertius'.

[1] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50202/1/tof/membership-and-voting.md
