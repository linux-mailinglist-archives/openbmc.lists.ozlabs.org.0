Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 130F51A8A92
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 21:17:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491wHP1v0czDqvv
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 05:17:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491wCv4rV4zDqvn
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 05:14:49 +1000 (AEST)
IronPort-SDR: YBTAsTViDTx9oBK6eIPapOZuLnsxdPp4iRZHu5H+PU4QtRdfMjZRH39+FCze2YErfsWw0qwJq7
 gUh/ibwAloYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:14:45 -0700
IronPort-SDR: C1RpqG3/7yYN/kmRlBPOLIGFpcXPRYqb6RcHDqTYWMXaY8CfKzl2ekvjK3mBcYIFUTBnIhreK9
 +dDzuH2TdKig==
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="288312798"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:14:45 -0700
Date: Tue, 14 Apr 2020 12:14:44 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Milton Miller II <miltonm@us.ibm.com>
Subject: Re: ipmi password storage
Message-ID: <20200414191444.GE9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <OFED1A87B9.D16D66BD-ON0025854A.004EDFC4-0025854A.00634C8E@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <OFED1A87B9.D16D66BD-ON0025854A.004EDFC4-0025854A.00634C8E@notes.na.collabserv.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14-Apr-2020 06:04 PM, Milton Miller II wrote:
>On Apr 13, 2020 around 6:01PM in some time zone, Vernon Mauery wrote:
>>
>>Internally, an issue was raised that basically says that the
>>mechanism
>>by which we are storing the IPMI passwords on the BMC is
>>insufficiently
>>obfuscated. I have come up with a patch set that resolves this at the
>>
>>expense of no downgrading the BMC without the side-effect of losing
>>all
>>IPMI passwords. I would like to know what the community thinks about
>>usability vs. security in this scenario.
>
>...
>
>>The migration from the old mechanism to the new could be done simply>by
>>using the new key on the next write to the /etc/ipmi_pass file. After
>>a
>>firmware update to this new code, a password change would trigger a
>>decrypt of the /etc/ipmi_pass file, a modification of the plain text,
>>
>>and a re-encryption of the data. If it reads the 'legacy' key in and
>>writes out the data using the new key mechanism and deletes the
>>legacy
>>key, it would use the new key mechanism from that point onward.
>>However,
>>this would cause any downgrades to prior versions to fail to decrypt
>>the
>>/etc/ipmi_pass file, thereby losing all the ipmi passwords. This is
>>not
>>ideal, but could possibly be mitigating by truncating the new
>>machine-id
>>derivative password to 8 bytes and storing it in the /etc/key_file
>>instead of just deleting it. This might improve security only
>>slightly
>>at for the price of a better user experience.
>>
>
>I'll point out the code to handle the new password could be added
>before the cdoe to use the new method, allowing test and revert
>until the users are upgraded to the new method.  It does require
>both methods to be supported.

Yes, it looks like any sort of change here would need to be a staged 
change to reduce the disruption.

>I didn't follow why currently all openbmc systems end up with
>the same encryption^Wobsfucation for what that is worth.

Unless the build has a bbappend that changes the contents of the 
key_file that is a part of the pam-ipmi package, all of the builds will 
contain that same key_file. I can't say for sure how many builds have 
this already, but I did not see much documentation around that fact that 
would have spurred people to take action, so it is my assumption that 
most builds would use the default.

--Vernon
