Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A372868DA
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 22:13:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C65B84MsdzDqR0
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 07:13:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LfJIAOMC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C659Q0VCJzDqQm
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 07:12:40 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097K3YJ8114748; Wed, 7 Oct 2020 16:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0siHGM/TcMyzQ56Sxr7uxo9Zsas6I+Flw6wWLA9wbiI=;
 b=LfJIAOMC2E60A/S3VWxt0MJDNbVpDMOjxlm6ETQMmc74FMVwOqxC5W3jF15hig+FkECD
 /e15sXaxt5CJSYL82c9T9vjeM7KjY6WfpFKTc90dCGbGmAGD4dd+yhsELwbT94N76xl1
 3D+p9lghe4jd/J5bwRz32SGp/UPvwF/296i7+223YRR+oFce4W04koHu+tVoH6wQ5OX0
 QJEjIsvISK76s6L2gYYaPpyGlcPMiwcgDWvRB497SVsgDLn7mzMKrJVg7UA5mGLjyTo/
 3LhFo6hq4XsL2WtfyiunlggYbsTGFZEz57J4AYwWxWE4ma2yMQ6bKiWc0lb6kStlRXD8 tQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341m848fky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 16:12:37 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097KBTtf019586;
 Wed, 7 Oct 2020 20:12:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 33xgx9t4w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 20:12:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097KCV1044368286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 20:12:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D207C6055;
 Wed,  7 Oct 2020 20:12:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D602C6057;
 Wed,  7 Oct 2020 20:12:34 +0000 (GMT)
Received: from [9.206.182.230] (unknown [9.206.182.230])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 20:12:33 +0000 (GMT)
Subject: Re: Heading out
To: James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <eb06797a-ccfd-2d5c-f3c4-0d3c024eb127@linux.vnet.ibm.com>
Date: Wed, 7 Oct 2020 14:12:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_10:2020-10-07,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=919
 phishscore=0 bulkscore=0 clxscore=1031 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070127
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

On 10/7/2020 12:21 PM, James Feist wrote:
> Hi everyone,
> 
> This will be my last week on the OpenBMC project. I'll be moving on to 
> something unrelated to OpenBMC. It's been great working with you all. 

Great working with you, James! Best of luck in your new position! The 
project will miss you.

- Gunnar

> All the repos I maintain have additional maintainers who will continue 
> to maintain those projects. I'll begin removing myself from the 
> maintainers lists shortly.
> 
> Best of luck with the project,
> 
> -James
> 

