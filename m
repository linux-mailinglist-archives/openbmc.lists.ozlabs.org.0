Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642CAC99B
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 23:53:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Qp7z4TKBzDqfJ
	for <lists+openbmc@lfdr.de>; Sun,  8 Sep 2019 07:53:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Qp770ZDFzDqcn
 for <openbmc@lists.ozlabs.org>; Sun,  8 Sep 2019 07:52:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x87Lkggv028666
 for <openbmc@lists.ozlabs.org>; Sat, 7 Sep 2019 17:52:12 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uv8ph83rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 07 Sep 2019 17:52:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x87LnmaN030728
 for <openbmc@lists.ozlabs.org>; Sat, 7 Sep 2019 21:52:11 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2uv466dwur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 07 Sep 2019 21:52:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x87LqAS961997398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Sep 2019 21:52:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFF4BC6059;
 Sat,  7 Sep 2019 21:52:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76628C605B;
 Sat,  7 Sep 2019 21:52:09 +0000 (GMT)
Received: from demeter.local (unknown [9.85.193.165])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat,  7 Sep 2019 21:52:09 +0000 (GMT)
Subject: Re: Updating BMC GUI Front End Framework
To: Derick Montague <Derick.Montague@ibm.com>, openbmc@lists.ozlabs.org
References: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <f81aec54-b597-c953-25da-f4f94307316d@linux.ibm.com>
Date: Sat, 7 Sep 2019 16:52:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <OF4FF7F8E2.9E3777F1-ON0025846D.004E7B10-0025846D.0051A226@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909070236
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


On 9/6/19 9:51 AM, Derick Montague wrote:
> Hello,
> We would like to start the discussion of migrating the BMC GUI off of 
> AngularJS. The AngularJS long term support period is 3 years and 
> started on 7/1/2018 and will end on 7/30/2021. You can read more about 
> this on the angular blog - 
> https://blog.angular.io/stable-angularjs-and-long-term-support-7e077635ee9c.
> The most likely options for migration are Angular, React, and Vue. 
> LogRocket has a decent comparison of the 3 frameworks - 
> https://blog.logrocket.com/angular-vs-react-vs-vue-a-performance-comparison/.
> There is also a really interesting framework called Svelte for 
> building reactive apps that might be worth considering as well - 
> https://github.com/sveltejs/svelte
> My first thought based on the size of the application, the need for a 
> smaller footprint, and the benefit of a small learning curve would 
> be Vue. However, I'm just throwing that out there to start the 
> conversation.

Derick, thanks for looking into this.  I agree a small footprint and 
short learning curve are important criteria.   Some other criteria to 
consider:
- Licensing terms, looking for permissive licenses like Apache 2.0 or MIT.
- Community support, especially for security fixes.

- Joseph

> Does anyone else have a preference on the next front end framework?
>

