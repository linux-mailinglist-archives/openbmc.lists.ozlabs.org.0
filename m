Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CE310DA1
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 17:10:59 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXL4c6ThRzDwl7
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 03:10:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E9GxZ7+B; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXL3T2Py3zDwkP
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 03:09:56 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115G3mOp195012
 for <openbmc@lists.ozlabs.org>; Fri, 5 Feb 2021 11:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qlt1O4Ms91ZI7Y46omiDnze9Uh6i45qa0qaqxY+J7UI=;
 b=E9GxZ7+BJRt5m7+vc1Z86LdAvL1P/VOndbxoFkLNZPcx9HjyMEF90kDj5Sq5+1gABO0T
 bKy/sva20JyEDENh05uipb55qzDSHI4gATNvRxiwf0jLj6dxUpvF6MMYJINpsM4p8sIp
 Vux48YhVANfxIDQbtxC0jedBxGI+SKbWg7L+pJZXkfakum8I7UMLVEyjoskxci435QTp
 23yWdXM6iZs4IaFG+cPvky+Po0Fwzjtkmr4w3x5MUUx2DkYlPEFOaqLphRma5uhrTmrJ
 QcYN2y55AMGqqSD85DI6dVxyJhDXQGO3JQA+rDsnykKEGIiYaBxobomU27yFF8dGW8KC Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h3dqsa1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Feb 2021 11:09:52 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 115G4w4C007502
 for <openbmc@lists.ozlabs.org>; Fri, 5 Feb 2021 11:09:52 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h3dqsa19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 11:09:52 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115G2Dim022345;
 Fri, 5 Feb 2021 16:09:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kw1jq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 16:09:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115G9oWF24052176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 16:09:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F69ABE051;
 Fri,  5 Feb 2021 16:09:50 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2596FBE053;
 Fri,  5 Feb 2021 16:09:50 +0000 (GMT)
Received: from demeter.local (unknown [9.80.214.11])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  5 Feb 2021 16:09:49 +0000 (GMT)
Subject: Re: Requesting feedback on GUI design - TPM Required policy and
 Virtual TPM
To: Priyanka Pillai <priyankapillai1206@gmail.com>, openbmc@lists.ozlabs.org
References: <CAJCnuYnOW4wceOdy_vcyO_PVdw66AjNo9O3VYKsQFY-+9v1KBw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c12b12b1-a425-7e5f-6421-327da8c79f4c@linux.ibm.com>
Date: Fri, 5 Feb 2021 10:09:49 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAJCnuYnOW4wceOdy_vcyO_PVdw66AjNo9O3VYKsQFY-+9v1KBw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_09:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=959
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050102
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

On 2/5/21 8:18 AM, Priyanka Pillai wrote:
> Hello, We have decided to remove the TPM Required Policy from...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hello,
>
> *We have decided to remove the TPM Required Policy from the Server 
> Power Operations Page and move it to the Security Panel page. *
> Our findings:
> * TPM Required policy is rarely required to be disabled during the 
> power operations.
> * Only in cases of troubleshooting or if a physical TPM card is not 
> part of the system, is when this setting needs to be disabled.
> * In all other cases, it is not advisable to disable it.
> * It affects the security of the host boot process.
>
> Similarly, we shall be *adding Virtual TPM to the security page* as 
> well, since it’s usage is the same and it affects security of the 
> logical partitions boot process.

Note this refers to the host's TPM (and not a TPM that measures the BMC 
such as the BMC Trusted Boot design being discussed here 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169).

These findings sound right to me (but I am not a TPM expert).

Joseph

> Does anyone from the community have any concerns regarding this?
>
> Warm regards,
> *Priyanka Pillai*
> User Experience Designer
> IBM iX : Interactive Experience

