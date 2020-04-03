Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E719DA37
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 17:32:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v3pp2BZ0zDqYY
	for <lists+openbmc@lfdr.de>; Sat,  4 Apr 2020 02:32:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v3nn2bdhzDqSp
 for <openbmc@lists.ozlabs.org>; Sat,  4 Apr 2020 02:31:56 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033F4k7m105173; Fri, 3 Apr 2020 11:31:53 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yfk1uft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 11:31:53 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 033FU3KU018172;
 Fri, 3 Apr 2020 15:31:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 301x77xepu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 15:31:52 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033FVpOp53870852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 15:31:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C704124055;
 Fri,  3 Apr 2020 15:31:51 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 439E812405B;
 Fri,  3 Apr 2020 15:31:51 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.171.253])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Apr 2020 15:31:51 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 1 - highlights
To: Patrick Williams <patrick@stwcx.xyz>
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
 <8e3e13eb-e974-4d32-ac01-074a1d4eb75a@linux.ibm.com>
 <20200402185247.GF580847@heinlein.lan.stwcx.xyz>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e0e908e9-f63b-6e2c-d538-3a1d6845a7a9@linux.ibm.com>
Date: Fri, 3 Apr 2020 10:31:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200402185247.GF580847@heinlein.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_11:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030130
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/2/20 1:52 PM, Patrick Williams wrote:
> On Thu, Apr 02, 2020 at 01:44:45PM -0500, Joseph Reynolds wrote:
>> On 3/31/20 11:21 AM, Joseph Reynolds wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting
>>> scheduled for this Wednesday April 1 at 10:00am PDT.
>>>
>>> We'll discuss current development items, and anything else that comes up.
>>>
>>> The current topics:
>>>
>>> 1. SELinux or AppArmor plans
>> Topic 1 has three points:
>> 1a. We would also want to move away from all processes running as root.
>> https://github.com/openbmc/openbmc/issues/3383  Next step is create
>> issue for each repo.
> Have the technical issues all been worked out on that issue?  Is there a
> design documented of what "each repo" is suppose to do?  It seems like
> kind of a leap to ask each repo to just not run as root at this point.
>

Patrick,

Thanks for asking.  There are technical issues to be worked out (ref: 
issue 3383).

Correction to 1a. Work out technical issues, then ask all daemons to 
move away from running as root.

- Joseph

