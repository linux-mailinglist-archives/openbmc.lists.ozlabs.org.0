Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A01A8E85
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:25:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920Rd42ntzDqgj
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:25:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920Hk40nlzDr0B
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:18:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EM46q1098578; Tue, 14 Apr 2020 18:18:21 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnmh8bv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 18:18:21 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EMFKO5012121;
 Tue, 14 Apr 2020 22:18:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 30b5h6cvtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 22:18:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EMIKXO60424688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 22:18:20 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366C36A054;
 Tue, 14 Apr 2020 22:18:20 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DFC76A058;
 Tue, 14 Apr 2020 22:18:19 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Apr 2020 22:18:19 +0000 (GMT)
Subject: Re: ipmi password storage
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
 <20200414191106.GD9295@mauery.jf.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <aee8d5c8-b5cf-32d8-b80d-36443182ab58@linux.ibm.com>
Date: Tue, 14 Apr 2020 17:18:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414191106.GD9295@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140153
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

On 4/14/20 2:11 PM, Vernon Mauery wrote:
> On 14-Apr-2020 06:27 PM, Alexander Tereschenko wrote:
>> To be more specific, I'm considering two attack scenarios in the 
>> below comments:
>> 1) The attacker gets into BMC and is able to copy off the data files, 
>> including ipmi_pass. This IMHO is a more realistic scenario in this 
>> case.
>> 2) The attacker gets ipmi_pass file/contents only, without being able 
>> to retrieve anything else.
>>
>> Which ones do *you* have in mind? For the sake of discussion, it 
>> would be helpful to specify them all and see how potential solutions 
>> address them.
>
> Attack one is the most likely, since if you can read one file, you can 
> probably get any/all of them.

An alternate solution is to make those file readable only by root, 
restricting root logins, and restricting SSH access in general.  See 
https://github.com/ibm-openbmc/dev/issues/1528

In this way, only an admin can get the files by enabling the SSH 
interface, logging in via SSH, and using su or sudo to access the 
files.  All of these events should be audit-able.

- Joseph

>
>> On 14-Apr-20 01:00, Vernon Mauery wrote:
>>> Possible Solution
>>> =================
>>> Migrate to a solution that uses a key that is longer that does not 
>>> get written directly to the flash
>>> 1) S is now computed instead of hard-coded. S=HMAC(MachineId, AppID)
>>
>> I like the direction and the guiding principle, however from "proper" 
>> cryptography standpoint, for producing keys, this is not noticeably 
>> better than the previous solution. The key material is still readily 
>> available on the filesystem (making points #3 and #4 irrelevant for 
>> attack scenario #1), so chances are that the adversary who can pull 
>> /etc/ipmi_pass file, can also pull /etc/machine-id one. In addition 
>> (but that's really a nitpick in this case with all these much bigger 
>> problems + easy to fix), plain HMAC is not a proper and recommended 
>> key derivation function, an HKDF or one of the NIST constructs from 
>> SP800-108 should be used instead.
>
> Cool. I did not know about HKDF. I will look into that.
>
>>> 2) S is longer (32 bytes instead of 8)
>> This (and #4) only helps the attack scenario #2, where attacker has 
>> to brute-force all possible values for S - and I believe that 
>> scenario is less realictic. But yes, case #2 gets a bit better than 
>> before, if we disregard the fact that HMAC is not a proper KDF and 
>> that MachineID is not a proper cryptographic key material [1, last 
>> paragraph in Description suggests that], which may provide additional 
>> advantage to the attacker. BTW, machine-id has at most 128 bits of 
>> entropy (if produced by a proper CSRNG, which I'm not sure about - 
>> e.g. I see they do some formatting), so practically it's not 32 
>> bytes, but 16 [at most].
>
> Yes, this was mostly a minor point. And yes, the entropy in S is 
> limited by machine-id, but either one is better than a hard-coded 
> 8-byte ASCII string :)
>
>> So while this new approach does provide some advantage for scenario 
>> #2, it doesn't address a more important case of #1 and to me it still 
>> looks like low security. The proper way here is indeed to get some 
>> capability for storing the keys securely, but I see how this is hard 
>> to impossible on AST2500 (if that's what we're talking about here), 
>> without TrustZone or anything similar, or some sort of 
>> ROM/bootloader-accessible-only part-unique secret, so OTMH I can't 
>> propose any viable alternatives for a given context (brownfield 
>> deployment, backward compatibility), but I'll think more about that.
>>
>> [1] https://www.freedesktop.org/software/systemd/man/machine-id.html
>
> Really, I don't see a real solution without some kind of secure 
> storage, which we don't have at this time on the ast2500. While that 
> is not the only machine running OpenBMC, ideally the solution would be 
> platform independent so that any machine could do it. Maybe that 
> requirement would be that it supported some minimal cryptographic 
> features or something (like trustzone support). But in the meantime, 
> some sort of solution that security researchers will not rake us over 
> the coals for would be nice. Maybe there isn't one. Some minimal 
> configuration that is better than writing the passwords in plain text.
>
> --Vernon
>
>

