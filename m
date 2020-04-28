Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA81BBEC4
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 15:16:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BMc91X2pzDqnf
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 23:16:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BMZt652vzDqPf
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 23:15:33 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SD3KUg040849
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 09:15:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjmj5v9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 09:15:30 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SD4Jdi045097
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 09:15:30 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pjmj5v9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 09:15:30 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SDFOAq001324;
 Tue, 28 Apr 2020 13:15:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 30mcu6u6em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 13:15:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SDFSnY52298116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 13:15:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D590AC05E;
 Tue, 28 Apr 2020 13:15:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37162AC05F;
 Tue, 28 Apr 2020 13:15:28 +0000 (GMT)
Received: from [9.80.200.186] (unknown [9.80.200.186])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 13:15:28 +0000 (GMT)
Subject: Re: Power monitoring and management
To: =?UTF-8?B?5byg6buO5piO?= <lemon_zhang555@163.com>, openbmc@lists.ozlabs.org
References: <53d78955.715a.171bfe1da3d.Coremail.lemon_zhang555@163.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <2a63ff3f-c4f7-e455-7428-4db7e28f40d1@linux.ibm.com>
Date: Tue, 28 Apr 2020 08:15:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <53d78955.715a.171bfe1da3d.Coremail.lemon_zhang555@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_09:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280098
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



On 4/28/2020 3:23 AM, 张黎明 wrote:
> hello,
> We have a functional requirement - the AST2400 sends a PWR_ON pin down 
> signal for 100 ms to CPLD to request that the server power on. The 
> CPLD change PGOOD pin up and powers on the system. If the CPLD 
> receives a continuous PWR_ON pin down signal for 4 s, it will 
> immediately shut down the server and change PGOOD pin down. We changed 
> the "PGOOD"、"POWER_PIN" pin definition in 
> /etc/default/obmc/gpio/gpio_defs.json file, but it does not work.where 
> should we change the definition of these pins to make it meet our 
> needs, and how to add a delay for PWR_ON pin.

The  code that handles gpio_defs.json is 
https://github.com/openbmc/skeleton/tree/master/op-pwrctl, though I 
believe there is an alternate version that uses entity manager to get 
the GPIO definitions somewhere else.  You should be able to modify that 
as necessary to meet your needs.



> Regards,
> Garnet

