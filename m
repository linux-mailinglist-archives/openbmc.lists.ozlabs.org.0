Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D9F3E19A9
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 18:36:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgZ512DX2z3d7c
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 02:36:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgZ4n14lQz3cKV
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 02:36:39 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="193789961"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="193789961"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 09:35:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="467572580"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2021 09:35:34 -0700
Received: from [10.209.98.69] (jmbills-MOBL.amr.corp.intel.com [10.209.98.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6132B580801
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 09:35:34 -0700 (PDT)
Subject: Re: Requesting maintainer privilege on smbios-mdr repo
To: openbmc@lists.ozlabs.org
References: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
 <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <d57f2680-e196-eb4b-bb80-5ba5f8a9d81c@linux.intel.com>
Date: Thu, 5 Aug 2021 10:35:33 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 8/5/2021 7:09 AM, Brad Bishop wrote:
> On Wed, 2021-08-04 at 13:42 -0600, Bills, Jason M wrote:
>>
>> Do you have permissions to add me to the list, so I can update it with
>> the new maintainers from Intel?
> 
> Done!  I hope the existing maintainers are ok with it...
Thanks!

I plan to update the list to match the MAINTAINERS file in the 
smbios-mdr repo, so everything should be in line with what is already 
approved in code review (including removing myself once everything is 
working :)).

> 
> -brad
> 
