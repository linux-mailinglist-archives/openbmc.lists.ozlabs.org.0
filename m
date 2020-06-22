Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5120335A
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 11:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r4182PJVzDqWj
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 19:31:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r40L5RVczDqWX
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 19:30:50 +1000 (AEST)
IronPort-SDR: Ju8oqr1mfcTgL1Tq1n7RKKHlQEwQQ/okRZgK3DOGrIxkSsxsLs9HjCz3RSjTnw2jd1L/q6VWz5
 7/926Z4Q6iBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="141219609"
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="141219609"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 02:30:48 -0700
IronPort-SDR: NLRHaHXfR9lrOaOpeh3om4F+XTkKYe2oKywBEWmlikPKAmy9lg6LOr0AJLnIucI+YZas9gUPar
 yUXHqo2ebyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,266,1589266800"; d="scan'208";a="384436504"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.213.9.176])
 ([10.213.9.176])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2020 02:30:47 -0700
Subject: Re: OpenBMC 2.8 security audit results
To: openbmc@lists.ozlabs.org
References: <a31fcd71-460d-86c4-7a07-b7c6800aa7be@linux.ibm.com>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <2abafb26-29d5-0a0b-7969-19b32556adc5@linux.intel.com>
Date: Mon, 22 Jun 2020 11:30:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <a31fcd71-460d-86c4-7a07-b7c6800aa7be@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20-Jun-20 03:26, Joseph Reynolds wrote:
> Here are the results from my "security audit" on the planned OpenBMC 
> 2.8 release.  The results are not intended as a complete analysis, but 
> only offer highlights into the BMC's security configuration. 
> Contributions are appreciated.
> The script to perform these tests was presented here: 
> https://lists.ozlabs.org/pipermail/openbmc/2020-April/021186.html and 
> was followed more-or-less.
>
> $ echo "Checking test host openssl version"
> Checking test host openssl version
> $ openssl version
> OpenSSL 1.0.2k-fips  26 Jan 2017
>
I'm not sure I get this one - is "test host" a BMC or the one where the 
test script is being run? If the former, this is really old, no longer 
publicly supported by the OpenSSL team and has multiple CVEs against it 
[1], so should be upgraded.

[1] https://www.openssl.org/news/openssl-1.0.2-notes.html


> debug1: Remote protocol version 2.0, remote software version 
> dropbear_2019.78

There's a very recent 2020.79, which has one CVE fix and some useful 
changes (e.g. using getrandom(), AES-GCM and so on), would be good to 
update it for the next release.


> observation: The BMC SSH server offers the algorithms shown above. 
> Should we remove HMAC-SHA1?

While it's not [yet] formally broken in the HMAC setting, IMO SHA1 is 
"broken enough" to remove it everywhere, so yes, I'd vote for that.


>
> When logged into the BMC via SSH as testuser:
> testuser$ ls -la /home/root
> drwxr-xr-x    2 root     root           384 Jun 18 00:00 .
> drwxr-xr-x    5 root     root           368 Jun 20 00:23 ..
> -rw-------    1 root     root         12437 Jun 20 00:24 .bash_history
> -rw-r-----    1 root     root           459 Jun 19 20:19 
> bmcweb_persistent_data.json
>
> observation: Non-root user can list files in /home/root; that seems 
> undesireable.  The files themselves are not readable.

Agree, it doesn't seem necessary, so should be restricted


> /etc/ssl/certs:
> drwx------    2 root     root           160 Jun 10 06:22 authority
> drwx------    2 root     root           304 Jun 10 06:23 https
>
> observation: Certificates under /etc/ssl are protected from reading

This actually seems to be surplus - *certificates* are public by 
definition, it's the private parts of them (private keys corresponding 
to public ones in certificates) that need protection like that.


regards,
Alexander

