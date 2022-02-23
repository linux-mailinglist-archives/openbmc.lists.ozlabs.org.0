Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4B4C1B09
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 19:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3lCx6QPbz3c7S
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 05:38:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lPLcKdbc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lPLcKdbc; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3lCY0pVSz3bV6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 05:37:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645641481; x=1677177481;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AR3lXJW2KcD5AFpAcoh6ZmthqI7ii5jDjja5Z1MyUlY=;
 b=lPLcKdbcz+r2C4KAmYwVc3OUbf2qHBPwzgcXfZt79OjPmeRW6K7Lj9Ph
 OaAEKm5zy/EP2Rcr7dfyV3Xozt+oe/3+a2uQMegbISUysOZ2djSiaNSx3
 QVVvpSCYGdRxi3me9npGqjpiQRaRadPjuG3VN/h4qpF8An+Q2MWM00Heh
 JtZgoOQPW9EZtUXcj8rtJyQp0ieywLrdfYBxUwcibjl9vlwYlWhLYU9Rn
 zdtw4bT6HahsCxivgH0JXR5XRQ/apg0wIXt5QxYEE1ak/W+wfEshaZWmO
 uGOfMY+DQ5Ej4Q9gTw1ggWo8LdUjUR/ozx8ED+R7/3uXh8/uak7PK2kOc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="239445717"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="239445717"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="782897440"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2022 10:36:54 -0800
Received: from [10.212.187.244] (jmbills-MOBL.amr.corp.intel.com
 [10.212.187.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1C9E1580295
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 10:36:51 -0800 (PST)
Message-ID: <3402647e-d195-4537-1279-bf4f7839161e@linux.intel.com>
Date: Wed, 23 Feb 2022 11:36:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Checking for network online
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
 <YhY7Kxgg6ew0HdUR@heinlein>
 <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <112c8819-24bc-2a24-45a3-9c919088f43a@linux.intel.com>
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



On 2/23/2022 10:44 AM, Jiaqing Zhao wrote:
> On 2022-02-23 21:48, Patrick Williams wrote:
>> On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
<snip>...
> 
> My understanding is that in OpenBMC, the propose to use rsyslog is to format the Redfish and IPMI SEL logs from system journal. The "r" of rsyslogd is not used in most cases.
> 

Just a nit-picky side-note: The "r" in rsyslogd is for "rocket-fast".  I 
don't believe rsyslogd is inherently designed for remote logging.
https://www.rsyslog.com/
