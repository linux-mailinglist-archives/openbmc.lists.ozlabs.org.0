Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB91B0E6B
	for <lists+openbmc@lfdr.de>; Mon, 20 Apr 2020 16:31:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495Tdc1YtczDqPf
	for <lists+openbmc@lfdr.de>; Tue, 21 Apr 2020 00:31:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495TcF2bQ8zDqPf
 for <openbmc@lists.ozlabs.org>; Tue, 21 Apr 2020 00:29:47 +1000 (AEST)
IronPort-SDR: 2cZsjfSTer4q2531x+G/wZ4VOsK0BTG9z3G0Gsc6MPWaMCvxL9LHYR7EAZ8M4mrPhh5UU9YnMj
 0vEEt4YhPT5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 07:29:44 -0700
IronPort-SDR: +r5M25hEy3/qtbRYlMwBl9WuYVRc4YMbzD8HIRc9xGQGIQK/pr1DQZvQcxe4Q0RPmE8acdO20o
 exMi84YcqgwA==
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; d="scan'208";a="289958510"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 07:29:43 -0700
Date: Mon, 20 Apr 2020 07:29:42 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: ipmi password storage
Message-ID: <20200420142942.GI9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <c59d8a92-aabd-1a79-a97a-5947bb7ff4cc@linux.ibm.com>
 <20200414224248.GF9295@mauery.jf.intel.com>
 <CACPK8Xf8q5B2kBoEK0au4sw4F_PfC-XGffj784JemLoZOWQk2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8Xf8q5B2kBoEK0au4sw4F_PfC-XGffj784JemLoZOWQk2g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 16-Apr-2020 06:04 AM, Joel Stanley wrote:
>On Tue, 14 Apr 2020 at 22:43, Vernon Mauery
><vernon.mauery@linux.intel.com> wrote:
>>
>> On 14-Apr-2020 05:03 PM, Joseph Reynolds wrote:
>> >
>> >
>> >On 4/14/20 11:46 AM, Vernon Mauery wrote:
>> >>On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
>> >>>On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
>> >>>
>> >>>Vernon,
>> >>>
>> >>>Is there some background pointers on why IPMI needs to store passwords
>> >>>in a reverable way?  I never understood that.
>> >>
>> >>Sure. I think this is most clearly described in section 13.31 "RMCP+
>> >>Authenticated Key-Exchange Protocol (RAKP)" in the IPMI v2 1.1 spec.
>> >
>> >This may be a bit naive....  Is it possible to expand the RCMP+ spec
>> >with a new cipher suite or similar, to use a mechanism more like HTTPS
>> >or SSH that does not require the server to be able to produce a clear
>> >text password?  Given that IPMI will be used for many years, this
>> >seems worthwhile, and would solve the current problem.
>>
>> While IPMI will not likely be abandoned for many years to come, there
>> are not any plans to update the specification. Redfish is supposed to be
>> the answer, but like IPv4 was supposed to be supplanted by IPv6 long
>> ago, full adoption is still dragging its feet.
>>
>> That being said, I am not opposed to creating a new de-facto standard.
>> In the name of security, I would not be opposed to using modern crypto
>> protocols to establish secure IPMI sessions. This would likely cause the
>> adoption of redfish to be even slower, because the biggest detractor of
>> IPMI would be fixed.
>
>This is a great suggestion.

Thanks! Here is a design doc I wrote up.
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548

--Vernon

>> We have the maintainer of ipmitool as a member of the OpenBMC community,
>> (Alexander Amelkin) so we could even implement both ends of this new
>> de-facto standard. I would suggest a DTLS connection on UDP 623, fully
>> replacing RCMP+.
