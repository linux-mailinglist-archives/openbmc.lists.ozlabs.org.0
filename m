Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F62038D7
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 16:11:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rBDS64mMzDqNv
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 00:11:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rB9B0VSgzDqKs
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 00:09:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ME2L9L190947; Mon, 22 Jun 2020 10:08:57 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31swph1tv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 10:08:57 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05MDu1Rr012433;
 Mon, 22 Jun 2020 14:08:53 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 31sa38r280-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 14:08:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05ME8rjM37290312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 14:08:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37A6B112066;
 Mon, 22 Jun 2020 14:08:53 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3833112063;
 Mon, 22 Jun 2020 14:08:52 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.159.135])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 22 Jun 2020 14:08:52 +0000 (GMT)
Subject: Re: OpenBMC 2.8 security audit results
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 openbmc@lists.ozlabs.org
References: <a31fcd71-460d-86c4-7a07-b7c6800aa7be@linux.ibm.com>
 <2abafb26-29d5-0a0b-7969-19b32556adc5@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <21ebed5c-ad63-84a1-0b0e-8b5fdb83387d@linux.ibm.com>
Date: Mon, 22 Jun 2020 09:08:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2abafb26-29d5-0a0b-7969-19b32556adc5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_07:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 priorityscore=1501 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006220102
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

On 6/22/20 4:30 AM, Alexander Tereschenko wrote:
> On 20-Jun-20 03:26, Joseph Reynolds wrote:
>> Here are the results from my "security audit" on the planned OpenBMC 
>> 2.8 release.  The results are not intended as a complete analysis, 
>> but only offer highlights into the BMC's security configuration. 
>> Contributions are appreciated.
>> The script to perform these tests was presented here: 
>> https://lists.ozlabs.org/pipermail/openbmc/2020-April/021186.html and 
>> was followed more-or-less.
>>
>> $ echo "Checking test host openssl version"
>> Checking test host openssl version
>> $ openssl version
>> OpenSSL 1.0.2k-fips  26 Jan 2017
>>
> I'm not sure I get this one - is "test host" a BMC or the one where 
> the test script is being run? If the former, this is really old, no 
> longer publicly supported by the OpenSSL team and has multiple CVEs 
> against it [1], so should be upgraded.
>
> [1] https://www.openssl.org/news/openssl-1.0.2-notes.html

Alexander, thanks for your reply.  The "test host" is a Linux system 
used to probe the BMC via network interfaces such as SSH, HTTPS, and 
REST APIs.  To reflect actual customer use, I used a test host that has 
an older operating system.  I've included the test host's software 
versions to help answer questions about the results below, when the host 
version factors into the results.  [I'll update my preamble with this 
information.]

>
>
>> debug1: Remote protocol version 2.0, remote software version 
>> dropbear_2019.78
>
> There's a very recent 2020.79, which has one CVE fix and some useful 
> changes (e.g. using getrandom(), AES-GCM and so on), would be good to 
> update it for the next release.

Agreed.  Yocto will pull in the new dropbear release, and it will 
downstream to OpenBMC.  We may want to update our dropbear/options.patch

https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/options.patch

>
>
>> observation: The BMC SSH server offers the algorithms shown above. 
>> Should we remove HMAC-SHA1?
>
> While it's not [yet] formally broken in the HMAC setting, IMO SHA1 is 
> "broken enough" to remove it everywhere, so yes, I'd vote for that.
>
>
>>
>> When logged into the BMC via SSH as testuser:
>> testuser$ ls -la /home/root
>> drwxr-xr-x    2 root     root           384 Jun 18 00:00 .
>> drwxr-xr-x    5 root     root           368 Jun 20 00:23 ..
>> -rw-------    1 root     root         12437 Jun 20 00:24 .bash_history
>> -rw-r-----    1 root     root           459 Jun 19 20:19 
>> bmcweb_persistent_data.json
>>
>> observation: Non-root user can list files in /home/root; that seems 
>> undesireable.  The files themselves are not readable.
>
> Agree, it doesn't seem necessary, so should be restricted
>
>
>> /etc/ssl/certs:
>> drwx------    2 root     root           160 Jun 10 06:22 authority
>> drwx------    2 root     root           304 Jun 10 06:23 https
>>
>> observation: Certificates under /etc/ssl are protected from reading
>
> This actually seems to be surplus - *certificates* are public by 
> definition, it's the private parts of them (private keys corresponding 
> to public ones in certificates) that need protection like that.

Thanks for the clarification.  I've heard a private certificate is 
improperly being stored along with its public cert in there somewhere, 
but I don't really know.

>
>
> regards,
> Alexander
>

