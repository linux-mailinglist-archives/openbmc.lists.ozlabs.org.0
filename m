Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD8307EF8
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 20:53:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRWNf2l4yzDsPL
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 06:53:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dpsUMmc4; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRWMk595qzDrfq
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 06:52:18 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SJdwl7163995; Thu, 28 Jan 2021 14:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QXGjOLknYHXBFMXFqv2zSDTuKoOjYlbcUnNCkkg8oco=;
 b=dpsUMmc4oIJ+pfegFaerTdtGI8X8PE06/76Vc1xRYS+/i580EaDBMko81XIZseigYRKG
 8w7u3Hm+LbYRUAlTjTiiA2eEiAwr0Z4SF83I4/7GKbCI2pJBzbD7nA6fdrdxIlajFDpP
 M9/KCYzYiOmEncwFgYfhakBSnQu7dNWI3NJRVIzJGtd34s8a9tS9YTWlMds4qPPErkcp
 TrjumEkBP97l02HzwaBhAnTLLITB0o/jA0Sq8QQj8vb+UA6JNn/x+4J3Gr6nlHZ6WaWW
 1Kj9e9FemZjUiBNcIzBwpzGRcL5yIn4lpQ0qpKhk4BpHv+1m80i6yKZmXWg1xW3f4zR/ xg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36c1bcuufd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 14:52:12 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SJhCX1017077;
 Thu, 28 Jan 2021 19:52:11 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 36agvf7dmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 19:52:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SJqA9c9830762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 19:52:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13EB1C6062;
 Thu, 28 Jan 2021 19:52:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C2E4C6061;
 Thu, 28 Jan 2021 19:52:09 +0000 (GMT)
Received: from [9.80.204.221] (unknown [9.80.204.221])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 19:52:08 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 6/7] common: hash: Remove a
 debug printf statement
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
References: <20210128105304.401058-1-joel@jms.id.au>
 <20210128105304.401058-7-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <a7412a18-b15e-02b0-12f8-5e964baedbeb@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 16:52:07 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128105304.401058-7-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280090
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
> From: Harald Seiler <hws@denx.de>
> 
> Remove a left-over debug printf that was introduced with SHA512 support.
> 
> Fixes: d16b38f42704 ("Add support for SHA384 and SHA512")
> Signed-off-by: Harald Seiler <hws@denx.de>
> (cherry picked from commit 7a81989b7b04bd87d1e684f2bafdc92a9c16fecc)
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>


-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
