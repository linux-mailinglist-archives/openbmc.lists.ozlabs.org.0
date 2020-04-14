Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D81A8EC0
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:48:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920yL23TWzDqtW
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:48:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920xf6kjlzDqjk
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:47:50 +1000 (AEST)
IronPort-SDR: DnnDPYOhp/pkM2+3cC3v50sNpYx6bK8tORPqKtX35VW/zNdOG9NCJ4Dl30FISd1mmemscIGmUu
 VWbpKA5LyF7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:47:47 -0700
IronPort-SDR: TaWTvQQEvW0xj22q2pq0ILFqUCdH16Yzrx/5+AvWfXw5/fqHZjvztlwye10gU2EuMuSgtHV+KM
 JGop+IM4/OCg==
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="288367795"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:47:47 -0700
Date: Tue, 14 Apr 2020 15:47:46 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: ipmi password storage
Message-ID: <20200414224746.GH9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <OFED1A87B9.D16D66BD-ON0025854A.004EDFC4-0025854A.00634C8E@notes.na.collabserv.com>
 <20200414191444.GE9295@mauery.jf.intel.com>
 <aa6d601a-998b-8ed0-24bb-27e5fdf0828f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aa6d601a-998b-8ed0-24bb-27e5fdf0828f@linux.ibm.com>
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

On 14-Apr-2020 05:30 PM, Joseph Reynolds wrote:
>>>>key, it would use the new key mechanism from that point onward.
>>>>However,
>>>>this would cause any downgrades to prior versions to fail to decrypt
>>>>the
>>>>/etc/ipmi_pass file, thereby losing all the ipmi passwords. This is
>>>>not
>>>>ideal, but could possibly be mitigating by truncating the new
>>>>machine-id
>>>>derivative password to 8 bytes and storing it in the /etc/key_file
>>>>instead of just deleting it. This might improve security only
>>>>slightly
>>>>at for the price of a better user experience.
>>>>
>>>
>>>I'll point out the code to handle the new password could be added
>>>before the cdoe to use the new method, allowing test and revert
>>>until the users are upgraded to the new method.=A0 It does require
>>>both methods to be supported.
>>
>>Yes, it looks like any sort of change here would need to be a staged=20
>>change to reduce the disruption.
>
>Thanks for handling this issue -- I appreciate it.=A0 Don't take this=20
>the wrong way, but...
>If this change provides little value and causes upgrade issues, would=20
>it be better to avoid having an upgrade path?
>Instead, use this new approach for new major release that requires a=20
>fresh install and upgrading is not an option.
>

It doesn't cause upgrade issues, it would cause downgrade issues. While=20
I am not personally opposed to not downgrading (always move forward),=20
not all IT shops have the same opinion. I thought it might be nice to=20
offer an opportunity to support downgrades.

--Vernon

>>>I didn't follow why currently all openbmc systems end up with
>>>the same encryption^Wobsfucation for what that is worth.
>>
>>Unless the build has a bbappend that changes the contents of the=20
>>key_file that is a part of the pam-ipmi package, all of the builds=20
>>will contain that same key_file. I can't say for sure how many=20
>>builds have this already, but I did not see much documentation=20
>>around that fact that would have spurred people to take action, so=20
>>it is my assumption that most builds would use the default.
>
>From previous emails in this thread, it doesn't seem like having each=20
>BMC having an unique key_file would help much.=A0 Nevertheless, I've=20
>added this to my notes for BMC build considerations:=20
>https://github.com/ibm-openbmc/dev/issues/1531#issuecomment-613676676
>
>- Joseph
>
>>
>>--Vernon
>
