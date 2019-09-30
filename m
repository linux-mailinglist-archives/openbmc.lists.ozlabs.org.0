Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F9C1B2D
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 07:58:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hWsY6TKwzDqMK
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 15:58:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aHYkeGsU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QJcg9pf+"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hWrq1BT7zDqKW
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 15:57:29 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 30D1F4ED;
 Mon, 30 Sep 2019 01:57:25 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 30 Sep 2019 01:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=PhI1+oj9tFKK+Rt9+Q+kPMffCoIu4od
 Wpg7qbOqF6gE=; b=aHYkeGsUWdEt0ordPTl6lNKrxGCCsExbHGjsWPh1OTgsNjU
 GadDCG3Ro7Cca7ghqAABRlW5rczZxb7YyEK+hHwoQbT40bhhk7BbccuQkTOEVPg5
 X7f0ZGMJOg3l0uNu5cG+nBXavmBXfWLxgQOEM066rCQe5R//Azj3oGEgq7CVQxQj
 UCMUh0vvgfeTsvXIcr+Qn9IYqc4guz+AvGtkD6BYnr+IkiJd2bMB6OPveOclhNbD
 eTXRaeVEdkOP2ZVkwmINiJHv2/wCM82KARBZQurWHS1auSJKOMQiCFsmm5sXQlQA
 3tW+hOd0blsYfjpkTlSRCiDzxyHFLD2j9CUZhZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PhI1+o
 j9tFKK+Rt9+Q+kPMffCoIu4odWpg7qbOqF6gE=; b=QJcg9pf+C7xVeqA4DzGRtW
 8/37mVB1mZK0wRuK/uj9UeMLl4kjezKcCiZ+BWRiP5H4KxI1c7loNdLd4nLvev0d
 9DrBZR0OAHqEDLNEx2veQiJypVYvJqR7F7KNuIQl8NzI0jhuKgZgdjQYMgnJLMv3
 Q9yjdTvR+KJtmIX0NuUmeRL51/+RQspsEYUN6p27r2L7b7cpPg7+esKvAC1cGo8X
 YFXD1Y1byEjjshmRGkEjYR73Fl2GPiL8ccvAp1aNOQRRDtMaEMEjsTFqcDVWXI+x
 3pdF3n5AOSdjxzUoZ2S9yS9EAwYLpaSndmFwklWJfyGKCvxAsfuA0xHpB4WgK1Og
 ==
X-ME-Sender: <xms:RJmRXY15dIDAnBDCxaUEnY1U7R97n4wzunh88aLtO6faKBXalMvkUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgedugddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:RJmRXZa3MT4QH3VcWfC4KcCRTsfagXuYbkA4xOXoTnWBBgS0sT3LqA>
 <xmx:RJmRXW5k8GnYrZanJEo8Qv7u3ymCuAU-13bCnlqG8p9mvO1cHcz6fQ>
 <xmx:RJmRXfI3-m0-B5lNQmUoLB2ishIJazpmXX1A-pAt7fkEV1e5knooMg>
 <xmx:RJmRXfFEzajB6X79Up0u4dRZuoGhy9VGfVKMCIJkLn-Kz3d2NAFkAg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59A2EE00A5; Mon, 30 Sep 2019 01:57:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <6089f3a1-e893-4a52-b812-331295f51b8a@www.fastmail.com>
In-Reply-To: <CAN34fow3D8f=LSY=gS51WxYAcE9Gfrk7_=7Rbppjc4zDF+Pkaw@mail.gmail.com>
References: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
 <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
 <CAN34fowhEKe0fTv+AVN-++5GoySugobjegb=5Lghi7VYXNLmdg@mail.gmail.com>
 <a1767b7c-1769-40ff-b3d7-8e9adc7d234e@www.fastmail.com>
 <CAN34fow3D8f=LSY=gS51WxYAcE9Gfrk7_=7Rbppjc4zDF+Pkaw@mail.gmail.com>
Date: Mon, 30 Sep 2019 15:28:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Stephen Beckwith" <embeddedsteve@gmail.com>
Subject: Re: Unable to boot OpenBMC image in QEMU for AST2500
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 26 Sep 2019, at 06:14, Stephen Beckwith wrote:

> 4) I then, as you suggested, reviewed the documentation (again) and 
> crafted some minimal parameters to running QEMU. And Behold:
> Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 
> evb-ast2500 ttyS4
> 
> evb-ast2500 login: root
> Password: 
> root@evb-ast2500:~# uname -a
> Linux evb-ast2500 5.2.0-c01e98d #1 Wed Sep 25 16:54:08 UTC 2019 armv6l 
> GNU/Linux

Great!

> 5) RE: runqemu script - My Python is rusty, but I'll take a gander at 
> it, since I will have some time here, as we are only working on an 
> initial PoC for this. The next attempt will be to try and see if we can 
> boot this on our reference platform (AST2500 based). 
>  - I maybe getting back to you should I have an update on this script.

Okay, thanks :)

Andrew
