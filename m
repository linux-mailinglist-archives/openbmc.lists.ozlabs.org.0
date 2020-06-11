Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B131F70A3
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 00:53:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jfKp4ys2zDqsy
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 08:53:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jfK34xv3zDqCB
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 08:53:11 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BMXKCf122095
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 18:53:08 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ktp14kff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 18:53:08 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05BMntwM021936
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:07 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 31hdb3wpsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05BMr7vG53281214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A988AC068
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2C62AC05E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:06 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.200.8])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 22:53:06 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday June 10 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <16e34c29-29d2-32fb-5a76-70ae983009dc@linux.ibm.com>
Message-ID: <aa8553af-fc61-5070-7e62-d667a7b9c41e@linux.ibm.com>
Date: Thu, 11 Jun 2020 17:53:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <16e34c29-29d2-32fb-5a76-70ae983009dc@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 bulkscore=0 malwarescore=0 adultscore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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



On 6/9/20 2:53 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 10 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> 1. Can we simplify password rules per NIST SP 800-63B?
No.  Downstream projects can easily change the password rules to 
whatever they prefer.
We also discussed recent code reviews about the IPMI 20 character limit 
and enhancing the password change API to say why the new password was 
not accepted.

>
> 2. Requesting comments on proposed new ServiceRep role and privilege 
> before it goes to Redfish.
Joseph will propose this to Redfish.

>
> 3. Idea: Would using the RunBMC spec help us create our threat model?
Yes.  This idea was added to the security wiki.

>
> 4. Do we have security input to the 2.8 release?
No.  No input.

- Joseph

>
>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

