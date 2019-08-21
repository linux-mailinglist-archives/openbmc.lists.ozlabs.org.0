Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA6986AB
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 23:38:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DLct2dGJzDqyh
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 07:38:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DLcC1sK5zDqTv
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 07:37:43 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LLbc6U177430; Wed, 21 Aug 2019 17:37:38 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uharp7btb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 17:37:37 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7LLZW94031545;
 Wed, 21 Aug 2019 21:37:12 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 2ugqwudyxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 21:37:12 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LLbCS813107900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 21:37:12 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 380D3AE05C;
 Wed, 21 Aug 2019 21:37:12 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09E4DAE060;
 Wed, 21 Aug 2019 21:37:12 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 21:37:11 +0000 (GMT)
Subject: Re: Telemetry Redfish Mockup location at DMTF
To: Paul.Vancil@dell.com, neladk@microsoft.com, openbmc@lists.ozlabs.org
References: <fbf557cba2d045b3a57d0adc508ae727@AUSX13MPS306.AMER.DELL.COM>
 <BYAPR21MB1191F6E61DC3BF7CA78C37CAC8AA0@BYAPR21MB1191.namprd21.prod.outlook.com>
 <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <9bda945a-f6b7-495a-098a-4c6399476a52@linux.vnet.ibm.com>
Date: Wed, 21 Aug 2019 16:37:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cf52a78d26364365820f5b70e80ef422@AUSX13MPS306.AMER.DELL.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210211
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


On 8/21/2019 12:08 PM, Paul.Vancil@dell.com wrote:
> Neeraj,
> It works if you have access to the github.com/DMTF/Redfish repo.

Hi Neeraj,

Link worked for me as well.
Microsoft is a Redfish Forum Supporter so you should be able to get 
access to the github.com/DMTF/Redfish repo by:

1. Joining the DMTF here: https://www.dmtf.org/join
2. After joining the DMTF, join the Redfish forum here: 
https://members.dmtf.org/apps/org/workgroup/portal/
         Menu > Group > All Groups -- Select "Redfish Forum"
3. Send an email to the Redfish forum asking for your GitHub ID to be 
given access to the private Redfish repository

- Gunnar


> For those who have access to the DMTF private repo on github, The location of the current Telemetry mockup is:
>   https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2FDMTF%2FRedfish%2Ftree%2Fmaster%2Fmockups%2Fpublic-telemetry&amp;data=02%7C01%7Cneladk%40microsoft.com%7C23e27aa9627a47be38be08d725d4d0f5%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637019468286104259&amp;sdata=XZs0FM7p97grbS50EuS0lAWk%2Br%2BaMuGxReRSxgZ1Lvs%3D&amp;reserved=0
>
