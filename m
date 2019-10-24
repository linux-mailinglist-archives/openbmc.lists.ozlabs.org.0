Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59408E385E
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 18:41:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zY1D4C1LzDqSY
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:41:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zXz4543HzDqQH
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 03:40:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9OGb7IN090427
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 12:39:57 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vue41v1ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 12:39:57 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9OGZqYL001533
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 16:40:00 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2vqt47jdkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 16:40:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9OGdtbq44499388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 16:39:55 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81F846A04D;
 Thu, 24 Oct 2019 16:39:55 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5779E6A04F;
 Thu, 24 Oct 2019 16:39:55 +0000 (GMT)
Received: from [9.10.99.168] (unknown [9.10.99.168])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 16:39:55 +0000 (GMT)
Subject: Re: Running arbitrary tests in CI
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <3cf26eea-3dfb-23a5-a533-408d8ccc0027@linux.ibm.com>
From: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Message-ID: <a377bef3-a4f0-1bdc-89cf-7961e41be244@linux.vnet.ibm.com>
Date: Thu, 24 Oct 2019 11:39:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cf26eea-3dfb-23a5-a533-408d8ccc0027@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240155
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

Sounds great to me.  I need something like this for what I'm working on.

On 10/24/2019 9:25 AM, Matt Spinler wrote:
> Hi,
>
> Following up to the thread that talks about being able to run extra 
> tests in CI:
> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018329.html
>
> I could definitely use something like this, so I am thinking of 
> putting up the
> commit to do the: run any run-ci.sh in the repo.
>
> Are there any additional ideas or other comments on a way to do this?
>
> Thanks
