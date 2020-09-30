Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7027E05E
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 07:32:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1PyZ3tqyzDqYX
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 15:32:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=p/xVBa0y; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=doPpqvfN; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1Pxn2NkbzDqGm
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 15:31:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4485A10BF;
 Wed, 30 Sep 2020 01:22:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 01:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=W/WjR7etuOg5MXlaRUCozifVGG8H4DO
 zxYUTXeHH1wg=; b=p/xVBa0yz1OS1tx1eHKWBerkFixgKWWcBHbDP+u/q5M7YNR
 Akl2j0MBnAPvR5CSaoJbxfEIrldvI9vsVdY6/uH6khZJg/U8EhupzrnjNk2bKrxl
 RLNpQmPrMCN0O63z09tdpY+lu/wbQNaMW9Rp3yuziKaT7kW7VULz3er0ayAWYEzr
 81kbeYcvu7/kIMT+IqfB0p3dhJJ+25mIl0DG88JAXQkgYSAbSfbaL/xdUA1NzvS5
 4IthOtONb2g+N+SHRCxMB+38SIS41UaBWF0O0UcZSlxxwB8zM1eHZmzvnI/Xioee
 Z9ca0ZtLm3beTvlCUX6KV9Rpj1h2nswmbUypEPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W/WjR7
 etuOg5MXlaRUCozifVGG8H4DOzxYUTXeHH1wg=; b=doPpqvfNGN50v8rCK9UInC
 /pETcrvH2nkuz68S0TbpIuqFphJ2AK/jlDt1SHG4+sl7M3XM5u5EkLuU3XqHuBpF
 ApCMO6OKFiYc8Q3/MX9Xfn74bQkeVl3EMknowXOFCawwXCGB4p6lFEsGr6XhTTfI
 wu11MgLwlREaC/VTgcDYPIciv4aCyVc0PwssfWrppNArBm5BYFkGa+wCddRJHM9q
 4UlhymyG9I/Jc74BS20g3CTbs7EAb1HR4DS2ks/ms3/yjnXjzQ8v+WswjWw7tkcL
 K1b+pUNBVX4N+xVVAnXmPojITV13bpFX5qz9A5nXYvSxXei5hHpyvBGnr4ANhx7g
 ==
X-ME-Sender: <xms:HxZ0X-H97AzbxDJzeYzZ5ON7kdojMNRPxB239VEeEjuIHQ9_rx2Hxg>
 <xme:HxZ0X_VaYt7sMWMiuAWUstOt4A3P9cq2cq8OVmK6vXGgQj5Lyd3edfr-hbPtbDxSB
 aF2FLmkbs_lFXKveA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedtgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:HxZ0X4Iw1VTzLTCewo3a13KQK_kRMFyaMWJSlIMPegFd7GOuzkGFKg>
 <xmx:HxZ0X4HfFWHR5jsYiLMMaJT9qzsaE-B-frDBAM0DZovcpdPYLPac3g>
 <xmx:HxZ0X0XUTSKEW9VG8Qdj4uPuvV9zSh_mcZqVXuIjGIUbbP7FpMFSqA>
 <xmx:HxZ0X3AXWYEtcAg7agismEktUukv_5Q6UoF81MMOrwUZ-2jkWqOsug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4B950E011E; Wed, 30 Sep 2020 01:22:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <1e9909c8-90e7-4e66-b946-87924316f6f5@www.fastmail.com>
In-Reply-To: <20200921173326.GK6152@heinlein>
References: <20200921173326.GK6152@heinlein>
Date: Wed, 30 Sep 2020 14:52:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: xyz.openbmc_project.Sensor.Value units
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



On Tue, 22 Sep 2020, at 03:03, Patrick Williams wrote:
> Hello,
> 
> Currently all xyz.openbmc_project.Sensor.Value's have metric units.
> There is a proposed commit [1] to add a non-metric unit.  Are there any
> opinions on this subject?

My opinion is we should convert values to presentation units at the
edges, and use metric everywhere internally.

> 
> In this case the proposal is to add an "airflow" unit, in CFMs (cubit
> feet per minute).  An equivalent metric unit would be L/s (liters per
> second).  CFM tends to be the standard unit to measure airflow from a
> fan, but L/s is used for liquid cooling.
> 
> Options:
> 
>     * Allow CFM for airflow.
>         - CFM is the "industry standard" measurement for fans.
> 
>     * Require Sensors.Value to use L/s instead.
>         - All units will continue to be metric.  Any external interface
>           which is expecting a non-metric unit can do the conversion at
>           that point.

Right, so this is how it should be IMO.

> 
>         - We won't have duplicate Units defined for similar concepts
>           (air vs liquid flow in this case).
> 
> Thus, it seems like there are two underlying questions to resolve:
> 
>     * Do we require only metric unit or do we allow non-metric?
>     * Do we allow duplicate unit definitions for the same concept (ex. flow)?

Lets avoid making life more confusing for ourselves and stick to a single
unit definition.

Andrew
