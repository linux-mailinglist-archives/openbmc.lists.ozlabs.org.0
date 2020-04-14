Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E91A870C
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 19:10:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491sS15b3tzDr1g
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 03:10:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 491rWJ4GW2zDqmT
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 02:27:54 +1000 (AEST)
IronPort-SDR: nCWPp5rGo2d0qvuezjC7Jzk6qTGBTH0eel7iFjYa2JMfwQ1e7GqU2IaghqGaDpWyPxZSloiZVD
 CrsW0hVd5eaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 09:27:51 -0700
IronPort-SDR: 6u7dQoypmZoWwlqj2ExgJk+d69yyICVIyFLYkQDRkYJ1Hn5oX+iNbCrfFTR/HpVWBRrOTAn/zb
 7RA/mkN9SJKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="243857864"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.249.141.117])
 ([10.249.141.117])
 by fmsmga007.fm.intel.com with ESMTP; 14 Apr 2020 09:27:50 -0700
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Subject: Re: ipmi password storage
To: openbmc@lists.ozlabs.org
References: <20200413230015.GB9295@mauery.jf.intel.com>
Message-ID: <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
Date: Tue, 14 Apr 2020 18:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413230015.GB9295@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

To be more specific, I'm considering two attack scenarios in the below 
comments:
1) The attacker gets into BMC and is able to copy off the data files, 
including ipmi_pass. This IMHO is a more realistic scenario in this case.
2) The attacker gets ipmi_pass file/contents only, without being able to 
retrieve anything else.

Which ones do *you* have in mind? For the sake of discussion, it would 
be helpful to specify them all and see how potential solutions address them.

On 14-Apr-20 01:00, Vernon Mauery wrote:
> Possible Solution
> =================
> Migrate to a solution that uses a key that is longer that does not get 
> written directly to the flash
> 1) S is now computed instead of hard-coded. S=HMAC(MachineId, AppID)

I like the direction and the guiding principle, however from "proper" 
cryptography standpoint, for producing keys, this is not noticeably 
better than the previous solution. The key material is still readily 
available on the filesystem (making points #3 and #4 irrelevant for 
attack scenario #1), so chances are that the adversary who can pull 
/etc/ipmi_pass file, can also pull /etc/machine-id one. In addition (but 
that's really a nitpick in this case with all these much bigger problems 
+ easy to fix), plain HMAC is not a proper and recommended key 
derivation function, an HKDF or one of the NIST constructs from 
SP800-108 should be used instead.

> 2) S is longer (32 bytes instead of 8)
This (and #4) only helps the attack scenario #2, where attacker has to 
brute-force all possible values for S - and I believe that scenario is 
less realictic. But yes, case #2 gets a bit better than before, if we 
disregard the fact that HMAC is not a proper KDF and that MachineID is 
not a proper cryptographic key material [1, last paragraph in 
Description suggests that], which may provide additional advantage to 
the attacker. BTW, machine-id has at most 128 bits of entropy (if 
produced by a proper CSRNG, which I'm not sure about - e.g. I see they 
do some formatting), so practically it's not 32 bytes, but 16 [at most].

So while this new approach does provide some advantage for scenario #2, 
it doesn't address a more important case of #1 and to me it still looks 
like low security. The proper way here is indeed to get some capability 
for storing the keys securely, but I see how this is hard to impossible 
on AST2500 (if that's what we're talking about here), without TrustZone 
or anything similar, or some sort of ROM/bootloader-accessible-only 
part-unique secret, so OTMH I can't propose any viable alternatives for 
a given context (brownfield deployment, backward compatibility), but 
I'll think more about that.

[1] https://www.freedesktop.org/software/systemd/man/machine-id.html

