Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C322B70E
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 21:58:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCNSQ195hzDrT0
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 05:58:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCNRJ1jl7zDrRx;
 Fri, 24 Jul 2020 05:57:47 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NJWgaN141255; Thu, 23 Jul 2020 15:57:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj3m8ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 15:57:44 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06NJlFfd178959;
 Thu, 23 Jul 2020 15:57:44 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faj3m8rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 15:57:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NJnfFW030963;
 Thu, 23 Jul 2020 19:57:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 32brq9evf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 19:57:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NJvgC555050600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 19:57:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3B55AE05F;
 Thu, 23 Jul 2020 19:57:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C89EAE062;
 Thu, 23 Jul 2020 19:57:42 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 19:57:42 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 23 Jul 2020 14:57:42 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Nancy Yuen <yuenn@google.com>
Subject: Re: What do you want in a package manager?
In-Reply-To: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
References: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
Message-ID: <a7949f916cf122cbc4ef1a3fb1d354ca@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_09:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 clxscore=1011
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230142
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-07-21 02:57, Nancy Yuen wrote:
> I'm looking into package management for BMCs in our fleet.  I'm
> wondering who else is interested in this, does it make sense for
> OpenBMC.  What kind of features are important?  What kind of package
> format (rpm, deb, something else)?
> 
> We have a distributed system dictating versions of software (BIOS, OS,
> userspace packages, other firmware) which should be on a particular
> machine (based a machine's characteristics like type, owner, etc). So
> our use case has the BMC take a list of packages to be installed,
> natively installing the packages on the BMC.

Something around that area is this new recipe[1] to add a host fw image 
to the BMC image at build time[2]. It'd be useful to have a manager that 
would use different recipes to build a final image based on different 
pieces.

> Packages must be signed
> and verified during installation.

To support the new image file provided by the host fw recipe, the 
bmc-code-mgmt-repo added the concept of 'optional images'[3] that would 
allow additional files to be included in the code update tarball and 
enforce signature verification on them. Maybe that can be used/expanded 
as we add support for additional packages.

> There is also the concept of
> deviation checking.  If the files for a package or some parts of the
> file system deviates from what's expected, it triggers some kind of
> repair flow.
> 
> ----------
> Nancy

1. 
https://github.com/openbmc/meta-phosphor/commit/39b1ff0dcd12f15dc651aa20cb85cdec903cb5de
2. https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/34618
3. 
https://github.com/openbmc/phosphor-bmc-code-mgmt/commit/73609bb51c8c43d471ba373317455d3cbe5c5c32
