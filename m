Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 710441C9865
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 19:54:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J1LL3shNzDqrq
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 03:54:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=thalerj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J1KX2B5pzDqmJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 03:53:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047HVhVg142908
 for <openbmc@lists.ozlabs.org>; Thu, 7 May 2020 13:53:27 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30twj0n2mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 13:53:27 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047HonVa019075
 for <openbmc@lists.ozlabs.org>; Thu, 7 May 2020 17:53:26 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 30s0g76n09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 May 2020 17:53:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047HrOx19241060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 7 May 2020 17:53:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F08B4C6057
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 17:53:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6DD3C6055
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 17:53:24 +0000 (GMT)
Received: from oc2358436115.ibm.com (unknown [9.160.17.201])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 17:53:24 +0000 (GMT)
Subject: Re: Prometheus telemetry exporter for OpenBmc - repository location
To: openbmc@lists.ozlabs.org
References: <b422a05c874e423ca0ad556ace9f8d03@intel.com>
From: Justin Thaler <thalerj@linux.vnet.ibm.com>
Message-ID: <65cc69da-63a4-391e-3768-7d071e681588@linux.vnet.ibm.com>
Date: Thu, 7 May 2020 12:53:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b422a05c874e423ca0ad556ace9f8d03@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_10:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=808
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070139
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

Hi Jakub,

On 5/7/20 11:52 AM, Dlugolecki, Jakub wrote:
> Hi OpenBmc Community,
> 
> We would like to release a Prometheus exporter for telemetry collected via Redfish protocol.
> Our team uses this exporter for OpenBmc telemetry collection and for health monitoring.
> 
This is pretty awesome and I've seen a few different solutions to get 
data into Prometheus, most around a message broker.
> Would you agree create a repository in https://github.com/openbmc/ organization?
> 
How would you feel about a page that points out tools/plugins out there 
that have been tested against OpenBMC? For instance a Netdata plugin, or 
your Prometheus plugin. We could then provide a pointer to other repo's 
that have the actual code, along with what level of openBMC is supported?

It might make a nice list for those looking at adopting OpenBMC to see 
what other tools are supported along with it.
> My initial idea was to create a repository in a Prometheus GitHub organization.
> Unfortunately, Prometheus project does not have any dedicated space for third party exporters:
> https://prometheus.io/docs/instrumenting/exporters/
> 
> Thank you,
> Jakub
> 
Thanks,
Justin
