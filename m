Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7F1A8EBD
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:45:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920tS2ct1zDqlw
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:45:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920sj4GFQzDqM9
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:44:24 +1000 (AEST)
IronPort-SDR: 8Ecwrp7iEmQirXuNT9Z9iqMUUbr4ixa4feWUlUnzjb8r7fjMwvr1FRMAFKAQAyuc5d8SfoAFCC
 o2LAScSj+4hw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:44:21 -0700
IronPort-SDR: hjkuvP+AXNNAmLwe0IDVq+pPN/aDguMJG9OfXWKUYKzWKi4YVtgWmCJemQRlygfFy5bF1EkIxo
 +8nmbZN8vc3g==
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="288367107"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 15:44:21 -0700
Date: Tue, 14 Apr 2020 15:44:19 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: ipmi password storage
Message-ID: <20200414224419.GG9295@mauery.jf.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
 <20200414191106.GD9295@mauery.jf.intel.com>
 <aee8d5c8-b5cf-32d8-b80d-36443182ab58@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aee8d5c8-b5cf-32d8-b80d-36443182ab58@linux.ibm.com>
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

On 14-Apr-2020 05:18 PM, Joseph Reynolds wrote:
>On 4/14/20 2:11 PM, Vernon Mauery wrote:
>>On 14-Apr-2020 06:27 PM, Alexander Tereschenko wrote:
>>>To be more specific, I'm considering two attack scenarios in the=20
>>>below comments:
>>>1) The attacker gets into BMC and is able to copy off the data=20
>>>files, including ipmi_pass. This IMHO is a more realistic scenario=20
>>>in this case.
>>>2) The attacker gets ipmi_pass file/contents only, without being=20
>>>able to retrieve anything else.
>>>
>>>Which ones do *you* have in mind? For the sake of discussion, it=20
>>>would be helpful to specify them all and see how potential=20
>>>solutions address them.
>>
>>Attack one is the most likely, since if you can read one file, you=20
>>can probably get any/all of them.
>
>An alternate solution is to make those file readable only by root,=20
>restricting root logins, and restricting SSH access in general.=A0 See=20
>https://github.com/ibm-openbmc/dev/issues/1528

Changes have been made already to restrict permissions to 0600. The=20
problem is that currently that is not much of protection at all because=20
all the processes run as root right now anyway.

--Vernon

>In this way, only an admin can get the files by enabling the SSH=20
>interface, logging in via SSH, and using su or sudo to access the=20
>files.=A0 All of these events should be audit-able.
>
>- Joseph
>
>>
>>>On 14-Apr-20 01:00, Vernon Mauery wrote:
>>>>Possible Solution
>>>>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>Migrate to a solution that uses a key that is longer that does=20
>>>>not get written directly to the flash
>>>>1) S is now computed instead of hard-coded. S=3DHMAC(MachineId, AppID)
>>>
>>>I like the direction and the guiding principle, however from=20
>>>"proper" cryptography standpoint, for producing keys, this is not=20
>>>noticeably better than the previous solution. The key material is=20
>>>still readily available on the filesystem (making points #3 and #4=20
>>>irrelevant for attack scenario #1), so chances are that the=20
>>>adversary who can pull /etc/ipmi_pass file, can also pull=20
>>>/etc/machine-id one. In addition (but that's really a nitpick in=20
>>>this case with all these much bigger problems + easy to fix),=20
>>>plain HMAC is not a proper and recommended key derivation=20
>>>function, an HKDF or one of the NIST constructs from SP800-108=20
>>>should be used instead.
>>
>>Cool. I did not know about HKDF. I will look into that.
>>
>>>>2) S is longer (32 bytes instead of 8)
>>>This (and #4) only helps the attack scenario #2, where attacker=20
>>>has to brute-force all possible values for S - and I believe that=20
>>>scenario is less realictic. But yes, case #2 gets a bit better=20
>>>than before, if we disregard the fact that HMAC is not a proper=20
>>>KDF and that MachineID is not a proper cryptographic key material=20
>>>[1, last paragraph in Description suggests that], which may=20
>>>provide additional advantage to the attacker. BTW, machine-id has=20
>>>at most 128 bits of entropy (if produced by a proper CSRNG, which=20
>>>I'm not sure about - e.g. I see they do some formatting), so=20
>>>practically it's not 32 bytes, but 16 [at most].
>>
>>Yes, this was mostly a minor point. And yes, the entropy in S is=20
>>limited by machine-id, but either one is better than a hard-coded=20
>>8-byte ASCII string :)
>>
>>>So while this new approach does provide some advantage for=20
>>>scenario #2, it doesn't address a more important case of #1 and to=20
>>>me it still looks like low security. The proper way here is indeed=20
>>>to get some capability for storing the keys securely, but I see=20
>>>how this is hard to impossible on AST2500 (if that's what we're=20
>>>talking about here), without TrustZone or anything similar, or=20
>>>some sort of ROM/bootloader-accessible-only part-unique secret, so=20
>>>OTMH I can't propose any viable alternatives for a given context=20
>>>(brownfield deployment, backward compatibility), but I'll think=20
>>>more about that.
>>>
>>>[1] https://www.freedesktop.org/software/systemd/man/machine-id.html
>>
>>Really, I don't see a real solution without some kind of secure=20
>>storage, which we don't have at this time on the ast2500. While that=20
>>is not the only machine running OpenBMC, ideally the solution would=20
>>be platform independent so that any machine could do it. Maybe that=20
>>requirement would be that it supported some minimal cryptographic=20
>>features or something (like trustzone support). But in the meantime,=20
>>some sort of solution that security researchers will not rake us=20
>>over the coals for would be nice. Maybe there isn't one. Some=20
>>minimal configuration that is better than writing the passwords in=20
>>plain text.
>>
>>--Vernon
>>
>>
>
