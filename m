Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FB726AC
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:33:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjCL20zBzDqP6
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:33:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tXCZ66sdzDqFK
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 07:48:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 14:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="197277411"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.132.72])
 ([10.251.132.72])
 by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2019 14:48:05 -0700
Subject: Re: phosphor-host-ipmid sensor SDRs on dbus
To: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, tomjoseph@in.ibm.com,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 Ofer Yehielli <ofery@google.com>, Kun Yi <kunyi@google.com>
References: <CAO=notwC5_-wVBOONXrO9R0eoR0MDOjmt1ZAc_J9XJvvXd-G7g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <70879c4f-33c4-8e99-00d6-ca7ad8ad18c2@linux.intel.com>
Date: Tue, 23 Jul 2019 14:48:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notwC5_-wVBOONXrO9R0eoR0MDOjmt1ZAc_J9XJvvXd-G7g@mail.gmail.com>
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

On 7/23/2019 1:40 PM, Patrick Venture wrote:
> I sent out an email indicating that we need to make sensors somewhat
> dynamic in phosphor-host-ipmid, and either using json or dbus was a
> reasonable approach.  I think json would be easier, but, for those
> using entity-manager, perhaps having the SDR information supported in
> some way associated with the dbus output might be useful.

In intel-ipmi-oem we were able to use the max / min values to generate 
an SDR. The only real hold ups for global adoption I believe were:
1. static sensor numbers were needed.
2. it was implemented using doubles for sensor numbers

If you had some configuration so that you could make these things 
non-generated if you wished, this might be useful to you.

https://github.com/openbmc/intel-ipmi-oem/blob/edf25e614919d0b379b885384bcdac987580b844/src/sensorcommands.cpp#L1259

-James

> 
> Idea: Given a sensor, read the SDR from dbus.
> Problem: association of a sensor id with a sensor on dbus -- maybe
> some search step is run once that caches everything and listens for
> change (similar to what James did with phosphor-pid-control)...
> 
> I'm just throwing out ideas without full design changes because I want
> to get a sense of where the preferences lie before really digging into
> what changes are required.
> 
> It would support both types (like dbus configuration in phosphor-pid-control).
> 
> Patrick
> 
