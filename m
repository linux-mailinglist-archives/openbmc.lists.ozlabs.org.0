Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CA102C7E
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 20:23:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HbMw65bmzDqhR
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 06:23:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HbM50GjyzDqgp
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 06:22:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJJM68i116557; Tue, 19 Nov 2019 14:22:53 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5pnqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 14:22:53 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAJJM9Ng116922;
 Tue, 19 Nov 2019 14:22:52 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5pnqa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 14:22:52 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAJJMbtD027811;
 Tue, 19 Nov 2019 19:22:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 2wa8r6nhsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2019 19:22:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJJMpIm13763404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 19:22:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1048CB206B;
 Tue, 19 Nov 2019 19:22:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46D07B206C;
 Tue, 19 Nov 2019 19:22:50 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 19:22:50 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Nov 2019 13:22:54 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Packaging and deploying multiple firmware image types in one
In-Reply-To: <CALLMt=oEYGDam4km_70bJMOsxDAX9TYheXYYsua8PWcP3EuABQ@mail.gmail.com>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
 <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
 <20191114075131.GA6696@bbwork.lan>
 <8755e79fb8f5b06113a953039daa2348@linux.vnet.ibm.com>
 <7e88ab9cf8e9698afdae885a5477da91@linux.vnet.ibm.com>
 <CALLMt=oEYGDam4km_70bJMOsxDAX9TYheXYYsua8PWcP3EuABQ@mail.gmail.com>
Message-ID: <a6ade65ef913536753348224afbeba8b@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_06:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911190160
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-11-15 09:46, Andrew Geissler wrote:
> On Fri, Nov 15, 2019 at 8:50 AM Adriana Kobylak <anoo@linux.ibm.com> 
> wrote:
> 
>> New expanded option for bundled images:
>> 
>> /xyz/openbmc_project/software/<system-version-id>/
>>    - Activation: Ready
>>    - Purpose: .System
>>    - Version: CompanyZ-v1.0
>>    /xyz/openbmc_project/software/<sysrem-version-id>/<bmc-version-id>/
>>      - Purpose: .BMC
>>      - Version: 2.8.0
>>    
>> /xyz/openbmc_project/software/<sysrem-version-id>/<host-version-id>/
>>      - Purpose: .Host
>>      - Version: 1.2.3

Ended up adding an array instead for the proposal, to avoid confusion 
with multiple version ids:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/27395

       "Purpose": 
"xyz.openbmc_project.Software.Version.VersionPurpose.System",
       "Version": "2.8.0-dev-882-gf0cbf42",
       "VersionAggregate": [
         [
           "xyz.openbmc_project.Software.Version.VersionPurpose.BMC",
           "2.8.0-dev",
           ""
         ],
         [
           "xyz.openbmc_project.Software.Version.VersionPurpose.Host",
           "open-power-witherspoon-v2.2",
           
"buildroot-2018.11.1-7-g5d7cc8c,skiboot-v6.2,hostboot-17ba81e-pb264a73,occ-12c8088"
         ]
       ]

> 
> Makes sense to me. The phosphor-webui code could look for a system 
> object
> and if found, only allow the user to update/switch images based on 
> system
> level. They could still easily show the BMC, host, PSU levels though.
> Or maybe this will just be a config option for the GUI? Either way I
> think the GUI would want to show both the system and individual levels
> of firmware.

Yeah, it'd make sense to also show the individual levels to provide the 
user with more information about the image.

> 
> Redfish code in bmcweb can continue to work as-is for bmc, host, psu
> firmware inventory.

Yeah, I'd just need to make a change in bmcweb to get the version string 
from that new Aggregate interface to populate the BMC FirmwareVersion 
field.

> I think we should see if we can get the DMTF to
> add a FirmwareVersion property to the ComputerSystem object where
> we could store this new system version.

Agree.
