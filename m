Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CFF90738
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 19:50:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699nw1DsHzDrJ7
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 03:50:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698kh2zjzzDrQv
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 03:02:19 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7GGvSoR072682; Fri, 16 Aug 2019 13:02:14 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udxshcb0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 13:02:14 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7GGxhG1080002;
 Fri, 16 Aug 2019 13:02:14 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udxshcb03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 13:02:14 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7GGscWS002041;
 Fri, 16 Aug 2019 17:02:13 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2udbc491dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 17:02:13 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7GH2Cje54002074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 17:02:12 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EFA2B206A;
 Fri, 16 Aug 2019 17:02:12 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F8ECB205F;
 Fri, 16 Aug 2019 17:02:12 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Aug 2019 17:02:12 +0000 (GMT)
Subject: Re: Historical Sensor Information
To: Wilfred Smith <wilfredsmith@fb.com>, Kun Yi <kunyi@google.com>
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
 <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>
 <OF838F4B69.A8C14781-ON00258457.005B6C1A-00258457.005B781B@notes.na.collabserv.com>
 <CAGMNF6XTn4ktTXj6zVkviS3J5OOKwSkNYUBDsrnfPrT2EH3WSQ@mail.gmail.com>
 <C1B2C3C5-B14B-4DF4-8DD9-38D70E112627@fb.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <96c68da9-8abf-aa64-7d88-ffa4596927ac@linux.ibm.com>
Date: Fri, 16 Aug 2019 12:02:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <C1B2C3C5-B14B-4DF4-8DD9-38D70E112627@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=984 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160176
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/15/19 5:50 PM, Wilfred Smith wrote:
> Many thanks to Emily, Milton and Kun Yi for their quick responses and 
> pointers.
>
> Among the reasons for local historical data collection are independent 
> auditing, disaster recovery, debugging and increasing availability 
> during periods of intermittent network connectivity.
>
> Vijay is already participating in the Telemetry workgroup, so I’ll try 
> to get a download from him to see what can be leveraged.
>
> The requirement at Facebook includes the ability to retrieve 
> historical sensor information for a user-defined period and interval 
> on the BMC console (through sensor-util, and in the same format). 
> Based on my cursory review of collectd, its lossy multicast network 
> protocol wouldn’t allow this information to be re-synthesized with 
> fidelity on the

I share this concern and would prefer to have a more reliable way to get 
sensor data off the BMC.  This data may be valuable to help detect when 
the BMC is being attacked.

- Joseph

> client side, but it would be a huge win if we can get a few 
> concessions. I intend to study the Telemetry Workgroup’s progress 
> carefully.
>
> Wilfred
>
...snip...
