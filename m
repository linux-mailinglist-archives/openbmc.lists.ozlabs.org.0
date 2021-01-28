Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B5308090
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 22:31:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRYZ25B1YzDrhK
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 08:31:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OEET4ZpZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRYY00Tb8zDr9K
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 08:30:27 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SL8hRL103954; Thu, 28 Jan 2021 16:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZWVuRq+c8Xg6CFhH9o0+mN2G671APJZ6U3DORo/RAzs=;
 b=OEET4ZpZ9kt8NumWCFTvwjoc6/TpglrZFdrqfS5S0kEpAVmXHTJo341UvoxJIzmSsjr7
 IQ1+Fzqo1OjcG24eEEj1n528fFKTK4rxXvYBz7PlkpM3tJGGO5RrCBJbO0zs9YGShp8m
 tJ7C86MJIRLUEAXQQN7+Pt5J0se+gxiTUUhcUmp0ks954sS2TUY7PBAoxCAMTWKAMnom
 7SNd9VvTH944NFI5IpymL0DCz4qjd99gGDJMPMDmM/UUi1PtrWOgfFwQx1xKH7QM/Nhm
 7Fhz/cOm6vcYWVD44Ggo6gD+y2+iL5D8MmvyzseIQIgH+IdRBDUIE1uCBfRX2K+SMtAw CQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36bymahewn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 16:30:21 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SLGuOk018545;
 Thu, 28 Jan 2021 21:30:20 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 36adtu9be3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 21:30:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SLUJft14221722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 21:30:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C0F4C6059;
 Thu, 28 Jan 2021 21:30:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7CD2C605A;
 Thu, 28 Jan 2021 21:30:18 +0000 (GMT)
Received: from [9.80.204.221] (unknown [9.80.204.221])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 21:30:18 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/7] image: Check
 hash-nodes when checking configurations
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
References: <20210128105304.401058-1-joel@jms.id.au>
 <20210128105304.401058-5-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <87c27b5f-6875-b25a-4de9-b3480cbb1c81@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 18:30:17 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128105304.401058-5-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280099
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



On 1/28/2021 7:53 AM, Joel Stanley wrote:
> From: Simon Glass<sjg@chromium.org>
> 
> It is currently possible to use a different configuration's signature and
> thus bypass the configuration check. Make sure that the configuration node
> that was hashed matches the one being checked, to catch this problem.
> 
> Also add a proper function comment to fit_config_check_sig() and make it
> static.
> 
> Signed-off-by: Simon Glass<sjg@chromium.org>
> (cherry picked from commit 67acad3db71bb372458fbb8a77749f5eb88aa324)
> Signed-off-by: Joel Stanley<joel@jms.id.au>
Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
