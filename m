Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC035F27
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 16:25:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jrg33lfKzDqZk
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 00:25:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JrfW663bzDqXW
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 00:25:06 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55EM8Jk126935
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jun 2019 10:25:04 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sxdd7pcv8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 10:25:04 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Wed, 5 Jun 2019 15:25:02 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Jun 2019 15:25:01 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55EP0Sk34341302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jun 2019 14:25:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C9B8124058
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 14:25:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FCD8124055
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 14:25:00 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 14:25:00 +0000 (GMT)
Subject: Re: [Design] PSU firmware update
To: openbmc@lists.ozlabs.org
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Wed, 5 Jun 2019 09:25:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060514-0060-0000-0000-0000034C6FF5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011218; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01213614; UDB=6.00637877; IPR=6.00994688; 
 MB=3.00027194; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-05 14:25:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060514-0061-0000-0000-000049A4078D
Message-Id: <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050091
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


On 6/5/2019 1:18 AM, Lei YU wrote:
>>> The PSU firmware code update will re-use the current interfaces to upload,
>>> verify, and activate the image.
>> We would like the option to be able to ship the PSU firmware as part of
>> the BMC image (in the root filesystem). This means that it is already
>> present and authenticated when the BMC boots. In this way, we know that
>> the current BMC firmware plays well with the PSU firmware and have fewer
>> variables to test for when making a release.
> Because the PSU firmware is part of BMC image, this seems a completely
> different approach, and more like part of BMC image update, is it?
> I would expect this should not be part of this design, what do you think?

FYI, I am 99% sure this is how IBM needs its systems to work as well.  
That being the case,

will you also be handling this design?



>> I suppose this could be done by skipping the download phase and simply
>> creating an activation object at boot and then initiating the FW
>> activation automatically.

