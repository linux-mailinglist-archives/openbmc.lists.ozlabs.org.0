Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C18E3F0BD4
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 21:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqdN916VQz3cJY
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 05:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HMA9LTUR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HMA9LTUR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqdMl4MClz2yNp
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 05:32:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IJ3HX9172630
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 15:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wv+FOpxOMIXuxO/xIMwmgMB8m/8dAP+8e056rkJcffo=;
 b=HMA9LTURfAtAkqY0emf9LUcroEaKHET9yjtl/Hmq8Nrgiz0PqsYbLUD57CVPsmZwhGUj
 1AKO8FObKr5uUmj3FAWdq+C7CMrPVLh70LzwNmc+auDHOCvjQJ8JfWemNP86MPL/rlHP
 g0VxS5BeMX6cAT6TdQEj/nGcAXzvuj3txbPowfZCUOCMw3odN6cHM/R9GKrhgSHDeYv7
 hjLyCLG7cTDaeUIo6DELX/1jupLXlIEe3yBerGZX9GlvA6M3kfbZgq58IWXzEIgCgnVW
 8PnmT4/zsE3KsMQbnX+U5mcCs0T9y0MPHy6XAD+Gsy1mwtEizHyWY0Rhd7ICloDzqs7e BA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agf0f3rmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 15:32:32 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IJDAoa002672
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:31 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3ae5fexc9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IJWUNU36176364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DFDA6E05F
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FC726E054
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:30 +0000 (GMT)
Received: from demeter.local (unknown [9.163.42.82])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 19:32:29 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 18 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
Message-ID: <911133cc-791b-5cec-4de9-c2d9f85f7e82@linux.ibm.com>
Date: Wed, 18 Aug 2021 14:32:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gDSEEEjaM_U0EeygiojELn_6Q3IM1TiK
X-Proofpoint-GUID: gDSEEEjaM_U0EeygiojELn_6Q3IM1TiK
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_07:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180118
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



On 8/18/21 8:54 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 18 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
Attended: Joseph Reynolds, Bruce Mitchell, James Mihm, Jiang Zhang, 
Richard Wilkins, Surya Intel, Daniil Egranov Arm

> 1. Wholesale changes to bitbake recipes were made.  See 
> https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u 
> <https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u> My 
> non-specific security concern (Joseph) is accidentally mis-configuring 
> something with these changes.

DISCUSSION: None


> 2. Gerrit review - The BMCWeb session idle timeout changed to 30 
> minutes (was 60): 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45658 
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45658>
DISCUSSION: None
> 3. Yocto is planning a security configuration guide.  See 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14509 
> <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14509>

DISCUSSION: None

Bonus items:

4. What database?  Bugzilla?  github.com issues?

DISCUSSION:

James and Surya looked at github issues.  Will test drive github.  Need 
dashboard/query function.  Worries about accidental disclosure.

Tianocore uses bugzilla per Richard.  UEFI has a separate database (not 
bugzilla).

Use github private branches?

What development process for security code reviews (Github reviews vs 
gerrit)?

Next steps: James and Surya will come up with critical objections to 
using github issues.


5 How to add session timeouts to host console?

DISCUSSION:

See the diagram in the README under 
https://github.com/openbmc/obmc-console 
<https://github.com/openbmc/obmc-console>.

We thought obmc-console-client was the right place to implement the 
timeout mechanism.

I created https://github.com/openbmc/obmc-console/issues/18 
<https://github.com/openbmc/obmc-console/issues/18>.




>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

