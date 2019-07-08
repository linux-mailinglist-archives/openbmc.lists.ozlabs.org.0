Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1162A21
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 22:09:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jGkX0VSTzDqQs
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 06:09:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jGjx0P5wzDqQk
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 06:08:52 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68K7JF1125084; Mon, 8 Jul 2019 16:08:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmbbsartq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 16:08:41 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x68K7W07125652;
 Mon, 8 Jul 2019 16:08:40 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmbbsarre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 16:08:40 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x68K67cZ001151;
 Mon, 8 Jul 2019 20:08:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 2tjk968evm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jul 2019 20:08:39 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68K8cC841812312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 20:08:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A44A1124052;
 Mon,  8 Jul 2019 20:08:38 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EBB5124053;
 Mon,  8 Jul 2019 20:08:38 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Jul 2019 20:08:38 +0000 (GMT)
Subject: Re: How to prevent the user repeat-login to avoid the ikvm overload
To: xiuzhi <1450335857@qq.com>, "jae.hyun.yoo" <jae.hyun.yoo@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, eajames <eajames@linux.ibm.com>,
 Joel Stanley <joel@jms.id.au>, "Andrew.Jeffery" <andrew@aj.id.au>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
References: <tencent_7DE3A7000B33C89E09783AFC@qq.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <604e506f-1bc7-d2f4-5a43-219cdb5b98fe@linux.ibm.com>
Date: Mon, 8 Jul 2019 15:08:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <tencent_7DE3A7000B33C89E09783AFC@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080250
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


On 6/27/19 8:53 PM, xiuzhi wrote:
> Hi Jae,Ratan,
>    The ikvm or openbmc phosphor-rest process will deadlock when users 
> operate the ikvm on different PC at the same time . The user can't 
> login when the CPU usage of phosphor-gevent process more than 70%.  
> This issue  will be triggered when one user login  both on different 
> IP and operate the host by  ikvm.
>   My test case:
> 1, The user "root" login throw AST2500  network  card, enter the ikvm 
> webpage ,the IP 192.168.0.100.
> 2, The user "root" login throw OCP network card with a different IP 
> 192.168.1.100, enter the ikvm web page, do some keyboard and mouse 
> operations
> 3, The openbmc will deadlock and cann't login, I must restart the 
> phosphor-gevent service ,then I can login again.
>   I created other common users, it is impossible to forbid them to 
> login and operate the ikvm at the same time to cause the bmc overload .
>    My personal idea is to allow  one user to login only on one machine 
> at a time. Do you have any good ideas?
I haven't seen a reply to this.  Here is my 2 cents worth:

Enhance the service to establish a mutex (or exclusive lock) scoped to 
the BMC when accessing the ikvm service, and release it when the ikvm 
session ends.  A second attempt to use the service concurrently will 
fail to obtain the lock and if possible, give a nice error message.
Can you determine when the ikvm session ends?
Have an easy way so you can (a) to determine if the lock is held, and 
(b) to clear the lock.  I've seen lock files used for this purpose.  For 
example, flock /tmp/ikvm.lock.  Rebooting the BMC should erase the /tmp 
file which will also clear the lock.

Would that help solve the problem?
- Joseph
>
>   Best,
> Xiuzhi

