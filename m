Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CB1C3F33
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 17:59:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G6wg5YGmzDq7w
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 01:58:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G6sw1lqmzDqSK
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 01:56:35 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 044FWK4r040157; Mon, 4 May 2020 11:56:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xjvd4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 11:56:31 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 044FX99E046186;
 Mon, 4 May 2020 11:56:31 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4xjvd3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 11:56:31 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 044FoLeV010619;
 Mon, 4 May 2020 15:56:28 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 30s0g5j2a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 15:56:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 044FuQgN51249344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 15:56:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EDC542047;
 Mon,  4 May 2020 15:56:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F9E842042;
 Mon,  4 May 2020 15:56:25 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.249.188])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 15:56:25 +0000 (GMT)
Subject: Re: Storing host data on the BMC
To: Sunitha Harish <sunithaharish04@gmail.com>, patrick@stwcx.xyz,
 dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com,
 openbmc <openbmc@lists.ozlabs.org>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
Date: Mon, 4 May 2020 21:26:24 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_09:2020-05-04,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040124
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

On 04/05/20 8:22 pm, Sunitha Harish wrote:
> Hi,
> 
> We have some user defined host settings which we are presently keeping 
> it in phosphor-settings-manager and the associated pldm bios attributes 
> are there in the pldm BIOS table. Few properties in the object hosted by 
> the phosphor-settings-manager are read-only for out of band but through 
> in-band it can be changed.
> 
> For example; the IP origin (static/dhcp) in the below commit.
> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/

Is the Origin property here a host setting/BIOS attribute? I don't 
believe it is. From a PLDM perspective, this is a sensor that the host 
can update and notify the BMC via an event, for eg. Even if you make it 
read-only, it is not a setting for the host firmware - which is what 
BIOS attributes are meant for.

Thanks,
Deepak
