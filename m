Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB351A6F95
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 01:01:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491PHR43JSzDqPF
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 09:01:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491PGY696ZzDqFw
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 09:00:19 +1000 (AEST)
IronPort-SDR: GF3pEfKo02HDzvh3ByNs9nqWxV/bQqvrJC37FZMtJUgObGUZ2C/RVRMtQSMIVLp1UCS4TumCt5
 6xxU3M1b2VVQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 16:00:17 -0700
IronPort-SDR: C6tFES/6cLzzlo+WReJBrXbqTTD2mny0qaSVAQpgzCfcHpVJ8bmmNC22tu9F4kWDIujMs1PCAw
 IwXeBbIvTvHQ==
X-IronPort-AV: E=Sophos;i="5.72,380,1580803200"; d="scan'208";a="271219091"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2020 16:00:16 -0700
Date: Mon, 13 Apr 2020 16:00:15 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: OpenBMC Development <openbmc@lists.ozlabs.org>
Subject: ipmi password storage
Message-ID: <20200413230015.GB9295@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Internally, an issue was raised that basically says that the mechanism 
by which we are storing the IPMI passwords on the BMC is insufficiently 
obfuscated. I have come up with a patch set that resolves this at the 
expense of no downgrading the BMC without the side-effect of losing all 
IPMI passwords. I would like to know what the community thinks about 
usability vs. security in this scenario.

Current Implementation
======================
1) If the user is part of the ipmi group (/etc/group) then when the user 
changes their password, pam-ipmisave.so intercepts the password as a one 
of the PAM layers and saves it, encrypted, to /etc/ipmi_pass.
2) Encryption (obfuscation, because we don't really have a secure 
mechanism of storing secret keys), is done like this:
   a) read 8 bytes (S) from /etc/key_file (currently pre-loaded with "OPENBMC=")
   b) create a random value H (read from /dev/urandom)
   c) create the AES-CBC secret key K=HMAC-SHA256(S, H)
   d) encrypt the list of username:password data using K
   e) store H along with the encrypted data in /etc/ipmi_pass
3) reading the password (for establishing IPMI RMCP+ sessions)
   a) read 8 bytes (S) from /etc/key_file
   b) read H from /etc/ipmi_pass
   c) compute the AES-CBC secret key K=HMAC-SHA256(S, H)
   d) decrypt and verify the contents of /etc/key_file


There are many issues with this mechanism, but we cannot fix all of them 
without some secure mechanism for storing secret keys. That is why 
really, at best, this is obfuscation, not encryption. The data is not in 
plain text, it takes some work to get to it. More than xor or rot13, but 
not so much that a person could do it with a bash script.
1) the default /etc/key_file is the same for every BMC built with the 
default settings (changing this requires a bbappend for pam-ipmi). This 
means the /etc/key_file could basically not exist; all you need is the 
algorithm and /etc/ipmi_pass.
2) the size of the /etc/key_file is also not really great. Even if it 
was different on every machine, computing only 2^64 possibilities is not 
so hard.


Possible Solution
=================
Migrate to a solution that uses a key that is longer that does not 
get written directly to the flash
1) S is now computed instead of hard-coded. S=HMAC(MachineId, AppID)
2) S is longer (32 bytes instead of 8)
3) S is not written to flash, because it can be computed
4) S is different for every machine because it is a derivative of 
/etc/machine-id

The migration from the old mechanism to the new could be done simply by 
using the new key on the next write to the /etc/ipmi_pass file. After a 
firmware update to this new code, a password change would trigger a 
decrypt of the /etc/ipmi_pass file, a modification of the plain text, 
and a re-encryption of the data. If it reads the 'legacy' key in and 
writes out the data using the new key mechanism and deletes the legacy 
key, it would use the new key mechanism from that point onward. However, 
this would cause any downgrades to prior versions to fail to decrypt the 
/etc/ipmi_pass file, thereby losing all the ipmi passwords. This is not 
ideal, but could possibly be mitigating by truncating the new machine-id 
derivative password to 8 bytes and storing it in the /etc/key_file 
instead of just deleting it. This might improve security only slightly 
at for the price of a better user experience.

I know that some companies using OpenBMC have products with users out in 
the field, so it is not great to make changes like this. Also, it is not 
great to have low-grade security. So here I am, writing to ask for 
opinions and options.

--Vernon
