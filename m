Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69909179C9C
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 01:09:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xrj15JkRzDqSL
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 11:09:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XrhG0jspzDqS3
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 11:09:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024NxlS7109048
 for <openbmc@lists.ozlabs.org>; Wed, 4 Mar 2020 19:08:59 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6njucv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 19:08:59 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02506Vng020964
 for <openbmc@lists.ozlabs.org>; Thu, 5 Mar 2020 00:08:58 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 2yffk78pjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2020 00:08:58 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02508vXB53936538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 5 Mar 2020 00:08:57 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4C66124053
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 00:08:57 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8596124054
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 00:08:57 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 00:08:57 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday March 4
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <144fb54a-9858-6a99-fbcc-bde71fce42a4@linux.ibm.com>
Message-ID: <cee38096-2466-164f-b74c-c691dcf0e84e@linux.ibm.com>
Date: Wed, 4 Mar 2020 18:08:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <144fb54a-9858-6a99-fbcc-bde71fce42a4@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040153
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

On 3/2/20 6:05 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday March 4 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> The current topics:
>
> 1. Proposal to add new Redfish roles for ServiceRep & OemRep. 2. 
> Implement the Redfish PasswordChangeRequired property. 3. Proposal to 
> delete BMCWeb sessions after some kinds of account changes.
>
> 4. Intel hackathon (pen test, code reviews, etc) results. 5. Security 
> issue: BMCWEB_ENABLE_DBUS_REST=ON enables information leak
>
> 6. Discuss making contributions toward 
> https://github.com/openbmc/openbmc/wiki/Security-working-group#security-end-of-release-checklist
> for the May 2020 OpenBMC release based on Yocto 3.1.
>
> Access, agenda, and notes are in the wiki:

Here is a summary of the discussion.  More details are in the minutes 
linked below.

1. Weagreed that ServiceRep and ManufacturingRep Privileges are useful 
to articulate. We found two use cases: Admin same as service agent and 
manufacturer, and Admin/Service/manufacturer are different roles. Joseph 
will pursue getting these roles and privileges defined in Redfish. We 
also discussed the problem of how to prevent the admin from escalating 
to the Service role given they control User management. (With possible 
solutions discussed), and some alternate designs.
The next step is: Joseph will send an email to the openbmc list with 
updated details and proposal.

2. Joseph is working on a new D-Bus property for UserPasswordExpired 
that is needed for BMCWeb.

3. Terminating BMCWeb sessions when there are severe account changes 
sounds like a good idea.
Nobody signed up to work on it. :)

4. James asked about how to report security vulnerabilities.  The plan 
to is to follow
https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md
and make a judgment call, sending some to the email list (thus 
disclosing them) and some to the OpenBMC security response team.
The response team can then sort out which issues can be disclosed, and 
which we want to fix.
That will be a good stress test.

5. We want definite plans and a timeline for changing the default to 
BMCWEB_ENABLE_DBUS_REST=OFF.

6. Joseph will propose an OpenBMC-customized dynamic-security-scan tool 
via email.

- Joseph

>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>

