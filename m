Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E661A8ED6
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 01:00:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4921Dh0lK5zDql5
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 09:00:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4921Cw200rzDqFh
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 09:00:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EMb9SC154856
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 19:00:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30dnmqh5eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 19:00:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EMtpi1028593
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:07 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 30b5h6vb51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EN05ta40370662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:05 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3F66A061
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A363C6A05F
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:04 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2020 23:00:04 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Proposal: how to make incompatible changes
Message-ID: <5532c90e-75e8-4998-b0cf-e65ed9af1424@linux.ibm.com>
Date: Tue, 14 Apr 2020 18:00:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140156
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

Proposal: how to make incompatible changes

This is a proposal to add guidelines for making incompatible changes to 
OpenBMC interfaces.  Is it okay to make incompatible changes? Yes, IMHO: 
the project will continuously break compatibility in various ways, and 
its users will adapt.  The main idea is to minimize churn and make it 
easier for users to adapt.

As the OpenBMC project moves forward with new releases, it will make 
changes that necessarily break existing use cases.  My recommendations are:
- Try hard to maintain forward compatibility.  For example, maintain all 
of the BMC's intended user interfaces.
- Identify changes that break compatibility.  Briefly describe the use 
case, what breaks, how a user can adapt, and cross-link technical 
discussions (Gerrit reviews, issues, emails).
- Work with maintainers to determine which incompatible changes get 
merged and what documentation is needed.
- Give users time to adapt to incompatible changes.  For example, 
deprecate interfaces in a previous release.
- List incompatible changes in the [release notes][] so community 
members will know they have to adapt, and link to how to adapt.

[release notes]: 
https://github.com/openbmc/docs/blob/master/release/release-notes

Perhaps we could add a section to one of these here documents:
https://github.com/openbmc/docs/blob/master/maintainer-workflow.md
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md

What do you think?

- Joseph


TLDR:

Applicability.

These guidelines are for the BMC's "intended external user interfaces".  
For example, its management interfaces including its web server and all 
REST APIs.  I haven't given much thought to the BMC/host interfaces or 
interfaces internal to the BMC.  IMHO, it is less important to maintain 
compatibility in these areas.  For example, if you need an incompatible 
change in an internal interface, you have a smaller set of users who 
ought to be active in the project, and can give you feedback and adapt 
within a release cycle.


What is forward compatibility?

The OpenBMC project has a sequence of releases.  When someone is using 
one of these releases, then updates to a later release, ideally all the 
BMC interfaces they use will continue to work as before.  That's what I 
call "forward compatibility"  which is close to the Wikipedia's [upward 
compatibility][].

Backward compatibility means that after you perform a firmware update to 
an older release in the sequence, using that release's older interfaces 
will continue to operate the BMC as before.  That is, you can downgrade 
to that release.  For example, backward compatibility is needed to be 
able to revert a previous update back to a known-good firmware image 
version.  Once again, this is different from Wikipedia's [backward 
compatibility][] entry which is more like interoperability.

I think it is useful to separate these concepts.  To be clear: I am in 
favor of the OpenBMC interfaces being upward compatible, backward 
compatible, and interoperable, but I think we need to take baby steps to 
get there.  So I am limiting the scope of this email to a narrow 
definition of forward compatibility.

I expect maintainers will consider backward compatibility at the same 
time they consider forward compatibility.  Note that it may be 
acceptable to break backward compatibility more frequently that breaking 
forward compatibility.  For example, you can tell users that once they 
upgrade to a new release, they cannot downgrade.

[upward compatibility]: https://en.wikipedia.org/wiki/Forward_compatibility
[backward compatibility]: 
https://en.wikipedia.org/wiki/Backward_compatibility


Examples of changes that may break compatibility:

https://gerrit.openbmc-project.xyz/c/openbmc/pam-ipmi/+/31054

https://github.com/openbmc/openbmc/issues/3615

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344

