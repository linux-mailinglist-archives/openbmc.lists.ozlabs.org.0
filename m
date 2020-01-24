Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF76148CE2
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 18:25:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4845ck47WpzDqdm
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 04:25:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4845bz520dzDqWM
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 04:24:29 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 09:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="276373789"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2020 09:24:26 -0800
Subject: Re: x86 power control for multi host
To: Vijay Khemka <vijaykhemka@fb.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>
References: <E8A81BD0-04D4-4ED5-91E3-F4CA85DC8CAE@fb.com>
 <C1AA3F44-5589-4751-B023-8A28CC5ACC19@fb.com>
 <ee4b29ec-561c-72de-1da0-57e9a5f9958b@linux.intel.com>
 <040595EA-2283-4FD6-B89D-DB6C9B93610D@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <641686af-cc02-df5a-7fdb-912ead566b06@linux.intel.com>
Date: Fri, 24 Jan 2020 09:24:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <040595EA-2283-4FD6-B89D-DB6C9B93610D@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/23/20 1:37 PM, Vijay Khemka wrote:
> Thanks Jason for quick response.
> Now my another question is can I get this configuration from entity manager for gpio lines or should I have a separate config.json file?

Using EM in this context would allow a single image to support both a 
multi-host system and single host system. If that's possible I'd think 
that would be better. I guess the question becomes if you have some way 
to dynamically detect a multi-host system, that'd be better. If that's 
not possible, then you might be stuck with a hardcoded file.

> 
> ﻿On 1/23/20, 10:48 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
> 
>      On 1/21/2020 3:26 PM, Vijay Khemka wrote:
>      > Sorry, missed to add mailing list.
>      >
>      > *From: *Vijay Khemka <vijaykhemka@fb.com>
>      > *Date: *Tuesday, January 21, 2020 at 2:51 PM
>      > *To: *James Feist <james.feist@linux.intel.com>,
>      > "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
>      > *Subject: *x86 power control for multi host
>      >
>      > Hi James/Jason,
>      >
>      > I am planning to modify x86 power control for multiple host support. As
>      > it has hardcoded name host0 but we want to support for multiple number
>      > of hosts based on configuration. I am thinking of reading different GPIO
>      > lines for each host from a config.json file and then monitor different
>      > gpios. Please suggest that if these configuration, I should read from
>      > entity-manager >
>      > Also looking forward to your thought of this feature addition in
>      > existing daemon or should I have separate repo itself?
>      If it's configurable, then I don't see any reason not to have it in the
>      existing repo.  Is it okay to start there and see how big the impact is
>      before deciding on a separate repo?
>      
>      >
>      > Regards
>      >
>      > -Vijay
>      >
>      
> 
