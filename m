Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553835F78
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 16:42:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Js283fXFzDqdx
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 00:42:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Js1J3tVgzDqXd;
 Thu,  6 Jun 2019 00:41:23 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x55Ec06B146130; Wed, 5 Jun 2019 10:41:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sxfcrs2fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2019 10:41:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x55CsKaZ004318;
 Wed, 5 Jun 2019 12:58:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2swybxyygs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2019 12:58:08 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x55EfIMf17105038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jun 2019 14:41:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 191E213604F;
 Wed,  5 Jun 2019 14:41:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFD6136055;
 Wed,  5 Jun 2019 14:41:17 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jun 2019 14:41:17 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 05 Jun 2019 09:42:19 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: [Design] PSU firmware update
In-Reply-To: <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <20190604182635.GD46814@mauery.jf.intel.com>
 <CAARXrtnpeP0J3T0y=K=O1QTYjxBXXxQSzUVErygzUo+MR6t=0w@mail.gmail.com>
 <f1d99c51-881e-c1f3-79e6-1d9be951b0c4@linux.ibm.com>
Message-ID: <c7cac47baa8d0686f111aab3faa51b58@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050092
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-05 09:25, Matt Spinler wrote:
> On 6/5/2019 1:18 AM, Lei YU wrote:
>>>> The PSU firmware code update will re-use the current interfaces to 
>>>> upload,
>>>> verify, and activate the image.
>>> We would like the option to be able to ship the PSU firmware as part 
>>> of
>>> the BMC image (in the root filesystem). This means that it is already
>>> present and authenticated when the BMC boots. In this way, we know 
>>> that
>>> the current BMC firmware plays well with the PSU firmware and have 
>>> fewer
>>> variables to test for when making a release.
>> Because the PSU firmware is part of BMC image, this seems a completely
>> different approach, and more like part of BMC image update, is it?
>> I would expect this should not be part of this design, what do you 
>> think?
> 
> FYI, I am 99% sure this is how IBM needs its systems to work as

There's a Version Purpose of "System"[1] that "is an aggregate for the 
system as a whole." IBM is planning to use this to bundle the BMC and 
host firmware in a single file, which as Vernon mentions would ensure 
that one is compatible with the other.

Not saying the proposed PSU design has to include the 'combined image' 
details, we can just have a mentioning that it can be an option and we 
can re-discuss how a bmc+PSU could look like once I send some details on 
the bmc+host image in the next few months.

[1] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_project/Software/Version.interface.yaml#L24

> well.  That being the case,
> 
> will you also be handling this design?
> 
> 
> 
>>> I suppose this could be done by skipping the download phase and 
>>> simply
>>> creating an activation object at boot and then initiating the FW
>>> activation automatically.
