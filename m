Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797C6831BC
	for <lists+openbmc@lfdr.de>; Tue, 31 Jan 2023 16:40:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5q581kK2z3cKb
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 02:40:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekJfzC8b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ekJfzC8b;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5q4X48gQz3bfT
	for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2023 02:40:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675179612; x=1706715612;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=TtwYAekra2xXvIxD+dS4wEsWE3CSKqrSvnYp1MN0TJg=;
  b=ekJfzC8bk78qY1T+pDR+P3vd416CzlDbUIsw03ZaRXssRFOvhkgxRC6f
   bP3LlS5996Y3OQEyYm58BmOJ4Mw/N/0AZPfRZVvHgnytkrnqUs5mIlKtz
   mVUxCBbpAmVV+ISctVVBXMYbuZRC3L3xWDILJCoVcBWxQZoloFJ5snXpx
   NQYgOiuLkOCPXP8U0SP2YO8sWIqGJd69e9Gt4AtAbtrcxu+CDFg6iF9uH
   S90GXSj8bEAgQHl0KQW1H9FaSLmt0JF2ri9yyhGbmAcNg8ccmoKZelIUU
   kkScUJSb53NmkdlqRrIbRV7JkgoXxKlQYIYEidNRPhLCWLpdUSeCwI9C8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="307528342"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="307528342"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 07:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="696859278"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="696859278"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 31 Jan 2023 07:39:56 -0800
Received: from [10.213.165.222] (jmbills-mobl1.amr.corp.intel.com [10.213.165.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 31A06580B55
	for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 07:39:56 -0800 (PST)
Message-ID: <b23a1dc5-1aa6-c72e-0b1b-444b7ec9aeae@linux.intel.com>
Date: Tue, 31 Jan 2023 08:39:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: TOF elections for 2023H1
To: openbmc@lists.ozlabs.org
References: <Y9hXCcmij+TRDXJ0@heinlein.taila677.ts.net>
 <Y9hau8eAn3W6Tf13@heinlein.taila677.ts.net>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <Y9hau8eAn3W6Tf13@heinlein.taila677.ts.net>
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



On 1/30/2023 5:03 PM, Patrick Williams wrote:
> On Mon, Jan 30, 2023 at 05:47:21PM -0600, Patrick Williams wrote:
> 
>> B. We have 4 members who's 1 year term has ended, which means there are 4
>>     positions up for election.  These members have an ending term and may
>>     be renominated:
>>          * Andrew Jeffery
>>          * Jason Bills
>>          * Patrick Williams
>>          * William Kennington
>>
>> C. Nominations for (B) may be sent to the mailing list by replying to
>>     this email.  Only those eligible to vote may be nominated.
> 
> I'll self-nominate to continue serving the community on the TOF.
> 
I'll also self-nominate to continue serving the community on the TOF.

Jason
