Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB714307EF9
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 20:54:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRWQ433qwzDqWL
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 06:54:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dEKPAPCc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRWNM46WKzDrdc
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 06:52:51 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SJYtj0096776; Thu, 28 Jan 2021 14:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=13aykxXI6bwE72Mg+7G19UQzbAKhxr29KttlY1hboFk=;
 b=dEKPAPCcUZlhzPzVgBNwXLO/pKjm4tmET6WXwhgsx4g7fcU94RBXGsuUzBTjam9vbb5X
 OgM/+p6JHzE0a7eZnqpSG+cRoOPsQ7nikrwigs37Xzz4shVH51N1YooyN+oCs1tKSyb/
 VebWHYxq4O/nyT8A9gv+aLPbRFCkL3JIXFrx5vhYOT0YWvYbtrpiB626hSXZlZkJ5uld
 xFkuP1LBnGP71RUo6IGVu1Gzm57Wb6SFG5cD4nmW78TxLhz9suuFFUoW+a8lOW6h7/76
 kp/9AUHoXs6PSI8H+m/F89CPO2V8CGiSGeYoiBlVsgHgPadYSGHtlS0SMyIjdai8cqSk DQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c3d38kdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:52:45 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SJpejl020327;
 Thu, 28 Jan 2021 19:52:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 36acj9m2w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 19:52:44 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SJqh1116384364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 19:52:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6445C6063;
 Thu, 28 Jan 2021 19:52:42 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4D1DC605D;
 Thu, 28 Jan 2021 19:52:41 +0000 (GMT)
Received: from [9.80.204.221] (unknown [9.80.204.221])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 19:52:41 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 7/7] image-fit:
 fit_check_format check for valid FDT
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
References: <20210128105304.401058-1-joel@jms.id.au>
 <20210128105304.401058-8-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <53ab04b7-3dc4-963c-cbb1-e0207879f786@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 16:52:40 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128105304.401058-8-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280094
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
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> 
> fit_check_format() must check that the buffer contains a flattened device
> tree before calling any device tree library functions.
> 
> Failure to do may cause segmentation faults.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> (cherry picked from commit ea1a9ec5f430359720d9a0621ed1acfbba6a142a)
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
