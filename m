Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D8E78C0
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:49:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723fY3c1WzDrfK
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:49:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723dr1L65zDr0y
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:48:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 11:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="399538963"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Oct 2019 11:48:44 -0700
Subject: Re: Could someone help to review bmcweb code?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, apparao.puli@linux.intel.com
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
 <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
 <D2F9CCC1-AAB3-4365-9C5A-E4764D7D099A@fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <3879e352-3d6f-6742-b94c-678b6ba7e286@linux.intel.com>
Date: Mon, 28 Oct 2019 11:48:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <D2F9CCC1-AAB3-4365-9C5A-E4764D7D099A@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/28/19 11:42 AM, Brad Bishop wrote:
>> However a direct email to Appu would be good to get him to reply to comments.
> 
> I don’t do direct email and I ask my team not to as well, so I’ll do it here - Appu could you reply to Carol’s questions?

I agree.. I mean direct CC'ing the list :)



