Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D4E78A9
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 19:41:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4723TR458bzDqWd
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 05:41:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=apparao.puli@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4723Sg4TBTzDrcR
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 05:40:43 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 11:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="374308872"
Received: from apuli-mobl.gar.corp.intel.com (HELO [10.252.95.34])
 ([10.252.95.34])
 by orsmga005.jf.intel.com with ESMTP; 28 Oct 2019 11:40:38 -0700
Subject: Re: Could someone help to review bmcweb code?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
From: "Puli, Apparao" <apparao.puli@linux.intel.com>
Message-ID: <0e83ea88-f057-c1b9-f968-c503a3486945@linux.intel.com>
Date: Tue, 29 Oct 2019 00:10:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

On 10/28/2019 11:17 PM, Brad Bishop wrote:
>> On Oct 28, 2019, at 1:08 PM, James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 10/28/19 5:51 AM, Carol Wang wrote:
>>> Hi,
>>> I wanna know who can help to review bmcweb code? I'm not sure if the list of maintainers I added
>>> is changed or not. This is the link of my coding about setting PowerCap. ---->
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/26223
>> It looks like this patch has been -1ed for over a week,
> Actually it got the -1 just last Wednesday.  Prior to that it had a +1 without any -1s for 6 days.
>
>> generally the maintainers will not look at a patch that has been -1ed.
> I don’t agree with this and I’d suggest you don’t make this your general policy.  If you do this, then you are going to miss reviewers giving people bad advice, which the reviewers will then implement at great waste of time.  I see kernel maintainers correcting bad advice from reviewers all the time.
>
>> I would work with the community to come to resolution and get some +1s.
> Carol responded to the feedback (with questions, that remain unanswered) the same day it was given, 5 days ago.  I’d say "working with the community" is exactly what Carol is trying to do here.

I am waiting for new patch-set from Carol to the one's which was 
mentioned that those are going to be modified and loaded new patch set.

