Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FE10F8C5
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 08:33:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RtyP41cCzDqVV
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 18:33:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Rtxf27TmzDqVN
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 18:33:08 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB37RQIs040776
 for <openbmc@lists.ozlabs.org>; Tue, 3 Dec 2019 02:33:03 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6cyfqb7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Dec 2019 02:33:02 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 3 Dec 2019 07:33:00 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 07:32:59 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB37WwfD66388062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 07:32:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21ED4AE05D;
 Tue,  3 Dec 2019 07:32:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66348AE04D;
 Tue,  3 Dec 2019 07:32:57 +0000 (GMT)
Received: from [9.122.210.30] (unknown [9.122.210.30])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 07:32:57 +0000 (GMT)
Subject: Re: Adding new metric definition use case
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 "neladk@microsoft.com" <neladk@microsoft.com>
References: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 3 Dec 2019 13:02:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------D2FE3E64E396BFD19364BAF5"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19120307-0016-0000-0000-000002D03020
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120307-0017-0000-0000-0000333227BB
Message-Id: <992e9072-b5d6-ad06-4dc3-430b5ec1659c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_01:2019-11-29,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030061
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Ambrozewicz,
 Adrian" <adrian.ambrozewicz@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------D2FE3E64E396BFD19364BAF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

hello,

I am just curious if the minutes are captured somewhere. The last I see 
is: "*Minutes of meeting : 08/06/19 @ 10:00 PM IST"*

Wiki: 
https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group

!! Vishwa !!

On 11/28/19 5:03 PM, Matuszczak, Piotr wrote:
> Hi Neeraj,
>
> 	As we talked recently during the Telemetry WG meeting, you were asking about adding new metric definitions. Please, let me better understand your use case, you have HW sensor present on the board (for example, let it be CPU0 VR temperature), you have already HWmon reading it and exposing it as the sensor on D-Bus. You want to be able to add the new Metric Definition for proper interpretation of sensor's reading and new metric definition shall also modify sensor's D-Bus parameters (Scale and Unit) ? Do I understand it correctly?
> 	Monitoring Service does not have to interpret the metric from the sensors, because it is used only for report management.
> 	
>
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
>

--------------D2FE3E64E396BFD19364BAF5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>hello,</p>
    <p>I am just curious if the minutes are captured somewhere. The last
      I see is: "<strong>Minutes of meeting : 08/06/19 @ 10:00 PM IST"</strong></p>
    <div class="moz-cite-prefix">Wiki:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group">https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a></div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">!! Vishwa !!</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 11/28/19 5:03 PM, Matuszczak, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DBA24EEE99A3B3489FF472F5E94DE6D7A3108ED1@IRSMSX101.ger.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Neeraj,

	As we talked recently during the Telemetry WG meeting, you were asking about adding new metric definitions. Please, let me better understand your use case, you have HW sensor present on the board (for example, let it be CPU0 VR temperature), you have already HWmon reading it and exposing it as the sensor on D-Bus. You want to be able to add the new Metric Definition for proper interpretation of sensor's reading and new metric definition shall also modify sensor's D-Bus parameters (Scale and Unit) ? Do I understand it correctly? 
	Monitoring Service does not have to interpret the metric from the sensors, because it is used only for report management. 
	 

Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o. 
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316

</pre>
    </blockquote>
  </body>
</html>

--------------D2FE3E64E396BFD19364BAF5--

