Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E381523FE
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 01:13:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C28n1qqfzDqLH
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 11:13:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C2855PM3zDqL4
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 11:12:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 16:12:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,403,1574150400"; d="scan'208";a="378583204"
Received: from unknown (HELO [10.241.225.77]) ([10.241.225.77])
 by orsmga004.jf.intel.com with ESMTP; 04 Feb 2020 16:12:47 -0800
Subject: Re: BMCWeb: rate-limit authentication failures
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <60250182-21b5-8bf2-9995-413c266f075f@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b8938058-1f51-1fd9-ff41-8c20a0b392cd@linux.intel.com>
Date: Tue, 4 Feb 2020 16:12:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <60250182-21b5-8bf2-9995-413c266f075f@linux.ibm.com>
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
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/4/2020 2:41 PM, Joseph Reynolds wrote:
> I would like to enhance BMCWeb to rate-limit password-based 
> authentication attempts (footnote1) to address [CWE-307][].  [Broken 
> Authentication][] is an OWASP top 10 item.  The goal is to protect 
> against CWE-307 without causing denial of service.  Specifically, when 
> excessive authentication attempts are happening, legitimate users should 
> be able to access the BMC (specifically an admin can login), and 
> degraded BMC performance is acceptable.
> 
> The main idea for the design is to allow authentication at full speed, 
> and rate-limit only when needed.   This is consistent with the approach 
> OWASP outlines.
> 
> Perhaps the design can be as simple as recording the 10 most recent 
> authentication failures (steady_clock time only, having them time out 
> after a minute) to define "excessive", and using the timestamp of the 
> most recent failure to determine when the next attempt will be allowed. 
> When authentication is requested but not allowed, return HTTP status 
> code 429 (Too Many Requests) with HTTP response header "Retry-After: 
> 3".  ==> This will slow down attackers (for example, to 30 tries per 
> minute, even when multiple connections are used) and allow legitimate 
> users to compete for authentication attempts.
> 
> However, I think even this apparently simple design might be tricky to 
> get right.  Is there an open source solution we can use?  What do you 
> think?  Let me know if this is important to you.  I would like to hear 
> ideas how to proceed.

I know we plan to look into this in the near future.

> 
> - Joseph
> 
> <snip/>TL;DR (too long; don't read):
> 
> A counterpart to this design is to delay any failed authentication 
> attempt for a few seconds.  This is intended to slow down malfunctioning 
> network agents that repeatedly fail to authenticate to the BMC.  This 
> won't slow down attackers who can use multiple connections to the BMC.
> 
> I looked at using Linux-PAM.  For example, [OpenBMC uses pam_tally2][] 

Did you look into Pam_abl? Haven't looked much into it, but reading a 
couple articles it looks promising. Using lockouts based on host instead 
of account seems like it would be a good approach.

> but does not configure account lockouts.  I don't want to pursue using 
> the pam_tally2 lockout mechanism because that can lead to denial of 
> service.  I believe rate-limiting is a better approach.
> 
> I only want to protect access via BMCWeb.  The protection techniques may 
> also apply to network IPMI and SSH, but the direction is to disable 
> these accesses, so I am less interested.  Access via the BMC's serial 
> console would not be protected.  Access via the BMC's host should have 
> similar protections, but I am not investigating that now.
> 
> CWE-307 is a problem only because OpenBMC offers password-based 
> authentication without requiring multi-factor authentication (MFA). 
> Disabling password-based auth remains a popular use case, and OpenBMC 
> has no MFA capabilities.  So I need CWE-307 protection as a stop-gap 
> solution.
> 
> References and footnotes:
> [CWE-307]: https://cwe.mitre.org/data/definitions/307.html
> [OpenBMC uses pam_tally2]: 
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth 
> 
> (footnote1): BMCWeb's password-based authentication includes Basic Auth, 
> login via /login, and creating a Redfish session.  It does not include 
> authentication via mTLS or using an X-Auth-Token or a cookie from an 
> established session.
> [Broken Authentication]: 
> https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A2-Broken_Authentication 
> 
