Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3189E18BF28
	for <lists+openbmc@lfdr.de>; Thu, 19 Mar 2020 19:16:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jw8c3S9WzDrL9
	for <lists+openbmc@lfdr.de>; Fri, 20 Mar 2020 05:16:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jvw526JDzDrN6
 for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2020 05:05:40 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JI3gfS133563; Thu, 19 Mar 2020 14:05:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8bt4uyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 14:05:34 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02JI5YFv139760;
 Thu, 19 Mar 2020 14:05:34 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8bt4uy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 14:05:34 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02JI3WXt011523;
 Thu, 19 Mar 2020 18:05:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 2yrpw74t9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 18:05:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02JI5W5T56230326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 18:05:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBBD6C6055;
 Thu, 19 Mar 2020 18:05:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D549C6061;
 Thu, 19 Mar 2020 18:05:31 +0000 (GMT)
Received: from [9.80.203.11] (unknown [9.80.203.11])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 18:05:30 +0000 (GMT)
Subject: Re: service for tracking user activity (phosphor-audit)
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
 <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
 <07C231EA-1761-4014-9A78-E2BDA3D71F0E@fuzziesquirrel.com>
 <3672a09d41f6d80fcff8f85306eda4ef07351a34.camel@yadro.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <9bfe6392-902a-25aa-ac5c-d6254677f02b@linux.ibm.com>
Date: Thu, 19 Mar 2020 13:05:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3672a09d41f6d80fcff8f85306eda4ef07351a34.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_06:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=853 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190074
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
Cc: gmills@us.ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/19/2020 10:14 AM, Ivan Mikhaylov wrote:
> On Tue, 2020-03-17 at 16:08 -0400, Brad Bishop wrote:
>> at 2:46 PM, Andrew Geissler <geissonator@gmail.com> wrote:
>>
>>> Matt and Deepak could weigh in on whether this could be a part of
>>> phosphor-logging.
>> This would be my preference.
>>
>> thx - Brad
> Who can grant me rights into this rep or to directory in it? Matt, Deepak? Also,
> phosphor-logging/phosphor-audit would be the possible place for it then.

I think you mean to merge code?  You could either put up a commit to add 
your
name to the MAINTAINERS file, or there is a gerrit plugin that we can 
somehow use
to grant people merge access to only certain directories.

>
> Thanks.
>

