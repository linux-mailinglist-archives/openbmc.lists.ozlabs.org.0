Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97681A8A8A
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 21:15:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491wDP6gjpzDqXC
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 05:15:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491w7h1vsbzDqvP
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 05:11:11 +1000 (AEST)
IronPort-SDR: r05ZHI10Vh9iEBsE+ycylf6idWdfKiaScz+bbcDwvsu6KIbB5OZxPYzKkE4W5djxyupecRa4I2
 nLickDRSGzXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:11:07 -0700
IronPort-SDR: Zgqil9bXBdviGyGgAAyiIU/lLosXFIJgSEanskG/kAtW57pbmxxLRIID2m3fwNXLdGMSGXD/Jl
 gUMrQtYqYfOQ==
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="400051754"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:11:07 -0700
Date: Tue, 14 Apr 2020 12:11:06 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Subject: Re: ipmi password storage
Message-ID: <20200414191106.GD9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
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

On 14-Apr-2020 06:27 PM, Alexander Tereschenko wrote:
>To be more specific, I'm considering two attack scenarios in the below 
>comments:
>1) The attacker gets into BMC and is able to copy off the data files, 
>including ipmi_pass. This IMHO is a more realistic scenario in this 
>case.
>2) The attacker gets ipmi_pass file/contents only, without being able 
>to retrieve anything else.
>
>Which ones do *you* have in mind? For the sake of discussion, it would 
>be helpful to specify them all and see how potential solutions address 
>them.

Attack one is the most likely, since if you can read one file, you can 
probably get any/all of them.

>On 14-Apr-20 01:00, Vernon Mauery wrote:
>>Possible Solution
>>=================
>>Migrate to a solution that uses a key that is longer that does not 
>>get written directly to the flash
>>1) S is now computed instead of hard-coded. S=HMAC(MachineId, AppID)
>
>I like the direction and the guiding principle, however from "proper" 
>cryptography standpoint, for producing keys, this is not noticeably 
>better than the previous solution. The key material is still readily 
>available on the filesystem (making points #3 and #4 irrelevant for 
>attack scenario #1), so chances are that the adversary who can pull 
>/etc/ipmi_pass file, can also pull /etc/machine-id one. In addition 
>(but that's really a nitpick in this case with all these much bigger 
>problems + easy to fix), plain HMAC is not a proper and recommended 
>key derivation function, an HKDF or one of the NIST constructs from 
>SP800-108 should be used instead.

Cool. I did not know about HKDF. I will look into that.

>>2) S is longer (32 bytes instead of 8)
>This (and #4) only helps the attack scenario #2, where attacker has to 
>brute-force all possible values for S - and I believe that scenario is 
>less realictic. But yes, case #2 gets a bit better than before, if we 
>disregard the fact that HMAC is not a proper KDF and that MachineID is 
>not a proper cryptographic key material [1, last paragraph in 
>Description suggests that], which may provide additional advantage to 
>the attacker. BTW, machine-id has at most 128 bits of entropy (if 
>produced by a proper CSRNG, which I'm not sure about - e.g. I see they 
>do some formatting), so practically it's not 32 bytes, but 16 [at 
>most].

Yes, this was mostly a minor point. And yes, the entropy in S is 
limited by machine-id, but either one is better than a hard-coded 8-byte 
ASCII string :)

>So while this new approach does provide some advantage for scenario 
>#2, it doesn't address a more important case of #1 and to me it still 
>looks like low security. The proper way here is indeed to get some 
>capability for storing the keys securely, but I see how this is hard 
>to impossible on AST2500 (if that's what we're talking about here), 
>without TrustZone or anything similar, or some sort of 
>ROM/bootloader-accessible-only part-unique secret, so OTMH I can't 
>propose any viable alternatives for a given context (brownfield 
>deployment, backward compatibility), but I'll think more about that.
>
>[1] https://www.freedesktop.org/software/systemd/man/machine-id.html

Really, I don't see a real solution without some kind of secure storage, 
which we don't have at this time on the ast2500. While that is not the 
only machine running OpenBMC, ideally the solution would be platform 
independent so that any machine could do it. Maybe that requirement 
would be that it supported some minimal cryptographic features or 
something (like trustzone support). But in the meantime, some sort of 
solution that security researchers will not rake us over the coals for 
would be nice. Maybe there isn't one. Some minimal configuration that is 
better than writing the passwords in plain text.

--Vernon


