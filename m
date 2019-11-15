Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5FFE081
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 15:51:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F1Wb1H3TzF1fG
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 01:51:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F1VQ6mkXzF7XK;
 Sat, 16 Nov 2019 01:50:22 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFEhMPF131828; Fri, 15 Nov 2019 09:50:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9nuqtd15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 09:50:17 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAFEhMwf131829;
 Fri, 15 Nov 2019 09:50:17 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9nuqtd0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 09:50:17 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAFEkKDB003224;
 Fri, 15 Nov 2019 14:50:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 2w9gy4we45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 14:50:20 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFEoFRl59638074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 14:50:15 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 883D96A04F;
 Fri, 15 Nov 2019 14:50:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512F36A054;
 Fri, 15 Nov 2019 14:50:15 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 14:50:15 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 15 Nov 2019 08:51:57 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>, geissonator@gmail.com,
 mine260309@gmail.com, gmills@linux.vnet.ibm.com
Subject: Re: Packaging and deploying multiple firmware image types in one
In-Reply-To: <8755e79fb8f5b06113a953039daa2348@linux.vnet.ibm.com>
References: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
 <20191112074921.GA4938@bbwork.lan>
 <9ddc3deca00904404c72a49c4f89c8a4@linux.vnet.ibm.com>
 <20191114075131.GA6696@bbwork.lan>
 <8755e79fb8f5b06113a953039daa2348@linux.vnet.ibm.com>
Message-ID: <7e88ab9cf8e9698afdae885a5477da91@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_04:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=864 mlxscore=0 adultscore=0 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150134
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

>> Ok, here are my thoughts:
>> The phosphor-version-software-manager might put all internal tarballs 
>> in the
>> /tmp/images folder during processing the top level tarball. That will 
>> lead to
>> creation of corresponding D-Bus objects. Each of them will have their 
>> own
>> purpose, version, object path and so on.
> 
> Yeah agree. We may still need some way to let the
> phosphor-version-software-manager
> know that it needs to untar the internal tarballs, maybe a very simple 
> MANIFEST
> with a new field, then each individual tarball would have their own
> MANIFEST that
> creates the D-Bus versions like you mentioned.
> 

For the bmcweb change to support the System purpose 
(https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27144), Andrew 
had the comment about if we could have the software manager determine 
the .BMC, .Host, .PSU details out of a System image and populate the 
individual version interfaces, which further confirms that the current 
Version D-Bus interface is insufficient to detail the individual 
components of a "System" firmware image, and that workarounds like 
adding individual Manifest files that Alexander proposed are needed.

Therefore, wanted to see what people thought about expanding the 
software D-Bus interface to add a 2nd version id to the path of a System 
version, which would contain the version information for each 
sub-element, but would not contain an Activation object:

--
Current, leave as is for individual firmware images:

/xyz/openbmc_project/software/<bmc-version-id>/
   - Activation: Ready
   - Purpose: .BMC
   - Version: 2.8.0

/xyz/openbmc_project/software/<host-version-id>/
   - Activation: Ready
   - Purpose: .Host
   - Version: 1.2.3

--
New expanded option for bundled images:

/xyz/openbmc_project/software/<system-version-id>/
   - Activation: Ready
   - Purpose: .System
   - Version: CompanyZ-v1.0
   /xyz/openbmc_project/software/<sysrem-version-id>/<bmc-version-id>/
     - Purpose: .BMC
     - Version: 2.8.0
   /xyz/openbmc_project/software/<sysrem-version-id>/<host-version-id>/
     - Purpose: .Host
     - Version: 1.2.3
