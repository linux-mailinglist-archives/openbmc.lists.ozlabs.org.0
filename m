Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EA693CB
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2019 16:47:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nRFK4WWBzDqCM
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 00:47:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nRCl4W0NzDqCM
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 00:45:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6FEbZgg017703
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 10:45:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2trtx92u61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 10:45:35 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6FEeeDX031341
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 10:45:35 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2trtx92u5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 10:45:35 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6FEikhA029457;
 Mon, 15 Jul 2019 14:45:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2tq6x6g2u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jul 2019 14:45:34 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6FEjX9149742098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 14:45:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 289CC124058;
 Mon, 15 Jul 2019 14:45:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9F5212405C;
 Mon, 15 Jul 2019 14:45:32 +0000 (GMT)
Received: from [9.10.99.12] (unknown [9.10.99.12])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Jul 2019 14:45:32 +0000 (GMT)
Subject: Re: Proposal: configurable per-sensor error behavior in phosphor-hwmon
To: Kun Yi <kunyi@google.com>, Patrick Venture <venture@google.com>,
 Brandon Kim <brandonkim@google.com>, spinler@us.ibm.com,
 mine260309@gmail.com
References: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <3e99accb-832d-e9fd-4263-2daaade10045@linux.ibm.com>
Date: Mon, 15 Jul 2019 09:45:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAGMNF6WpQS06JDQJOKRLbKWwKrXKHvNtY7r+MnUTqp1G2Jn=qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150175
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a great proposal, just a few concerns/notes.

On 7/12/19 5:27 PM, Kun Yi wrote:
> Hi there,
> 
> Current phosphor-hwmon code is filled with preprocessor macros to branch 
> error condition for sysfs reads, and it seems to me that adding a 
> per-sensor configuration would solve two issues at least:
> 1. code can be greatly simplified
> 2. we can code more flexible sensor reading behavior
> 
> Why 2) is needed: with many types of sensors that BMC controls, having 
> an one-size-fits-all policy will always have cases that it can't handle. 
> Each flaky sensor is flaky in its own way.
> 
> Rough proposal on how this will work:
> 
> add properties to each sensor group's configuration file:
> 
> "error behavior": can be one of
> - always keep
> - remove from D-Bus on error
There is a REMOVERCS device config file option that can be configured to 
remove an individual sensor or any sensor of the device when a given set 
of return codes occur when attempting to read the sensor.
> 
> "error condition":  can be combination of
> - certain sysfs return codes
REMOVERCS combines this error condition to the behavior of removing the 
sensor from Dbus. I'd be interested in how these types of 
bahavior-to-conditions will be mapped within the device's config file.

> - timeout
In the case of phosphor-hwmon, isnt a timeout condition similar to error 
retries since a timeout condition is presented as a ETIMEDOUT return 
code on the sensor.
> - invalid value
This is another area I'd be interested to hear more on, how would one go 
about defining when a value would be invalid? Or is this a simple, 
negative values are invalid for a sensor that should always return a 
positive value?
> 
> "error retries": number of retries before declaring the sensor has an error
This would be great to have configurable per sensors, however a possible 
issue here would be allowing too many retries causing hwmon to take too 
long. So this should be capped or controlled in someway with the delay 
between reads as well. Right now a sensor is allowed to be retried 10x's 
with a 100ms delay between each attempt.
> 
> Happy to hear any feedback.
> 
> Regards,
> Kun
