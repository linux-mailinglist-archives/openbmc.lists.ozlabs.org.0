Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9F1FBED4
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 21:18:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mdKD3gZmzDqwC
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 05:18:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mdJN5qCVzDqbl
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 05:17:56 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GIXY79140980; Tue, 16 Jun 2020 15:17:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31q1m64bd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 15:17:53 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05GJGC7w007071;
 Tue, 16 Jun 2020 19:17:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 31q26f9bv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 19:17:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05GJHqvu45220124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 19:17:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33F15AC05B;
 Tue, 16 Jun 2020 19:17:52 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065DEAC059;
 Tue, 16 Jun 2020 19:17:51 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.177.12])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 16 Jun 2020 19:17:51 +0000 (GMT)
Subject: Security announcement subscriptions (was: [Security Advisory]
 CVE-2020-14156 ...)
To: Lee Fisher <lee@preossec.com>, openbmc <openbmc@lists.ozlabs.org>
References: <09a8c25d-fa77-a550-946c-7e721aa1d474@linux.ibm.com>
 <599434a4-84cd-4281-d4ed-580427f61970@preossec.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <eeec1af5-e4ba-dc56-8673-fb8cf5177daf@linux.ibm.com>
Date: Tue, 16 Jun 2020 14:17:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <599434a4-84cd-4281-d4ed-580427f61970@preossec.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_11:2020-06-16,
 2020-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 cotscore=-2147483648 clxscore=1011
 phishscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160131
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

On 6/16/20 12:35 PM, Lee Fisher wrote:
> Hi,
>
> In addition to a web page showing how to submit security issues, it
> would be nice if there was a web page showing OpenBMC CVEs. And/or a
> mailing list to announce OpenBMC security advisories. Having to
> subscribe to the dev list and watch the issue tracking system for CVEs
> will only keep security awareness isolated to OpenBMC devs.

Lee,  +cc: openbmc email list

I agree.  The security wiki [1] has a query to show all security 
advisories [2].  We had discussed creating an 
openbmc-public-security-announcements email list that you could 
subscribe to.  I'll add an item to the security working group agenda [3] 
to discuss the email again.

- Joseph

[1]: https://github.com/openbmc/openbmc/wiki/Security-working-group
[2]: 
https://github.com/openbmc/openbmc/issues?utf8=%E2%9C%93&q=Security+Advisory
[3]: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

>
> Thanks,
> Lee
>
> On 6/15/20 12:31 PM, Joseph Reynolds wrote:
>> |The OpenBMC Security Response team has released an OpenBMC Security
>> Advisory: https://github.com/openbmc/openbmc/issues/3670 Thanks to
>> everyone who helped work on this. An OpenBMC Security Advisory
>> explains a security vulnerability, its severity, and how to protect
>> systems that are built on OpenBMC. For more information about OpenBMC
>> Security Response, see:
>> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md
>> - Joseph |
>>

