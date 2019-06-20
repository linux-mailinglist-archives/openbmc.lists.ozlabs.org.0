Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6604DDAF
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 01:13:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VHfd3NMtzDrFK
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 09:12:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VHf51PvFzDr6P;
 Fri, 21 Jun 2019 09:12:28 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KNBTKg098136; Thu, 20 Jun 2019 19:12:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t8hsxkcuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 19:12:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5KN9eko002051;
 Thu, 20 Jun 2019 23:12:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 2t8hrnrk65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 23:12:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KNCLwl37159220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 23:12:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD850C6066;
 Thu, 20 Jun 2019 23:12:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26648C6055;
 Thu, 20 Jun 2019 23:12:21 +0000 (GMT)
Received: from birb.localdomain (unknown [9.102.43.75])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu, 20 Jun 2019 23:12:20 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4DDD94EC62A; Fri, 21 Jun 2019 09:12:17 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Move away from default password
In-Reply-To: <43de939d764a17c737b0edb31cdfe830@linux.vnet.ibm.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
 <874l4n6ct4.fsf@linux.vnet.ibm.com>
 <43de939d764a17c737b0edb31cdfe830@linux.vnet.ibm.com>
Date: Fri, 21 Jun 2019 09:12:17 +1000
Message-ID: <878stv4zse.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200164
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
Cc: Openbmc <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joseph Reynolds <jrey@linux.ibm.com> writes:
> On 2019-06-17 17:56, Stewart Smith wrote:
>> Joseph Reynolds <jrey@linux.ibm.com> writes:
>>> There is some interest in moving OpenBMC away from a default password.
>>> - email:
>>> https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html  
>>> (which
>>> references a RestrictionMode design:
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195)
>>> 
>>> Having a default password is a security risk.  Note that changing to a
>>> different default password is not a good solution.  For example, if a
>>> bad actor learns the default password from one device, that actor will
>>> likely know the password for many of them.
>> 
>> and it makes it pretty easy to use something like Shodan to find all 
>> the
>> possible OpenBMCs connected to the Internet (hopefully by accident) and
>> pop a root shell on them.
>> 
>> Mind you, in a lab environment, it's *really* useful.
>
> I imagine for the forseeable future, OpenBMC would continue to have a 
> default userid and password (and I hope each development lab is using a 
> different default password than the well-known password).  But I think 
> development labs are subject to attack, so we need to eventually move 
> away from default passwords even in the development labs.
>
> At this time, I am looking for options to move away from this model, but 
> do not anticipate changing the default.

I admire your optimism :)

I could probably ruin everybody's day with a simple nmap invocation and
for loop in shell across the IBM class A :)

Having something that wasn't the same everywhere would probably be an
improvement in the lab, and make it harder for someone to accidentally
do something to a machine they didn't intend to.

-- 
Stewart Smith
OPAL Architect, IBM.
