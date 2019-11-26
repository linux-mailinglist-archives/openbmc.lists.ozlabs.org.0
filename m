Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6810A6C1
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 23:44:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MzVd0yjSzDqnl
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 09:44:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MzL10nvnzDqlg
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 09:37:12 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQMX56L085511
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 17:37:08 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqr3be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 17:37:08 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAQMYlk2088588
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 17:37:08 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqr3ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:37:08 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQMYraR009359;
 Tue, 26 Nov 2019 22:37:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2wevd6f9s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 22:37:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQMb6f057147826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 22:37:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F273ABE053;
 Tue, 26 Nov 2019 22:37:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB92BE051;
 Tue, 26 Nov 2019 22:37:05 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Nov 2019 22:37:05 +0000 (GMT)
Subject: Re: BMCWeb auth primer
To: Brandon Wyman <bjwyman@gmail.com>
References: <98ab5fc7-60e7-3e90-1e9e-bf7e220a2a50@linux.ibm.com>
 <CAK_vbW3xT8WL5qnBVV_m-HVY84DWYNCpH=ntYyLNzgyFJMzw0A@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <e4e32524-d71f-3f17-645a-39861755215a@linux.ibm.com>
Date: Tue, 26 Nov 2019 16:37:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK_vbW3xT8WL5qnBVV_m-HVY84DWYNCpH=ntYyLNzgyFJMzw0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_07:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911260191
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



On 11/25/19 3:37 PM, Brandon Wyman wrote:
> On Mon, Nov 11, 2019 at 7:41 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>> Dear OpenBMC community and BMCWeb maintainers,
>>
>> I worked on BMCWeb, learned how it works, and put together this little
>> primer on its authentication and authorization flows.  I think portions
>> of it are generally useful to the community, and specifically useful to
>> help guide BMC security work.  Certainly, I may want to refer back to it.
>>
>> The material is more-or-less in markdown format, but no promises.
>>
>> Take a peek, learn about auth security topics, correct my errors and
>> omissions, and let me know your ideas how to incorporate this into the
>> project.  Thank you!
>>
>> - Joseph
>>
> Would this have worked better as a gerrit commit, or a public gist
> that you could point to?

Brandon, yes, that's the feedback I am looking for.  I haven't seen much 
interest in openbmc gists.  You can find the primer in the OpenBMC email 
archives here:
https://lists.ozlabs.org/pipermail/openbmc/2019-November/019422.html
(at least until that site it taken down).

I've incorporated documentation for the OperationMap into the source 
code, currently in review here:
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27595/2/redfish-core/include/privileges.hpp#226

Thanks for your interest.  I'll keep at it...

- Joseph

>> # BMCWeb auth primer
>>
>> This describes the BMCWeb server's authentication and authorization
>> flows, showing how they relate to the usage shown in the [REDFISH
>> cheatsheet][] and [REST cheatsheet][], to [Phosphor User Manager][], and
>> to the [BMCWeb code][].
>>
> <SNIP>

