Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D582BFAC3
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 22:53:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fRw54ZdBzDqwj
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 06:53:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fRvS2T0YzDqvK
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 06:52:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8QKlIPJ190721; Thu, 26 Sep 2019 16:52:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w26926a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 16:52:23 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8QKlM17190795;
 Thu, 26 Sep 2019 16:52:22 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w26925s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 16:52:22 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8QKnVTL017365;
 Thu, 26 Sep 2019 20:52:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2v5bg86uhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 20:52:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8QKqKl759179398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 20:52:20 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99D5F6A04F;
 Thu, 26 Sep 2019 20:52:20 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AEED6A057;
 Thu, 26 Sep 2019 20:52:19 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 26 Sep 2019 20:52:19 +0000 (GMT)
Subject: Re: BitBake Apache License and Packaging for OpenBMC Components
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>
References: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
 <e9f88063-77e0-42e4-b63d-92d5b8d8c299@www.fastmail.com>
 <CALLMt=r15qn+kFJdTWpbAzorjr+kfBoyz2mOJ3QsTwrfJKDUhw@mail.gmail.com>
 <1a5c8f66-1d5a-4f6b-9326-816831934c14@www.fastmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <1eabc036-6c34-5011-d085-ee3d5fe93558@linux.ibm.com>
Date: Thu, 26 Sep 2019 15:52:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1a5c8f66-1d5a-4f6b-9326-816831934c14@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909260162
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
Cc: Andrew Geissler <andrewg@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/18/2019 6:48 PM, Andrew Jeffery wrote:
>
> On Wed, 18 Sep 2019, at 22:31, Andrew Geissler wrote:
>> On Tue, Sep 17, 2019 at 6:59 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>>
>>>> (5) How should I handle being in a subdirectory of a repository? The
>>>> code I’m checking in will go into openbmc-tools. How does that work for
>>>> CI?
>>> There isn't any CI for openbmc-tools at the moment, as it was originally
>>> intended as a collection of quick hacks that made people's lives easier
>>> without any particular guarantees. This was done to lower the bar for
>>> entry and get people contributing their scripts.
>>>
>>> CI is probably something we need to think about though, so I've added
>>> Andrew G in To/Cc:
>> I know for openbmc-build-scripts I did eventually make a jenkins job
>> that does basic validation of the scripts it can (building docker containers).
>> We were getting some regressions which were breaking our CI so this was
>> a quick way to make sure the docker containers at least built when the
>> scripts were updated.
>>
>> We could do something similar with this repo, even if it's just running --help
>> of the tools to ensure they execute. We could get more complex and
>> connect them up to a QEMU session running openbmc to validate
>> more. I don't have any bandwidth to do much here though so someone
>> else would need to drive it.
>>
>> Would we want a run-ci.sh in each subdirectory where a tool owner
>> could configure it to setup their env and run their tests? Most of the
>> tools are python, is there a python CI framework we should look at?
>> Maybe easier to have a master script from the root dir that runs all
>> CI for all tools? Just throwing some thoughts out.
> The run-ci.sh approach might not be too bad - that way the jankins
> job can just run a `find . -name run-ci.sh -exec \{\}\;`, which feels
> kinda horrific but doesn't need much in the way of maintenance.

I would be interested in a run-ci.sh sort of thing as well for a repo I 
am working on.   It would
allow me to do some additional data validation with some custom scripts.


> Andrew

