Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A481A0F7
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 15:19:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvff9ZxV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwG070XpYz3bdm
	for <lists+openbmc@lfdr.de>; Thu, 21 Dec 2023 01:19:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvff9ZxV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwFzW5SFxz2ysD
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 01:18:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703081928; x=1734617928;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TsB78LnI1mCH5x+Jis8MIHLYEfbEI6XoCGzvwt8tkXU=;
  b=nvff9ZxVcBDcJXEdeWzuHkS186S2NMexQSzNXXgb2WiDNo5cQeDmQzcB
   OJ+A1SU2A4Lj9ZLXuIsKvLnRIOSQ7qWfYlqTg0KZUqbjNGYWSo4qMQunZ
   pzBTjC7L4BT1cVIdb+2i+RfYMi48ytbzVcxVzEWhrKLXHfKzfntcUGd5T
   BHjmMUAcqIqZXJASFhSuTHHhDPzkMDn6h/AIDBFJQVRbJnR99CapmGoe5
   +y1Tn/BGWLgavRNr9ZpeB1+9ef6cmBMOOPMkgNd5d3LgZGn7kuzc71LOO
   dUnzF01OHIaC6EsWZB+34tPwvHPQk3eh+2+J3dBOw7nWXAb8YvuEs0JVz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375973914"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="375973914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 06:18:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="18318183"
Received: from aambroze-mobl4.ger.corp.intel.com (HELO [10.217.160.83]) ([10.217.160.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 06:18:41 -0800
Message-ID: <5296a763-9a24-4828-a648-2de5d78cad76@linux.intel.com>
Date: Wed, 20 Dec 2023 15:18:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: openbmc/telemetry: First complaint of unresponsiveness
Content-Language: pl
To: Andrew Jeffery <andrew@codeconstruct.com.au>, jozef.wludzik@intel.com,
 cezary.zwolak@intel.com
References: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
From: "Ambrozewicz, Adrian" <adrian.ambrozewicz@linux.intel.com>
In-Reply-To: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I would like to apologize for this issue.

We were undergoing serious reorganization recently and this indeed flew 
under the radar.

Currently we've integrated proposed changes and wait for feedback from 
automated regression test suite.

Regards,
Adrian

W dniu 18.12.2023 o 00:54, Andrew Jeffery pisze:
> Hello Adrian, Jozef, and Cezary,
> 
> A complaint has been raised to the Technical Oversight Forum that as
> maintainers you collectively have not responded to several patches for
> openbmc/telemetry in a reasonable timeframe.
> 
> Some time ago the project defined constraints on timeliness for
> reviews. This helps to set expectations for both contributors and
> maintainers. Maintainers are expected to find time to provide feedback
> on patches inside one month of them being pushed to Gerrit. Upon
> complaint, missing this deadline forms one count of unresponsiveness.
> If a subproject's maintainers receive three complaints of
> unresponsiveness in a 12 month period then the Technical Oversight
> Forum will seek to introduce new maintainers to the subproject.
> 
> This is the first notice of a complaint of unresponsiveness for
> openbmc/telemetry.
> 
> This notice is copied to the OpenBMC mailing list to provide community
> visibility. We need the process to be both public and archived to make
> sure we are clear and accountable in our communication.
> 
> Further details and considerations of this policy are defined at the
> link below:
> 
> https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md
> 
> The complaint regarding openbmc/telemetry at:
> 
> https://github.com/openbmc/technical-oversight-forum/issues/32
> 
> The specific patches identified by the complaint are:
> 
> 1. 64867: build: upgrade to C++23
>     https://gerrit.openbmc.org/c/openbmc/telemetry/+/64867
> 
> 2. 67240: clang-format: copy latest and re-format
>     https://gerrit.openbmc.org/c/openbmc/telemetry/+/67240
> 
> 3. 66007: meson_options.txt: Support for reading options from meson.options
>     https://gerrit.openbmc.org/c/openbmc/telemetry/+/66007
> 
> If you are unable to continue with your maintenance role for
> openbmc/telemetry then please work with the community identify others
> who are capable and willing. When doing so, please consider the
> expectations set out in the community membership documentation:
> 
> https://github.com/openbmc/docs/blob/master/community-membership.md
> 
> On behalf of the Technical Oversight Forum,
> 
> Andrew
