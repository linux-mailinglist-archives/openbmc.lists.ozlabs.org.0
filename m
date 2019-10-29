Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EAE8E0B
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 18:26:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472dln4FB9zF3Cy
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 04:25:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472dkY5vFszF1vj;
 Wed, 30 Oct 2019 04:24:53 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9THMWcT047124; Tue, 29 Oct 2019 13:24:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxss402mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 13:24:49 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9THOMLi050711;
 Tue, 29 Oct 2019 13:24:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxss402m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 13:24:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9THKgI0024581;
 Tue, 29 Oct 2019 17:24:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2vvds94nd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Oct 2019 17:24:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9THOlTe38273284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 17:24:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A7826A058;
 Tue, 29 Oct 2019 17:24:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0381B6A04F;
 Tue, 29 Oct 2019 17:24:46 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Oct 2019 17:24:46 +0000 (GMT)
Subject: Re: OpenPOWER SEL/PEL/HBEL parser
To: Artem Senichev <artemsen@gmail.com>, openpower-firmware@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
References: <20191011104722.5kqe4gl6cdk5wijx@gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <82a07ce4-c370-8758-411c-b24119c2403f@linux.ibm.com>
Date: Tue, 29 Oct 2019 12:24:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011104722.5kqe4gl6cdk5wijx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910290150
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

Hi,

Sorry it took me so long to reply.

I'd just like to mention that on our systems we have to move to creating 
PELs for all BMC
errors as well as accepting  PELs via PLDM from our various host 
subsystems.  So we are
currently working on a proper PEL repository on the BMC, and plan on 
providing a parser
that works with it.

I'm not sure if you heard back from the github.com/open-power project, 
but that seems
like an appropriate place to host the project as it also works on other 
places besides a BMC.

On 10/11/2019 5:47 AM, Artem Senichev wrote:
> Hi all,
>
> We created a parser to decode error log entries generated by OpenPOWER firmware.
> It is something like `errl` utility that can be used in OpenBMC.
>
> Source code:
> https://github.com/YADRO-KNS/openpower-esel-parser
>
> OpenBMC's recipe:
> https://github.com/openbmc/openbmc/blob/master/meta-yadro/meta-nicole/recipes-phosphor/logging/openpower-esel-parser_git.bb
>
> If you find this parser useful, we can transfer our repository to OpenBMC or
> OpenPOWER and continue to maintain it as part of one of these projects.
>

