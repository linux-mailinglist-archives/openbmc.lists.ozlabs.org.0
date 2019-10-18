Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F50DBC03
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 06:54:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vYbQ0JtJzDrND
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 15:54:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vYZb35FpzDrKW
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 15:53:26 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9I4quQG007397
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 00:53:24 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vq6eprg1m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 00:53:23 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 18 Oct 2019 05:53:22 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 18 Oct 2019 05:53:19 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9I4rIj249414152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Oct 2019 04:53:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A9BF52063;
 Fri, 18 Oct 2019 04:53:18 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.85.80.86])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EFC8C5204F;
 Fri, 18 Oct 2019 04:53:16 +0000 (GMT)
Subject: Re: Redfish Aggregator
To: Richard Hanley <rhanley@google.com>, Ed Tanous <ed.tanous@intel.com>,
 bradleyb@fuzziesquirrel.com
References: <CADfYTpG_Sy4_jNGqZTJKx1Tyivsu+SpBpWy=vNSH7L=Z0PXAEQ@mail.gmail.com>
 <2F98B4CC-2C61-4AF7-B41A-897C9BA4E32F@fuzziesquirrel.com>
 <CADfYTpEut49XPWs+Ahz5dsRgayLkHToRh-6btHeqbaSR3wnK2A@mail.gmail.com>
 <0b5a46e8-748b-faa0-59fd-c548810c9b12@intel.com>
 <CAH1kD+Z5qJ=tDV76MtAE6bgF8yCq-RYSz8y9jgnOV_SSUTF79g@mail.gmail.com>
 <CAH1kD+bFPJdXggCuQ9oQZkf9809C3Qw28inLwW7gVzUWrsgLQQ@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 18 Oct 2019 10:23:15 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAH1kD+bFPJdXggCuQ9oQZkf9809C3Qw28inLwW7gVzUWrsgLQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101804-0008-0000-0000-00000323225B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101804-0009-0000-0000-00004A424283
Message-Id: <e50605fb-ea29-ab36-1bd0-4cf1961e38fa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-18_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=878 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910180045
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/10/19 5:14 AM, Richard Hanley wrote:
> Hi Brad and Ed,
> 
> I wanted to check in with you and the rest of the community about the 
> design path and requirements we're considering for a Redfish Aggregator.
> 
> When I think about an Aggregator in this context, I'm thinking about 
> several Redfish services that are connected to each other using a 
> star topology.  The central service would be the only service exposed to 
> clients on the outside network.
> 
> The central service would for all intents and purposes look like a 
> single service to clients, and on the backend it would act as a proxy to 
> the other hidden services.

Would the redfish aggregator talk Redfish to the endpoints? Or could 
they communicate via other (inband) protocols? Just curious if this will 
be left to the implementation or will this be specified.

Also, if this is applied to a multi-chassis system (where each chassis 
has a BMC), could any BMC take up the role of an aggregator dynamically?

Thanks,
Deepak

