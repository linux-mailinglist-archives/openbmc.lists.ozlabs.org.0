Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 861FBE3ADE
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 20:23:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zbG70NR2zDqZq
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 05:23:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYk870rRzDqW9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 04:13:52 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9OHCGu4017630; Thu, 24 Oct 2019 13:13:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vufp012nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 13:13:45 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9OHDL2i021980;
 Thu, 24 Oct 2019 13:13:45 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vufp012mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 13:13:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9OHA8ms001610;
 Thu, 24 Oct 2019 17:13:44 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2vqt47ybxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2019 17:13:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9OHDgBA46727656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2019 17:13:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB1FA6A063;
 Thu, 24 Oct 2019 17:13:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AE786A04D;
 Thu, 24 Oct 2019 17:13:42 +0000 (GMT)
Received: from [9.10.99.168] (unknown [9.10.99.168])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2019 17:13:42 +0000 (GMT)
Subject: Re: multiple telemetry designs
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, james.feist@linux.intel.com,
 piotr.matuszczak@intel.com, kunyi@google.com
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
From: Shawn McCarney <shawnmm@linux.vnet.ibm.com>
Message-ID: <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
Date: Thu, 24 Oct 2019 12:13:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910240161
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
Cc: thalerj@linux.vnet.ibm.com, neladk@microsoft.com, openbmc@lists.ozlabs.org,
 james.mihm@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I've reviewed both designs, although I cannot say I understand them both 
in depth.

With that disclaimer, here is my 2 cents:

* Both proposals are thoughtful with a lot work put into them.

* bmcweb has a lot of a sensor code that is quite complex that is 
dependent on the current D-Bus sensors and associations.  It would 
require a lot of work and re-testing to ensure a different interface to 
sensor data doesn't break current systems.  The code would be even more 
complex if it had to support two different sensor data interfaces.

* There are sensor readings that cannot be collected by reading files in 
the file system.  Some are collected by direct I2C reads or other 
methods.  If my surface understanding of collectd is correct, plug-ins 
would need to be written to handle these "non-file" sensors.

* For the reasons above, I'd prefer to see D-Bus continue to be the 
"public API" to sensor data.  D-Bus is the central data sharing 
repository on the OpenBMC.  How the sensor data gets on D-Bus is 
implementation detail and can vary by system and by project.  It can be 
obtained by hwmon, collectd, and many other ways.  As long as it is 
published on D-Bus, other applications (like bmcweb) can easily consume it.

* It sounds like the RRD format would be an efficient way to store 
sensor data.  I do worry about the space and CPU required to store 
telemetry data.  The OpenBMC stack is going to be used on some big 
servers, and they are going to have a large number of sensors.

* Could the two proposals be merged, with D-Bus providing the public API 
to the data?  Maybe something like the following?  1) Continue to store 
current sensor values on D-Bus using the existing architecture.  Sensor 
values come from a variety of sources.  2) An application obtains 
current sensor values from D-Bus and stores them with timestamps in RRD 
to provide efficient history/telemetry.  3) A new D-Bus interface/method 
is created to obtain the history/telemetry data.  4) bmcweb uses the 
current D-Bus interfaces for the Sensor URIs (as it does today) and uses 
the new D-Bus interface/method for Telemetry URIs?

Thanks,

Shawn

