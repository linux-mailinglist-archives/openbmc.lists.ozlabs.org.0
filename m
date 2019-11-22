Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA36105E4F
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 02:37:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JzYn58RLzDqwL
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 12:37:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JzY76v7SzDqDJ
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 12:36:27 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAM1YxT8073680; Thu, 21 Nov 2019 20:36:23 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdhwa0as0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 20:36:23 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAM1aM7h076101;
 Thu, 21 Nov 2019 20:36:22 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdhwa0ard-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 20:36:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAM1Z54R009351;
 Fri, 22 Nov 2019 01:36:21 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 2wa8r7qjrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 01:36:21 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAM1aI9647972760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 01:36:18 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76FF86E050;
 Fri, 22 Nov 2019 01:36:18 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D8E36E04C;
 Fri, 22 Nov 2019 01:36:18 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 22 Nov 2019 01:36:18 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Nov 2019 19:36:28 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Bright Cheng/WYHQ/Wiwynn <Bright_Cheng@wiwynn.com>
Subject: RE: phosphor-bmc-code-memt: Support redfish remote firmware update
 with static layout image
In-Reply-To: <HK0PR02MB33485DDBFBED11F8ED70C4D99F4E0@HK0PR02MB3348.apcprd02.prod.outlook.com>
References: <HK0PR02MB33487C8E6D56DD2143034D0C9F700@HK0PR02MB3348.apcprd02.prod.outlook.com>
 <CAARXrtnjxJw4S25CoBACzY8A8hQtV+8excmoM2iNR5sLqhxcXg@mail.gmail.com>
 <0f356ff58ad9ec48b19e86f9da5eb7cc@linux.vnet.ibm.com>
 <HK0PR02MB33485DDBFBED11F8ED70C4D99F4E0@HK0PR02MB3348.apcprd02.prod.outlook.com>
Message-ID: <e265ea9fecc389df33c0e7dce0861e05@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_07:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911220011
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
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-11-21 04:29, Bright Cheng/WYHQ/Wiwynn wrote:
> Dear Adriana and Lei Yu,
> 
> We have some questions about submitting code to gerrit,
> 1. We add remote to gerrit server using
> "https://gerrit.openbmc-project.xyz/openbmc/phosphor-bmc-code-mgmt"
> and try to push the commit to gerrit server.
> The result shows that we need to register an email address, but we
> cannot verify my email address and receive an error 422 (Unprocessable
> Entity): invalid token.
> 
> 2. We also try to add remote to gerrit server using
> "ssh://gerrit.openbmc-project.xyz/openbmc/phosphor-bmc-code-mgmt", but
> ssh connection cannot be established because timeout.
> 
> Could you help us to solve this problem? Thanks!
> 

Hi, you may be missing some setup steps to link your github account to 
gerrit, here are the instructions:
https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md
