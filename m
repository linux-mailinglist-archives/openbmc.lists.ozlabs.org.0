Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8D1BE348
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 18:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C3Gf1ymCzDrB2
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 02:03:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=aleksandr.v.tereschenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C3FD12KbzDrB1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 02:02:28 +1000 (AEST)
IronPort-SDR: sw3deiGt45rcEBWqXtvArIODGaRI7RG4j5pvnPBNzWN3wOW5J6F154d4/WxkQiMtSdmC2K1gOx
 nErnuM9o7BUg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 09:02:24 -0700
IronPort-SDR: hRD6xMV48fxFfE1TqKu5mBxk/mW9kS3LAOkyyjV/mwUezh83cq+5iYbd3uGvx72d9R3FV2Fqkh
 f7tCuR0SRJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="459624605"
Received: from avteresc-mobl1.ger.corp.intel.com (HELO [10.213.20.47])
 ([10.213.20.47])
 by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2020 09:02:22 -0700
Subject: Re: ipmi password storage
To: openbmc@lists.ozlabs.org
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <20200422113857.GC196148@heinlein.lan.stwcx.xyz>
 <20200422221943.GJ9295@mauery.jf.intel.com>
 <20200424151522.GC26818@heinlein.lan.stwcx.xyz>
From: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
Message-ID: <99c69b86-4ba6-8fa5-b2e4-ede2dbca2c57@linux.intel.com>
Date: Wed, 29 Apr 2020 18:02:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424151522.GC26818@heinlein.lan.stwcx.xyz>
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

On 24-Apr-20 17:15, Patrick Williams wrote:
> On Wed, Apr 22, 2020 at 03:19:43PM -0700, Vernon Mauery wrote:
>> Pros and cons of this new solution:
>> Pros:
>> 1) Obfuscates passwords more than currently. A hash is even harder to
>> deal with than an encrypted file that has the key sitting right next to
>> it.
>> 2) Item one is a very strong plus
>>
>> Cons:
>> 1) Would require us to write or hack up an HMAC that would work for us.
>> This is not ideal; writing crypto stuff is generally best left to the
>> experts. OpenSSL is trying harder and harder to hide its internal
>> workings from its API, so extracting the hash state is hard. libTomCrypt
>> allows you to do this easier, but still does not have an HMAC function
>> that takes two partial hash states as inputs.
> I don't think that the interfaces we'd be needing to use here will ever
> be deprecated.  The "hash-resume" functions are needed in order to hash
> very large files that cannot be fit in memory.  They're just too useful
> to deprecate.
>
> You are correct that we would be effectively implementing HMAC ourselves
> using the SHA hash functions though.  It _seems_ straight-forward enough
> though on the surface.

Yes, that should be doable and HMAC is generally not that prone to 
implementation problems, so this is reasonable to assume it could be 
done safely using just the plain hash primitives. The major problem with 
this one, from my standpoint, is that the unsalted hashes are these days 
a too easy target for attackers, as hash tables can be (and actually 
are, you can download those I believe) precomputed on password 
dictionaries and without salt it's a BORE-type risk (break once, run 
everywhere) - the hash will be the same on all BMCs if the password is 
the same, so compromising one means compromising others.

>> 3) We would need to store two hashes of each password for both SHA1 and
>> SHA256, for a total of 4 states per password. This greatly reduces the
>> effectiveness of the solution in the first place. Not that we are
>> planning on adding MD5- or MD2-based cipher suites, but those would
>> break the value of this completely.
> Agree on keeping anything like MD5/MD2 out of it.
>
> I'm not a cryptographic expert, but I'm not sure it "greatly reduces"
> the effectiveness.  The addition of the SHA-2 state probably doesn't
> help you reverse or collide the SHA-1 much at all, so this is only
> slightly weaker than SHA-1 itself.
>
> My reading on the SHA-1 algorithm would lead me to believe that SHA-1 state
> is the same as SHA-1(password) itself.  Meaning, by doing this partial
> hash we're not weaking the algorithm at all.

For SHA-1 and SHA2-256/512 the hashing output *is* the hash internal 
state at the end of calculation, so there's no additional compromise 
here from the crypto standpoint. Essentially, this proposal is a hash 
length extension attack, but used for good, not evil :) The problem here 
is with hashes being unsalted, but I agree this is still better than 
encrypting with a static key thay lies nearby. FWIW, that DTLS solution 
looks a bit better to me as it allows us to ditch that password thing 
completely, but if that one is not possible, this one could be the next 
best.

BTW, Vernon, could you please elaborate why it's 4 values that we need 
to store here? One is SHA1, another one is SHA2-256, but what are the 
other two?

regards,
Alexander

