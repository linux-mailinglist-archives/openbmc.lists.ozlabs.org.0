Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0C2B994B
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 23:54:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZnYV0N3fzF4L3
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 07:54:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZnXK6Sb1zF4Gs
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 07:53:20 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KLpvHm038320; Fri, 20 Sep 2019 17:53:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v55pxua4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 17:53:12 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KLrCcW040427;
 Fri, 20 Sep 2019 17:53:12 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v55pxua3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 17:53:12 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KLotQY002960;
 Fri, 20 Sep 2019 21:53:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 2v3vbu9dst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 21:53:10 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KLr9qv42074478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 21:53:09 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B430228059;
 Fri, 20 Sep 2019 21:53:09 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3863828058;
 Fri, 20 Sep 2019 21:53:09 +0000 (GMT)
Received: from demeter.local (unknown [9.80.207.9])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Sep 2019 21:53:09 +0000 (GMT)
Subject: Re: Machine name in Code update
To: Vijay Khemka <vijaykhemka@fb.com>, Lei YU <mine260309@gmail.com>,
 Adriana Kobylak <anoo@linux.ibm.com>
References: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
 <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
 <1b08815f-5258-2635-ce2d-9c0e0e51e3e0@linux.ibm.com>
 <F3969E3B-B2FB-4257-B053-6FF2FAFD3FC7@fb.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <bc8ef115-d2d7-d544-2f8a-d62410580725@linux.ibm.com>
Date: Fri, 20 Sep 2019 16:53:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <F3969E3B-B2FB-4257-B053-6FF2FAFD3FC7@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200178
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ben Wei <benwei@fb.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/20/19 1:34 PM, Vijay Khemka wrote:
>
> ﻿On 9/20/19, 8:55 AM, "Joseph Reynolds" <jrey@linux.ibm.com> wrote:
>
>      
>      On 9/19/19 9:21 PM, Lei YU wrote:
>      > On Fri, Sep 20, 2019 at 2:15 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>      >> Team,
>      >>
>      >> I am trying to add a feature of verifying machine name while upgrading BMC image. I have submitted a couple of patches, 1. Which adds machine name in manifest file and 2. Which verifies machine name from manifest to os-release file. Below are 2 gerrit review patch.
>      >>
>      >> https://urldefense.proofpoint.com/v2/url?u=https-3A__gerrit.openbmc-2Dproject.xyz_-23_c_openbmc_meta-2Dphosphor_-2B_25324_&d=DwIDaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=arMHhrzzBHUMyI_30avg7eppPTw9DIZJoNVYq20Hro0&s=7fog-3ezFneiNbNeFTsBxOq5eciSgB21JCovcFMEJXk&e=
>      >>
>      >> https://urldefense.proofpoint.com/v2/url?u=https-3A__gerrit.openbmc-2Dproject.xyz_-23_c_openbmc_phosphor-2Dbmc-2Dcode-2Dmgmt_-2B_25344_&d=DwIDaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=arMHhrzzBHUMyI_30avg7eppPTw9DIZJoNVYq20Hro0&s=Z-RwTQ2KomMzSaMUGqyarcfRf9EfKeQE5CGtfeqMfRg&e=
>      >>
>      >>
>      >> I have received some valuable feedback on design approach and I agreed with some of them. Let me explain complete thought here and please provide your valuable feedback as well as new ideas.
...snip...

>      
>      I see the check for machine type as a step in the right direction, so I
>      am in favor of it.  Thanks!
>
> Thanks, I will start with current plan and add more feature further.
>      

Sounds good.  We should consider a formal design which lays out the 
problem we are trying to solve, defines concepts, and describes 
mechanisms and how they interact with existing features like digital 
signatures.  For example:
- Problem: How to prevent wrong images loaded onto the BMC.
- Problem: How to prevent unintended downgrade of firmware images.
- Concept: a series of BMC images which all  have the same MACHINE type.
- Concept: What it means for one firmware image to be an upgrade or a 
downgrade of another image.
- Note: the concept of an upgrade between two firmware images is only 
meaningful when they both have the same machine type.
- Example design: 
https://github.com/openbmc/docs/blob/master/designs/psu-firmware-update.md

I'm behind the curve here.  I am not even familiar with Redfish 
UpdateService.  Does OCP or TCG have anything for us here?

- Joseph

