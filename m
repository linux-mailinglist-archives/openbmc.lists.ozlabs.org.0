Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEC1B5006
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 00:20:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496vyP0v01zDqlP
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 08:20:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496vxg0YFyzDqhm
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 08:19:49 +1000 (AEST)
IronPort-SDR: Y205AaZ/ld7Mb+FPnvZeviw6UHjI2/pzgfaEEY8xRnsh33UiLCxanqTWq1nH/DvIsu5OCCqSMt
 uYj7RvqxFBTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:19:45 -0700
IronPort-SDR: wlo4Uz5nc8IC32u3yv+HPqqZ2gsxNEXqSa4YOZpgeicstjrOYfbmvdExotUVt7SJwVWvL5pOiN
 G2rq400QZAmw==
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="430090404"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:19:45 -0700
Date: Wed, 22 Apr 2020 15:19:43 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: ipmi password storage
Message-ID: <20200422221943.GJ9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
 <20200422113857.GC196148@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200422113857.GC196148@heinlein.lan.stwcx.xyz>
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

On 22-Apr-2020 06:38 AM, Patrick Williams wrote:
>Vernon,
>
>Thanks for the info.  It's taken a few days before I could find a time
>slot to think about this in detail.
>
>On Tue, Apr 14, 2020 at 09:46:10AM -0700, Vernon Mauery wrote:
>> On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
>> >On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
>> Specifically, the RAKP3 message (User->BMC) contains an HMAC of the
>> various parts of the exchanged session (User random number, session ID, Role,
>> Username) using the password as the key for the HMAC. The BMC needs to
>> compute this same HMAC to compare (this is the main authentication
>> challenge).
>>
>> Then, the session key is generated using an HMAC of similar
>> data (BMC random number, user random number, role, username) using
>> either the user password or the channel password. Almost nobody uses the
>> channel password, which is good because it allows for simple privilege
>> escalation and session hijacking.
>
>If I understand this right, the algorithm uses this to create a symetric
>key for the session:
>    HMAC(password, hash(pseudo_random_session_data))
>
>The client gives some data to seed the session-data and the server gives
>some data to seed the session-data, so that part is unique per
>connection.  The part that is constant, and that they both have, is the
>key to the HMAC.  Do I have that right?

Yes.

>The HMAC algorithm, at least for SHA-1/2, is a two-phase hash call, but
>the key is always used at the front of the first hash phase.  The SHA
>hash algorithms allow you to do a partial hash, extract the hash state,
>and then resume the hash (See SHA1_Init / SHA1_Update functions in
>openssl/sha1.h as example).  Rather than calling the OpenSSL HMAC
>directly, can't we rewrite it such that it uses the partial hash on the
>key as the starting point rather than the raw password?

I had to code up a quick test to make sure, but yes, it is possible to 
do this.

>This approach would allow us to save a SHA-1 + SHA-2 hash'd version of
>the password rather than the raw (or even obfuscated) password.  It
>isn't as secure as the normal crypt methods because we cannot salt them,
>but we could certainly obfuscate the hash-state in a similar method to
>what you already proposed.

Pros and cons of this new solution:
Pros:
1) Obfuscates passwords more than currently. A hash is even harder to 
deal with than an encrypted file that has the key sitting right next to 
it.
2) Item one is a very strong plus

Cons:
1) Would require us to write or hack up an HMAC that would work for us. 
This is not ideal; writing crypto stuff is generally best left to the 
experts. OpenSSL is trying harder and harder to hide its internal 
workings from its API, so extracting the hash state is hard. libTomCrypt 
allows you to do this easier, but still does not have an HMAC function 
that takes two partial hash states as inputs.
2) Is not backwards compatible with any of our current password storage 
mechanisms. This is workable, but would likely take some time to stage 
things so that they would work better without breaking everything.
3) We would need to store two hashes of each password for both SHA1 and 
SHA256, for a total of 4 states per password. This greatly reduces the 
effectiveness of the solution in the first place. Not that we are 
planning on adding MD5- or MD2-based cipher suites, but those would 
break the value of this completely.

So pro-1 is good. but con-2 and con-3 are bad. Con-2 we can deal with, 
but con-3 brings down the value of pro-1.

--Vernon
