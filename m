Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E43217EA06
	for <lists+openbmc@lfdr.de>; Mon,  9 Mar 2020 21:30:29 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bqbj2VWtzDqTJ
	for <lists+openbmc@lfdr.de>; Tue, 10 Mar 2020 07:30:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bqZq5VT4zDqSZ
 for <openbmc@lists.ozlabs.org>; Tue, 10 Mar 2020 07:29:37 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 13:29:32 -0700
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="234110023"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 13:29:32 -0700
Date: Mon, 9 Mar 2020 13:29:30 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Anony Mous <obmc.developers@gmail.com>
Subject: Re: IPMI Raw Commands
Message-ID: <20200309202819.GA28744@mauery.jf.intel.com>
References: <CABbLDjOsmeBTWb94DkeJHfUMNHzXEairkP+_rC4g4TRgZUn_7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CABbLDjOsmeBTWb94DkeJHfUMNHzXEairkP+_rC4g4TRgZUn_7g@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06-Mar-2020 04:54 PM, Anony Mous wrote:
>To whom it may concern,

Anony,

Interesting name choice for interacting with an opensource project.

>1. Does openbmc ipmitool support any of the ipmi raw commands? Most of them
>(such as the one below) returns "invalid command".
>ipmitool raw <netfn> <command>
>
>Where:
>netfn = storage = 0x0a
>command = enter sdr respository update mode = 0x2a

ipmitool supports raw commands in part because it the full array of 
commands supported by the IPMI spec is too vast to have them all 
implemented as named commands. In addition, IPMI offers the ability for 
OEMs to define OEM-specific IPMI commands that may have one meaning on 
one BMC and another meaning on a system from a different OEM.

>The above command was executed on the BMC and the following error returned:
>
>"Unable to send RAW command (channel=0x0 netfn=0xa lun=0x0 cmd=0x2a
>rsp=0xc1): Invalid command"

The SDR commands for OpenBMC are defined in the phosphor-host-ipmid repo 
(https://github.com/openbmc/phosphor-host-ipmid) in the 
storagehandler.cpp file. It appears that the enter sdr update mode 
command is not implemented.

>2.  Can the ipmi raw commands be executed on the BMC itself or does it need
>to be executed from an external source (such as a processor connected to
>the BMC)?

As explained above, raw commands are not so much a kind of command as a 
mechanism to send specific bytes to the IPMI execution machinery. From 
the BMC console, it is possible to run raw commands, the same as if you 
are executing them over any other channel (SI, IPMB, RMCP+, etc.)

>3. Do any kind of privilege settings need to be modified in order to
>execute any ipmi raw commands?

It is not that raw commands don't work on OpenBMC, it is that some 
commands are not implemented.

root@intel-obmc:~# ipmitool raw 6 1
 23 00 80 40 02 bf 57 01 00 7b 00 0c 42 ff 21

From the BMC serial console, running ipmitool will execute commands in a 
session-less manner, much like executing commands over the system 
interface from the host or over an IPMB channel. So no privilege check 
is done; the commands run as admin by default.

--Vernon
