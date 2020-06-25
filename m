Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CD20A0E6
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 16:35:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t2c234qHzDqsw
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 00:35:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t2Yn64lCzDqsv
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 00:33:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PEXCDf083839
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 10:33:14 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwymtcb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 10:33:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05PETx0d024049
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:58 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 31uuruqvsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:58 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05PEWwAR53608736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E937112061
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:58 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC0A112062
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:57 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.159.135])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 14:32:57 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday June 24 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <a3420c1d-5026-23a6-bff4-a28507a4ebac@linux.ibm.com>
Message-ID: <ccdca43c-f78d-c186-4ee6-5de6eb10e3e1@linux.ibm.com>
Date: Thu, 25 Jun 2020 09:32:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a3420c1d-5026-23a6-bff4-a28507a4ebac@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_10:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 cotscore=-2147483648 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250095
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

On 6/23/20 8:17 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 24 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> 1. Is there interest in documenting privacy considerations (as 
> personal data stored on the BMC's flash drive)?
TODO: Joseph to push notes into openbmc/docs.

>
> 2. Planning for dropbear 2020.79 configuration.
TODO: When we pick up a Yocto that updates to dropbear 2020.79, we 
should revisit some patches:
Per https://matt.ucc.asn.au/dropbear/CHANGES -

- CBC ciphers, 3DES, hmac-sha1-96, and x11 forwarding are now disabled by default.
   They can be set in localoptions.h if required.
   Blowfish has been removed.

And a number of ciphers have been added.  Our patches are here:
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-core/dropbear/dropbear/dropbear-disable-weak-ciphers.patch
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core/dropbear/dropbear/options.patch

>
> 3. Proposal: Create new email address for OpenBMC security announcements:
>  - openbmc@lists.ozlabs.org -- is for the community.
>  - openbmc-security@lists.ozlabs.org -- is to report security 
> vulnerabilities and the the OpenBMC security response team's private 
> discussions of non-public vulnerabilities.
>  - openbmc-public-security-announcements@lists.ozlabs.org -- could be 
> for public security discussions, including announcements of OpenBMC 
> security fixes
We agreed this is a good idea if Joseph does all the work for it.  To 
make it useful for subscribers, we need to moderate the list and have 
only actionable items (such as CVE fixes, significant security relevant 
configuration changes, and the like).

TODO: Joseph to move forward to the email list.

>
> 4. Discuss OpenBMC 2.8 security audit results and feedback for the 
> release notes.
The security audit exercise seemed beneficial, cost effective, and 
generated some discussion and release notes.  Next time can we use more 
open source scanners?  (Links are in the minutes.)

5. (Bonus item): The project is using PLDM over MCTP.  Is there interest 
in SPDM?
ANSWER: Yes, and SPDM is new.

- Joseph

>
>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>

