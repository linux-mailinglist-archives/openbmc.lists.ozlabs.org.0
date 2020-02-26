Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC3E170C92
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 00:27:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SX5Y4SyRzDqM2
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 10:27:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SX4r1sJszDqHw
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 10:26:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QNOMva111446; Wed, 26 Feb 2020 18:26:23 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yden1pq6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 18:26:23 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QNPK3U016924;
 Wed, 26 Feb 2020 23:26:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2ydcmku3av-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 23:26:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QNQL8X51052886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 23:26:21 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF556E050;
 Wed, 26 Feb 2020 23:26:21 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FD746E052;
 Wed, 26 Feb 2020 23:26:21 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Feb 2020 23:26:20 +0000 (GMT)
Subject: Re: Functionality vs Security
To: Patrick Williams <patrick@stwcx.xyz>, "Mihm, James" <james.mihm@intel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
 <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
 <20200225155202.GK67957@patrickw3-mbp.dhcp.thefacebook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a9d059b8-52d1-aa17-937d-7006a591e74d@linux.ibm.com>
Date: Wed, 26 Feb 2020 17:26:20 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225155202.GK67957@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_09:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260142
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/25/20 9:52 AM, Patrick Williams wrote:
> On Thu, Feb 13, 2020 at 08:15:29AM +0000, Mihm, James wrote:
>> Exposing the REST D-Bus APIs via a network interface is bad practice and should be disabled by default. Just because it was done that way in the beginning doesn’t mean that it should remain that way.
>> Applications should be configured to be secure by default. Consumers of the code should have to intentionally select an insecure configuration - it shouldn't be provided by default.
> I'm not going to argue one way or the other with respect to the REST
> D-Bus API.  I do feel like we're becoming a little too tightly coupled
> to Redfish though.

Do you mean you are concerned that the authorization checks are 
performed in BMCWeb, and the D-Bus APIs are expected to be run with root 
user authority?

> When we first put together the REST / D-Bus API we did have discussions
> on how to secure it.  There isn't anything inherent to that API that
> makes it any more or less secure than Redfish might be, except for
> missing code.  D-Bus has policies that can be used to lock down access
> for specific users.  What we had talked about was creating these
> policies based on roles and having the REST end-point do something like
> 'setuid' to the logged in user so that those roles took effect.

There is a related issue to run daemons as a non-root user. 
https://github.com/openbmc/openbmc/issues/3383
We tried briefly, hit an authority issue, ran out of time, and haven't 
got back.

>
> By writing all of the access policies inside the webserver based
> specifically on Redfish requirements, none of that code is helpful for
> any other management interface.  If those access policies were instead
> implemented as D-Bus policies then we gain that feature across every
> management interface available, with SSH being a trivial example.
>

I agree.  Although we are full speed ahead with BMCWeb/Redfish as the 
management interface.  I would welcome some internal authorization 
controls for BMC users.  As far as I know, when SSH'd to the BMC, if you 
are root: you can do everything; if not: your authority is severely limited.

- Joseph

