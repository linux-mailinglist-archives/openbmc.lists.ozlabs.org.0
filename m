Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325275479
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 18:44:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vdNB67R0zDqQx
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 02:44:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vdMX4g0zzDqNd
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 02:43:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PFvjiI023032
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:43:49 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tyeqk4847-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 12:43:49 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 25 Jul 2019 17:43:47 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Jul 2019 17:43:43 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6PGhRj930867808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2019 16:43:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBD9D5204F;
 Thu, 25 Jul 2019 16:43:42 +0000 (GMT)
Received: from [9.199.48.27] (unknown [9.199.48.27])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id D746152050;
 Thu, 25 Jul 2019 16:43:40 +0000 (GMT)
Subject: Re: Dynamic Configuration of phosphor-host-ipmid sensors
To: Patrick Venture <venture@google.com>,
 James Feist <james.feist@linux.intel.com>, "Tanous, Ed"
 <ed.tanous@intel.com>, tomjoseph@in.ibm.com,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Emily Shaffer <emilyshaffer@google.com>
References: <CAO=notzV0DFQ80fPP=z96RxK7WBwUYZzEG__Qdo7-mAzJRjwWg@mail.gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 25 Jul 2019 22:13:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzV0DFQ80fPP=z96RxK7WBwUYZzEG__Qdo7-mAzJRjwWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072516-0008-0000-0000-00000300D1E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072516-0009-0000-0000-0000226E6733
Message-Id: <0b279184-ff88-9e44-f7cf-46e1db2983a1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250188
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If you are pursuing a run-time configuration for the sensors, my 
preference will be a json.
On OpenPower systems the sensors numbers are fixed between the BIOS and 
BMC. So json will
give a provision to share the sensor numbers and SDR info between the 
two parties.

Right now the sensor yaml's are generated from a machine readable 
workbook(MRW) using scripts.
(https://github.com/openbmc/phosphor-mrw-tools). Once this switches to 
json, script has to take
care of that. It will generate extra work for some of the OpenPower systems.

On Tuesday 23 July 2019 03:58 AM, Patrick Venture wrote:
> I was curious if anyone has patches to do either:
> 1) configure phosphor-host-ipmid's sensor list with json; or
> 2) configure phosphor-host-ipmid's sensor list with entity-manager,
> s.t. it builds the SDRs from the Configuration namespace?
>
> Is there a preference along this path because we're going to need to
> move to dynamically configured sensors for phosphor-host-ipmid?
>
> Patrick
>

