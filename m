Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C3B25FE
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 21:25:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VQZX2m5FzF4S2
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 05:25:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VQYp2T8vzDq6J
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 05:24:28 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DJMNfJ099636
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 15:24:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uytca1hua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 15:24:20 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8DJMwCl100795
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 15:24:20 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uytca1htp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 15:24:20 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8DJJajG004350;
 Fri, 13 Sep 2019 19:24:19 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2uytdx98sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 19:24:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DJOIWs63897914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 19:24:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C9FABE054;
 Fri, 13 Sep 2019 19:24:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA766BE051;
 Fri, 13 Sep 2019 19:24:17 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 13 Sep 2019 19:24:17 +0000 (GMT)
Subject: Re: stack overflow tag for openbmc questions?
To: Brandon Wyman <bjwyman@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=o3+h7JpEdyFci7BXzpDyN2XvYvDmxOGLwOxaqn9OneNw@mail.gmail.com>
 <CAARXrtkOnosU2N6pvNUCxaRnjbXMBKP=iopC+92Gc0iUmzZL0Q@mail.gmail.com>
 <CALLMt=oQ1muBW+u49OaQkLJDhmqN+vKqSsxTisRARTjBdN0Zsw@mail.gmail.com>
 <3aa37f37-b9c9-f9bb-e125-7e1f998f1c3d@gmail.com>
 <CAK_vbW2gCBLu_VyzDK3OBHvvNQyHjUunHDyrMaaNmmrEVegmnQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <f3a4103f-9b54-0186-88f8-513eb1ae80bd@linux.ibm.com>
Date: Fri, 13 Sep 2019 14:24:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK_vbW2gCBLu_VyzDK3OBHvvNQyHjUunHDyrMaaNmmrEVegmnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130198
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


On 9/11/19 5:37 PM, Brandon Wyman wrote:
> On Wed, Sep 4, 2019 at 9:07 AM krtaylor <kurt.r.taylor@gmail.com> wrote:
>> On 9/4/19 7:04 AM, Andrew Geissler wrote:
>>> On Wed, Sep 4, 2019 at 12:33 AM Lei YU <mine260309@gmail.com> wrote:
>>>> On Fri, Aug 30, 2019 at 2:59 AM Andrew Geissler <geissonator@gmail.com> wrote:
>>>>> As a community, we're getting more and more questions via
>>>>> IRC, the mailing list, and openbmc github issues. Any thoughts
>>>>> on creating a stack overflow tag to try and get a more searchable
>>>>> and consistent location for questions (i.e. openbmc)?
>>>>>
>>>>> Andrew
>>>> Done. Tag `openbmc` is created in StackOverflow :)
>>>> The wiki needs peer review though:
>>>> https://stackoverflow.com/review/suggested-edits/23960865
>> Just be careful about sharing code ideas or bug fixes there. The license
>> terms may be incompatible if that code wound up in our tree.
>>
>> I see no problems with answering usage/build questions there.
>>
>> Kurt Taylor (krtaylor)
>>
>>
> Curious what this link was, and what there was to review, I clicked on
> it. It looks to be too generic, not helpful, rejected. So, I guess we
> don't (yet) have something to worry about on copying code.

Vote for my tag info!  Or edit to make it better! ~ 
https://stackoverflow.com/tags/openbmc/info

- Joseph
