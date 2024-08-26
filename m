Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12695FAD8
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 22:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt2mF635Gz30Vk
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 06:47:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724705225;
	cv=none; b=WITvZS9OPhZWaW11H9nMVrpqLE118A3/N40oD8FGIfeGMR9hehp/bXQAoB0p1LMh+JaFCUd1d3lHF8nVh1QG8UpjDgMdO2qmggho1pXssL41px3cxacYHxEgEV9mAYp2Rc2NdW2moIfOd3W63Oe9mCH6T+ZYGOueqnc4/rvdYtt30ywOaZRjZhDecb/krdJvssU7dyf0s+qc0J8NVLcQRCfKWrDPgsj62sw4qVFt9XxZoFcWDvviTN0VspCncHaZ3v6fL1THGhJcnZJ9NBo7qmI6uRDaQ1T/mGNRjx3aK8fHzoieNSTKqnxyBn3HEA5wYIocgUFw7g+iUr2nocesxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724705225; c=relaxed/relaxed;
	bh=/GDQt7nPUccEXpcXkGCb/xR0EDei9fnFk5LAcz/YnnE=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=USXRYO+XCJ9MYHPCy14FVArwwZf7prfomQ2g10gK2gIoGN34QQ9n621JiippEDc46AH0rhzf9bbJMa3iVdBaTouw0FyxzVa3PpzdytlHe6QLL21JikhMWjMLTsXnyFmKYNeAb6Oa7lOZDuVVZ8JfYHjstk7pkE+8u39ZRAg0zucQ0MqUSzOG21GsWcVkE54o0Oa12x8YrbHZ4koEHsIZFBEZJkiAE3yhuMyYnjVroZXv9UFjebm3996dwEUqSXHCANieYyRaa5i328egtDUdRFS84wEgHEF+iFsOA/o1UiNWiSPsYMpBjr0Wq9UUkXvL5ZoB2rLqy0LdzY7zcA90VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJH8SqpN; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJH8SqpN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt2m66QQtz2xZr
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 06:47:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724705224; x=1756241224;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=hlpilJ/c0pgQq/9hbVnGGCwXd0+7mZLBFm7br5aNB+8=;
  b=QJH8SqpNoZHeAkzL1hr3d/tyD01b2rcZFq3/7BTwoqfNySXo/wLM2sXY
   Aeao39sOSNl45fqbFI0oAGqcIUL1+dQ0m2SKhpUJkgDLysVmLA1mMSIie
   X6jppDfSEDIUq9bxPTGfnQmE75QW++BBOzFDZCb5eQyDf/MuPUsIzOy5/
   HitN8MfBrTolizK9NZ7YQouG08zj2qhPvRBVtw00tha6Kg/3TJmrlDKmp
   rAGZH91eeloZl1ZmO4TlbbFpimUPcVgaQYCE2hvXr05s2+YgHA/vh6Wdg
   +5oUlRUh61zHZ9d/LuZ+w/Y8CiCZy1aka0yy6QWN8VlOhXZHJKMuxmLu1
   g==;
X-CSE-ConnectionGUID: krLSr/j0TdKCklpIZbO36A==
X-CSE-MsgGUID: LvwE8kF8TFmA3BQFE4o95Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26921365"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26921365"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:46:57 -0700
X-CSE-ConnectionGUID: 5bgZsMWWT1SDnvrF09bSmA==
X-CSE-MsgGUID: s1Ggb81hSICFXV7YPSYdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62456442"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 13:46:57 -0700
Received: from [10.124.100.41] (jmbills-mobl1.amr.corp.intel.com [10.124.100.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D9C7920CFED7
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 13:46:56 -0700 (PDT)
Message-ID: <76955a65-9716-4d32-81d7-377df0d7b25e@linux.intel.com>
Date: Mon, 26 Aug 2024 14:46:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plea for help with GPIO pin naming
To: openbmc@lists.ozlabs.org
References: <ZszK_Zj1QpH--xv1@vault.lan>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <ZszK_Zj1QpH--xv1@vault.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 8/26/2024 12:35 PM, Johannes Truschnigg wrote:
> Dear list,
> 
> in my ongoing hobbyist quest to port OpenBMC to the Gigabyte MC12-LE0, I face
> some challenges that leave me scratching my head - hence me posting here.
> Today's questions concern GPIO line names and x86-power-control aka
> /usr/bin/power-control.
> 
> I've been reverse-engineering my board's GPIO pins for a while now, and once I
> figure out what a particular pin is (probably) actually good and used for, I
> most of the time have a hard time identifying the proper name/label for that
> particular pin.
> 
> I don't have a background in electronics, much less PCB design, but I guess
> most line names in OpenBMC's DTS files are lifted verbatim from board
> schematics, which I do not have for my board. That, as well as the sprawl of
> pin labels and names used between existing platforms and boards, makes it very
> hard for me to infer the meaning of most pins defined for supported OpenBMC
> machines.

The original thought in x86-power-control was for the GPIO names to 
remain static and be routed to the correct pin in the DTS. This didn't 
turn out to be the direction, so the config file was created later to 
allow specifying GPIO names.

> 
> My research led me to a design document from 2020 with the promising title
> "Device Tree GPIO Naming in OpenBMC"[0], but since I can't seem to find the
> proposed names in any of OpenBMC meta layers, I guess it always remained a
> proposal, without proper uptake in the real world? This hunch of mine is
> somewhat exacerbated by the fact that the x86-power-control package assumes
> very different pin names in its default example config file[1] (although a
> GitHub issue[2] exists that makes it somewhat plausible that might not be 100%
> deliberate)...

The GPIO names in x86-power-control pre-date the proposal and would just 
need some transition with backward-compatibility to move to the proposed 
names, if the community would like to go that direction.

If I understand that GitHub issue, it's just that the README doesn't 
list all the GPIOs that must be defined (which doesn't really apply 
anymore since the config file allows any GPIO name). But it may be good 
to update the README overall.

> 
> What I'd like to have is a solid guideline on how to interpret existing boards'
> DTS pin names (unfortunately, I don't know what either of SIO_POWER_GOOD or
> PS_PWROK exactly describe, or what the difference between the concepts the two
> strings of characters map to in the physical world might be), assuming little
> prior knowledge of these dark arts. Is there material on the web that isn't
> buried under mountains of mainboard-designer-specific NDAs that could help me
> with making sense of all the jargon I don't know? I'd be very thankful if
> someone could point me a way!

I won't be able to help with general guidelines for existing boards' 
DTSes, but I can definitely help with what x86-power-control uses.

SIO_POWER_GOOD is named for the POWER_GOOD pin on the Aspeed BMC SIO 
signal block (probably a poor name in hindsight). On every system I have 
worked on, the CPU Power Good signal has been connected to that BMC pin. 
In x86-power-control, this signals that the system is fully powered and 
running.

PS_PWROK is the Power Good or Power OK signal from the power supplies. 
In x86-power-control, this signals that the power supplies are enabled 
and supplying power to the system.

> 
> Thanks very much for reading this far! :)
> 
> [0]: https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> [1]: https://github.com/openbmc/x86-power-control/blob/master/config/power-config-host0.json
> [2]: https://github.com/openbmc/x86-power-control/issues/4
> 
