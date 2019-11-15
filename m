Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E7FE223
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 16:59:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F3230R1czF7XT
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 02:59:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F31F1vpNzF7V3;
 Sat, 16 Nov 2019 02:58:40 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFFvjZA047855; Fri, 15 Nov 2019 10:58:37 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nsjwevr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 10:58:37 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAFFwaLL050913;
 Fri, 15 Nov 2019 10:58:36 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nsjweuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 10:58:36 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAFFfBve005681;
 Fri, 15 Nov 2019 15:58:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 2w9gy3wv36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 15:58:35 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFFwYqu46727586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 15:58:34 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15C47AC05E;
 Fri, 15 Nov 2019 15:58:34 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06A50AC05B;
 Fri, 15 Nov 2019 15:58:33 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 15:58:32 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 15 Nov 2019 10:00:14 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>, Bright Cheng/WYHQ/Wiwynn
 <Bright_Cheng@wiwynn.com>
Subject: Re: phosphor-bmc-code-memt: Support redfish remote firmware update
 with static layout image
In-Reply-To: <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com>
References: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
 <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com>
Message-ID: <0f356ff58ad9ec48b19e86f9da5eb7cc@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_04:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150143
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
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>,
 Neeraj Ladkani <neladk@microsoft.com>,
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Jayanth Othayoth <ojayanth@in.ibm.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> phosphor-bmc-code-memt doesn’t support static-layout remote update 
>> since static layout fw package could only has “image-bmc” in the 
>> package.
> 
> For now, it does support static layout, you just need to upload the
> tarball contains separated images, instead of the whole "image-bmc"
> tarball.
> 

Checking the build files, the *.static.mtd.all.tar contains the 
image-bmc, manifest and signature files so yeah we can just upload that 
file without any build changes, we just need to add the support in the 
bmc-code-mgmt repo.

>> 
>> 
>> Following are the modifications
>> 
>> 1. Add a name list for static layout only has image-bmc in the fw 
>> package and modify related image file checking.
>> 
>> 2. Add checking ApplyTime property for static layout to decide whether 
>> reboot to apply update process or not.
>> 
>> 
>> 
>> Please find the patch for these modifications in the attachment.

Looks good, if you could just break the patch into two separate patches, 
one for the supporting image-bmc and one for adding the ApplyTime 
property, and submit via gerrit as Lei YU pointed. Let us know if you 
have any questions with the process. Thanks!

> 
> It may be useful to support the whole image as well, so please submit
> the code to gerrit, and we could review the code.
> Please follow
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes-via-gerrit-server-to-openbmc
> for how to submit changes to gerrit.
> Thanks!
