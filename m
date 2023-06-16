Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FE77333C4
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 16:38:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YBabPw+q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjMGV2Twtz3bpp
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 00:38:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YBabPw+q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=suryakanth.sekar@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 17 Jun 2023 00:37:52 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMFr6l7vz300v
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 00:37:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686926273; x=1718462273;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2g5h4s+Qiv7zx88ebOogNhJX6DpfdBQ6cyX6W5t7Vcs=;
  b=YBabPw+qO6X0zMi/NR1VarG2ic6rTiZGom+CaN4vXW2gJaLBMeH54TXT
   7XS8MKpFCdHEY+FS3izGaS84TYyp9CKm+sa4bE/VwNt6A/b0p6Ji4tlpn
   ltxLRbRrZ+CabhsN13W362n9yvk2C86JvC3QXcz5mLfFeYwNsQGM1XtTW
   xsNGNaH5NHY86zefx2N3fzw8Zk3Il5UTOtrphD03Gkp7VviRylFqX1BiG
   6mc7PguNnZuCfu+8Vdsy6+JbqIzjUsQjCRhaeWk1Rnoa285sk+g4/IGk2
   JyFS046/iqY6TdlxCNTJ2HosSmGZzST3tqUDFgi/oxuOsE7lW5cJ9i6Pb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343964673"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="343964673"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="712895780"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="712895780"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 16 Jun 2023 07:36:44 -0700
Received: from [10.215.122.98] (ssekar-MOBL.gar.corp.intel.com [10.215.122.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 11995580D61;
	Fri, 16 Jun 2023 07:36:41 -0700 (PDT)
Message-ID: <fdbd70b3-e85a-5756-b12f-9a291fe7767b@linux.intel.com>
Date: Fri, 16 Jun 2023 20:06:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: openbmc/bios-settings-mgr: Notification of unresponsiveness
To: Andrew Jeffery <andrew@aj.id.au>, wangkuiying.wky@alibaba-inc.com,
 openbmc@lists.ozlabs.org
References: <f21a5062-b462-4597-8770-4869b0071ba2@app.fastmail.com>
Content-Language: en-US
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
In-Reply-To: <f21a5062-b462-4597-8770-4869b0071ba2@app.fastmail.com>
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

Hi Andrew,

I didn't see any open code review waiting for review and merge. 
Everything is taken care.

Thanks

Suryakanth.S

On 6/16/2023 10:26 AM, Andrew Jeffery wrote:
> Hello Kuiying and Suryakanth,
>
> A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/bios-settings-mgr have not been responded to in a reasonable timeframe.
>
> This is the first notice of a complaint of unresponsiveness.
>
> The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.
>
> Further details and considerations of this policy can be found at the following location:
>
> https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md
>
> The complaint regarding openbmc/bios-settings-mgr can be found below:
>
> https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292
>
> The specific patches identified by the complaint are:
>
> 1. 63276: clang-format: copy latest and re-format
>     https://gerrit.openbmc.org/c/openbmc/bios-settings-mgr/+/63276
>
> If you are unable to continue with your maintenance role for openbmc/bios-settings-mgr then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:
>
> https://github.com/openbmc/docs/blob/master/community-membership.md
>
> On behalf of the Technical Oversight Forum,
>
> Andrew
