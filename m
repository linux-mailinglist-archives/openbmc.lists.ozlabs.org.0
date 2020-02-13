Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F2015CCF9
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 22:10:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JTgR0FVnzDqW2
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 08:10:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JTff4YCSzDqRR
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 08:09:45 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DL8ZZU103868; Thu, 13 Feb 2020 16:09:40 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y3yw9nh53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 16:09:40 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01DL5DZv013130;
 Thu, 13 Feb 2020 21:09:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 2y5bc01ecc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 21:09:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01DL9bWA10879248
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 21:09:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0E6C78064;
 Thu, 13 Feb 2020 21:09:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E9E7805E;
 Thu, 13 Feb 2020 21:09:37 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 13 Feb 2020 21:09:37 +0000 (GMT)
Subject: Re: Functionality vs Security - security assurance methodology
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Mihm, James" <james.mihm@intel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
 <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
 <C48B413D-C8FD-4FF5-8B3A-7D34FBB15EB6@fuzziesquirrel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3fe6eaf9-26ed-774f-ee55-218205f366e9@linux.ibm.com>
Date: Thu, 13 Feb 2020 15:09:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <C48B413D-C8FD-4FF5-8B3A-7D34FBB15EB6@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_08:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130151
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/13/20 10:36 AM, Brad Bishop wrote:
>
>> On Feb 13, 2020, at 3:15 AM, Mihm, James <james.mihm@intel.com> wrote:
>>
>> Exposing the REST D-Bus APIs via a network interface is bad practice and should be disabled by default.
> Yeah.  You are right of course.  It isn’t really the what that bothers me here it is the how.  I’m disappointed that Intel was only able to make the Redfish enabled webui work for Intel and not anyone else.
>
>> Just because it was done that way in the beginning doesn’t mean that it should remain that way.
> I don’t remember saying this?
>
>> Applications should be configured to be secure by default.
> This sounds perfectly reasonable of course but I don’t know how to implement it for OpenBMC.  I’m not even sure what it means.  Security isn’t a boolean it is a spectrum.  Show me any security posture, and I will show you one that is slightly more strict/secure.  Clearly, my security posture isn’t strict enough for Intel.  However I know there are organizations out there that have even stricter security postures than Intel.  So in the general case - how does one decide which posture should be the default, and when is ok to “break” existing usage patterns rather than “update” them for the sake of a stricter security posture?  Help me establish some rules so we can avoid this kind of bickering in the future.

Brad,

Thanks for that introduction.  We're working on a way to answer 
questions like this in the [OpenBMC security assurance workflow][] which 
promises to address all security items using world-class practices.

Yes, literally all security items.  There are some excellent references 
out there that we are trying to use.  (footnote1)

For example, a key point in the Cloud Security Industry Summit > "[CSIS 
Secure Firmware Development Best Practices][]" > "BMC" section is to 
"Document all available interfaces" specifically including Redfish 
APIs.  A security review would find the D-Bus APIs, and raise suspicion.

Most security assurance methodologies begin with an architectural review 
of the system and drill down to all external interfaces.  We need that 
for OpenBMC.  The hard part is getting the right level of abstraction 
because the use cases and details are different, so nothing is merged 
yet.  The current attempt (in review), 
[architecture/interface-overview][], describes how BMCWeb serves REST 
APIs (which includes the D-Bus APIs).  I hope we can merge this as a 
simplified view of the BMC's primary interfaces.

Anyway, that's how I see the security story playing out for OpenBMC ... 
using OpenBMC security assurance workflow as the way to organize all 
OpenBMC security documentation and talk about which pieces are 
relatively more important.  When these docs are ready, we can refer to 
them as we continue to bicker and argue in a more sophisticated way.

- Joseph

P.S. I gave my opinion about the D-Bus APIs in a separate email, 
archived here: 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020501.html

(footnote1): Don't expect any miracles though, because following the 
security assurance methodology is a lot of difficult work and requires 
cooperation between folks in different disciplines.  And we're just 
getting started.  And all the big words makes peoples' brains hurt.

[OpenBMC security assurance workflow]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-assurance-workflow

[CSIS Secure Firmware Development Best Practices]: 
https://github.com/opencomputeproject/Security/blob/master/SecureFirmwareDevelopmentBestPractices.md#bmc

[architecture/interface-overview]: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27969

> thx
> -brad

