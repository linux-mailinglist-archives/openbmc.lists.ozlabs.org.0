Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DBE7D83B5
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 15:38:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0MT2IpG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGRh41yl5z3cFh
	for <lists+openbmc@lfdr.de>; Fri, 27 Oct 2023 00:38:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0MT2IpG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGRgR2rk7z307V
	for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2023 00:37:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698327459; x=1729863459;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=U8lg42r5XkqHFJwzwR0twtzOLFFNbdRViboMf6PlKkI=;
  b=A0MT2IpG3KoaltLYVJXyYHmTLpbzDITFkCpC62nOL9q4kFA8jt/S8jP0
   8Mb89CouN3oC5W4DTUkpqx+r6wGciBI/v5SzRCDfHZlE9QFXVvf/Hdkqp
   gS6Djp22n/Ki3LjsNjBNi2mJu+11o9rWBf/fzYPn7/lLpKWnXBHDsNYzm
   EOBzaAiW+JJAZwVmPh/g761QPeyfHgFEK5WAN5sQ3F6bFhcmyj3j85U8o
   WV/y/Jsf52TgY/xEYkumWV82UFDAmpnV4HecKsrpXL7oud2xhRm8oGN1W
   AXleB7YJEfpjKDSwfS9k89iTv49y8EYWTvQ4B/KAHwpiKAnpG+i3q5zbM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="390412861"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="390412861"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:37:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="875950654"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="875950654"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:37:34 -0700
Received: from [10.209.190.26] (rcllano-mobl.amr.corp.intel.com [10.209.190.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B937D580AFF
	for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2023 06:37:33 -0700 (PDT)
Message-ID: <8bc433dd-7ba0-4870-b3e0-7163d3c3d64d@linux.intel.com>
Date: Thu, 26 Oct 2023 07:37:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: async_method_call_timed issue ?
To: openbmc@lists.ozlabs.org
References: <PAXPR02MB768042EFA62F196C0BE43B52E4D6A@PAXPR02MB7680.eurprd02.prod.outlook.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <PAXPR02MB768042EFA62F196C0BE43B52E4D6A@PAXPR02MB7680.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 10/17/2023 4:29 AM, Francine Sauvage wrote:
> Hi @ all,
> 
> I cannot figure out how to change bmcweb dbus method call timeout with 
> async_method_call_timed ?

Not sure if you solved this one already.

> 
> My bmcweb version is old, but I guess I missed something, like http 
> connection timeout? socket timeout ? web server timeout ? Adaptator 
> timeout ?
> 
> I tried to implement it with a 4mn timeout.
> 
> But I always get an internal server error after about 25 seconds:

It sounds like you're hitting the D-Bus internal timeout which is around 
25 seconds.  As far as I understand, if you make a D-Bus method call, 
and the receiver doesn't respond within about 25 seconds, D-Bus will 
time out and return an error to the caller.

> 
> Response:
> 
> Implementation – callback is never reached.
> 
> busctl call is OK with timeout option, I mean, my service is able to 
> take care of timeout :
> 
> *Any idea or suggestion ?*
> 
> *Kind Regards,*
> 
> Francine Sauvage
> Team Leader – BDS-RD-PFM
> M: +33 (1) 6 21 43 11 21
> Av. Jean Jaurès BP68 – 78340 LES CLAYES-SOUS-BOIS – France
> eviden.com <https://eviden.com/>
> LinkedIn icon 
> <https://www.linkedin.com/in/francine-sauvage-consultant>Twitter icon 
> <https://twitter.com/EvidenLive>Instagram icon 
> <https://www.instagram.com/evidenlive>YouTube icon 
> <https://www.youtube.com/@EvidenLive><https://github.com/frsauvage>
> 
> Eviden logo
> 
> 	
> 
> an atos business
> 
